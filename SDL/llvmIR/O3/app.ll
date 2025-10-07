; ModuleID = 'SDL/app.c'
source_filename = "SDL/app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define dso_local void @draw_cell(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = shl nsw i32 %1, 3
  %5 = or disjoint i32 %4, 7
  %6 = or disjoint i32 %4, 6
  %7 = or disjoint i32 %4, 5
  %8 = or disjoint i32 %4, 4
  %9 = or disjoint i32 %4, 3
  %10 = or disjoint i32 %4, 2
  %11 = or disjoint i32 %4, 1
  %12 = shl nsw i32 %0, 3
  tail call void @simPutPixel(i32 noundef %12, i32 noundef %4, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %12, i32 noundef %11, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %12, i32 noundef %10, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %12, i32 noundef %9, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %12, i32 noundef %8, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %12, i32 noundef %7, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %12, i32 noundef %6, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %12, i32 noundef %5, i32 noundef %2) #4
  %13 = or disjoint i32 %12, 1
  tail call void @simPutPixel(i32 noundef %13, i32 noundef %4, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %13, i32 noundef %11, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %13, i32 noundef %10, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %13, i32 noundef %9, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %13, i32 noundef %8, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %13, i32 noundef %7, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %13, i32 noundef %6, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %13, i32 noundef %5, i32 noundef %2) #4
  %14 = or disjoint i32 %12, 2
  tail call void @simPutPixel(i32 noundef %14, i32 noundef %4, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %14, i32 noundef %11, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %14, i32 noundef %10, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %14, i32 noundef %9, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %14, i32 noundef %8, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %14, i32 noundef %7, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %14, i32 noundef %6, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %14, i32 noundef %5, i32 noundef %2) #4
  %15 = or disjoint i32 %12, 3
  tail call void @simPutPixel(i32 noundef %15, i32 noundef %4, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %15, i32 noundef %11, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %15, i32 noundef %10, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %15, i32 noundef %9, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %15, i32 noundef %8, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %15, i32 noundef %7, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %15, i32 noundef %6, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %15, i32 noundef %5, i32 noundef %2) #4
  %16 = or disjoint i32 %12, 4
  tail call void @simPutPixel(i32 noundef %16, i32 noundef %4, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %16, i32 noundef %11, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %16, i32 noundef %10, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %16, i32 noundef %9, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %16, i32 noundef %8, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %16, i32 noundef %7, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %16, i32 noundef %6, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %16, i32 noundef %5, i32 noundef %2) #4
  %17 = or disjoint i32 %12, 5
  tail call void @simPutPixel(i32 noundef %17, i32 noundef %4, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %17, i32 noundef %11, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %17, i32 noundef %10, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %17, i32 noundef %9, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %17, i32 noundef %8, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %17, i32 noundef %7, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %17, i32 noundef %6, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %17, i32 noundef %5, i32 noundef %2) #4
  %18 = or disjoint i32 %12, 6
  tail call void @simPutPixel(i32 noundef %18, i32 noundef %4, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %18, i32 noundef %11, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %18, i32 noundef %10, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %18, i32 noundef %9, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %18, i32 noundef %8, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %18, i32 noundef %7, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %18, i32 noundef %6, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %18, i32 noundef %5, i32 noundef %2) #4
  %19 = or disjoint i32 %12, 7
  tail call void @simPutPixel(i32 noundef %19, i32 noundef %4, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %19, i32 noundef %11, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %19, i32 noundef %10, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %19, i32 noundef %9, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %19, i32 noundef %8, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %19, i32 noundef %7, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %19, i32 noundef %6, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %19, i32 noundef %5, i32 noundef %2) #4
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

declare void @simPutPixel(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local void @app() local_unnamed_addr #0 {
  %1 = alloca [2 x [64 x [64 x i32]]], align 16
  call void @llvm.lifetime.start.p0(i64 32768, ptr nonnull %1) #4
  br label %2

2:                                                ; preds = %2, %0
  %3 = phi i64 [ 0, %0 ], [ %36, %2 ]
  %4 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 0
  store <4 x i32> zeroinitializer, ptr %4, align 16, !tbaa !5
  %5 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 0
  store <4 x i32> zeroinitializer, ptr %5, align 16, !tbaa !5
  %6 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 4
  store <4 x i32> zeroinitializer, ptr %6, align 16, !tbaa !5
  %7 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 4
  store <4 x i32> zeroinitializer, ptr %7, align 16, !tbaa !5
  %8 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 8
  store <4 x i32> zeroinitializer, ptr %8, align 16, !tbaa !5
  %9 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 8
  store <4 x i32> zeroinitializer, ptr %9, align 16, !tbaa !5
  %10 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 12
  store <4 x i32> zeroinitializer, ptr %10, align 16, !tbaa !5
  %11 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 12
  store <4 x i32> zeroinitializer, ptr %11, align 16, !tbaa !5
  %12 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 16
  store <4 x i32> zeroinitializer, ptr %12, align 16, !tbaa !5
  %13 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 16
  store <4 x i32> zeroinitializer, ptr %13, align 16, !tbaa !5
  %14 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 20
  store <4 x i32> zeroinitializer, ptr %14, align 16, !tbaa !5
  %15 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 20
  store <4 x i32> zeroinitializer, ptr %15, align 16, !tbaa !5
  %16 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 24
  store <4 x i32> zeroinitializer, ptr %16, align 16, !tbaa !5
  %17 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 24
  store <4 x i32> zeroinitializer, ptr %17, align 16, !tbaa !5
  %18 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 28
  store <4 x i32> zeroinitializer, ptr %18, align 16, !tbaa !5
  %19 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 28
  store <4 x i32> zeroinitializer, ptr %19, align 16, !tbaa !5
  %20 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 32
  store <4 x i32> zeroinitializer, ptr %20, align 16, !tbaa !5
  %21 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 32
  store <4 x i32> zeroinitializer, ptr %21, align 16, !tbaa !5
  %22 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 36
  store <4 x i32> zeroinitializer, ptr %22, align 16, !tbaa !5
  %23 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 36
  store <4 x i32> zeroinitializer, ptr %23, align 16, !tbaa !5
  %24 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 40
  store <4 x i32> zeroinitializer, ptr %24, align 16, !tbaa !5
  %25 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 40
  store <4 x i32> zeroinitializer, ptr %25, align 16, !tbaa !5
  %26 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 44
  store <4 x i32> zeroinitializer, ptr %26, align 16, !tbaa !5
  %27 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 44
  store <4 x i32> zeroinitializer, ptr %27, align 16, !tbaa !5
  %28 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 48
  store <4 x i32> zeroinitializer, ptr %28, align 16, !tbaa !5
  %29 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 48
  store <4 x i32> zeroinitializer, ptr %29, align 16, !tbaa !5
  %30 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 52
  store <4 x i32> zeroinitializer, ptr %30, align 16, !tbaa !5
  %31 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 52
  store <4 x i32> zeroinitializer, ptr %31, align 16, !tbaa !5
  %32 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 56
  store <4 x i32> zeroinitializer, ptr %32, align 16, !tbaa !5
  %33 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 56
  store <4 x i32> zeroinitializer, ptr %33, align 16, !tbaa !5
  %34 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 60
  store <4 x i32> zeroinitializer, ptr %34, align 16, !tbaa !5
  %35 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 60
  store <4 x i32> zeroinitializer, ptr %35, align 16, !tbaa !5
  %36 = add nuw nsw i64 %3, 1
  %37 = icmp eq i64 %36, 64
  br i1 %37, label %38, label %2, !llvm.loop !9

38:                                               ; preds = %2
  %39 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 28, i64 29
  store i32 2, ptr %39, align 4, !tbaa !5
  %40 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 28, i64 30
  store i32 2, ptr %40, align 8, !tbaa !5
  %41 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 28, i64 33
  store i32 2, ptr %41, align 4, !tbaa !5
  %42 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 28, i64 34
  store i32 2, ptr %42, align 8, !tbaa !5
  %43 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 29, i64 28
  store i32 2, ptr %43, align 16, !tbaa !5
  %44 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 29, i64 29
  store i32 2, ptr %44, align 4, !tbaa !5
  %45 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 29, i64 33
  store i32 2, ptr %45, align 4, !tbaa !5
  %46 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 29, i64 34
  store i32 2, ptr %46, align 8, !tbaa !5
  %47 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 30, i64 28
  store i32 2, ptr %47, align 16, !tbaa !5
  %48 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 30, i64 33
  store i32 2, ptr %48, align 4, !tbaa !5
  %49 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 30, i64 34
  store i32 2, ptr %49, align 8, !tbaa !5
  %50 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 30, i64 35
  store i32 2, ptr %50, align 4, !tbaa !5
  %51 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 31, i64 33
  store i32 2, ptr %51, align 4, !tbaa !5
  %52 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 31, i64 34
  store i32 2, ptr %52, align 8, !tbaa !5
  %53 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 31, i64 35
  store i32 2, ptr %53, align 4, !tbaa !5
  %54 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 33, i64 28
  store <4 x i32> <i32 2, i32 2, i32 2, i32 2>, ptr %54, align 16, !tbaa !5
  %55 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 34, i64 28
  store <4 x i32> <i32 2, i32 2, i32 2, i32 2>, ptr %55, align 16, !tbaa !5
  %56 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 35, i64 30
  store i32 2, ptr %56, align 8, !tbaa !5
  %57 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 35, i64 31
  store i32 2, ptr %57, align 4, !tbaa !5
  %58 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 35, i64 35
  store i32 2, ptr %58, align 4, !tbaa !5
  br label %62

59:                                               ; preds = %128
  %60 = add nuw nsw i32 %63, 1
  %61 = icmp eq i32 %60, 3
  br i1 %61, label %182, label %62

62:                                               ; preds = %38, %59
  %63 = phi i32 [ %60, %59 ], [ 0, %38 ]
  %64 = phi i32 [ %66, %59 ], [ 0, %38 ]
  %65 = zext nneg i32 %64 to i64
  %66 = sub nuw nsw i32 1, %64
  %67 = zext nneg i32 %66 to i64
  br label %68

68:                                               ; preds = %62, %87
  %69 = phi i64 [ 0, %62 ], [ %88, %87 ]
  %70 = shl nuw nsw i64 %69, 3
  %71 = trunc i64 %70 to i32
  %72 = trunc i64 %70 to i32
  %73 = or disjoint i32 %72, 1
  %74 = trunc i64 %70 to i32
  %75 = or disjoint i32 %74, 2
  %76 = trunc i64 %70 to i32
  %77 = or disjoint i32 %76, 3
  %78 = trunc i64 %70 to i32
  %79 = or disjoint i32 %78, 4
  %80 = trunc i64 %70 to i32
  %81 = or disjoint i32 %80, 5
  %82 = trunc i64 %70 to i32
  %83 = or disjoint i32 %82, 6
  %84 = trunc i64 %70 to i32
  %85 = or disjoint i32 %84, 7
  br label %90

86:                                               ; preds = %87
  tail call void (...) @simFlush() #4
  br label %121

87:                                               ; preds = %118
  %88 = add nuw nsw i64 %69, 1
  %89 = icmp eq i64 %88, 64
  br i1 %89, label %86, label %68, !llvm.loop !11

90:                                               ; preds = %68, %118
  %91 = phi i64 [ 0, %68 ], [ %119, %118 ]
  %92 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %69, i64 %91
  %93 = load i32, ptr %92, align 4, !tbaa !5
  %94 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %67, i64 %69, i64 %91
  %95 = load i32, ptr %94, align 4, !tbaa !5
  %96 = icmp eq i32 %93, %95
  br i1 %96, label %118, label %97

97:                                               ; preds = %90
  %98 = icmp eq i32 %93, 1
  %99 = select i1 %98, i32 -13041685, i32 0
  %100 = icmp eq i32 %93, 2
  %101 = select i1 %100, i32 16777215, i32 %99
  %102 = shl nuw nsw i64 %91, 3
  %103 = trunc i64 %102 to i32
  tail call void @simPutPixel(i32 noundef %71, i32 noundef %103, i32 noundef %101) #4
  %104 = trunc i64 %102 to i32
  %105 = or disjoint i32 %104, 1
  tail call void @simPutPixel(i32 noundef %71, i32 noundef %105, i32 noundef %101) #4
  %106 = trunc i64 %102 to i32
  %107 = or disjoint i32 %106, 2
  tail call void @simPutPixel(i32 noundef %71, i32 noundef %107, i32 noundef %101) #4
  %108 = trunc i64 %102 to i32
  %109 = or disjoint i32 %108, 3
  tail call void @simPutPixel(i32 noundef %71, i32 noundef %109, i32 noundef %101) #4
  %110 = trunc i64 %102 to i32
  %111 = or disjoint i32 %110, 4
  tail call void @simPutPixel(i32 noundef %71, i32 noundef %111, i32 noundef %101) #4
  %112 = trunc i64 %102 to i32
  %113 = or disjoint i32 %112, 5
  tail call void @simPutPixel(i32 noundef %71, i32 noundef %113, i32 noundef %101) #4
  %114 = trunc i64 %102 to i32
  %115 = or disjoint i32 %114, 6
  tail call void @simPutPixel(i32 noundef %71, i32 noundef %115, i32 noundef %101) #4
  %116 = trunc i64 %102 to i32
  %117 = or disjoint i32 %116, 7
  tail call void @simPutPixel(i32 noundef %71, i32 noundef %117, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %73, i32 noundef %103, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %73, i32 noundef %105, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %73, i32 noundef %107, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %73, i32 noundef %109, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %73, i32 noundef %111, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %73, i32 noundef %113, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %73, i32 noundef %115, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %73, i32 noundef %117, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %75, i32 noundef %103, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %75, i32 noundef %105, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %75, i32 noundef %107, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %75, i32 noundef %109, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %75, i32 noundef %111, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %75, i32 noundef %113, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %75, i32 noundef %115, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %75, i32 noundef %117, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %77, i32 noundef %103, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %77, i32 noundef %105, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %77, i32 noundef %107, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %77, i32 noundef %109, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %77, i32 noundef %111, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %77, i32 noundef %113, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %77, i32 noundef %115, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %77, i32 noundef %117, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %79, i32 noundef %103, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %79, i32 noundef %105, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %79, i32 noundef %107, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %79, i32 noundef %109, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %79, i32 noundef %111, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %79, i32 noundef %113, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %79, i32 noundef %115, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %79, i32 noundef %117, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %81, i32 noundef %103, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %81, i32 noundef %105, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %81, i32 noundef %107, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %81, i32 noundef %109, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %81, i32 noundef %111, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %81, i32 noundef %113, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %81, i32 noundef %115, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %81, i32 noundef %117, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %83, i32 noundef %103, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %83, i32 noundef %105, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %83, i32 noundef %107, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %83, i32 noundef %109, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %83, i32 noundef %111, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %83, i32 noundef %113, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %83, i32 noundef %115, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %83, i32 noundef %117, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %85, i32 noundef %103, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %85, i32 noundef %105, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %85, i32 noundef %107, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %85, i32 noundef %109, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %85, i32 noundef %111, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %85, i32 noundef %113, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %85, i32 noundef %115, i32 noundef %101) #4
  tail call void @simPutPixel(i32 noundef %85, i32 noundef %117, i32 noundef %101) #4
  br label %118

118:                                              ; preds = %97, %90
  %119 = add nuw nsw i64 %91, 1
  %120 = icmp eq i64 %119, 64
  br i1 %120, label %87, label %90, !llvm.loop !12

121:                                              ; preds = %86, %128
  %122 = phi i64 [ 0, %86 ], [ %129, %128 ]
  %123 = add nuw i64 %122, 63
  %124 = and i64 %123, 63
  %125 = and i64 %122, 63
  %126 = add nuw i64 %122, 1
  %127 = and i64 %126, 63
  br label %131

128:                                              ; preds = %177
  %129 = add nuw nsw i64 %122, 1
  %130 = icmp eq i64 %129, 64
  br i1 %130, label %59, label %121, !llvm.loop !13

131:                                              ; preds = %121, %177
  %132 = phi i64 [ 0, %121 ], [ %180, %177 ]
  %133 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %122, i64 %132
  %134 = load i32, ptr %133, align 4, !tbaa !5
  switch i32 %134, label %135 [
    i32 2, label %177
    i32 1, label %176
  ]

135:                                              ; preds = %131
  %136 = add nuw i64 %132, 63
  %137 = and i64 %136, 63
  %138 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %124, i64 %137
  %139 = load i32, ptr %138, align 4, !tbaa !5
  %140 = and i64 %132, 63
  %141 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %124, i64 %140
  %142 = load i32, ptr %141, align 4, !tbaa !5
  %143 = add nuw i64 %132, 1
  %144 = and i64 %143, 63
  %145 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %124, i64 %144
  %146 = load i32, ptr %145, align 4, !tbaa !5
  %147 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %125, i64 %137
  %148 = load i32, ptr %147, align 4, !tbaa !5
  %149 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %125, i64 %140
  %150 = load i32, ptr %149, align 4, !tbaa !5
  %151 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %125, i64 %144
  %152 = load i32, ptr %151, align 4, !tbaa !5
  %153 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %127, i64 %137
  %154 = load i32, ptr %153, align 4, !tbaa !5
  %155 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %127, i64 %140
  %156 = load i32, ptr %155, align 4, !tbaa !5
  %157 = insertelement <8 x i32> poison, i32 %142, i64 0
  %158 = insertelement <8 x i32> %157, i32 %139, i64 1
  %159 = insertelement <8 x i32> %158, i32 %146, i64 2
  %160 = insertelement <8 x i32> %159, i32 %148, i64 3
  %161 = insertelement <8 x i32> %160, i32 %150, i64 4
  %162 = insertelement <8 x i32> %161, i32 %152, i64 5
  %163 = insertelement <8 x i32> %162, i32 %154, i64 6
  %164 = insertelement <8 x i32> %163, i32 %156, i64 7
  %165 = icmp eq <8 x i32> %164, <i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2>
  %166 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %127, i64 %144
  %167 = load i32, ptr %166, align 4, !tbaa !5
  %168 = icmp eq i32 %167, 2
  %169 = zext i1 %168 to i32
  %170 = bitcast <8 x i1> %165 to i8
  %171 = tail call i8 @llvm.ctpop.i8(i8 %170), !range !14
  %172 = zext nneg i8 %171 to i32
  %173 = add nuw nsw i32 %172, %169
  %174 = icmp eq i32 %173, 2
  %175 = select i1 %174, i32 2, i32 0
  br label %177

176:                                              ; preds = %131
  br label %177

177:                                              ; preds = %131, %176, %135
  %178 = phi i32 [ 0, %176 ], [ %175, %135 ], [ 1, %131 ]
  %179 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %67, i64 %122, i64 %132
  store i32 %178, ptr %179, align 4, !tbaa !5
  %180 = add nuw nsw i64 %132, 1
  %181 = icmp eq i64 %180, 64
  br i1 %181, label %128, label %131, !llvm.loop !15

182:                                              ; preds = %59
  call void @llvm.lifetime.end.p0(i64 32768, ptr nonnull %1) #4
  ret void
}

declare void @simFlush(...) local_unnamed_addr #2

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.ctpop.i8(i8) #3

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 18.1.8 (11~20.04.2)"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !10}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = !{i8 0, i8 9}
!15 = distinct !{!15, !10}
