; ModuleID = 'SDL/app.c'
source_filename = "SDL/app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define dso_local void @draw_cell(i32 noundef %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  %4 = shl nsw i32 %0, 3
  %5 = shl nsw i32 %1, 3
  br label %6

6:                                                ; preds = %3, %10
  %7 = phi i32 [ 0, %3 ], [ %11, %10 ]
  %8 = add nuw nsw i32 %7, %4
  br label %13

9:                                                ; preds = %10
  ret void

10:                                               ; preds = %13
  %11 = add nuw nsw i32 %7, 1
  %12 = icmp eq i32 %11, 8
  br i1 %12, label %9, label %6, !llvm.loop !5

13:                                               ; preds = %6, %13
  %14 = phi i32 [ 0, %6 ], [ %16, %13 ]
  %15 = add nuw nsw i32 %14, %5
  tail call void @simPutPixel(i32 noundef %8, i32 noundef %15, i32 noundef %2) #3
  %16 = add nuw nsw i32 %14, 1
  %17 = icmp eq i32 %16, 8
  br i1 %17, label %10, label %13, !llvm.loop !8
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

declare void @simPutPixel(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local void @app() local_unnamed_addr #0 {
  %1 = alloca [2 x [64 x [64 x i32]]], align 16
  call void @llvm.lifetime.start.p0(i64 32768, ptr nonnull %1) #3
  br label %2

2:                                                ; preds = %0, %4
  %3 = phi i64 [ 0, %0 ], [ %5, %4 ]
  br label %7

4:                                                ; preds = %7
  %5 = add nuw nsw i64 %3, 1
  %6 = icmp eq i64 %5, 64
  br i1 %6, label %13, label %2, !llvm.loop !9

7:                                                ; preds = %2, %7
  %8 = phi i64 [ 0, %2 ], [ %11, %7 ]
  %9 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 %8
  store i32 0, ptr %9, align 4, !tbaa !10
  %10 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %3, i64 %8
  store i32 0, ptr %10, align 4, !tbaa !10
  %11 = add nuw nsw i64 %8, 1
  %12 = icmp eq i64 %11, 64
  br i1 %12, label %4, label %7, !llvm.loop !14

13:                                               ; preds = %4, %15
  %14 = phi i64 [ %16, %15 ], [ 28, %4 ]
  br label %18

15:                                               ; preds = %25
  %16 = add nuw nsw i64 %14, 1
  %17 = icmp eq i64 %16, 36
  br i1 %17, label %31, label %13, !llvm.loop !15

18:                                               ; preds = %13, %25
  %19 = phi i64 [ 28, %13 ], [ %26, %25 ]
  %20 = mul nuw nsw i64 %19, %14
  %21 = and i64 %20, 8
  %22 = icmp eq i64 %21, 0
  br i1 %22, label %25, label %23

23:                                               ; preds = %18
  %24 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 %14, i64 %19
  store i32 2, ptr %24, align 4, !tbaa !10
  br label %25

25:                                               ; preds = %18, %23
  %26 = add nuw nsw i64 %19, 1
  %27 = icmp eq i64 %26, 36
  br i1 %27, label %15, label %18, !llvm.loop !16

28:                                               ; preds = %79
  %29 = add nuw nsw i32 %32, 1
  %30 = icmp eq i32 %29, 3
  br i1 %30, label %119, label %31, !llvm.loop !17

31:                                               ; preds = %15, %28
  %32 = phi i32 [ %29, %28 ], [ 0, %15 ]
  %33 = phi i32 [ %42, %28 ], [ 0, %15 ]
  %34 = zext nneg i32 %33 to i64
  %35 = sub nuw nsw i32 1, %33
  %36 = zext nneg i32 %35 to i64
  br label %37

37:                                               ; preds = %31, %45
  %38 = phi i64 [ 0, %31 ], [ %46, %45 ]
  %39 = trunc i64 %38 to i32
  %40 = shl i32 %39, 3
  br label %48

41:                                               ; preds = %45
  tail call void (...) @simFlush() #3
  %42 = sub nuw nsw i32 1, %33
  %43 = zext nneg i32 %33 to i64
  %44 = zext nneg i32 %42 to i64
  br label %76

45:                                               ; preds = %73
  %46 = add nuw nsw i64 %38, 1
  %47 = icmp eq i64 %46, 64
  br i1 %47, label %41, label %37, !llvm.loop !18

48:                                               ; preds = %37, %73
  %49 = phi i64 [ 0, %37 ], [ %74, %73 ]
  %50 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %34, i64 %38, i64 %49
  %51 = load i32, ptr %50, align 4, !tbaa !10
  %52 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %36, i64 %38, i64 %49
  %53 = load i32, ptr %52, align 4, !tbaa !10
  %54 = icmp eq i32 %51, %53
  br i1 %54, label %73, label %55

55:                                               ; preds = %48
  %56 = icmp eq i32 %51, 1
  %57 = select i1 %56, i32 -13041685, i32 0
  %58 = icmp eq i32 %51, 2
  %59 = select i1 %58, i32 16777215, i32 %57
  %60 = trunc i64 %49 to i32
  %61 = shl i32 %60, 3
  br label %62

62:                                               ; preds = %65, %55
  %63 = phi i32 [ 0, %55 ], [ %66, %65 ]
  %64 = add nuw nsw i32 %63, %40
  br label %68

65:                                               ; preds = %68
  %66 = add nuw nsw i32 %63, 1
  %67 = icmp eq i32 %66, 8
  br i1 %67, label %73, label %62, !llvm.loop !5

68:                                               ; preds = %68, %62
  %69 = phi i32 [ 0, %62 ], [ %71, %68 ]
  %70 = add nuw nsw i32 %69, %61
  tail call void @simPutPixel(i32 noundef %64, i32 noundef %70, i32 noundef %59) #3
  %71 = add nuw nsw i32 %69, 1
  %72 = icmp eq i32 %71, 8
  br i1 %72, label %65, label %68, !llvm.loop !8

73:                                               ; preds = %65, %48
  %74 = add nuw nsw i64 %49, 1
  %75 = icmp eq i64 %74, 64
  br i1 %75, label %45, label %48, !llvm.loop !19

76:                                               ; preds = %41, %79
  %77 = phi i64 [ 0, %41 ], [ %80, %79 ]
  %78 = trunc i64 %77 to i32
  br label %82

79:                                               ; preds = %114
  %80 = add nuw nsw i64 %77, 1
  %81 = icmp eq i64 %80, 64
  br i1 %81, label %28, label %76, !llvm.loop !20

82:                                               ; preds = %76, %114
  %83 = phi i64 [ 0, %76 ], [ %117, %114 ]
  %84 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %43, i64 %77, i64 %83
  %85 = load i32, ptr %84, align 4, !tbaa !10
  switch i32 %85, label %86 [
    i32 2, label %114
    i32 1, label %88
  ]

86:                                               ; preds = %82
  %87 = trunc i64 %83 to i32
  br label %89

88:                                               ; preds = %82
  br label %114

89:                                               ; preds = %86, %98
  %90 = phi i32 [ %99, %98 ], [ -1, %86 ]
  %91 = phi i32 [ %111, %98 ], [ 0, %86 ]
  %92 = add i32 %90, %78
  %93 = and i32 %92, 63
  %94 = zext nneg i32 %93 to i64
  br label %101

95:                                               ; preds = %98
  %96 = icmp eq i32 %111, 2
  %97 = select i1 %96, i32 2, i32 0
  br label %114

98:                                               ; preds = %101
  %99 = add nsw i32 %90, 1
  %100 = icmp eq i32 %99, 2
  br i1 %100, label %95, label %89, !llvm.loop !21

101:                                              ; preds = %89, %101
  %102 = phi i32 [ -1, %89 ], [ %112, %101 ]
  %103 = phi i32 [ %91, %89 ], [ %111, %101 ]
  %104 = add i32 %102, %87
  %105 = and i32 %104, 63
  %106 = zext nneg i32 %105 to i64
  %107 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %43, i64 %94, i64 %106
  %108 = load i32, ptr %107, align 4, !tbaa !10
  %109 = icmp eq i32 %108, 2
  %110 = zext i1 %109 to i32
  %111 = add nsw i32 %103, %110
  %112 = add nsw i32 %102, 1
  %113 = icmp eq i32 %112, 2
  br i1 %113, label %98, label %101, !llvm.loop !22

114:                                              ; preds = %82, %88, %95
  %115 = phi i32 [ 0, %88 ], [ %97, %95 ], [ 1, %82 ]
  %116 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %44, i64 %77, i64 %83
  store i32 %115, ptr %116, align 4, !tbaa !10
  %117 = add nuw nsw i64 %83, 1
  %118 = icmp eq i64 %117, 64
  br i1 %118, label %79, label %82, !llvm.loop !23

119:                                              ; preds = %28
  call void @llvm.lifetime.end.p0(i64 32768, ptr nonnull %1) #3
  ret void
}

declare void @simFlush(...) local_unnamed_addr #2

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 18.1.8 (11~20.04.2)"}
!5 = distinct !{!5, !6, !7}
!6 = !{!"llvm.loop.mustprogress"}
!7 = !{!"llvm.loop.unroll.disable"}
!8 = distinct !{!8, !6, !7}
!9 = distinct !{!9, !6, !7}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !12, i64 0}
!12 = !{!"omnipotent char", !13, i64 0}
!13 = !{!"Simple C/C++ TBAA"}
!14 = distinct !{!14, !6, !7}
!15 = distinct !{!15, !6, !7}
!16 = distinct !{!16, !6, !7}
!17 = distinct !{!17, !7}
!18 = distinct !{!18, !6, !7}
!19 = distinct !{!19, !6, !7}
!20 = distinct !{!20, !6, !7}
!21 = distinct !{!21, !6, !7}
!22 = distinct !{!22, !6, !7}
!23 = distinct !{!23, !6, !7}
