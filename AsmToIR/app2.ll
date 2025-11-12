; ModuleID = 'top'
source_filename = "top"

@regFile = private global [16 x i32] zeroinitializer

define void @app() {
entry:
  %0 = alloca [2 x [64 x [64 x i32]]], align 4
  store i32 0, ptr @regFile, align 4
  br label %init_loop_arr

init_loop_arr:                                    ; preds = %init_break_rows, %entry
  store i32 0, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 1), align 4
  br label %init_loop_rows

init_loop_rows:                                   ; preds = %init_break_cols, %init_loop_arr
  store i32 0, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 2), align 4
  br label %init_loop_cols

init_loop_cols:                                   ; preds = %init_loop_cols, %init_loop_rows
  %1 = load i32, ptr @regFile, align 4
  %2 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 1), align 4
  %3 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 2), align 4
  %4 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 %1, i32 %2, i32 %3
  store i32 0, ptr %4, align 4
  %5 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 2), align 4
  %6 = add i32 %5, 1
  store i32 %6, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 2), align 4
  %7 = icmp eq i32 %6, 64
  store i1 %7, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 1
  %8 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %9 = trunc i32 %8 to i1
  br i1 %9, label %init_loop_cols, label %init_break_cols

init_break_cols:                                  ; preds = %init_loop_cols
  %10 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 1), align 4
  %11 = add i32 %10, 1
  store i32 %11, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 1), align 4
  %12 = icmp eq i32 %11, 64
  store i1 %12, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 1
  %13 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %14 = trunc i32 %13 to i1
  br i1 %14, label %init_loop_rows, label %init_break_rows

init_break_rows:                                  ; preds = %init_break_cols
  %15 = load i32, ptr @regFile, align 4
  %16 = add i32 %15, 1
  store i32 %16, ptr @regFile, align 4
  %17 = icmp eq i32 %16, 2
  store i1 %17, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 1
  %18 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %19 = trunc i32 %18 to i1
  br i1 %19, label %init_loop_arr, label %init_break

init_break:                                       ; preds = %init_break_rows
  %20 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 0, i32 28, i32 29
  store i32 2, ptr %20, align 4
  %21 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 0, i32 28, i32 30
  store i32 2, ptr %21, align 4
  %22 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 0, i32 28, i32 33
  store i32 2, ptr %22, align 4
  %23 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 0, i32 28, i32 34
  store i32 2, ptr %23, align 4
  %24 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 0, i32 29, i32 28
  store i32 2, ptr %24, align 4
  %25 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 0, i32 29, i32 29
  store i32 2, ptr %25, align 4
  %26 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 0, i32 29, i32 33
  store i32 2, ptr %26, align 4
  %27 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 0, i32 29, i32 34
  store i32 2, ptr %27, align 4
  %28 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 0, i32 30, i32 28
  store i32 2, ptr %28, align 4
  %29 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 0, i32 30, i32 33
  store i32 2, ptr %29, align 4
  %30 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 0, i32 30, i32 34
  store i32 2, ptr %30, align 4
  %31 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 0, i32 30, i32 35
  store i32 2, ptr %31, align 4
  %32 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 0, i32 31, i32 33
  store i32 2, ptr %32, align 4
  %33 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 0, i32 31, i32 34
  store i32 2, ptr %33, align 4
  %34 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 0, i32 31, i32 35
  store i32 2, ptr %34, align 4
  %35 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 0, i32 33, i32 28
  store i32 2, ptr %35, align 4
  %36 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 0, i32 33, i32 29
  store i32 2, ptr %36, align 4
  %37 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 0, i32 33, i32 30
  store i32 2, ptr %37, align 4
  %38 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 0, i32 33, i32 31
  store i32 2, ptr %38, align 4
  %39 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 0, i32 34, i32 28
  store i32 2, ptr %39, align 4
  %40 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 0, i32 34, i32 29
  store i32 2, ptr %40, align 4
  %41 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 0, i32 34, i32 30
  store i32 2, ptr %41, align 4
  %42 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 0, i32 34, i32 31
  store i32 2, ptr %42, align 4
  %43 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 0, i32 35, i32 30
  store i32 2, ptr %43, align 4
  %44 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 0, i32 35, i32 31
  store i32 2, ptr %44, align 4
  %45 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 0, i32 35, i32 35
  store i32 2, ptr %45, align 4
  store i32 0, ptr @regFile, align 4
  store i32 0, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 11), align 4
  br label %while_render

while_render:                                     ; preds = %update_break_rows, %init_break
  %46 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 11), align 4
  %47 = add i32 %46, 1
  store i32 %47, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 11), align 4
  %48 = icmp eq i32 %47, 4
  store i1 %48, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 1
  %49 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %50 = trunc i32 %49 to i1
  br i1 %50, label %continue_render, label %end_render

continue_render:                                  ; preds = %while_render
  store i32 0, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 1), align 4
  br label %draw_loop_row

draw_loop_row:                                    ; preds = %draw_break_cols, %continue_render
  store i32 0, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 2), align 4
  br label %draw_loop_col

draw_loop_col:                                    ; preds = %draw_loop_col, %draw_loop_row
  %51 = load i32, ptr @regFile, align 4
  %52 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 1), align 4
  %53 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 2), align 4
  %54 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 %51, i32 %52, i32 %53
  %55 = load i32, ptr %54, align 4
  store i32 %55, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 4), align 4
  %56 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 4), align 4
  %57 = icmp eq i32 %56, 1
  %58 = select i1 %57, i32 -13041685, i32 0
  store i32 %58, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 5), align 4
  %59 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 4), align 4
  %60 = icmp eq i32 %59, 2
  %61 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 5), align 4
  %62 = select i1 %60, i32 16777215, i32 %61
  store i32 %62, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 5), align 4
  %63 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 1), align 4
  %64 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 2), align 4
  %65 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 5), align 4
  call void @do_DRAWC(i32 %63, i32 %64, i32 %65)
  %66 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 2), align 4
  %67 = add i32 %66, 1
  store i32 %67, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 2), align 4
  %68 = icmp eq i32 %67, 64
  store i1 %68, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 1
  %69 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %70 = trunc i32 %69 to i1
  br i1 %70, label %draw_loop_col, label %draw_break_cols

draw_break_cols:                                  ; preds = %draw_loop_col
  %71 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 1), align 4
  %72 = add i32 %71, 1
  store i32 %72, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 1), align 4
  %73 = icmp eq i32 %72, 64
  store i1 %73, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 1
  %74 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %75 = trunc i32 %74 to i1
  br i1 %75, label %draw_loop_row, label %draw_break_rows

draw_break_rows:                                  ; preds = %draw_break_cols
  call void @simFlush()
  %76 = load i32, ptr @regFile, align 4
  %77 = icmp eq i32 %76, 1
  %78 = zext i1 %77 to i32
  %79 = and i32 %78, 1
  store i32 %79, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 10), align 4
  store i32 0, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 1), align 4
  br label %update_loop_row

update_loop_row:                                  ; preds = %update_break_cols, %draw_break_rows
  store i32 0, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 2), align 4
  br label %update_loop_col

update_loop_col:                                  ; preds = %decided, %update_loop_row
  %80 = load i32, ptr @regFile, align 4
  %81 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 1), align 4
  %82 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 2), align 4
  %83 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 %80, i32 %81, i32 %82
  %84 = load i32, ptr %83, align 4
  store i32 %84, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 4), align 4
  %85 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 4), align 4
  %86 = icmp eq i32 %85, 2
  %87 = select i1 %86, i32 1, i32 3
  store i32 %87, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 5), align 4
  %88 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 4), align 4
  %89 = icmp eq i32 %88, 1
  %90 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 5), align 4
  %91 = select i1 %89, i32 0, i32 %90
  store i32 %91, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 5), align 4
  %92 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 5), align 4
  %93 = icmp eq i32 %92, 3
  %94 = zext i1 %93 to i32
  store i32 %94, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %95 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %96 = trunc i32 %95 to i1
  br i1 %96, label %decide_dead, label %decided

decide_dead:                                      ; preds = %update_loop_col
  %97 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 1), align 4
  %98 = icmp eq i32 %97, 1
  %99 = zext i1 %98 to i32
  %100 = and i32 %99, 63
  store i32 %100, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 6), align 4
  %101 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 1), align 4
  %102 = icmp eq i32 %101, 63
  %103 = zext i1 %102 to i32
  %104 = and i32 %103, 63
  store i32 %104, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 7), align 4
  %105 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 2), align 4
  %106 = icmp eq i32 %105, 1
  %107 = zext i1 %106 to i32
  %108 = and i32 %107, 63
  store i32 %108, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 8), align 4
  %109 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 2), align 4
  %110 = icmp eq i32 %109, 63
  %111 = zext i1 %110 to i32
  %112 = and i32 %111, 63
  store i32 %112, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 9), align 4
  store i32 0, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %113 = load i32, ptr @regFile, align 4
  %114 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 1), align 4
  %115 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 8), align 4
  %116 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 %113, i32 %114, i32 %115
  %117 = load i32, ptr %116, align 4
  store i32 %117, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 12), align 4
  %118 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 12), align 4
  %119 = icmp eq i32 %118, 2
  %120 = zext i1 %119 to i32
  store i32 %120, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %121 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %122 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %123 = add i32 %121, %122
  store i32 %123, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %124 = load i32, ptr @regFile, align 4
  %125 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 6), align 4
  %126 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 8), align 4
  %127 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 %124, i32 %125, i32 %126
  %128 = load i32, ptr %127, align 4
  store i32 %128, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 12), align 4
  %129 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 12), align 4
  %130 = icmp eq i32 %129, 2
  %131 = zext i1 %130 to i32
  store i32 %131, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %132 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %133 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %134 = add i32 %132, %133
  store i32 %134, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %135 = load i32, ptr @regFile, align 4
  %136 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 7), align 4
  %137 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 8), align 4
  %138 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 %135, i32 %136, i32 %137
  %139 = load i32, ptr %138, align 4
  store i32 %139, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 12), align 4
  %140 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 12), align 4
  %141 = icmp eq i32 %140, 2
  %142 = zext i1 %141 to i32
  store i32 %142, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %143 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %144 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %145 = add i32 %143, %144
  store i32 %145, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %146 = load i32, ptr @regFile, align 4
  %147 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 6), align 4
  %148 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 2), align 4
  %149 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 %146, i32 %147, i32 %148
  %150 = load i32, ptr %149, align 4
  store i32 %150, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 12), align 4
  %151 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 12), align 4
  %152 = icmp eq i32 %151, 2
  %153 = zext i1 %152 to i32
  store i32 %153, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %154 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %155 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %156 = add i32 %154, %155
  store i32 %156, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %157 = load i32, ptr @regFile, align 4
  %158 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 7), align 4
  %159 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 2), align 4
  %160 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 %157, i32 %158, i32 %159
  %161 = load i32, ptr %160, align 4
  store i32 %161, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 12), align 4
  %162 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 12), align 4
  %163 = icmp eq i32 %162, 2
  %164 = zext i1 %163 to i32
  store i32 %164, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %165 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %166 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %167 = add i32 %165, %166
  store i32 %167, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %168 = load i32, ptr @regFile, align 4
  %169 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 1), align 4
  %170 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 9), align 4
  %171 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 %168, i32 %169, i32 %170
  %172 = load i32, ptr %171, align 4
  store i32 %172, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 12), align 4
  %173 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 12), align 4
  %174 = icmp eq i32 %173, 2
  %175 = zext i1 %174 to i32
  store i32 %175, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %176 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %177 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %178 = add i32 %176, %177
  store i32 %178, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %179 = load i32, ptr @regFile, align 4
  %180 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 6), align 4
  %181 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 9), align 4
  %182 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 %179, i32 %180, i32 %181
  %183 = load i32, ptr %182, align 4
  store i32 %183, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 12), align 4
  %184 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 12), align 4
  %185 = icmp eq i32 %184, 2
  %186 = zext i1 %185 to i32
  store i32 %186, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %187 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %188 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %189 = add i32 %187, %188
  store i32 %189, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %190 = load i32, ptr @regFile, align 4
  %191 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 7), align 4
  %192 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 9), align 4
  %193 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 %190, i32 %191, i32 %192
  %194 = load i32, ptr %193, align 4
  store i32 %194, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 12), align 4
  %195 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 12), align 4
  %196 = icmp eq i32 %195, 2
  %197 = zext i1 %196 to i32
  store i32 %197, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %198 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %199 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %200 = add i32 %198, %199
  store i32 %200, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %201 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %202 = icmp eq i32 %201, 2
  %203 = select i1 %202, i32 2, i32 0
  store i32 %203, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 5), align 4
  br label %decided

decided:                                          ; preds = %decide_dead, %update_loop_col
  %204 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 10), align 4
  %205 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 1), align 4
  %206 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 2), align 4
  %207 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 5), align 4
  %208 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i32 %204, i32 %205, i32 %206
  store i32 %207, ptr %208, align 4
  %209 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 2), align 4
  %210 = add i32 %209, 1
  store i32 %210, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 2), align 4
  %211 = icmp eq i32 %210, 64
  store i1 %211, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 1
  %212 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %213 = trunc i32 %212 to i1
  br i1 %213, label %update_loop_col, label %update_break_cols

update_break_cols:                                ; preds = %decided
  %214 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 1), align 4
  %215 = add i32 %214, 1
  store i32 %215, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 1), align 4
  %216 = icmp eq i32 %215, 64
  store i1 %216, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 1
  %217 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %218 = trunc i32 %217 to i1
  br i1 %218, label %update_loop_row, label %update_break_rows

update_break_rows:                                ; preds = %update_break_cols
  %219 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 10), align 4
  store i32 %219, ptr @regFile, align 4
  br label %while_render

end_render:                                       ; preds = %while_render
  ret void
}

declare void @simFlush()

declare void @do_DUMP()

declare void @do_DRAWC(i32, i32, i32)
