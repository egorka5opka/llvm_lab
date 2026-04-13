%{
#include <cstdio>
#include <cstdlib>
#include <cstring>

#include <map>
#include <string>
#include <vector>
#include <iostream>

#include "llvm/IR/Constants.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Type.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/raw_ostream.h"

using namespace llvm;

#define YYSTYPE Value*

int yyparse();
int yylex();
extern int yylineno;
extern FILE* yyin;

void yyerror(const char* s) {
    std::cerr << "[spellcast2] parse error at line " << yylineno << ": " << s << "\n";
}

static LLVMContext TheContext;
static Module* TheModule = nullptr;
static IRBuilder<>* Builder = nullptr;
static Function* AppFunc = nullptr;

static FunctionCallee DrawCellFunc;
static FunctionCallee SimFlushFunc;

static ArrayType* MagicStoreTy = nullptr;
static AllocaInst* MagicStoreAlloca = nullptr;

static std::map<std::string, AllocaInst*> VarAlloca;

static Type* I32Ty() { return Type::getInt32Ty(TheContext); }
static Type* I64Ty() { return Type::getInt64Ty(TheContext); }
static Type* VoidTy() { return Type::getVoidTy(TheContext); }

static Value* asI32(Value* v) {
    if (!v) return nullptr;
    if (v->getType()->isIntegerTy(32)) return v;
    if (v->getType()->isIntegerTy(1)) return Builder->CreateZExt(v, I32Ty());
    return Builder->CreateTrunc(v, I32Ty());
}

static Value* asI64Index(Value* v) {
    v = asI32(v);
    return Builder->CreateZExt(v, I64Ty());
}

static AllocaInst* ensureVar(const std::string& name) {
    auto it = VarAlloca.find(name);
    if (it != VarAlloca.end()) return it->second;

    // Create allocas at the beginning of entry block.
    BasicBlock& entry = AppFunc->getEntryBlock();
    IRBuilder<> entryBuilder(&entry, entry.begin());
    AllocaInst* a = entryBuilder.CreateAlloca(I32Ty(), nullptr, name);
    entryBuilder.CreateStore(entryBuilder.getInt32(0), a);

    VarAlloca[name] = a;
    return a;
}

static void ensureRuntimeDecls() {
    if (!TheModule) return;

    DrawCellFunc = TheModule->getOrInsertFunction(
        "draw_cell",
        FunctionType::get(VoidTy(), {I32Ty(), I32Ty(), I32Ty()}, false));

    SimFlushFunc = TheModule->getOrInsertFunction(
        "simFlush",
        FunctionType::get(VoidTy(), {}, false));

    if (!MagicStoreTy) {
        ArrayType* inner = ArrayType::get(I32Ty(), 64);
        ArrayType* mid = ArrayType::get(inner, 64);
        MagicStoreTy = ArrayType::get(mid, 2);
    }
}

static void ensureMagicStoreAlloca() {
    ensureRuntimeDecls();
    if (MagicStoreAlloca) return;
    if (!AppFunc) return;

    BasicBlock& entry = AppFunc->getEntryBlock();
    IRBuilder<> entryBuilder(&entry, entry.begin());
    MagicStoreAlloca = entryBuilder.CreateAlloca(MagicStoreTy, nullptr, "magic_store");
    MagicStoreAlloca->setAlignment(Align(4));

    // Keep behavior predictable: zero-initialize the whole store.
    entryBuilder.CreateStore(ConstantAggregateZero::get(MagicStoreTy), MagicStoreAlloca);
}

struct IfContext {
    BasicBlock* contBB;
};

struct LoopContext {
    BasicBlock* innerIncBB;
    BasicBlock* afterBB;
};

struct PortalContext {
    BasicBlock* loopBB;
    BasicBlock* afterBB;
};

static std::vector<IfContext> IfStack;
static std::vector<LoopContext> LoopStack;
static std::vector<PortalContext> PortalStack;

static void beginWonder(Value* condI32) {
    Value* cond = Builder->CreateICmpNE(asI32(condI32), Builder->getInt32(0));

    BasicBlock* thenBB = BasicBlock::Create(TheContext, "wonder.then", AppFunc);
    BasicBlock* contBB = BasicBlock::Create(TheContext, "wonder.cont", AppFunc);

    if (!Builder->GetInsertBlock()->getTerminator()) {
        Builder->CreateCondBr(cond, thenBB, contBB);
    }

    Builder->SetInsertPoint(thenBB);
    IfStack.push_back({contBB});
}

static void endWonder() {
    if (IfStack.empty()) return;
    BasicBlock* contBB = IfStack.back().contBB;
    IfStack.pop_back();

    if (!Builder->GetInsertBlock()->getTerminator()) {
        Builder->CreateBr(contBB);
    }
    Builder->SetInsertPoint(contBB);
}

static void beginPortal() {
    BasicBlock* loopBB = BasicBlock::Create(TheContext, "portal.loop", AppFunc);
    BasicBlock* afterBB = BasicBlock::Create(TheContext, "portal.after", AppFunc);

    if (!Builder->GetInsertBlock()->getTerminator()) {
        Builder->CreateBr(loopBB);
    }

    Builder->SetInsertPoint(loopBB);
    PortalStack.push_back({loopBB, afterBB});
}

static void endPortal() {
    if (PortalStack.empty()) return;
    PortalContext ctx = PortalStack.back();
    PortalStack.pop_back();

    if (!Builder->GetInsertBlock()->getTerminator()) {
        Builder->CreateBr(ctx.loopBB);
    }
    Builder->SetInsertPoint(ctx.afterBB);
}

static void beginWhirl(const std::string& rowVar, int rowStart, int rowEnd,
                       const std::string& colVar, int colStart, int colEnd) {
    AllocaInst* rowA = ensureVar(rowVar);
    AllocaInst* colA = ensureVar(colVar);

    // Initialize row before entering the loop.
    Builder->CreateStore(Builder->getInt32(rowStart), rowA);

    BasicBlock* outerCondBB = BasicBlock::Create(TheContext, "whirl.outer.cond", AppFunc);
    BasicBlock* outerBodyBB = BasicBlock::Create(TheContext, "whirl.outer.body", AppFunc);
    BasicBlock* outerIncBB  = BasicBlock::Create(TheContext, "whirl.outer.inc", AppFunc);
    BasicBlock* afterBB     = BasicBlock::Create(TheContext, "whirl.after", AppFunc);

    BasicBlock* innerCondBB = BasicBlock::Create(TheContext, "whirl.inner.cond", AppFunc);
    BasicBlock* innerBodyBB = BasicBlock::Create(TheContext, "whirl.inner.body", AppFunc);
    BasicBlock* innerIncBB  = BasicBlock::Create(TheContext, "whirl.inner.inc", AppFunc);
    BasicBlock* innerEndBB  = BasicBlock::Create(TheContext, "whirl.inner.end", AppFunc);

    if (!Builder->GetInsertBlock()->getTerminator()) {
        Builder->CreateBr(outerCondBB);
    }

    // outer.cond
    Builder->SetInsertPoint(outerCondBB);
    Value* rowV = Builder->CreateLoad(I32Ty(), rowA);
    Value* outerCond = Builder->CreateICmpSLT(rowV, Builder->getInt32(rowEnd));
    Builder->CreateCondBr(outerCond, outerBodyBB, afterBB);

    // outer.body
    Builder->SetInsertPoint(outerBodyBB);
    Builder->CreateStore(Builder->getInt32(colStart), colA);
    Builder->CreateBr(innerCondBB);

    // inner.cond
    Builder->SetInsertPoint(innerCondBB);
    Value* colV = Builder->CreateLoad(I32Ty(), colA);
    Value* innerCond = Builder->CreateICmpSLT(colV, Builder->getInt32(colEnd));
    Builder->CreateCondBr(innerCond, innerBodyBB, innerEndBB);

    // inner.inc
    Builder->SetInsertPoint(innerIncBB);
    Value* colNext = Builder->CreateAdd(Builder->CreateLoad(I32Ty(), colA), Builder->getInt32(1));
    Builder->CreateStore(colNext, colA);
    Builder->CreateBr(innerCondBB);

    // inner.end
    Builder->SetInsertPoint(innerEndBB);
    Builder->CreateBr(outerIncBB);

    // outer.inc
    Builder->SetInsertPoint(outerIncBB);
    Value* rowNext = Builder->CreateAdd(Builder->CreateLoad(I32Ty(), rowA), Builder->getInt32(1));
    Builder->CreateStore(rowNext, rowA);
    Builder->CreateBr(outerCondBB);

    // Now parse user block into inner.body.
    Builder->SetInsertPoint(innerBodyBB);
    LoopStack.push_back({innerIncBB, afterBB});
}

static void endWhirl() {
    if (LoopStack.empty()) return;
    LoopContext ctx = LoopStack.back();
    LoopStack.pop_back();

    if (!Builder->GetInsertBlock()->getTerminator()) {
        Builder->CreateBr(ctx.innerIncBB);
    }
    Builder->SetInsertPoint(ctx.afterBB);
}

static Value* codegenDetect(Value* plane, Value* row, Value* col) {
    ensureMagicStoreAlloca();

    Value* idx0 = Builder->getInt64(0);
    Value* plane64 = asI64Index(plane);
    Value* row64 = asI64Index(row);
    Value* col64 = asI64Index(col);

    Value* ptr = Builder->CreateInBoundsGEP(MagicStoreTy, MagicStoreAlloca,
                                            {idx0, plane64, row64, col64});

    return Builder->CreateLoad(I32Ty(), ptr);
}

static void codegenCrave(Value* plane, Value* row, Value* col, Value* val) {
    ensureMagicStoreAlloca();

    Value* idx0 = Builder->getInt64(0);
    Value* plane64 = asI64Index(plane);
    Value* row64 = asI64Index(row);
    Value* col64 = asI64Index(col);

    Value* ptr = Builder->CreateInBoundsGEP(MagicStoreTy, MagicStoreAlloca,
                                            {idx0, plane64, row64, col64});

    Builder->CreateStore(asI32(val), ptr);
}

%}

%token IntLiteral
%token VarIdent

%token WhirlToken
%token PortalToken
%token WonderToken
%token MinorImageToken
%token IllusionToken
%token CraveToken
%token DetectToken
%token FocusToken
%token WishToken
%token InToken

%token EqualEqual
%token EOL

%left EqualEqual
%left '&'
%left '+' '-'
%right UMINUS

%%

Parse:
        Lines { YYACCEPT; }
        ;

Lines:
        /* empty */
    | Lines Line
    ;

Line:
        EOL
    | Statement EOL
    ;

Statement:
    WishStmt
  | MinorImageStmt
  | IllusionStmt
  | CraveStmt
  | WonderStmt
  | WhirlStmt
  | PortalStmt
  ;

Block:
        '{' Lines '}'
    ;

WishStmt:
    WishToken VarIdent Expression {
        std::string name((char*)$2);
        AllocaInst* a = ensureVar(name);
        Builder->CreateStore(asI32($3), a);
    }
  ;

MinorImageStmt:
    MinorImageToken Atom Atom Atom {
        ensureRuntimeDecls();
        Builder->CreateCall(DrawCellFunc, {asI32($2), asI32($3), asI32($4)});
    }
  ;

IllusionStmt:
    IllusionToken {
        ensureRuntimeDecls();
        Builder->CreateCall(SimFlushFunc);
    }
  ;

CraveStmt:
    CraveToken Atom Atom Atom Atom {
        codegenCrave($2, $3, $4, $5);
    }
  ;

WonderStmt:
    WonderToken Expression { beginWonder($2); } Block { endWonder(); }
  ;

PortalStmt:
    PortalToken { beginPortal(); } Block { endPortal(); }
  ;

WhirlStmt:
    WhirlToken
    '('
        VarIdent InToken '[' IntLiteral ',' IntLiteral ')' ')'
    '('
        VarIdent InToken '[' IntLiteral ',' IntLiteral ')' ')'
    {
        std::string rowVar((char*)$3);
        int rowStart = atoi((char*)$6);
        int rowEnd = atoi((char*)$8);

        std::string colVar((char*)$12);
        int colStart = atoi((char*)$15);
        int colEnd = atoi((char*)$17);

        beginWhirl(rowVar, rowStart, rowEnd, colVar, colStart, colEnd);
    }
    Block
    {
        endWhirl();
    }
  ;

Expression:
        Atom { $$ = $1; }
    | Expression '+' Atom { $$ = Builder->CreateAdd(asI32($1), asI32($3)); }
    | Expression '-' Atom { $$ = Builder->CreateSub(asI32($1), asI32($3)); }
    | Expression '&' Atom { $$ = Builder->CreateAnd(asI32($1), asI32($3)); }
    | Expression EqualEqual Atom {
        Value* cmp = Builder->CreateICmpEQ(asI32($1), asI32($3));
        $$ = Builder->CreateZExt(cmp, I32Ty());
    }
  ;

Atom:
        IntLiteral { $$ = Builder->getInt32(atoi((char*)$1)); }
    | VarIdent {
        std::string name((char*)$1);
        AllocaInst* a = ensureVar(name);
        $$ = Builder->CreateLoad(I32Ty(), a);
    }
  | '(' Expression ')' { $$ = $2; }
    | '-' Atom %prec UMINUS { $$ = Builder->CreateNeg(asI32($2)); }
    | DetectToken Atom Atom Atom { $$ = codegenDetect($2, $3, $4); }
    | FocusToken Atom Atom Atom {
                Value* cond = Builder->CreateICmpNE(asI32($2), Builder->getInt32(0));
                $$ = Builder->CreateSelect(cond, asI32($3), asI32($4));
        }
  ;

%%

int main(int argc, char** argv) {
    InitializeNativeTarget();
    InitializeNativeTargetAsmPrinter();

    if (argc != 2) {
        std::cerr << "Usage: spellcast2c <input.spell>\n";
        return 2;
    }

    yyin = fopen(argv[1], "rb");
    if (!yyin) {
        std::cerr << "[spellcast2] failed to open input: " << argv[1] << "\n";
        return 2;
    }

    TheModule = new Module("spellcast2", TheContext);
    Builder = new IRBuilder<>(TheContext);

    // define void @app()
    FunctionType* appTy = FunctionType::get(VoidTy(), {}, false);
    AppFunc = Function::Create(appTy, Function::ExternalLinkage, "app", TheModule);
    BasicBlock* entry = BasicBlock::Create(TheContext, "entry", AppFunc);
    Builder->SetInsertPoint(entry);

    ensureRuntimeDecls();
    ensureMagicStoreAlloca();

    int parseRc = yyparse();
    if (parseRc != 0) {
        return 1;
    }

    if (!Builder->GetInsertBlock()->getTerminator()) {
        Builder->CreateRetVoid();
    }

    TheModule->print(outs(), nullptr);

    if (verifyModule(*TheModule, &outs())) {
        outs() << "[VERIFICATION] FAIL\n";
        return 1;
    }

    return 0;
}
