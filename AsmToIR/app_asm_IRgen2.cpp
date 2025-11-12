#include "../SDL/sim.h"
#include "INSTR.h"

#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/ExecutionEngine/GenericValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Support/Error.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/raw_ostream.h"
#include <fstream>
#include <iostream>
#include <sstream>
#include <unordered_map>
#include <unordered_set>
using namespace llvm;

std::unordered_set<std::string> INSTR = {
    "EXIT",
    "DRAWC",
    "ALLOC",
    "STORE",
    "BR_COND",
    "MOV",
    "INC_LESS",
    "FLUSH",
    "READ",
    "SELECTEQ",
    "GOTO",
    "EQ",
    "ADDAND",
    "ADD",
    "DUMP"
};

const int REG_FILE_SIZE = 16;
extern uint32_t REG_FILE[REG_FILE_SIZE];

int main(int argc, char* argv[]) {
    if (argc != 3) {
        outs() << "[ERROR] Need 2 argument: <input> <output> \n";
        return 1;
    }
    std::ifstream input;
    input.open(argv[1]);
    if (!input.is_open()) {
        outs() << "[ERROR] Can't open " << argv[1] << '\n';
        return 1;
    }

    LLVMContext context;
    // ; ModuleID = 'top'
    // source_filename = "top"
    Module* module = new Module("top", context);
    IRBuilder<> builder(context);

    auto int32Type = builder.getInt32Ty();

    ArrayType* regFileType = ArrayType::get(int32Type, REG_FILE_SIZE);
    // GlobalVariable* regFile = new GlobalVariable(
    //     *module, regFileType, false, GlobalValue::PrivateLinkage, 0, "regFile");
    // regFile->setInitializer(ConstantAggregateZero::get(regFileType));

    module->getOrInsertGlobal("regFile", regFileType);
    GlobalVariable* regFile = module->getNamedGlobal("regFile");

    // declare void @main()
    FunctionType* funcType = FunctionType::get(builder.getVoidTy(), false);
    Function* appFunc = Function::Create(funcType, Function::ExternalLinkage, "app", module);

    std::string line;
    std::unordered_map<std::string, BasicBlock*> BBMap;

    while (getline(input, line)) {
        std::stringstream ss(line);
        std::string name;
        if (!(ss >> name)) {
            continue;
        }
        if (name == "//") {
            continue;
        }
        if (INSTR.count(name) > 0) {
            continue;
        }
        // encounter label
        BBMap[name] = BasicBlock::Create(context, name, appFunc);
    }

    input.close();

    // Functions types
    Type* voidType = Type::getVoidTy(context);
    FunctionType* voidFuncType = FunctionType::get(voidType, false);
    ArrayRef<Type*> int32x3Types = { Type::getInt32Ty(context),
        Type::getInt32Ty(context),
        Type::getInt32Ty(context) };
    // Functions
    FunctionCallee simFlushFunc = module->getOrInsertFunction("simFlush", voidFuncType);
    FunctionCallee do_DUMPFunc = module->getOrInsertFunction("do_DUMP", voidFuncType);
    FunctionCallee draw_cellFunc = module->getOrInsertFunction("draw_cell", FunctionType::get(voidType, int32x3Types, false));

    input.open(argv[1]);

    // first - val
    // second - is_reg

    auto parseRegPtr = [&](std::string arg) -> Value* {
        int regId = std::stoi(arg.substr(1));
        return builder.CreateConstGEP2_32(regFileType, regFile, 0, regId);
    };

    auto parseArg = [&](std::string arg) -> Value* {
        if (arg[0] == 'x') {
            int regId = std::stoi(arg.substr(1));
            return builder.CreateLoad(
                int32Type, builder.CreateConstGEP2_32(regFileType, regFile, 0, regId));
        } else {
            return builder.getInt32(std::stoi(arg));
        }
    };

    ArrayType* InnerArrayTy = ArrayType::get(builder.getInt32Ty(), 64);
    ArrayType* MiddleArrayTy = ArrayType::get(InnerArrayTy, 64);
    ArrayType* dataArrayTy = ArrayType::get(MiddleArrayTy, 2);
    AllocaInst* dataArr = nullptr;

    bool wasBr = true;
    while (getline(input, line)) {
        std::stringstream ss(line);
        std::string name;
        if (!(ss >> name)) {
            continue;
        }
        if (name == "//") {
            continue;
        }
        if (INSTR.count(name) > 0) {
            if (name == "BR_COND") {
                std::string arg, arg2;
                ss >> arg;
                Value* reg_p = builder.CreateConstGEP2_32(regFileType, regFile, 0,
                    std::stoi(arg.substr(1)));
                Value* reg_i1 = builder.CreateTrunc(
                    builder.CreateLoad(builder.getInt32Ty(), reg_p), builder.getInt1Ty());
                ss >> arg >> arg2;
                builder.CreateCondBr(reg_i1, BBMap[arg], BBMap[arg2]);
                wasBr = true;
                continue;
            }
            if (name == "GOTO") {
                std::string arg;
                ss >> arg;
                builder.CreateBr(BBMap[arg]);
                wasBr = true;
                continue;
            }

            Value* zero64 = builder.getInt64(0);
            if (name == "EXIT") {
                builder.CreateRetVoid();
            } else if (name == "ALLOC") {
                dataArr = builder.CreateAlloca(dataArrayTy, nullptr, "");
            } else if (name == "DRAWC") {
                std::string arg_r, arg_c, arg_color;
                ss >> arg_r >> arg_c >> arg_color;
                Value* r = parseArg(arg_r);
                Value* c = parseArg(arg_c);
                Value* color = parseArg(arg_color);
                builder.CreateCall(draw_cellFunc, { r, c, color });
            } else if (name == "STORE") {
                std::string arg_i, arg_row, arg_col, arg_val;
                ss >> arg_i >> arg_row >> arg_col >> arg_val;
                auto i = parseArg(arg_i);
                auto row = parseArg(arg_row);
                auto col = parseArg(arg_col);
                auto val = parseArg(arg_val);
                auto dst = builder.CreateGEP(dataArrayTy, dataArr, { zero64, i, row, col });
                builder.CreateStore(val, dst);
            } else if (name == "MOV") {
                std::string arg_dst, arg_src;
                ss >> arg_dst >> arg_src;
                auto dst = parseRegPtr(arg_dst);
                auto src = parseArg(arg_src);
                builder.CreateStore(src, dst);
            } else if (name == "INC_LESS") {
                std::string arg_dst, arg_reg, arg_b;
                ss >> arg_dst >> arg_reg >> arg_b;
                auto dst = parseRegPtr(arg_dst);
                auto reg = parseRegPtr(arg_reg);
                auto b = parseArg(arg_b);
                auto cur = builder.CreateLoad(int32Type, reg);
                auto inc = builder.CreateAdd(cur, builder.getInt32(1));
                builder.CreateStore(inc, reg);
                auto eq = builder.CreateICmpSLT(inc, b);
                builder.CreateStore(eq, dst);
            } else if (name == "READ") {
                std::string arg_dst, arg_i, arg_row, arg_col;
                ss >> arg_dst >> arg_i >> arg_row >> arg_col;
                auto dst = parseRegPtr(arg_dst);
                auto i = parseArg(arg_i);
                auto row = parseArg(arg_row);
                auto col = parseArg(arg_col);
                auto src = builder.CreateGEP(dataArrayTy, dataArr, {zero64,  i, row, col });
                auto val = builder.CreateLoad(int32Type, src);
                builder.CreateStore(val, dst);
            } else if (name == "SELECTEQ") {
                std::string arg_dst, arg_a, arg_b, arg_ift, arg_iff;
                ss >> arg_dst >> arg_a >> arg_b >> arg_ift >> arg_iff;
                auto dst = parseRegPtr(arg_dst);
                auto a = parseArg(arg_a);
                auto b = parseArg(arg_b);
                auto res = builder.CreateICmpEQ(a, b);
                auto ift = parseArg(arg_ift);
                auto iff = parseArg(arg_iff);
                auto r = builder.CreateSelect(res, ift, iff);
                builder.CreateStore(r, dst);
            } else if (name == "EQ") {
                std::string arg_dst, arg_a, arg_b;
                ss >> arg_dst >> arg_a >> arg_b;
                auto dst = parseRegPtr(arg_dst);
                auto a = parseArg(arg_a);
                auto b = parseArg(arg_b);
                auto res = builder.CreateICmpEQ(a, b);
                auto res_i32 = builder.CreateZExt(res, int32Type);
                builder.CreateStore(res_i32, dst);
            } else if (name == "ADDAND") {
                std::string arg_dst, arg_a, arg_b, arg_c;
                ss >> arg_dst >> arg_a >> arg_b >> arg_c;
                auto dst = parseRegPtr(arg_dst);
                auto a = parseArg(arg_a);
                auto b = parseArg(arg_b);
                auto c = parseArg(arg_c);
                auto s = builder.CreateAdd(a, b);
                auto res = builder.CreateAnd(s, c);
                builder.CreateStore(res, dst);
            } else if (name == "ADD") {
                std::string arg_dst, arg_a, arg_b;
                ss >> arg_dst >> arg_a >> arg_b;
                auto dst = parseRegPtr(arg_dst);
                auto a = parseArg(arg_a);
                auto b = parseArg(arg_b);
                auto res = builder.CreateAdd(a, b);
                builder.CreateStore(res, dst);
            } else if (name == "FLUSH") {
                builder.CreateCall(simFlushFunc);
            } else if (name == "DUMP") {
                builder.CreateCall(do_DUMPFunc);
            } else {
                outs() << "unrsolved name=" << name << "\n in line:\n"
                       << line << '\n';
            }
        } else {
            if (wasBr) {
                wasBr = false;
            } else {
                builder.CreateBr(BBMap[name]);
            }
            builder.SetInsertPoint(BBMap[name]);
        }
    }

    input.close();

    outs() << "\n#[LLVM IR]:\n";
    module->print(outs(), nullptr);
    outs() << '\n';
    bool verif = verifyFunction(*appFunc, &outs());
    outs() << "[VERIFICATION] " << (verif ? "FAIL\n\n" : "OK\n\n");

    std::error_code EC;
    llvm::raw_fd_ostream fout(argv[2], EC, llvm::sys::fs::OF_None);
    module->print(fout, nullptr);

    outs() << "\n#[Running code]\n";
    InitializeNativeTarget();
    InitializeNativeTargetAsmPrinter();

    ExecutionEngine* ee = EngineBuilder(std::unique_ptr<Module>(module)).create();
    ee->InstallLazyFunctionCreator([](const std::string& fnName) -> void* {
        if (fnName == "simFlush") {
        return reinterpret_cast<void *>(simFlush);
        }
        if(fnName == "draw_cell") {
        return reinterpret_cast<void *>(draw_cell);
        }
        if (fnName == "do_DUMP") {
        return reinterpret_cast<void *>(do_DUMP);
        }
    return nullptr; });

    ee->addGlobalMapping(regFile, (void *)REG_FILE);
    ee->finalizeObject();

    simInit();

    ArrayRef<GenericValue> noargs;
    ee->runFunction(appFunc, noargs);
    outs() << "#[Code was run]\n";

    simExit();
    return EXIT_SUCCESS;
}