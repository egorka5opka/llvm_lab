#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/LLVMContext.h"
#include "llvm/IR/Module.h"
#include "llvm/ExecutionEngine/ExecutionEngine.h"
#include "llvm/ExecutionEngine/GenericValue.h"
#include "llvm/IR/Verifier.h"
#include "llvm/IR/Type.h"
#include "llvm/Support/TypeSize.h"
#include "llvm/IR/Value.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/Constants.h"
#include "llvm/Support/TargetSelect.h"
#include "llvm/Support/raw_ostream.h"

#include "../SDL/sim.h"

#include <unordered_map>
#include <array>

using namespace llvm;
using std::string;

// O2
int main()
{
    LLVMContext context;

    // ; ModuleID = 'SDL/app.c'
    // source_filename = "SDL/app.c"
    Module *module = new Module("SDL/app.c", context);
    IRBuilder<> builder(context);

    Type *intTy = builder.getInt32Ty();
    Type *int64Ty = builder.getInt64Ty();
    Type *voidTy = builder.getVoidTy();

    auto int64 = [&builder](uint64_t x)
    { return builder.getInt64(x); };
    auto int32 = [&builder](uint32_t x)
    { return builder.getInt32(x); };

    FunctionCallee simPutPixelFunc = module->getOrInsertFunction("simPutPixel",
                                                                 FunctionType::get(builder.getVoidTy(), {intTy, intTy, intTy}, false));
    FunctionCallee simFlushFunc = module->getOrInsertFunction("simFlush",
                                                              FunctionType::get(builder.getVoidTy(), {}, false));

    // define dso_local void @draw_cell(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
    FunctionType *drawCellFuncType = FunctionType::get(voidTy, {intTy, intTy, intTy}, false);
    Function *drawCellFunc = Function::Create(drawCellFuncType, Function::ExternalLinkage, "draw_cell", module);
    {

        BasicBlock *BB3 = BasicBlock::Create(context, "", drawCellFunc);
        BasicBlock *BB13 = BasicBlock::Create(context, "", drawCellFunc);
        BasicBlock *BB18 = BasicBlock::Create(context, "", drawCellFunc);

        Value *var0 = drawCellFunc->getArg(0);
        Value *var1 = drawCellFunc->getArg(1);
        Value *var2 = drawCellFunc->getArg(2);

        builder.SetInsertPoint(BB3);
        //   %4 = shl nsw i32 %0, 3
        Value *var4 = builder.CreateShl(var0, 3, "", false, true);

        //   %5 = shl nsw i32 %1, 3
        Value *var5 = builder.CreateShl(var1, 3, "", false, true);

        //   %6 = or disjoint i32 %5, 1
        Value *var6 = builder.CreateOr(var5, 1);
        //   %7 = or disjoint i32 %5, 2
        Value *var7 = builder.CreateOr(var5, 2);
        //   %8 = or disjoint i32 %5, 3
        Value *var8 = builder.CreateOr(var5, 3);
        //   %9 = or disjoint i32 %5, 4
        Value *var9 = builder.CreateOr(var5, 4);
        //   %10 = or disjoint i32 %5, 5
        Value *var10 = builder.CreateOr(var5, 5);
        //   %11 = or disjoint i32 %5, 6
        Value *var11 = builder.CreateOr(var5, 6);
        //   %12 = or disjoint i32 %5, 7
        Value *var12 = builder.CreateOr(var5, 7);
        //   br label %13
        builder.CreateBr(BB13);

        // 13:                                              ; preds = %3, %13
        builder.SetInsertPoint(BB13);

        //   %14 = phi i32 [ 0, %3 ], [ %16, %13 ]
        PHINode *var14 = builder.CreatePHI(builder.getInt32Ty(), 2, "");
        var14->addIncoming(builder.getInt32(0), BB3);

        //   %15 = add nuw nsw i32 %14, %4
        Value *var15 = builder.CreateAdd(var14, var4);

        //   tail call void @simPutPixel(i32 noundef %15, i32 noundef %5, i32 noundef %2) #4
        builder.CreateCall(simPutPixelFunc, {var15, var5, var2});
        //   tail call void @simPutPixel(i32 noundef %15, i32 noundef %6, i32 noundef %2) #4
        builder.CreateCall(simPutPixelFunc, {var15, var6, var2});
        //   tail call void @simPutPixel(i32 noundef %15, i32 noundef %7, i32 noundef %2) #4
        builder.CreateCall(simPutPixelFunc, {var15, var7, var2});
        //   tail call void @simPutPixel(i32 noundef %15, i32 noundef %8, i32 noundef %2) #4
        builder.CreateCall(simPutPixelFunc, {var15, var8, var2});
        //   tail call void @simPutPixel(i32 noundef %15, i32 noundef %9, i32 noundef %2) #4
        builder.CreateCall(simPutPixelFunc, {var15, var9, var2});
        //   tail call void @simPutPixel(i32 noundef %15, i32 noundef %10, i32 noundef %2) #4
        builder.CreateCall(simPutPixelFunc, {var15, var10, var2});
        //   tail call void @simPutPixel(i32 noundef %15, i32 noundef %11, i32 noundef %2) #4
        builder.CreateCall(simPutPixelFunc, {var15, var11, var2});
        //   tail call void @simPutPixel(i32 noundef %15, i32 noundef %12, i32 noundef %2) #4
        builder.CreateCall(simPutPixelFunc, {var15, var12, var2});
        //   %16 = add nuw nsw i32 %14, 1
        Value *var16 = builder.CreateAdd(var14, builder.getInt32(1), "", true, true);
        var14->addIncoming(var16, BB13);
        //   %17 = icmp eq i32 %16, 8
        Value *var17 = builder.CreateICmpEQ(var16, builder.getInt32(8));
        //   br i1 %17, label %18, label %13, !llvm.loop !5
        builder.CreateCondBr(var17, BB18, BB13);

        // 18:                                               ; preds = %13
        builder.SetInsertPoint(BB18);
        //   ret void
        builder.CreateRetVoid();
        // }
    }
    Function *appFunc = Function::Create(FunctionType::get(voidTy, {}, false), Function::ExternalLinkage, "app", module);
    {
        // define dso_local void @app() local_unnamed_addr #0 {

        BasicBlock *BB0 = BasicBlock::Create(context, "", appFunc);
        BasicBlock *BB2 = BasicBlock::Create(context, "", appFunc);
        BasicBlock *BB38 = BasicBlock::Create(context, "", appFunc);
        BasicBlock *BB59 = BasicBlock::Create(context, "", appFunc);
        BasicBlock *BB62 = BasicBlock::Create(context, "", appFunc);
        BasicBlock *BB68 = BasicBlock::Create(context, "", appFunc);
        BasicBlock *BB71 = BasicBlock::Create(context, "", appFunc);
        BasicBlock *BB72 = BasicBlock::Create(context, "", appFunc);
        BasicBlock *BB75 = BasicBlock::Create(context, "", appFunc);
        BasicBlock *BB82 = BasicBlock::Create(context, "", appFunc);
        BasicBlock *BB88 = BasicBlock::Create(context, "", appFunc);
        BasicBlock *BB91 = BasicBlock::Create(context, "", appFunc);
        BasicBlock *BB98 = BasicBlock::Create(context, "", appFunc);
        BasicBlock *BB101 = BasicBlock::Create(context, "", appFunc);
        BasicBlock *BB105 = BasicBlock::Create(context, "", appFunc);
        BasicBlock *BB146 = BasicBlock::Create(context, "", appFunc);
        BasicBlock *BB147 = BasicBlock::Create(context, "", appFunc);
        BasicBlock *BB152 = BasicBlock::Create(context, "", appFunc);

        builder.SetInsertPoint(BB0);

        std::array<Value *, 200> var;

        //   %1 = alloca [2 x [64 x [64 x i32]]], align 16
        ArrayType *InnerArrayTy = ArrayType::get(intTy, 64);
        ArrayType *MiddleArrayTy = ArrayType::get(InnerArrayTy, 64);
        ArrayType *dataArrayTy = ArrayType::get(MiddleArrayTy, 2);
        AllocaInst *var1 = builder.CreateAlloca(dataArrayTy, nullptr, "");
        var1->setAlignment(Align(16));
        var[1] = var1;

        //   call void @llvm.lifetime.start.p0(i64 32768, ptr nonnull %1) #4
        //   br label %2
        builder.CreateBr(BB2);

        // 2:                                                ; preds = %2, %0
        builder.SetInsertPoint(BB2);
        //   %3 = phi i64 [ 0, %0 ], [ %36, %2 ]
        PHINode *var3 = builder.CreatePHI(int64Ty, 2);
        var3->addIncoming(builder.getInt64(0), BB0);
        var[3] = var3;

        //   %4 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 0
        //   store <4 x i32> zeroinitializer, ptr %4, align 16, !tbaa !7
        //   %5 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 0
        //   store <4 x i32> zeroinitializer, ptr %5, align 16, !tbaa !7
        //   %6 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 4
        //   store <4 x i32> zeroinitializer, ptr %6, align 16, !tbaa !7
        //   %7 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 4
        //   store <4 x i32> zeroinitializer, ptr %7, align 16, !tbaa !7
        //   %8 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 8
        //   store <4 x i32> zeroinitializer, ptr %8, align 16, !tbaa !7
        //   %9 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 8
        //   store <4 x i32> zeroinitializer, ptr %9, align 16, !tbaa !7
        //   %10 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 12
        //   store <4 x i32> zeroinitializer, ptr %10, align 16, !tbaa !7
        //   %11 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 12
        //   store <4 x i32> zeroinitializer, ptr %11, align 16, !tbaa !7
        //   %12 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 16
        //   store <4 x i32> zeroinitializer, ptr %12, align 16, !tbaa !7
        //   %13 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 16
        //   store <4 x i32> zeroinitializer, ptr %13, align 16, !tbaa !7
        //   %14 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 20
        //   store <4 x i32> zeroinitializer, ptr %14, align 16, !tbaa !7
        //   %15 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 20
        //   store <4 x i32> zeroinitializer, ptr %15, align 16, !tbaa !7
        //   %16 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 24
        //   store <4 x i32> zeroinitializer, ptr %16, align 16, !tbaa !7
        //   %17 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 24
        //   store <4 x i32> zeroinitializer, ptr %17, align 16, !tbaa !7
        //   %18 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 28
        //   store <4 x i32> zeroinitializer, ptr %18, align 16, !tbaa !7
        //   %19 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 28
        //   store <4 x i32> zeroinitializer, ptr %19, align 16, !tbaa !7
        //   %20 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 32
        //   store <4 x i32> zeroinitializer, ptr %20, align 16, !tbaa !7
        //   %21 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 32
        //   store <4 x i32> zeroinitializer, ptr %21, align 16, !tbaa !7
        //   %22 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 36
        //   store <4 x i32> zeroinitializer, ptr %22, align 16, !tbaa !7
        //   %23 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 36
        //   store <4 x i32> zeroinitializer, ptr %23, align 16, !tbaa !7
        //   %24 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 40
        //   store <4 x i32> zeroinitializer, ptr %24, align 16, !tbaa !7
        //   %25 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 40
        //   store <4 x i32> zeroinitializer, ptr %25, align 16, !tbaa !7
        //   %26 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 44
        //   store <4 x i32> zeroinitializer, ptr %26, align 16, !tbaa !7
        //   %27 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 44
        //   store <4 x i32> zeroinitializer, ptr %27, align 16, !tbaa !7
        //   %28 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 48
        //   store <4 x i32> zeroinitializer, ptr %28, align 16, !tbaa !7
        //   %29 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 48
        //   store <4 x i32> zeroinitializer, ptr %29, align 16, !tbaa !7
        //   %30 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 52
        //   store <4 x i32> zeroinitializer, ptr %30, align 16, !tbaa !7
        //   %31 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 52
        //   store <4 x i32> zeroinitializer, ptr %31, align 16, !tbaa !7
        //   %32 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 56
        //   store <4 x i32> zeroinitializer, ptr %32, align 16, !tbaa !7
        //   %33 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 56
        //   store <4 x i32> zeroinitializer, ptr %33, align 16, !tbaa !7
        //   %34 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 60
        //   store <4 x i32> zeroinitializer, ptr %34, align 16, !tbaa !7
        //   %35 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 60
        //   store <4 x i32> zeroinitializer, ptr %35, align 16, !tbaa !7

        Value *zero64 = builder.getInt64(0);
        Constant *ZeroInit = ConstantAggregateZero::get(VectorType::get(intTy, 4, false));

        for (int i = 4; i < 36; i += 2)
        {
            var[i] = builder.CreateInBoundsGEP(dataArrayTy, var[1],
                                               {zero64, builder.getInt64(1), var[3], builder.getInt64(2 * (i - 4))});
            builder.CreateStore(ZeroInit, var[i])->setAlignment(Align(16));

            var[i + 1] = builder.CreateInBoundsGEP(dataArrayTy, var[1],
                                                   {zero64, var[3], builder.getInt64(2 * (i - 4))});
            builder.CreateStore(ZeroInit, var[i + 1])->setAlignment(Align(16));
        }

        //   %36 = add nuw nsw i64 %3, 1
        var[36] = builder.CreateAdd(var[3], builder.getInt64(1), "", true, true);
        var3->addIncoming(var[36], BB2);
        //   %37 = icmp eq i64 %36, 64
        var[37] = builder.CreateICmpEQ(var[36], builder.getInt64(64));
        //   br i1 %37, label %38, label %2, !llvm.loop !11
        builder.CreateCondBr(var[37], BB38, BB2);

        // 38:                                               ; preds = %2
        builder.SetInsertPoint(BB38);
        //   %39 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 28, i64 29
        //   store i32 2, ptr %39, align 4, !tbaa !7
        //   %40 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 28, i64 30
        //   store i32 2, ptr %40, align 8, !tbaa !7
        //   %41 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 28, i64 33
        //   store i32 2, ptr %41, align 4, !tbaa !7
        //   %42 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 28, i64 34
        //   store i32 2, ptr %42, align 8, !tbaa !7
        //   %43 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 29, i64 28
        //   store i32 2, ptr %43, align 16, !tbaa !7
        //   %44 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 29, i64 29
        //   store i32 2, ptr %44, align 4, !tbaa !7
        //   %45 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 29, i64 33
        //   store i32 2, ptr %45, align 4, !tbaa !7
        //   %46 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 29, i64 34
        //   store i32 2, ptr %46, align 8, !tbaa !7
        //   %47 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 30, i64 28
        //   store i32 2, ptr %47, align 16, !tbaa !7
        //   %48 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 30, i64 33
        //   store i32 2, ptr %48, align 4, !tbaa !7
        //   %49 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 30, i64 34
        //   store i32 2, ptr %49, align 8, !tbaa !7
        //   %50 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 30, i64 35
        //   store i32 2, ptr %50, align 4, !tbaa !7
        //   %51 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 31, i64 33
        //   store i32 2, ptr %51, align 4, !tbaa !7
        //   %52 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 31, i64 34
        //   store i32 2, ptr %52, align 8, !tbaa !7
        //   %53 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 31, i64 35
        //   store i32 2, ptr %53, align 4, !tbaa !7
        std::array<std::pair<int, int>, 15> magic = {
            std::pair<int, int>{28, 29},
            {28, 30},
            {28, 33},
            {28, 34},
            {29, 28},
            {29, 29},
            {29, 33},
            {29, 34},
            {30, 28},
            {30, 33},
            {30, 34},
            {30, 35},
            {31, 33},
            {31, 34},
            {31, 35},
        };

        for (int i = 39; i <= 53; ++i)
        {
            var[i] = builder.CreateInBoundsGEP(MiddleArrayTy, var[1],
                                               {zero64, int64(magic[i - 39].first), int64(magic[i - 39].second)});
            builder.CreateStore(builder.getInt32(2), var[i])->setAlignment(Align(4));
        }

        VectorType *Vec4Ty = VectorType::get(intTy, 4, false);
        Constant *VecConst = ConstantVector::getSplat(ElementCount::getFixed(4), builder.getInt32(2));

        //   %54 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 33, i64 28
        var[54] = builder.CreateInBoundsGEP(MiddleArrayTy, var[1], {zero64, int64(33), int64(28)});
        //   store <4 x i32> <i32 2, i32 2, i32 2, i32 2>, ptr %54, align 16, !tbaa !7
        builder.CreateStore(VecConst, var[54])->setAlignment(Align(16));

        //   %55 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 34, i64 28
        var[55] = builder.CreateInBoundsGEP(MiddleArrayTy, var[1], {zero64, int64(34), int64(28)});
        //   store <4 x i32> <i32 2, i32 2, i32 2, i32 2>, ptr %55, align 16, !tbaa !7
        builder.CreateStore(VecConst, var[55])->setAlignment(Align(16));

        //   %56 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 35, i64 30
        var[56] = builder.CreateInBoundsGEP(MiddleArrayTy, var[1], {zero64, int64(35), int64(30)});
        //   store i32 2, ptr %56, align 8, !tbaa !7
        builder.CreateStore(builder.getInt32(2), var[56])->setAlignment(Align(4));

        //   %57 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 35, i64 31
        var[57] = builder.CreateInBoundsGEP(MiddleArrayTy, var[1], {zero64, int64(35), int64(31)});
        //   store i32 2, ptr %57, align 4, !tbaa !7
        builder.CreateStore(builder.getInt32(2), var[57])->setAlignment(Align(4));

        //   %58 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 35, i64 35
        var[58] = builder.CreateInBoundsGEP(MiddleArrayTy, var[1], {zero64, int64(35), int64(35)});
        //   store i32 2, ptr %58, align 4, !tbaa !7
        builder.CreateStore(builder.getInt32(2), var[58])->setAlignment(Align(4));
        //   br label %62
        builder.CreateBr(BB62);

        // PHI62
        builder.SetInsertPoint(BB62);
        //   %63 = phi i32 [ %60, %59 ], [ 0, %38 ]
        PHINode *var63 = builder.CreatePHI(intTy, 2);
        var[63] = var63;
        // auto it62 = builder.GetInsertPoint();

        // 59:                                               ; preds = %98
        builder.SetInsertPoint(BB59);
        //   %60 = add nuw nsw i32 %63, 1
        var[60] = builder.CreateAdd(var[63], int32(1));
        //   %61 = icmp eq i32 %60, 3
        var[61] = builder.CreateICmpEQ(var[60], int32(3));
        //   br i1 %61, label %152, label %62
        builder.CreateCondBr(var[61], BB152, BB62);

        // 62:                                       ; preds = %38, %59
        builder.SetInsertPoint(BB62);
        var63->addIncoming(var[60], BB59);
        var63->addIncoming(int32(0), BB38);
        //   %64 = phi i32 [ %66, %59 ], [ 0, %38 ]
        PHINode *var64 = builder.CreatePHI(intTy, 2);
        var[64] = var64;
        var64->addIncoming(int32(0), BB38);

        //   %65 = zext nneg i32 %64 to i64
        var[65] = builder.CreateZExt(var[64], int64Ty);
        //   %66 = sub nuw nsw i32 1, %64
        var[66] = builder.CreateSub(int32(1), var[64], "", true, true);
        var64->addIncoming(var[66], BB59);

        //   %67 = zext nneg i32 %66 to i64
        var[67] = builder.CreateZExt(var[66], int64Ty);
        //   br label %68
        builder.CreateBr(BB68);

        // 68:                                               ; preds = %62, %72
        builder.SetInsertPoint(BB68);
        //   %69 = phi i64 [ 0, %62 ], [ %73, %72 ]
        PHINode *var69 = builder.CreatePHI(int64Ty, 2);
        var[69] = var69;
        var69->addIncoming(int64(0), BB62);
        //   %70 = trunc i64 %69 to i32
        var[70] = builder.CreateTrunc(var[69], intTy);
        //   br label %75
        builder.CreateBr(BB75);

        // 71:                                               ; preds = %72
        builder.SetInsertPoint(BB71);
        //   tail call void (...) @simFlush() #4
        builder.CreateCall(simFlushFunc);
        //   br label %91
        builder.CreateBr(BB91);

        // 72:                                               ; preds = %88
        builder.SetInsertPoint(BB72);
        //   %73 = add nuw nsw i64 %69, 1
        var[73] = builder.CreateAdd(var[69], int64(1), "", true, true);
        var69->addIncoming(var[73], BB72);
        //   %74 = icmp eq i64 %73, 64
        var[74] = builder.CreateICmpEQ(var[73], int64(64));
        //   br i1 %74, label %71, label %68, !llvm.loop !12
        builder.CreateCondBr(var[74], BB71, BB68);

        // 75:                                               ; preds = %68, %88
        builder.SetInsertPoint(BB75);
        //   %76 = phi i64 [ 0, %68 ], [ %89, %88 ]
        PHINode *phi76 = builder.CreatePHI(int64Ty, 2);
        var[76] = phi76;
        phi76->addIncoming(zero64, BB68);
        //   %77 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %69, i64 %76
        var[77] = builder.CreateInBoundsGEP(dataArrayTy, var[1], {zero64, var[65], var[69], var[76]});
        //   %78 = load i32, ptr %77, align 4, !tbaa !7
        LoadInst *load78 = builder.CreateLoad(intTy, var[77]);
        load78->setAlignment(Align(4));
        var[78] = load78;
        //   %79 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %67, i64 %69, i64 %76
        var[79] = builder.CreateInBoundsGEP(dataArrayTy, var[1], {zero64, var[67], var[69], var[76]});
        //   %80 = load i32, ptr %79, align 4, !tbaa !7
        LoadInst *load80 = builder.CreateLoad(intTy, var[79]);
        load80->setAlignment(Align(4));
        var[80] = load80;
        //   %81 = icmp eq i32 %78, %80
        var[81] = builder.CreateICmpEQ(var[78], var[80]);
        //   br i1 %81, label %88, label %82
        builder.CreateCondBr(var[81], BB88, BB82);

        // 82:                                               ; preds = %75
        builder.SetInsertPoint(BB82);
        //   %83 = icmp eq i32 %78, 1
        var[83] = builder.CreateICmpEQ(var[78], int32(1));
        //   %84 = select i1 %83, i32 -13041685, i32 0
        var[84] = builder.CreateSelect(var[83], int32(-13041685), int32(0));
        //   %85 = icmp eq i32 %78, 2
        var[85] = builder.CreateICmpEQ(var[78], int32(2));
        //   %86 = select i1 %85, i32 16777215, i32 %84
        var[86] = builder.CreateSelect(var[85], int32(16777215), var[84]);
        //   %87 = trunc i64 %76 to i32
        var[87] = builder.CreateTrunc(var[76], intTy);
        //   tail call void @draw_cell(i32 noundef %70, i32 noundef %87, i32 noundef %86)
        builder.CreateCall(drawCellFunc, {var[70], var[87], var[86]});
        //   br label %88
        builder.CreateBr(BB88);

        // 88:                                               ; preds = %75, %82
        builder.SetInsertPoint(BB88);
        //   %89 = add nuw nsw i64 %76, 1
        var[89] = builder.CreateAdd(var[76], int64(1));
        phi76->addIncoming(var[89], BB88);
        //   %90 = icmp eq i64 %89, 64
        var[90] = builder.CreateICmpEQ(var[89], int64(64));
        //   br i1 %90, label %72, label %75, !llvm.loop !13
        builder.CreateCondBr(var[90], BB72, BB75);

        // 91:                                               ; preds = %71, %98
        builder.SetInsertPoint(BB91);
        //   %92 = phi i64 [ 0, %71 ], [ %99, %98 ]
        PHINode *phi92 = builder.CreatePHI(int64Ty, 2);
        var[92] = phi92;
        phi92->addIncoming(zero64, BB71);
        //   %93 = add nuw i64 %92, 63
        var[93] = builder.CreateAdd(var[92], int64(63), "", true, true);
        //   %94 = and i64 %93, 63
        var[94] = builder.CreateAnd(var[93], int64(63));
        //   %95 = and i64 %92, 63
        var[95] = builder.CreateAnd(var[92], int64(63));
        //   %96 = add nuw i64 %92, 1
        var[96] = builder.CreateAnd(var[92], int64(1));
        //   %97 = and i64 %96, 63
        var[97] = builder.CreateAnd(var[96], int64(63));
        //   br label %101
        builder.CreateBr(BB101);

        // 98:                                               ; preds = %147
        builder.SetInsertPoint(BB98);
        //   %99 = add nuw nsw i64 %92, 1
        var[99] = builder.CreateAdd(var[92], int64(1), "", true);
        phi92->addIncoming(var[99], BB98);
        //   %100 = icmp eq i64 %99, 64
        var[100] = builder.CreateICmpEQ(var[99], int64(64));
        //   br i1 %100, label %59, label %91, !llvm.loop !14
        builder.CreateCondBr(var[100], BB59, BB91);

        // 101:                                              ; preds = %91, %147
        builder.SetInsertPoint(BB101);
        //   %102 = phi i64 [ 0, %91 ], [ %150, %147 ]
        PHINode *phi102 = builder.CreatePHI(int64Ty, 2);
        var[102] = phi102;
        phi102->addIncoming(zero64, BB91);

        //   %103 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %92, i64 %102
        var[103] = builder.CreateInBoundsGEP(dataArrayTy, var[1], {zero64, var[65], var[92], var[102]});

        //   %104 = load i32, ptr %103, align 4, !tbaa !7
        LoadInst *load104 = builder.CreateLoad(intTy, var[103]);
        load104->setAlignment(Align(4));
        var[104] = load104;
        //   switch i32 %104, label %105 [
        //     i32 2, label %147
        //     i32 1, label %146
        //   ]
        SwitchInst *swh = builder.CreateSwitch(var[104], BB105, 2);
        swh->addCase(int32(2), BB147);
        swh->addCase(int32(1), BB146);

        // 105:                                              ; preds = %101
        builder.SetInsertPoint(BB105);
        //   %106 = add nuw i64 %102, 63
        var[106] = builder.CreateAdd(var[102], int64(63), "", true);
        //   %107 = and i64 %106, 63
        var[107] = builder.CreateAnd(var[106], int64(63));
        //   %108 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %94, i64 %107
        var[108] = builder.CreateInBoundsGEP(dataArrayTy, var[1], {zero64, var[65], var[94], var[107]});
        //   %109 = load i32, ptr %108, align 4, !tbaa !7
        LoadInst *load109 = builder.CreateLoad(intTy, var[108]);
        load109->setAlignment(Align(4));
        var[109] = load109;
        //   %110 = and i64 %102, 63
        var[110] = builder.CreateAnd(var[102], int64(63));
        //   %111 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %94, i64 %110
        var[111] = builder.CreateInBoundsGEP(dataArrayTy, var[1], {zero64, var[65], var[94], var[110]});
        //   %112 = load i32, ptr %111, align 4, !tbaa !7
        LoadInst *load112 = builder.CreateLoad(intTy, var[111]);
        load112->setAlignment(Align(4));
        var[112] = load112;
        //   %113 = add nuw i64 %102, 1
        var[113] = builder.CreateAdd(var[102], int64(1));
        //   %114 = and i64 %113, 63
        var[114] = builder.CreateAnd(var[113], 63);
        //   %115 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %94, i64 %114
        //   %116 = load i32, ptr %115, align 4, !tbaa !7
        //   %117 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %95, i64 %107
        //   %118 = load i32, ptr %117, align 4, !tbaa !7
        //   %119 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %95, i64 %110
        //   %120 = load i32, ptr %119, align 4, !tbaa !7
        //   %121 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %95, i64 %114
        //   %122 = load i32, ptr %121, align 4, !tbaa !7
        //   %123 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %97, i64 %107
        //   %124 = load i32, ptr %123, align 4, !tbaa !7
        //   %125 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %97, i64 %110
        //   %126 = load i32, ptr %125, align 4, !tbaa !7
        std::array<std::pair<int, int>, 6> magic2 = {
            std::pair<int, int>{94, 114},
            {95, 107},
            {95, 110},
            {95, 114},
            {97, 107},
            {97, 110},
        };
        for (int i = 115; i < 127; i += 2)
        {
            auto cur_m = magic2[(i - 115) / 2];
            var[i] = builder.CreateInBoundsGEP(dataArrayTy, var[1], {zero64, var[65], var[cur_m.first], var[cur_m.second]});
            LoadInst *load_ = builder.CreateLoad(intTy, var[i]);
            load_->setAlignment(Align(4));
            var[i + 1] = load_;
        }
        //   %127 = insertelement <8 x i32> poison, i32 %112, i64 0
        VectorType *Vec8Ty = VectorType::get(intTy, 8, false);
        var[127] = builder.CreateInsertElement(PoisonValue::get(Vec8Ty), var[112], zero64);
        //   %128 = insertelement <8 x i32> %127, i32 %109, i64 1
        var[128] = builder.CreateInsertElement(var[127], var[109], int64(1));
        //   %129 = insertelement <8 x i32> %128, i32 %116, i64 2
        var[129] = builder.CreateInsertElement(var[128], var[116], int64(2));
        //   %130 = insertelement <8 x i32> %129, i32 %118, i64 3
        var[130] = builder.CreateInsertElement(var[129], var[118], int64(3));
        //   %131 = insertelement <8 x i32> %130, i32 %120, i64 4
        var[131] = builder.CreateInsertElement(var[130], var[120], int64(4));
        //   %132 = insertelement <8 x i32> %131, i32 %122, i64 5
        var[132] = builder.CreateInsertElement(var[131], var[122], int64(5));
        //   %133 = insertelement <8 x i32> %132, i32 %124, i64 6
        var[133] = builder.CreateInsertElement(var[132], var[124], int64(6));
        //   %134 = insertelement <8 x i32> %133, i32 %126, i64 7
        var[134] = builder.CreateInsertElement(var[133], var[126], int64(7));

        //   %135 = icmp eq <8 x i32> %134, <i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2>
        Value *vec8 = ConstantVector::getSplat(ElementCount::getFixed(8), builder.getInt32(2));

        var[135] = builder.CreateICmpEQ(var[134], vec8);
        //   %136 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %97, i64 %114
        var[136] = builder.CreateInBoundsGEP(dataArrayTy, var[1], {zero64, var[65], var[97], var[114]});
        //   %137 = load i32, ptr %136, align 4, !tbaa !7
        LoadInst *load137 = builder.CreateLoad(intTy, var[136]);
        load137->setAlignment(Align(4));
        var[137] = load137;
        //   %138 = icmp eq i32 %137, 2
        var[138] = builder.CreateICmpEQ(var[137], int32(2));
        //   %139 = zext i1 %138 to i32
        var[139] = builder.CreateZExt(var[138], intTy);
        //   %140 = bitcast <8 x i1> %135 to i8
        var[140] = builder.CreateBitCast(var[135], builder.getInt8Ty());
        //   %141 = tail call i8 @llvm.ctpop.i8(i8 %140), !range !15
        Function *Ctpop = Intrinsic::getDeclaration(module, Intrinsic::ctpop, {builder.getInt8Ty()});
        var[141] = builder.CreateCall(Ctpop, {var[140]});
        //   %142 = zext nneg i8 %141 to i32
        var[142] = builder.CreateZExt(var[141], intTy);
        //   %143 = add nuw nsw i32 %142, %139
        var[143] = builder.CreateAdd(var[142], var[139], "", true, true);
        //   %144 = icmp eq i32 %143, 2
        var[144] = builder.CreateICmpEQ(var[143], int32(2));
        //   %145 = select i1 %144, i32 2, i32 0
        var[145] = builder.CreateSelect(var[144], int32(2), int32(0));
        //   br label %147
        builder.CreateBr(BB147);

        // 146:                                              ; preds = %101
        builder.SetInsertPoint(BB146);
        //   br label %147
        builder.CreateBr(BB147);

        // 147:                                              ; preds = %101, %146, %105
        builder.SetInsertPoint(BB147);
        //   %148 = phi i32 [ 0, %146 ], [ %145, %105 ], [ 1, %101 ]
        PHINode *phi148 = builder.CreatePHI(intTy, 3);
        var[148] = phi148;
        phi148->addIncoming(int32(0), BB146);
        phi148->addIncoming(var[145], BB105);
        phi148->addIncoming(int32(1), BB101);
        //   %149 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %67, i64 %92, i64 %102
        var[149] = builder.CreateInBoundsGEP(dataArrayTy, var[1], {zero64, var[67], var[92], var[102]});
        //   store i32 %148, ptr %149, align 4, !tbaa !7
        builder.CreateStore(var[148], var[149])->setAlignment(Align(4));
        //   %150 = add nuw nsw i64 %102, 1
        var[150] = builder.CreateAdd(var[102], int64(1), "", true, true);
        phi102->addIncoming(var[150], BB147);
        //   %151 = icmp eq i64 %150, 64
        var[151] = builder.CreateICmpEQ(var[150], int64(64));
        //   br i1 %151, label %98, label %101, !llvm.loop !16
        builder.CreateCondBr(var[151], BB98, BB101);

        // 152:                                              ; preds = %59
        builder.SetInsertPoint(BB152);
        //   call void @llvm.lifetime.end.p0(i64 32768, ptr nonnull %1) #4
        //   ret void
        builder.CreateRetVoid();
        // }
    }

    // declare void @simFlush(...) local_unnamed_addr #2

    // ; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
    // declare i8 @llvm.ctpop.i8(i8) #3

    // attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
    // attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
    // attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
    // attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
    // attributes #4 = { nounwind }

    // !llvm.module.flags = !{!0, !1, !2, !3}
    // !llvm.ident = !{!4}

    // !0 = !{i32 1, !"wchar_size", i32 4}
    // !1 = !{i32 8, !"PIC Level", i32 2}
    // !2 = !{i32 7, !"PIE Level", i32 2}
    // !3 = !{i32 7, !"uwtable", i32 2}
    // !4 = !{!"Ubuntu clang version 18.1.8 (11~20.04.2)"}
    // !5 = distinct !{!5, !6}
    // !6 = !{!"llvm.loop.mustprogress"}
    // !7 = !{!8, !8, i64 0}
    // !8 = !{!"int", !9, i64 0}
    // !9 = !{!"omnipotent char", !10, i64 0}
    // !10 = !{!"Simple C/C++ TBAA"}
    // !11 = distinct !{!11, !6}
    // !12 = distinct !{!12, !6}
    // !13 = distinct !{!13, !6}
    // !14 = distinct !{!14, !6}
    // !15 = !{i8 0, i8 9}
    // !16 = distinct !{!16, !6}

    module->print(outs(), nullptr);

    outs() << '\n';
    bool verif = verifyModule(*module, &errs());
    outs() << "[VERIFICATION] " << (verif ? "FAIL\n\n" : "OK\n\n");

    // outs() << "[EE] Run\n";
    // InitializeNativeTarget();
    // InitializeNativeTargetAsmPrinter();

    // ExecutionEngine *ee = EngineBuilder(std::unique_ptr<Module>(module)).create();
    // ee->InstallLazyFunctionCreator([](const std::string &fnName) -> void *
    //                                {
    // if (fnName == "simPutPixel") {
    //   return reinterpret_cast<void *>(simPutPixel);
    // }
    // if (fnName == "simFlush") {
    //     return reinterpret_cast<void *>(simFlush);
    // }
    // return nullptr; });
    // ee->finalizeObject();
    // ArrayRef<GenericValue> noargs;
    // GenericValue v = ee->runFunction(appFunc, noargs);
    // outs() << "[EE] Result: " << v.IntVal << '\n';

    return 0;
}