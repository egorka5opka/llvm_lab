; ModuleID = 'app.c'
source_filename = "app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define dso_local void @draw_cell(i32 %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = shl i32 %0, 2
  %5 = shl i32 %1, 2
  br label %6

6:                                                ; preds = %10, %3
  %7 = phi i32 [ 0, %3 ], [ %11, %10 ]
  %8 = add nuw nsw i32 %7, %4
  br label %13

9:                                                ; preds = %10
  ret void

10:                                               ; preds = %13
  %11 = add nuw nsw i32 %7, 1
  %12 = icmp eq i32 %11, 4
  br i1 %12, label %9, label %6

13:                                               ; preds = %13, %6
  %14 = phi i32 [ 0, %6 ], [ %16, %13 ]
  %15 = add nuw nsw i32 %14, %5
  call void @simPutPixel(i32 %8, i32 %15, i32 %2) #4
  %16 = add nuw nsw i32 %14, 1
  %17 = icmp eq i32 %16, 4
  br i1 %17, label %10, label %13
}

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

declare dso_local void @simPutPixel(i32, i32, i32) local_unnamed_addr #2

; Function Attrs: noreturn nounwind uwtable
define dso_local void @app() local_unnamed_addr #3 {
  %1 = alloca [2 x [128 x [128 x i32]]], align 16
  %2 = bitcast [2 x [128 x [128 x i32]]]* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 131072, i8* nonnull %2) #4
  br label %3

3:                                                ; preds = %5, %0
  %4 = phi i64 [ 60, %0 ], [ %6, %5 ]
  br label %8

5:                                                ; preds = %15
  %6 = add nuw nsw i64 %4, 1
  %7 = icmp eq i64 %6, 68
  br i1 %7, label %18, label %3

8:                                                ; preds = %15, %3
  %9 = phi i64 [ 60, %3 ], [ %16, %15 ]
  %10 = mul nuw nsw i64 %9, %4
  %11 = and i64 %10, 8
  %12 = icmp eq i64 %11, 0
  br i1 %12, label %15, label %13

13:                                               ; preds = %8
  %14 = getelementptr inbounds [2 x [128 x [128 x i32]]], [2 x [128 x [128 x i32]]]* %1, i64 0, i64 0, i64 %4, i64 %9
  store i32 2, i32* %14, align 4, !tbaa !2
  br label %15

15:                                               ; preds = %8, %13
  %16 = add nuw nsw i64 %9, 1
  %17 = icmp eq i64 %16, 68
  br i1 %17, label %5, label %8

18:                                               ; preds = %44, %5
  %19 = phi i32 [ 0, %5 ], [ %24, %44 ]
  %20 = sext i32 %19 to i64
  br label %21

21:                                               ; preds = %27, %18
  %22 = phi i64 [ 0, %18 ], [ %28, %27 ]
  br label %30

23:                                               ; preds = %27
  call void (...) @simFlush() #4
  %24 = sub nsw i32 1, %19
  %25 = sext i32 %19 to i64
  %26 = sext i32 %24 to i64
  br label %42

27:                                               ; preds = %30
  %28 = add nuw nsw i64 %22, 1
  %29 = icmp eq i64 %28, 128
  br i1 %29, label %23, label %21

30:                                               ; preds = %30, %21
  %31 = phi i64 [ 0, %21 ], [ %40, %30 ]
  %32 = getelementptr inbounds [2 x [128 x [128 x i32]]], [2 x [128 x [128 x i32]]]* %1, i64 0, i64 %20, i64 %22, i64 %31
  %33 = load i32, i32* %32, align 4, !tbaa !2
  %34 = icmp eq i32 %33, 1
  %35 = select i1 %34, i32 -13041685, i32 0
  %36 = icmp eq i32 %33, 2
  %37 = select i1 %36, i32 16777215, i32 %35
  %38 = trunc i64 %31 to i32
  %39 = trunc i64 %22 to i32
  call void @draw_cell(i32 %39, i32 %38, i32 %37)
  %40 = add nuw nsw i64 %31, 1
  %41 = icmp eq i64 %40, 128
  br i1 %41, label %27, label %30

42:                                               ; preds = %44, %23
  %43 = phi i64 [ 0, %23 ], [ %45, %44 ]
  br label %47

44:                                               ; preds = %79
  %45 = add nuw nsw i64 %43, 1
  %46 = icmp eq i64 %45, 128
  br i1 %46, label %18, label %42

47:                                               ; preds = %79, %42
  %48 = phi i64 [ 0, %42 ], [ %82, %79 ]
  %49 = getelementptr inbounds [2 x [128 x [128 x i32]]], [2 x [128 x [128 x i32]]]* %1, i64 0, i64 %25, i64 %43, i64 %48
  %50 = load i32, i32* %49, align 4, !tbaa !2
  switch i32 %50, label %52 [
    i32 2, label %79
    i32 1, label %51
  ]

51:                                               ; preds = %47
  br label %79

52:                                               ; preds = %47, %62
  %53 = phi i32 [ %63, %62 ], [ -1, %47 ]
  %54 = phi i32 [ %76, %62 ], [ 0, %47 ]
  %55 = trunc i64 %43 to i32
  %56 = add i32 %53, %55
  %57 = and i32 %56, 127
  %58 = zext i32 %57 to i64
  br label %65

59:                                               ; preds = %62
  %60 = icmp eq i32 %76, 2
  %61 = select i1 %60, i32 2, i32 0
  br label %79

62:                                               ; preds = %65
  %63 = add nsw i32 %53, 1
  %64 = icmp eq i32 %63, 2
  br i1 %64, label %59, label %52

65:                                               ; preds = %65, %52
  %66 = phi i32 [ -1, %52 ], [ %77, %65 ]
  %67 = phi i32 [ %54, %52 ], [ %76, %65 ]
  %68 = trunc i64 %48 to i32
  %69 = add i32 %66, %68
  %70 = and i32 %69, 127
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds [2 x [128 x [128 x i32]]], [2 x [128 x [128 x i32]]]* %1, i64 0, i64 %25, i64 %58, i64 %71
  %73 = load i32, i32* %72, align 4, !tbaa !2
  %74 = icmp eq i32 %73, 2
  %75 = zext i1 %74 to i32
  %76 = add nsw i32 %67, %75
  %77 = add nsw i32 %66, 1
  %78 = icmp eq i32 %77, 2
  br i1 %78, label %62, label %65

79:                                               ; preds = %47, %51, %59
  %80 = phi i32 [ 0, %51 ], [ %61, %59 ], [ 1, %47 ]
  %81 = getelementptr inbounds [2 x [128 x [128 x i32]]], [2 x [128 x [128 x i32]]]* %1, i64 0, i64 %26, i64 %43, i64 %48
  store i32 %80, i32* %81, align 4, !tbaa !2
  %82 = add nuw nsw i64 %48, 1
  %83 = icmp eq i64 %82, 128
  br i1 %83, label %44, label %47
}

declare dso_local void @simFlush(...) local_unnamed_addr #2

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
