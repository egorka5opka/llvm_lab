; ModuleID = 'SDL/app.c'
source_filename = "SDL/app.c"

declare void @simPutPixel(i32, i32, i32)

declare void @simFlush()

define void @draw_cell(i32 %0, i32 %1, i32 %2) {
  %4 = shl nsw i32 %0, 3
  %5 = shl nsw i32 %1, 3
  %6 = or i32 %5, 1
  %7 = or i32 %5, 2
  %8 = or i32 %5, 3
  %9 = or i32 %5, 4
  %10 = or i32 %5, 5
  %11 = or i32 %5, 6
  %12 = or i32 %5, 7
  br label %13

13:                                               ; preds = %13, %3
  %14 = phi i32 [ 0, %3 ], [ %16, %13 ]
  %15 = add i32 %14, %4
  call void @simPutPixel(i32 %15, i32 %5, i32 %2)
  call void @simPutPixel(i32 %15, i32 %6, i32 %2)
  call void @simPutPixel(i32 %15, i32 %7, i32 %2)
  call void @simPutPixel(i32 %15, i32 %8, i32 %2)
  call void @simPutPixel(i32 %15, i32 %9, i32 %2)
  call void @simPutPixel(i32 %15, i32 %10, i32 %2)
  call void @simPutPixel(i32 %15, i32 %11, i32 %2)
  call void @simPutPixel(i32 %15, i32 %12, i32 %2)
  %16 = add nuw nsw i32 %14, 1
  %17 = icmp eq i32 %16, 8
  br i1 %17, label %18, label %13

18:                                               ; preds = %13
  ret void
}

define void @app() {
  %1 = alloca [2 x [64 x [64 x i32]]], align 16
  br label %2

2:                                                ; preds = %2, %0
  %3 = phi i64 [ 0, %0 ], [ %36, %2 ]
  %4 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 0
  store <4 x i32> zeroinitializer, ptr %4, align 16
  %5 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %3, i64 0
  store <4 x i32> zeroinitializer, ptr %5, align 16
  %6 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 4
  store <4 x i32> zeroinitializer, ptr %6, align 16
  %7 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %3, i64 4
  store <4 x i32> zeroinitializer, ptr %7, align 16
  %8 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 8
  store <4 x i32> zeroinitializer, ptr %8, align 16
  %9 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %3, i64 8
  store <4 x i32> zeroinitializer, ptr %9, align 16
  %10 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 12
  store <4 x i32> zeroinitializer, ptr %10, align 16
  %11 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %3, i64 12
  store <4 x i32> zeroinitializer, ptr %11, align 16
  %12 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 16
  store <4 x i32> zeroinitializer, ptr %12, align 16
  %13 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %3, i64 16
  store <4 x i32> zeroinitializer, ptr %13, align 16
  %14 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 20
  store <4 x i32> zeroinitializer, ptr %14, align 16
  %15 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %3, i64 20
  store <4 x i32> zeroinitializer, ptr %15, align 16
  %16 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 24
  store <4 x i32> zeroinitializer, ptr %16, align 16
  %17 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %3, i64 24
  store <4 x i32> zeroinitializer, ptr %17, align 16
  %18 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 28
  store <4 x i32> zeroinitializer, ptr %18, align 16
  %19 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %3, i64 28
  store <4 x i32> zeroinitializer, ptr %19, align 16
  %20 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 32
  store <4 x i32> zeroinitializer, ptr %20, align 16
  %21 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %3, i64 32
  store <4 x i32> zeroinitializer, ptr %21, align 16
  %22 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 36
  store <4 x i32> zeroinitializer, ptr %22, align 16
  %23 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %3, i64 36
  store <4 x i32> zeroinitializer, ptr %23, align 16
  %24 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 40
  store <4 x i32> zeroinitializer, ptr %24, align 16
  %25 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %3, i64 40
  store <4 x i32> zeroinitializer, ptr %25, align 16
  %26 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 44
  store <4 x i32> zeroinitializer, ptr %26, align 16
  %27 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %3, i64 44
  store <4 x i32> zeroinitializer, ptr %27, align 16
  %28 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 48
  store <4 x i32> zeroinitializer, ptr %28, align 16
  %29 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %3, i64 48
  store <4 x i32> zeroinitializer, ptr %29, align 16
  %30 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 52
  store <4 x i32> zeroinitializer, ptr %30, align 16
  %31 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %3, i64 52
  store <4 x i32> zeroinitializer, ptr %31, align 16
  %32 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 56
  store <4 x i32> zeroinitializer, ptr %32, align 16
  %33 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %3, i64 56
  store <4 x i32> zeroinitializer, ptr %33, align 16
  %34 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 1, i64 %3, i64 60
  store <4 x i32> zeroinitializer, ptr %34, align 16
  %35 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %3, i64 60
  store <4 x i32> zeroinitializer, ptr %35, align 16
  %36 = add nuw nsw i64 %3, 1
  %37 = icmp eq i64 %36, 64
  br i1 %37, label %38, label %2

38:                                               ; preds = %2
  %39 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 28, i64 29
  store i32 2, ptr %39, align 4
  %40 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 28, i64 30
  store i32 2, ptr %40, align 4
  %41 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 28, i64 33
  store i32 2, ptr %41, align 4
  %42 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 28, i64 34
  store i32 2, ptr %42, align 4
  %43 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 29, i64 28
  store i32 2, ptr %43, align 4
  %44 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 29, i64 29
  store i32 2, ptr %44, align 4
  %45 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 29, i64 33
  store i32 2, ptr %45, align 4
  %46 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 29, i64 34
  store i32 2, ptr %46, align 4
  %47 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 30, i64 28
  store i32 2, ptr %47, align 4
  %48 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 30, i64 33
  store i32 2, ptr %48, align 4
  %49 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 30, i64 34
  store i32 2, ptr %49, align 4
  %50 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 30, i64 35
  store i32 2, ptr %50, align 4
  %51 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 31, i64 33
  store i32 2, ptr %51, align 4
  %52 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 31, i64 34
  store i32 2, ptr %52, align 4
  %53 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 31, i64 35
  store i32 2, ptr %53, align 4
  %54 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 33, i64 28
  store <4 x i32> <i32 2, i32 2, i32 2, i32 2>, ptr %54, align 16
  %55 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 34, i64 28
  store <4 x i32> <i32 2, i32 2, i32 2, i32 2>, ptr %55, align 16
  %56 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 35, i64 30
  store i32 2, ptr %56, align 4
  %57 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 35, i64 31
  store i32 2, ptr %57, align 4
  %58 = getelementptr inbounds [64 x [64 x i32]], ptr %1, i64 0, i64 35, i64 35
  store i32 2, ptr %58, align 4
  br label %62

59:                                               ; preds = %98
  %60 = add i32 %63, 1
  %61 = icmp eq i32 %60, 3
  br i1 %61, label %152, label %62

62:                                               ; preds = %59, %38
  %63 = phi i32 [ %60, %59 ], [ 0, %38 ]
  %64 = phi i32 [ 0, %38 ], [ %66, %59 ]
  %65 = zext i32 %64 to i64
  %66 = sub nuw nsw i32 1, %64
  %67 = zext i32 %66 to i64
  br label %68

68:                                               ; preds = %72, %62
  %69 = phi i64 [ 0, %62 ], [ %73, %72 ]
  %70 = trunc i64 %69 to i32
  br label %75

71:                                               ; preds = %72
  call void @simFlush()
  br label %91

72:                                               ; preds = %88
  %73 = add nuw nsw i64 %69, 1
  %74 = icmp eq i64 %73, 64
  br i1 %74, label %71, label %68

75:                                               ; preds = %88, %68
  %76 = phi i64 [ 0, %68 ], [ %89, %88 ]
  %77 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %69, i64 %76
  %78 = load i32, ptr %77, align 4
  %79 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %67, i64 %69, i64 %76
  %80 = load i32, ptr %79, align 4
  %81 = icmp eq i32 %78, %80
  br i1 %81, label %88, label %82

82:                                               ; preds = %75
  %83 = icmp eq i32 %78, 1
  %84 = select i1 %83, i32 -13041685, i32 0
  %85 = icmp eq i32 %78, 2
  %86 = select i1 %85, i32 16777215, i32 %84
  %87 = trunc i64 %76 to i32
  call void @draw_cell(i32 %70, i32 %87, i32 %86)
  br label %88

88:                                               ; preds = %82, %75
  %89 = add i64 %76, 1
  %90 = icmp eq i64 %89, 64
  br i1 %90, label %72, label %75

91:                                               ; preds = %98, %71
  %92 = phi i64 [ 0, %71 ], [ %99, %98 ]
  %93 = add nuw nsw i64 %92, 63
  %94 = and i64 %93, 63
  %95 = and i64 %92, 63
  %96 = and i64 %92, 1
  %97 = and i64 %96, 63
  br label %101

98:                                               ; preds = %147
  %99 = add nuw i64 %92, 1
  %100 = icmp eq i64 %99, 64
  br i1 %100, label %59, label %91

101:                                              ; preds = %147, %91
  %102 = phi i64 [ 0, %91 ], [ %150, %147 ]
  %103 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %92, i64 %102
  %104 = load i32, ptr %103, align 4
  switch i32 %104, label %105 [
    i32 2, label %147
    i32 1, label %146
  ]

105:                                              ; preds = %101
  %106 = add nuw i64 %102, 63
  %107 = and i64 %106, 63
  %108 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %94, i64 %107
  %109 = load i32, ptr %108, align 4
  %110 = and i64 %102, 63
  %111 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %94, i64 %110
  %112 = load i32, ptr %111, align 4
  %113 = add i64 %102, 1
  %114 = and i64 %113, 63
  %115 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %94, i64 %114
  %116 = load i32, ptr %115, align 4
  %117 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %95, i64 %107
  %118 = load i32, ptr %117, align 4
  %119 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %95, i64 %110
  %120 = load i32, ptr %119, align 4
  %121 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %95, i64 %114
  %122 = load i32, ptr %121, align 4
  %123 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %97, i64 %107
  %124 = load i32, ptr %123, align 4
  %125 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %65, i64 %97, i64 %110
  %126 = load i32, ptr %125, align 4
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
  %137 = load i32, ptr %136, align 4
  %138 = icmp eq i32 %137, 2
  %139 = zext i1 %138 to i32
  %140 = bitcast <8 x i1> %135 to i8
  %141 = call i8 @llvm.ctpop.i8(i8 %140)
  %142 = zext i8 %141 to i32
  %143 = add nuw nsw i32 %142, %139
  %144 = icmp eq i32 %143, 2
  %145 = select i1 %144, i32 2, i32 0
  br label %147

146:                                              ; preds = %101
  br label %147

147:                                              ; preds = %146, %105, %101
  %148 = phi i32 [ 0, %146 ], [ %145, %105 ], [ 1, %101 ]
  %149 = getelementptr inbounds [2 x [64 x [64 x i32]]], ptr %1, i64 0, i64 %67, i64 %92, i64 %102
  store i32 %148, ptr %149, align 4
  %150 = add nuw nsw i64 %102, 1
  %151 = icmp eq i64 %150, 64
  br i1 %151, label %98, label %101

152:                                              ; preds = %59
  ret void
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i8 @llvm.ctpop.i8(i8) #0

attributes #0 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }


