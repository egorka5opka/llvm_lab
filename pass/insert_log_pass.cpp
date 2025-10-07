#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Verifier.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"

#include <vector>
using namespace llvm;

struct MyModPass : public PassInfoMixin<MyModPass> {
  Type *voidType;
  Type *int8PtrTy;
  Type *int32Ty;
  Type *int64Ty;

  bool isFuncLogger(StringRef name) {
    return name == "binOptLogger" || name == "callLogger" ||
           name == "funcStartLogger" || name == "funcEndLogger" ||
           name == "resIntLogger";
  }

  bool insertFuncStartLog(Module &M, Function &F, IRBuilder<> &builder) {
    // Prepare funcStartLogger function
    ArrayRef<Type *> funcStartParamTypes = {int8PtrTy};
    FunctionType *funcStartLogFuncType =
        FunctionType::get(voidType, funcStartParamTypes, false);
    FunctionCallee funcStartLogFunc =
        M.getOrInsertFunction("funcStartLogger", funcStartLogFuncType);

    // Insert a call to funcStartLogger function in the function begin
    BasicBlock &entryBB = F.getEntryBlock();
    builder.SetInsertPoint(&entryBB.front());
    Value *funcName = builder.CreateGlobalStringPtr(F.getName());
    Value *args[] = {funcName};
    builder.CreateCall(funcStartLogFunc, args);

    return true;
  }

  bool insertCallLog(Module &M, Function &F, IRBuilder<> &builder) {
    // Prepare callLogger function
    ArrayRef<Type *> callParamTypes = {int8PtrTy, int8PtrTy, int64Ty};
    FunctionType *callLogFuncType =
        FunctionType::get(voidType, callParamTypes, false);
    FunctionCallee callLogFunc =
        M.getOrInsertFunction("callLogger", callLogFuncType);

    // Prepare resIntLogger function
    ArrayRef<Type *> resIntParamTypes = {int64Ty, int64Ty};
    FunctionType *resIntLogFuncType =
        FunctionType::get(voidType, resIntParamTypes, false);
    FunctionCallee resIntLogFunc =
        M.getOrInsertFunction("resIntLogger", resIntLogFuncType);

    bool Inserted = false;
    // Insert loggers for call, binOpt and ret instructions
    for (auto &B : F) {
      for (auto &I : B) {
        Value *valueAddr = ConstantInt::get(int64Ty, (int64_t)(&I));
        if (auto *call = dyn_cast<CallInst>(&I)) {
          // Insert before call
          builder.SetInsertPoint(call);

          // Insert a call to callLogger function
          Function *callee = call->getCalledFunction();
          if (callee && !isFuncLogger(callee->getName())) {
            Value *calleeName =
                builder.CreateGlobalStringPtr(callee->getName());
            Value *funcName = builder.CreateGlobalStringPtr(F.getName());
            Value *args[] = {funcName, calleeName, valueAddr};
            builder.CreateCall(callLogFunc, args);
            Inserted = true;

            // Insert result dump
            if (!call->getType()->isVoidTy()) {
              builder.SetInsertPoint(call->getNextNode());
              Value *resArgs[] = {call, valueAddr};
              builder.CreateCall(resIntLogFunc, resArgs);
            }
          }
        }
      }
    }
    return Inserted;
  }

  bool insertFuncEndLog(Module &M, Function &F, IRBuilder<> &builder) {
    // Prepare funcEndLogger function
    ArrayRef<Type *> funcEndParamTypes = {int8PtrTy, int64Ty};
    FunctionType *funcEndLogFuncType =
        FunctionType::get(voidType, funcEndParamTypes, false);
    FunctionCallee funcEndLogFunc =
        M.getOrInsertFunction("funcEndLogger", funcEndLogFuncType);

    bool Inserted = false;
    // Insert loggers for call, binOpt and ret instructions
    for (auto &B : F) {
      for (auto &I : B) {
        Value *valueAddr = ConstantInt::get(int64Ty, (int64_t)(&I));
        if (auto *ret = dyn_cast<ReturnInst>(&I)) {
          // Insert before ret
          builder.SetInsertPoint(ret);

          // Insert a call to funcEndLogFunc function
          Value *funcName = builder.CreateGlobalStringPtr(F.getName());
          Value *args[] = {funcName, valueAddr};
          builder.CreateCall(funcEndLogFunc, args);
          Inserted = true;
        }
      }
    }
    return Inserted;
  }

  std::string getName(Value* val) {
    if (val->hasName()) {
      return val->getName().str();
    } else if (isa<ConstantInt>(val)) {
      auto *C = cast<ConstantInt>(val);
      return std::to_string(C->getSExtValue());
    } else {
      std::string tmp;
      llvm::raw_string_ostream rso(tmp);
      val->printAsOperand(rso, false);
      return rso.str();
    }
  }

  bool insertOptLogs(Module &M, Function &F, IRBuilder<> &builder) {

    FunctionCallee useLogger = M.getOrInsertFunction("useLogger", FunctionType::get(voidType, {int8PtrTy, int8PtrTy}, false));

    bool Inserted = false;
    for (auto &B : F) {
      for (auto &I : B) {
        if (dyn_cast<PHINode>(&I)) {
          continue;
        }
        int operands_cnt = I.getNumOperands();
        Value *opName = builder.CreateGlobalStringPtr(I.getOpcodeName());
        builder.SetInsertPoint(&I);
        builder.SetInsertPoint(&B, builder.GetInsertPoint());
        
        for (int i = 0; i < operands_cnt; ++i) {
          Value *op = I.getOperand(i);

          std::string opNameStr;

          if (Instruction *opI = dyn_cast<Instruction>(op)) {
            opNameStr = opI->getOpcodeName();
          } else if (Argument *arg = dyn_cast<Argument>(op)) {
            if (arg->hasName())
              opNameStr = arg->getName().str();
            else
              opNameStr = "arg";
          } else if (ConstantInt *ci = dyn_cast<ConstantInt>(op)) {
            opNameStr = std::to_string(ci->getSExtValue());
          } else {
            std::string tmp;
            raw_string_ostream rso(tmp);
            op->printAsOperand(rso, false);
            opNameStr = rso.str();
          }

          Value *opNameGV = builder.CreateGlobalStringPtr(opNameStr);
          builder.CreateCall(useLogger, {opName, opNameGV});

        }

        Inserted = true;
      }
    }

    for (auto &B : F) {
        outs() << "\n#[Basic block]";
        B.print(outs());
      }
      outs() << '\n';

    return Inserted;
  }

  PreservedAnalyses run(Module &M, ModuleAnalysisManager &AM) {
    outs() << "[Module] " << M.getName() << '\n';
    if (M.getName() != "SDL/app.c") {
      return PreservedAnalyses::all();
    }

    // Prepare builder for IR modification
    LLVMContext &Ctx = M.getContext();
    IRBuilder<> builder(Ctx);
    voidType = Type::getVoidTy(Ctx);
    int8PtrTy = Type::getInt8Ty(Ctx)->getPointerTo();
    int32Ty = Type::getInt32Ty(Ctx);
    int64Ty = Type::getInt64Ty(Ctx);

    for (auto &F : M) {
      outs() << "[Function] " << F.getName() << " (arg_size: " << F.arg_size()
             << ")\n";
      if (isFuncLogger(F.getName()) || F.isDeclaration()) {
        continue;
      }

      if (insertFuncEndLog(M, F, builder)) {
        outs() << "insertFuncEndLog done\n";
      }

      if (insertOptLogs(M, F, builder)) {
        outs() << "insertOptLogs done\n";
      }
      
      if (insertFuncStartLog(M, F, builder)) {
        outs() << "insertFuncStartLog done\n";
      }

      outs() << '\n';
      bool verif = verifyFunction(F, &outs());
      outs() << "[VERIFICATION] " << (verif ? "FAIL\n\n" : "OK\n\n");
    }
    outs() << '\n';
    return PreservedAnalyses::none();
  };
};

PassPluginLibraryInfo getPassPluginInfo() {
  const auto callback = [](PassBuilder &PB) {
    // PB.registerOptimizerLastEPCallback([](ModulePassManager &MPM, auto) {
    PB.registerPipelineStartEPCallback([](ModulePassManager &MPM, auto) {
      MPM.addPass(MyModPass{});
      return true;
    });
  };

  return {LLVM_PLUGIN_API_VERSION, "MyPlugin", "0.0.1", callback};
};

/* When a plugin is loaded by the driver, it will call this entry point to
obtain information about this plugin and about how to register its passes.
*/
extern "C" LLVM_ATTRIBUTE_WEAK PassPluginLibraryInfo llvmGetPassPluginInfo() {
  return getPassPluginInfo();
}