; ModuleID = 'SDL/app.c'
source_filename = "SDL/app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define dso_local void @draw_cell(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = shl nsw i32 %0, 3
  %5 = shl nsw i32 %1, 3
  %6 = or disjoint i32 %5, 1
  %7 = or disjoint i32 %5, 2
  %8 = or disjoint i32 %5, 3
  %9 = or disjoint i32 %5, 4
  %10 = or disjoint i32 %5, 5
  %11 = or disjoint i32 %5, 6
  %12 = or disjoint i32 %5, 7
  br label %13

13:                                               ; preds = %3, %13
  %14 = phi i32 [ 0, %3 ], [ %16, %13 ]
  %15 = add nuw nsw i32 %14, %4
  tail call void @simPutPixel(i32 noundef %15, i32 noundef %5, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %15, i32 noundef %6, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %15, i32 noundef %7, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %15, i32 noundef %8, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %15, i32 noundef %9, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %15, i32 noundef %10, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %15, i32 noundef %11, i32 noundef %2) #4
  tail call void @simPutPixel(i32 noundef %15, i32 noundef %12, i32 noundef %2) #4
  %16 = add nuw nsw i32 %14, 1
  %17 = icmp eq i32 %16, 8
  br i1 %17, label %18, label %13, !llvm.loop !5

18:                                               ; preds = %13
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
  store <4 x i32> zeroinitializer, ptr %4, align 16, !tbaa !7
  %5 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 0
  store <4 x i32> zeroinitializer, ptr %5, align 16, !tbaa !7
  %6 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 4
  store <4 x i32> zeroinitializer, ptr %6, align 16, !tbaa !7
  %7 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 4
  store <4 x i32> zeroinitializer, ptr %7, align 16, !tbaa !7
  %8 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 8
  store <4 x i32> zeroinitializer, ptr %8, align 16, !tbaa !7
  %9 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 8
  store <4 x i32> zeroinitializer, ptr %9, align 16, !tbaa !7
  %10 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 12
  store <4 x i32> zeroinitializer, ptr %10, align 16, !tbaa !7
  %11 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 12
  store <4 x i32> zeroinitializer, ptr %11, align 16, !tbaa !7
  %12 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 16
  store <4 x i32> zeroinitializer, ptr %12, align 16, !tbaa !7
  %13 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 16
  store <4 x i32> zeroinitializer, ptr %13, align 16, !tbaa !7
  %14 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 20
  store <4 x i32> zeroinitializer, ptr %14, align 16, !tbaa !7
  %15 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 20
  store <4 x i32> zeroinitializer, ptr %15, align 16, !tbaa !7
  %16 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 24
  store <4 x i32> zeroinitializer, ptr %16, align 16, !tbaa !7
  %17 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 24
  store <4 x i32> zeroinitializer, ptr %17, align 16, !tbaa !7
  %18 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 28
  store <4 x i32> zeroinitializer, ptr %18, align 16, !tbaa !7
  %19 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 28
  store <4 x i32> zeroinitializer, ptr %19, align 16, !tbaa !7
  %20 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 32
  store <4 x i32> zeroinitializer, ptr %20, align 16, !tbaa !7
  %21 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 32
  store <4 x i32> zeroinitializer, ptr %21, align 16, !tbaa !7
  %22 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 36
  store <4 x i32> zeroinitializer, ptr %22, align 16, !tbaa !7
  %23 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 36
  store <4 x i32> zeroinitializer, ptr %23, align 16, !tbaa !7
  %24 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 40
  store <4 x i32> zeroinitializer, ptr %24, align 16, !tbaa !7
  %25 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 40
  store <4 x i32> zeroinitializer, ptr %25, align 16, !tbaa !7
  %26 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 44
  store <4 x i32> zeroinitializer, ptr %26, align 16, !tbaa !7
  %27 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 44
  store <4 x i32> zeroinitializer, ptr %27, align 16, !tbaa !7
  %28 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 48
  store <4 x i32> zeroinitializer, ptr %28, align 16, !tbaa !7
  %29 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 48
  store <4 x i32> zeroinitializer, ptr %29, align 16, !tbaa !7
  %30 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 52
  store <4 x i32> zeroinitializer, ptr %30, align 16, !tbaa !7
  %31 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 52
  store <4 x i32> zeroinitializer, ptr %31, align 16, !tbaa !7
  %32 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 56
  store <4 x i32> zeroinitializer, ptr %32, align 16, !tbaa !7
  %33 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 56
  store <4 x i32> zeroinitializer, ptr %33, align 16, !tbaa !7
  %34 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 60
  store <4 x i32> zeroinitializer, ptr %34, align 16, !tbaa !7
  %35 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 60
  store <4 x i32> zeroinitializer, ptr %35, align 16, !tbaa !7
  %36 = add nuw nsw i64 %3, 1
  %37 = icmp eq i64 %36, 64
  br i1 %37, label %38, label %2, !llvm.loop !11

38:                                               ; preds = %2
  %39 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 28, i64 29
  store i32 2, ptr %39, align 4, !tbaa !7
  %40 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 28, i64 30
  store i32 2, ptr %40, align 8, !tbaa !7
  %41 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 28, i64 33
  store i32 2, ptr %41, align 4, !tbaa !7
  %42 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 28, i64 34
  store i32 2, ptr %42, align 8, !tbaa !7
  %43 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 29, i64 28
  store i32 2, ptr %43, align 16, !tbaa !7
  %44 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 29, i64 29
  store i32 2, ptr %44, align 4, !tbaa !7
  %45 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 29, i64 33
  store i32 2, ptr %45, align 4, !tbaa !7
  %46 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 29, i64 34
  store i32 2, ptr %46, align 8, !tbaa !7
  %47 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 30, i64 28
  store i32 2, ptr %47, align 16, !tbaa !7
  %48 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 30, i64 33
  store i32 2, ptr %48, align 4, !tbaa !7
  %49 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 30, i64 34
  store i32 2, ptr %49, align 8, !tbaa !7
  %50 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 30, i64 35
  store i32 2, ptr %50, align 4, !tbaa !7
  %51 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 31, i64 33
  store i32 2, ptr %51, align 4, !tbaa !7
  %52 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 31, i64 34
  store i32 2, ptr %52, align 8, !tbaa !7
  %53 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 31, i64 35
  store i32 2, ptr %53, align 4, !tbaa !7
  %54 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 33, i64 28
  store <4 x i32> <i32 2, i32 2, i32 2, i32 2>, ptr %54, align 16, !tbaa !7
  %55 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 34, i64 28
  store <4 x i32> <i32 2, i32 2, i32 2, i32 2>, ptr %55, align 16, !tbaa !7
  %56 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 35, i64 30
  store i32 2, ptr %56, align 8, !tbaa !7
  %57 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 35, i64 31
  store i32 2, ptr %57, align 4, !tbaa !7
  %58 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 35, i64 35
  store i32 2, ptr %58, align 4, !tbaa !7
  br label %62

59:                                               ; preds = %98
  %60 = add nuw nsw i32 %63, 1
  %61 = icmp eq i32 %60, 3
  br i1 %61, label %152, label %62

62:                                               ; preds = %38, %59
  %63 = phi i32 [ %60, %59 ], [ 0, %38 ]
  %64 = phi i32 [ %66, %59 ], [ 0, %38 ]
  %65 = zext nneg i32 %64 to i64
  %66 = sub nuw nsw i32 1, %64
  %67 = zext nneg i32 %66 to i64
  br label %68

68:                                               ; preds = %62, %72
  %69 = phi i64 [ 0, %62 ], [ %73, %72 ]
  %70 = trunc i64 %69 to i32
  br label %75

71:                                               ; preds = %72
  tail call void (...) @simFlush() #4
  br label %91

72:                                               ; preds = %88
  %73 = add nuw nsw i64 %69, 1
  %74 = icmp eq i64 %73, 64
  br i1 %74, label %71, label %68, !llvm.loop !12

75:                                               ; preds = %68, %88
  %76 = phi i64 [ 0, %68 ], [ %89, %88 ]
  %77 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %69, i64 %76
  %78 = load i32, ptr %77, align 4, !tbaa !7
  %79 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %67, i64 %69, i64 %76
  %80 = load i32, ptr %79, align 4, !tbaa !7
  %81 = icmp eq i32 %78, %80
  br i1 %81, label %88, label %82

82:                                               ; preds = %75
  %83 = icmp eq i32 %78, 1
  %84 = select i1 %83, i32 -13041685, i32 0
  %85 = icmp eq i32 %78, 2
  %86 = select i1 %85, i32 16777215, i32 %84
  %87 = trunc i64 %76 to i32
  tail call void @draw_cell(i32 noundef %70, i32 noundef %87, i32 noundef %86)
  br label %88

88:                                               ; preds = %75, %82
  %89 = add nuw nsw i64 %76, 1
  %90 = icmp eq i64 %89, 64
  br i1 %90, label %72, label %75, !llvm.loop !13

91:                                               ; preds = %71, %98
  %92 = phi i64 [ 0, %71 ], [ %99, %98 ]
  %93 = add nuw i64 %92, 63
  %94 = and i64 %93, 63
  %95 = and i64 %92, 63
  %96 = add nuw i64 %92, 1
  %97 = and i64 %96, 63
  br label %101

98:                                               ; preds = %147
  %99 = add nuw nsw i64 %92, 1
  %100 = icmp eq i64 %99, 64
  br i1 %100, label %59, label %91, !llvm.loop !14

101:                                              ; preds = %91, %147
  %102 = phi i64 [ 0, %91 ], [ %150, %147 ]
  %103 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %92, i64 %102
  %104 = load i32, ptr %103, align 4, !tbaa !7
  switch i32 %104, label %105 [
    i32 2, label %147
    i32 1, label %146
  ]

105:                                              ; preds = %101
  %106 = add nuw i64 %102, 63
  %107 = and i64 %106, 63
  %108 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %94, i64 %107
  %109 = load i32, ptr %108, align 4, !tbaa !7
  %110 = and i64 %102, 63
  %111 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %94, i64 %110
  %112 = load i32, ptr %111, align 4, !tbaa !7
  %113 = add nuw i64 %102, 1
  %114 = and i64 %113, 63
  %115 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %94, i64 %114
  %116 = load i32, ptr %115, align 4, !tbaa !7
  %117 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %95, i64 %107
  %118 = load i32, ptr %117, align 4, !tbaa !7
  %119 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %95, i64 %110
  %120 = load i32, ptr %119, align 4, !tbaa !7
  %121 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %95, i64 %114
  %122 = load i32, ptr %121, align 4, !tbaa !7
  %123 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %97, i64 %107
  %124 = load i32, ptr %123, align 4, !tbaa !7
  %125 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %97, i64 %110
  %126 = load i32, ptr %125, align 4, !tbaa !7
  %127 = insertelement <8 x i32> poison, i32 %112, i64 0
  %128 = insertelement <8 x i32> %127, i32 %109, i64 1
  %129 = insertelement <8 x i32> %128, i32 %116, i64 2
  %130 = insertelement <8 x i32> %129, i32 %118, i64 3
  %131 = insertelement <8 x i32> %130, i32 %120, i64 4
  %132 = insertelement <8 x i32> %131, i32 %122, i64 5
  %133 = insertelement <8 x i32> %132, i32 %124, i64 6
  %134 = insertelement <8 x i32> %133, i32 %126, i64 7
  %135 = icmp eq <8 x i32> %134, <i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2, i32 2>
  %136 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %97, i64 %114
  %137 = load i32, ptr %136, align 4, !tbaa !7
  %138 = icmp eq i32 %137, 2
  %139 = zext i1 %138 to i32
  %140 = bitcast <8 x i1> %135 to i8
  %141 = tail call i8 @llvm.ctpop.i8(i8 %140), !range !15
  %142 = zext nneg i8 %141 to i32
  %143 = add nuw nsw i32 %142, %139
  %144 = icmp eq i32 %143, 2
  %145 = select i1 %144, i32 2, i32 0
  br label %147

146:                                              ; preds = %101
  br label %147

147:                                              ; preds = %101, %146, %105
  %148 = phi i32 [ 0, %146 ], [ %145, %105 ], [ 1, %101 ]
  %149 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %67, i64 %92, i64 %102
  store i32 %148, ptr %149, align 4, !tbaa !7
  %150 = add nuw nsw i64 %102, 1
  %151 = icmp eq i64 %150, 64
  br i1 %151, label %98, label %101, !llvm.loop !16

152:                                              ; preds = %59
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
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = distinct !{!11, !6}
!12 = distinct !{!12, !6}
!13 = distinct !{!13, !6}
!14 = distinct !{!14, !6}
!15 = !{i8 0, i8 9}
!16 = distinct !{!16, !6}
