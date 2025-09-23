; ModuleID = 'app.c'
source_filename = "app.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@data = common dso_local local_unnamed_addr global [2 x [128 x [128 x i32]]] zeroinitializer, align 16

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
  call void @simPutPixel(i32 %8, i32 %15, i32 %2) #3
  %16 = add nuw nsw i32 %14, 1
  %17 = icmp eq i32 %16, 4
  br i1 %17, label %10, label %13
}

declare dso_local void @simPutPixel(i32, i32, i32) local_unnamed_addr #1

; Function Attrs: noreturn nounwind uwtable
define dso_local void @app() local_unnamed_addr #2 {
  br label %1

1:                                                ; preds = %3, %0
  %2 = phi i64 [ 60, %0 ], [ %4, %3 ]
  br label %6

3:                                                ; preds = %13
  %4 = add nuw nsw i64 %2, 1
  %5 = icmp eq i64 %4, 68
  br i1 %5, label %16, label %1

6:                                                ; preds = %13, %1
  %7 = phi i64 [ 60, %1 ], [ %14, %13 ]
  %8 = mul nuw nsw i64 %7, %2
  %9 = and i64 %8, 8
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %13, label %11

11:                                               ; preds = %6
  %12 = getelementptr inbounds [2 x [128 x [128 x i32]]], [2 x [128 x [128 x i32]]]* @data, i64 0, i64 0, i64 %2, i64 %7
  store i32 2, i32* %12, align 4, !tbaa !2
  br label %13

13:                                               ; preds = %6, %11
  %14 = add nuw nsw i64 %7, 1
  %15 = icmp eq i64 %14, 68
  br i1 %15, label %3, label %6

16:                                               ; preds = %42, %3
  %17 = phi i32 [ 0, %3 ], [ %22, %42 ]
  %18 = sext i32 %17 to i64
  br label %19

19:                                               ; preds = %25, %16
  %20 = phi i64 [ 0, %16 ], [ %26, %25 ]
  br label %28

21:                                               ; preds = %25
  call void (...) @simFlush() #3
  %22 = sub nsw i32 1, %17
  %23 = sext i32 %17 to i64
  %24 = sext i32 %22 to i64
  br label %40

25:                                               ; preds = %28
  %26 = add nuw nsw i64 %20, 1
  %27 = icmp eq i64 %26, 128
  br i1 %27, label %21, label %19

28:                                               ; preds = %28, %19
  %29 = phi i64 [ 0, %19 ], [ %38, %28 ]
  %30 = getelementptr inbounds [2 x [128 x [128 x i32]]], [2 x [128 x [128 x i32]]]* @data, i64 0, i64 %18, i64 %20, i64 %29
  %31 = load i32, i32* %30, align 4, !tbaa !2
  %32 = icmp eq i32 %31, 1
  %33 = select i1 %32, i32 -13041685, i32 0
  %34 = icmp eq i32 %31, 2
  %35 = select i1 %34, i32 16777215, i32 %33
  %36 = trunc i64 %29 to i32
  %37 = trunc i64 %20 to i32
  call void @draw_cell(i32 %37, i32 %36, i32 %35)
  %38 = add nuw nsw i64 %29, 1
  %39 = icmp eq i64 %38, 128
  br i1 %39, label %25, label %28

40:                                               ; preds = %42, %21
  %41 = phi i64 [ 0, %21 ], [ %43, %42 ]
  br label %45

42:                                               ; preds = %77
  %43 = add nuw nsw i64 %41, 1
  %44 = icmp eq i64 %43, 128
  br i1 %44, label %16, label %40

45:                                               ; preds = %77, %40
  %46 = phi i64 [ 0, %40 ], [ %80, %77 ]
  %47 = getelementptr inbounds [2 x [128 x [128 x i32]]], [2 x [128 x [128 x i32]]]* @data, i64 0, i64 %23, i64 %41, i64 %46
  %48 = load i32, i32* %47, align 4, !tbaa !2
  switch i32 %48, label %50 [
    i32 2, label %77
    i32 1, label %49
  ]

49:                                               ; preds = %45
  br label %77

50:                                               ; preds = %45, %60
  %51 = phi i32 [ %61, %60 ], [ -1, %45 ]
  %52 = phi i32 [ %74, %60 ], [ 0, %45 ]
  %53 = trunc i64 %41 to i32
  %54 = add i32 %51, %53
  %55 = and i32 %54, 127
  %56 = zext i32 %55 to i64
  br label %63

57:                                               ; preds = %60
  %58 = icmp eq i32 %74, 2
  %59 = select i1 %58, i32 2, i32 0
  br label %77

60:                                               ; preds = %63
  %61 = add nsw i32 %51, 1
  %62 = icmp eq i32 %61, 2
  br i1 %62, label %57, label %50

63:                                               ; preds = %63, %50
  %64 = phi i32 [ -1, %50 ], [ %75, %63 ]
  %65 = phi i32 [ %52, %50 ], [ %74, %63 ]
  %66 = trunc i64 %46 to i32
  %67 = add i32 %64, %66
  %68 = and i32 %67, 127
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds [2 x [128 x [128 x i32]]], [2 x [128 x [128 x i32]]]* @data, i64 0, i64 %23, i64 %56, i64 %69
  %71 = load i32, i32* %70, align 4, !tbaa !2
  %72 = icmp eq i32 %71, 2
  %73 = zext i1 %72 to i32
  %74 = add nsw i32 %65, %73
  %75 = add nsw i32 %64, 1
  %76 = icmp eq i32 %75, 2
  br i1 %76, label %60, label %63

77:                                               ; preds = %45, %49, %57
  %78 = phi i32 [ 0, %49 ], [ %59, %57 ], [ 1, %45 ]
  %79 = getelementptr inbounds [2 x [128 x [128 x i32]]], [2 x [128 x [128 x i32]]]* @data, i64 0, i64 %24, i64 %41, i64 %46
  store i32 %78, i32* %79, align 4, !tbaa !2
  %80 = add nuw nsw i64 %46, 1
  %81 = icmp eq i64 %80, 128
  br i1 %81, label %42, label %45
}

declare dso_local void @simFlush(...) local_unnamed_addr #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.0-4ubuntu1 "}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
