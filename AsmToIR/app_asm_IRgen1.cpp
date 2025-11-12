#include "../SDL/sim.h"
#include "INSTR.h"

#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/ExecutionEngine/GenericValue.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/Error.h"
#include <fstream>
#include <iostream>
#include <sstream>
#include <unordered_map>
#include <unordered_set>
using namespace llvm;

//    XOR x1 x1 x1
//    MUL x3 x2 x1
//    SUBi x6 x6 16777216
//    PUT_PIXEL x5 x2 x6
//    INC_NEi x4 x5 512
//    BR_COND x4 label_13
//    FLUSH
//    EXIT

const int REG_FILE_SIZE = 16;
extern uint32_t REG_FILE[REG_FILE_SIZE];


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

    // [32 x i32] regFile = {0, 0, 0, 0}
    ArrayType* regFileType = ArrayType::get(builder.getInt32Ty(), REG_FILE_SIZE);
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
    ArrayRef<Type*> int32x4Types = {
        Type::getInt32Ty(context), Type::getInt32Ty(context),
        Type::getInt32Ty(context), Type::getInt32Ty(context)
    };
    ArrayRef<Type*> int32x5Types = {
        Type::getInt32Ty(context), Type::getInt32Ty(context),
        Type::getInt32Ty(context), Type::getInt32Ty(context),
        Type::getInt32Ty(context)
    };
    ArrayRef<Type*> int32x6Types = {
        Type::getInt32Ty(context), Type::getInt32Ty(context),
        Type::getInt32Ty(context), Type::getInt32Ty(context),
        Type::getInt32Ty(context), Type::getInt32Ty(context)
    };
    ArrayRef<Type*> int32x8Types = {
        Type::getInt32Ty(context), Type::getInt32Ty(context),
        Type::getInt32Ty(context), Type::getInt32Ty(context),
        Type::getInt32Ty(context), Type::getInt32Ty(context),
        Type::getInt32Ty(context), Type::getInt32Ty(context)
    };
    FunctionType* int32x3FuncType = FunctionType::get(voidType, int32x3Types, false);
    FunctionType* int32x4FuncType = FunctionType::get(voidType, int32x4Types, false);
    FunctionType* int32x5FuncType = FunctionType::get(voidType, int32x5Types, false);
    FunctionType* int32x6FuncType = FunctionType::get(voidType, int32x6Types, false);
    FunctionType* int32x8FuncType = FunctionType::get(voidType, int32x8Types, false);
    // Functions
    FunctionCallee do_FLUSHFunc = module->getOrInsertFunction("do_FLUSH", voidFuncType);
    FunctionCallee do_DRAWCFunc = module->getOrInsertFunction("do_DRAWC", int32x3FuncType);
    FunctionCallee do_ALLOCFunc = module->getOrInsertFunction("do_ALLOC", voidFuncType);
    FunctionCallee do_STOREFunc = module->getOrInsertFunction("do_STORE", int32x8FuncType);
    FunctionCallee do_MOVFunc = module->getOrInsertFunction("do_MOV", int32x3FuncType);
    FunctionCallee do_INC_LESSFunc = module->getOrInsertFunction("do_INC_LESS", int32x3FuncType);
    FunctionCallee do_READFunc = module->getOrInsertFunction("do_READ", int32x4FuncType);
    FunctionCallee do_SELECTEQFunc = module->getOrInsertFunction("do_SELECTEQ", int32x6FuncType);
    FunctionCallee do_EQFunc = module->getOrInsertFunction("do_EQ", int32x3FuncType);
    FunctionCallee do_ADDANDFunc = module->getOrInsertFunction("do_ADDAND", int32x4FuncType);
    FunctionCallee do_ADDFunc = module->getOrInsertFunction("do_ADD", int32x3FuncType);
    FunctionCallee do_DUMPFunc = module->getOrInsertFunction("do_DUMP", voidFuncType);

    input.open(argv[1]);

    // first - val
    // second - is_reg
    auto parseArg = [&builder](std::string arg) -> std::pair<Value*, Value*> {
        int f, s;
        if (arg[0] == 'x') {
            f = std::stoi(arg.substr(1));
            s = 1;
        } else {
            f = std::stoi(arg);
            s = 0;
        }
        return {builder.getInt32(f), builder.getInt32(s)};
    };

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
                ss  >> arg;
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
            if (name == "EXIT") {
                builder.CreateRetVoid();
            } else if (name == "ALLOC") {
                builder.CreateCall(do_ALLOCFunc);
            } else if (name == "DRAWC") {
                std::string arg_r, arg_c, arg_color;
                ss >> arg_r >> arg_c >> arg_color;
                Value* r = parseArg(arg_r).first;
                Value* c = parseArg(arg_c).first;
                Value* color = parseArg(arg_color).first;
                builder.CreateCall(do_DRAWCFunc, {r, c, color});
            } else if (name == "STORE") {
                std::string arg_i, arg_row, arg_col, arg_val;
                ss >> arg_i >> arg_row >> arg_col >> arg_val;
                auto [i, ir] = parseArg(arg_i);
                auto [row, rowr] = parseArg(arg_row);
                auto [col, colr] = parseArg(arg_col);
                auto [val, valr] = parseArg(arg_val);
                builder.CreateCall(do_STOREFunc, {i, ir, row, rowr, col, colr, val, valr});
            } else if (name == "MOV") {
                std::string arg_dst, arg_src;
                ss >> arg_dst >> arg_src;
                auto [a1, a2] = parseArg(arg_dst);
                auto [b1, b2] = parseArg(arg_src);
                builder.CreateCall(do_MOVFunc, {a1, b1, b2});
            } else if (name == "INC_LESS") {
                std::string arg_dst, arg_reg, arg_b;
                ss >> arg_dst >> arg_reg >> arg_b;
                auto dst = parseArg(arg_dst).first;
                auto reg = parseArg(arg_reg).first;
                auto b = parseArg(arg_b).first;
                builder.CreateCall(do_INC_LESSFunc, {dst, reg, b});
            } else if (name == "READ") {
                std::string arg_dst, arg_i, arg_row, arg_col;
                ss >> arg_dst >> arg_i >> arg_row >> arg_col;
                auto dst = parseArg(arg_dst).first;
                auto i = parseArg(arg_i).first;
                auto row = parseArg(arg_row).first;
                auto col = parseArg(arg_col).first;
                builder.CreateCall(do_READFunc, {dst, i, row, col});
            } else if (name == "SELECTEQ") {
                std::string arg_dst, arg_a, arg_b, arg_ift, arg_iff;
                ss >> arg_dst >> arg_a >> arg_b >> arg_ift >> arg_iff;
                auto dst = parseArg(arg_dst).first;
                auto a = parseArg(arg_a).first;
                auto b = parseArg(arg_b).first;
                auto ift = parseArg(arg_ift).first;
                auto [iff, iffr] = parseArg(arg_iff);
                builder.CreateCall(do_SELECTEQFunc, {dst, a, b, ift, iff, iffr});
            } else if (name == "EQ") {
                std::string arg_dst, arg_a, arg_b;
                ss >> arg_dst >> arg_a >> arg_b;
                auto dst = parseArg(arg_dst).first;
                auto a = parseArg(arg_a).first;
                auto b = parseArg(arg_b).first;
                builder.CreateCall(do_EQFunc, {dst, a, b});
            } else if (name == "ADDAND") {
                std::string arg_dst, arg_a, arg_b, arg_c;
                ss >> arg_dst >> arg_a >> arg_b >> arg_c;
                auto dst = parseArg(arg_dst).first;
                auto a = parseArg(arg_a).first;
                auto b = parseArg(arg_b).first;
                auto c = parseArg(arg_c).first;
                builder.CreateCall(do_ADDANDFunc, {dst, a, b, c});
            } else if (name == "ADD") {
                std::string arg_dst, arg_a, arg_b;
                ss >> arg_dst >> arg_a >> arg_b;
                auto dst = parseArg(arg_dst).first;
                auto a = parseArg(arg_a).first;
                auto b = parseArg(arg_b).first;
                builder.CreateCall(do_ADDFunc, {dst, a, b});
            } else if (name == "FLUSH") {
                builder.CreateCall(do_FLUSHFunc);
            } else if (name == "DUMP") {
                builder.CreateCall(do_DUMPFunc);
            } else {
                outs() << "unrsolved name=" << name << "\n in line:\n" << line << '\n';
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

    ExecutionEngine *ee =
    EngineBuilder(std::unique_ptr<Module>(module)).create();
    ee->InstallLazyFunctionCreator([](const std::string &fnName) -> void *
                                   {
        if (fnName == "do_FLUSH") {
        return reinterpret_cast<void *>(do_FLUSH);
        }
    if (fnName == "do_DRAWC") {
    return reinterpret_cast<void *>(do_DRAWC);
    }
    if (fnName == "do_ALLOC") {
    return reinterpret_cast<void *>(do_ALLOC);
    }
    if (fnName == "do_STORE") {
    return reinterpret_cast<void *>(do_STORE);
    }
    if (fnName == "do_MOV") {
    return reinterpret_cast<void *>(do_MOV);
    }
    if (fnName == "do_INC_LESS") {
    return reinterpret_cast<void *>(do_INC_LESS);
    }
    if (fnName == "do_READ") {
    return reinterpret_cast<void *>(do_READ);
    }
    if (fnName == "do_SELECTEQ") {
    return reinterpret_cast<void *>(do_SELECTEQ);
    }
    if (fnName == "do_EQ") {
    return reinterpret_cast<void *>(do_EQ);
    }
    if (fnName == "do_ADDAND") {
    return reinterpret_cast<void *>(do_ADDAND);
    }
    if (fnName == "do_ADD") {
    return reinterpret_cast<void *>(do_ADD);
    }
    if(fnName == "do_DUMP") {
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