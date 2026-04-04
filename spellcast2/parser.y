// %language "c++"

%{
#include <iostream>
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Verifier.h"
#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/ExecutionEngine/GenericValue.h"
#include "llvm/Support/TargetSelect.h"
#include "../SDL/sim.h"
using namespace llvm;


// extern int yylex();
extern int yylineno;
extern int yylex();

extern "C" {
    int yyparse();
    void yyerror(char *s) {
        std::cerr << s << "\n";
    }
    int yywrap(void){return 1;}
}

LLVMContext context;
IRBuilder<>* builder;
IRBuilder<>* entryBuilder;
Module* module;
Function *appFunc;
FunctionCallee simFlushFunc;
FunctionCallee simDrawCellFunc;

std::map<std::string, Value *> ValueMap;

std::map<std::string, BasicBlock *> BBMap;

ArrayType* dataArrayTy;
AllocaInst* dataArr = nullptr;

int main(int argc, char **argv)
{
    InitializeNativeTarget();
    InitializeNativeTargetAsmPrinter();

    // ; ModuleID = 'app'
    // source_filename = "app"
    module = new Module("app", context);
    builder = new IRBuilder<> (context);
    entryBuilder = new IRBuilder<> (context);

    ArrayRef<Type*> int32x3Types = { Type::getInt32Ty(context),
        Type::getInt32Ty(context),
        Type::getInt32Ty(context) };

    Type *voidTy   = Type::getVoidTy(context);
    simFlushFunc = module->getOrInsertFunction("simFlush", FunctionType::get(voidTy, {}, false));
    simDrawCellFunc = module->getOrInsertFunction("draw_cell", FunctionType::get(voidTy, int32x3Types, false));

    ArrayType* InnerArrayTy = ArrayType::get(builder->getInt32Ty(), 64);
    ArrayType* MiddleArrayTy = ArrayType::get(InnerArrayTy, 64);
    dataArrayTy = ArrayType::get(MiddleArrayTy, 2);

    FunctionType* funcType = FunctionType::get(builder->getVoidTy(), false);
    appFunc  = Function::Create(funcType, Function::ExternalLinkage, "app", module);

    yyparse();

    module->print(outs(), nullptr);
    if (verifyModule(*module, &outs())) {
        outs() << "[VERIFICATION] FAIL\n";
        return 1;
    }
    return 0;
}
%}

%code requires {
  #include <cstdint>
  namespace llvm { class Value; }
}

%union {
    int32_t i32;
    char* str;
    llvm::Value* val;
}


%token <i32> INT
%token <str> VAR
%token PORTAL WONDER WISH DETECT CRAVE WHIRL
%token FOCUS
%token MINOR_IMAGE ILLUSION
%token IN
%token EQ
%token NEWLINE

%type <val> expr
%type <val> var_ 

%left '&'
%left '+'
%nonassoc EQ

%%

program
  : script
    ;

script
  : 
  | spell script

spell
  : NEWLINE
  | PORTAL 
    {
      BBMap.insert({(char*) "portal_begin", BasicBlock::Create(context, (char*)"portal_begin", appFunc)});
      BBMap.insert({(char*) "portal_end", BasicBlock::Create(context, (char*)"portal_end", appFunc)});
      builder->SetInsertPoint(BBMap["portal_begin"]);
    }
    '{' script '}'
    {
      builder->CreateBr(BBMap["portal_end"]);
      builder->SetInsertPoint(BBMap["portal_end"]);
    }
  | WHIRL '(' expr IN '[' INT ',' INT ')' ')'
      '(' expr IN '[' INT ',' INT ')' ')'
      '{' script '}'
    {

    }
  | WISH var_ expr
    {
      builder->CreateStore($3, $2);
    }
  | CRAVE expr expr expr expr 
    {
      Value* ptr = builder->CreateGEP(dataArrayTy, dataArr, {builder->getInt32(0), $2, $3, $4}, "slot.ptr");
      builder->CreateStore($5, ptr);
    }
  | MINOR_IMAGE expr expr expr
    {
      builder->CreateCall(simDrawCellFunc, {$2, $3, $4});
    }
  | ILLUSION
    {
      builder->CreateCall(simFlushFunc);
    }
;

expr
  : INT
    {
        $$ = builder->getInt32($1);
    }
  | var_ 
    {
        $$ = builder->CreateLoad(builder->getInt32Ty(), $1);
    }
  | '(' expr ')'
    {
      $$ = $2;
    }
  | expr '+' expr
    {
      $$ = builder->CreateAdd($1, $3);;
    }
  | expr '&' expr
    {
      $$ = builder->CreateAnd($1, $3);
    }
  | expr EQ expr
    {
      Value* cmp = builder->CreateICmpEQ($1, $3);
      $$ = builder->CreateZExt(cmp, builder->getInt32Ty());
    }
  | FOCUS expr expr expr
    {
      Value* cond = builder->CreateICmpNE($2, builder->getInt32(0), "focus.cond");
      $$ = builder->CreateSelect(cond, $3, $4, "focus");
    }
  | DETECT expr expr expr
    {
      Value* ptr = builder->CreateGEP(dataArrayTy, dataArr, {builder->getInt32(0), $2, $3, $4}, "slot.ptr");
      $$ = builder->CreateLoad(builder->getInt32Ty(), ptr, "slot.val");
    }
;

var_ 
  : VAR 
  {
    if (ValueMap.find((char*)$1) == ValueMap.end()) {
        entryBuilder->SetInsertPoint(entryBuilder->GetInsertBlock(), --entryBuilder->GetInsertPoint());
        ValueMap.insert({(char*)$1, entryBuilder->CreateAlloca(entryBuilder->getInt32Ty())});
    }                            
    $$ = builder->CreateConstGEP1_32(builder->getInt32Ty(), ValueMap[(char*)$1], 0);
  }

%%

void yyerror(const char* s)
{
    std::fprintf(stderr, "Parse error (line %d): %s\n", yylineno, s);
}
