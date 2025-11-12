; ModuleID = 'top'
source_filename = "top"

@regFile = external global [16 x i32]

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
  %4 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 %1, i32 %2, i32 %3
  store i32 0, ptr %4, align 4
  %5 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 2), align 4
  %6 = add i32 %5, 1
  store i32 %6, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 2), align 4
  %7 = icmp slt i32 %6, 64
  store i1 %7, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 1
  %8 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %9 = trunc i32 %8 to i1
  br i1 %9, label %init_loop_cols, label %init_break_cols

init_break_cols:                                  ; preds = %init_loop_cols
  %10 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 1), align 4
  %11 = add i32 %10, 1
  store i32 %11, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 1), align 4
  %12 = icmp slt i32 %11, 64
  store i1 %12, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 1
  %13 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %14 = trunc i32 %13 to i1
  br i1 %14, label %init_loop_rows, label %init_break_rows

init_break_rows:                                  ; preds = %init_break_cols
  %15 = load i32, ptr @regFile, align 4
  %16 = add i32 %15, 1
  store i32 %16, ptr @regFile, align 4
  %17 = icmp slt i32 %16, 2
  store i1 %17, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 1
  %18 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %19 = trunc i32 %18 to i1
  br i1 %19, label %init_loop_arr, label %init_break

init_break:                                       ; preds = %init_break_rows
  %20 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 0, i32 28, i32 29
  store i32 2, ptr %20, align 4
  %21 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 0, i32 28, i32 30
  store i32 2, ptr %21, align 4
  %22 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 0, i32 28, i32 33
  store i32 2, ptr %22, align 4
  %23 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 0, i32 28, i32 34
  store i32 2, ptr %23, align 4
  %24 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 0, i32 29, i32 28
  store i32 2, ptr %24, align 4
  %25 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 0, i32 29, i32 29
  store i32 2, ptr %25, align 4
  %26 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 0, i32 29, i32 33
  store i32 2, ptr %26, align 4
  %27 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 0, i32 29, i32 34
  store i32 2, ptr %27, align 4
  %28 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 0, i32 30, i32 28
  store i32 2, ptr %28, align 4
  %29 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 0, i32 30, i32 33
  store i32 2, ptr %29, align 4
  %30 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 0, i32 30, i32 34
  store i32 2, ptr %30, align 4
  %31 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 0, i32 30, i32 35
  store i32 2, ptr %31, align 4
  %32 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 0, i32 31, i32 33
  store i32 2, ptr %32, align 4
  %33 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 0, i32 31, i32 34
  store i32 2, ptr %33, align 4
  %34 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 0, i32 31, i32 35
  store i32 2, ptr %34, align 4
  %35 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 0, i32 33, i32 28
  store i32 2, ptr %35, align 4
  %36 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 0, i32 33, i32 29
  store i32 2, ptr %36, align 4
  %37 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 0, i32 33, i32 30
  store i32 2, ptr %37, align 4
  %38 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 0, i32 33, i32 31
  store i32 2, ptr %38, align 4
  %39 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 0, i32 34, i32 28
  store i32 2, ptr %39, align 4
  %40 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 0, i32 34, i32 29
  store i32 2, ptr %40, align 4
  %41 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 0, i32 34, i32 30
  store i32 2, ptr %41, align 4
  %42 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 0, i32 34, i32 31
  store i32 2, ptr %42, align 4
  %43 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 0, i32 35, i32 30
  store i32 2, ptr %43, align 4
  %44 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 0, i32 35, i32 31
  store i32 2, ptr %44, align 4
  %45 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 0, i32 35, i32 35
  store i32 2, ptr %45, align 4
  store i32 0, ptr @regFile, align 4
  store i32 0, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 11), align 4
  br label %while_render

while_render:                                     ; preds = %update_break_rows, %init_break
  %46 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 11), align 4
  %47 = add i32 %46, 1
  store i32 %47, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 11), align 4
  %48 = icmp slt i32 %47, 4
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
  %54 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 %51, i32 %52, i32 %53
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
  call void @draw_cell(i32 %63, i32 %64, i32 %65)
  %66 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 2), align 4
  %67 = add i32 %66, 1
  store i32 %67, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 2), align 4
  %68 = icmp slt i32 %67, 64
  store i1 %68, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 1
  %69 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %70 = trunc i32 %69 to i1
  br i1 %70, label %draw_loop_col, label %draw_break_cols

draw_break_cols:                                  ; preds = %draw_loop_col
  %71 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 1), align 4
  %72 = add i32 %71, 1
  store i32 %72, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 1), align 4
  %73 = icmp slt i32 %72, 64
  store i1 %73, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 1
  %74 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %75 = trunc i32 %74 to i1
  br i1 %75, label %draw_loop_row, label %draw_break_rows

draw_break_rows:                                  ; preds = %draw_break_cols
  call void @simFlush()
  %76 = load i32, ptr @regFile, align 4
  %77 = add i32 %76, 1
  %78 = and i32 %77, 1
  store i32 %78, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 10), align 4
  store i32 0, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 1), align 4
  br label %update_loop_row

update_loop_row:                                  ; preds = %update_break_cols, %draw_break_rows
  store i32 0, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 2), align 4
  br label %update_loop_col

update_loop_col:                                  ; preds = %decided, %update_loop_row
  %79 = load i32, ptr @regFile, align 4
  %80 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 1), align 4
  %81 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 2), align 4
  %82 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 %79, i32 %80, i32 %81
  %83 = load i32, ptr %82, align 4
  store i32 %83, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 4), align 4
  %84 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 4), align 4
  %85 = icmp eq i32 %84, 2
  %86 = select i1 %85, i32 1, i32 3
  store i32 %86, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 5), align 4
  %87 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 4), align 4
  %88 = icmp eq i32 %87, 1
  %89 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 5), align 4
  %90 = select i1 %88, i32 0, i32 %89
  store i32 %90, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 5), align 4
  %91 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 5), align 4
  %92 = icmp eq i32 %91, 3
  %93 = zext i1 %92 to i32
  store i32 %93, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %94 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %95 = trunc i32 %94 to i1
  br i1 %95, label %decide_dead, label %decided

decide_dead:                                      ; preds = %update_loop_col
  %96 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 1), align 4
  %97 = add i32 %96, 1
  %98 = and i32 %97, 63
  store i32 %98, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 6), align 4
  %99 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 1), align 4
  %100 = add i32 %99, 63
  %101 = and i32 %100, 63
  store i32 %101, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 7), align 4
  %102 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 2), align 4
  %103 = add i32 %102, 1
  %104 = and i32 %103, 63
  store i32 %104, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 8), align 4
  %105 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 2), align 4
  %106 = add i32 %105, 63
  %107 = and i32 %106, 63
  store i32 %107, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 9), align 4
  store i32 0, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %108 = load i32, ptr @regFile, align 4
  %109 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 1), align 4
  %110 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 8), align 4
  %111 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 %108, i32 %109, i32 %110
  %112 = load i32, ptr %111, align 4
  store i32 %112, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 12), align 4
  %113 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 12), align 4
  %114 = icmp eq i32 %113, 2
  %115 = zext i1 %114 to i32
  store i32 %115, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %116 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %117 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %118 = add i32 %116, %117
  store i32 %118, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %119 = load i32, ptr @regFile, align 4
  %120 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 6), align 4
  %121 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 8), align 4
  %122 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 %119, i32 %120, i32 %121
  %123 = load i32, ptr %122, align 4
  store i32 %123, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 12), align 4
  %124 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 12), align 4
  %125 = icmp eq i32 %124, 2
  %126 = zext i1 %125 to i32
  store i32 %126, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %127 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %128 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %129 = add i32 %127, %128
  store i32 %129, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %130 = load i32, ptr @regFile, align 4
  %131 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 7), align 4
  %132 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 8), align 4
  %133 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 %130, i32 %131, i32 %132
  %134 = load i32, ptr %133, align 4
  store i32 %134, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 12), align 4
  %135 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 12), align 4
  %136 = icmp eq i32 %135, 2
  %137 = zext i1 %136 to i32
  store i32 %137, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %138 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %139 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %140 = add i32 %138, %139
  store i32 %140, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %141 = load i32, ptr @regFile, align 4
  %142 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 6), align 4
  %143 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 2), align 4
  %144 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 %141, i32 %142, i32 %143
  %145 = load i32, ptr %144, align 4
  store i32 %145, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 12), align 4
  %146 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 12), align 4
  %147 = icmp eq i32 %146, 2
  %148 = zext i1 %147 to i32
  store i32 %148, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %149 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %150 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %151 = add i32 %149, %150
  store i32 %151, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %152 = load i32, ptr @regFile, align 4
  %153 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 7), align 4
  %154 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 2), align 4
  %155 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 %152, i32 %153, i32 %154
  %156 = load i32, ptr %155, align 4
  store i32 %156, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 12), align 4
  %157 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 12), align 4
  %158 = icmp eq i32 %157, 2
  %159 = zext i1 %158 to i32
  store i32 %159, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %160 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %161 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %162 = add i32 %160, %161
  store i32 %162, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %163 = load i32, ptr @regFile, align 4
  %164 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 1), align 4
  %165 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 9), align 4
  %166 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 %163, i32 %164, i32 %165
  %167 = load i32, ptr %166, align 4
  store i32 %167, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 12), align 4
  %168 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 12), align 4
  %169 = icmp eq i32 %168, 2
  %170 = zext i1 %169 to i32
  store i32 %170, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %171 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %172 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %173 = add i32 %171, %172
  store i32 %173, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %174 = load i32, ptr @regFile, align 4
  %175 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 6), align 4
  %176 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 9), align 4
  %177 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 %174, i32 %175, i32 %176
  %178 = load i32, ptr %177, align 4
  store i32 %178, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 12), align 4
  %179 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 12), align 4
  %180 = icmp eq i32 %179, 2
  %181 = zext i1 %180 to i32
  store i32 %181, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %182 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %183 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %184 = add i32 %182, %183
  store i32 %184, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %185 = load i32, ptr @regFile, align 4
  %186 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 7), align 4
  %187 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 9), align 4
  %188 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 %185, i32 %186, i32 %187
  %189 = load i32, ptr %188, align 4
  store i32 %189, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 12), align 4
  %190 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 12), align 4
  %191 = icmp eq i32 %190, 2
  %192 = zext i1 %191 to i32
  store i32 %192, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %193 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %194 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %195 = add i32 %193, %194
  store i32 %195, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %196 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 13), align 4
  %197 = icmp eq i32 %196, 2
  %198 = select i1 %197, i32 2, i32 0
  store i32 %198, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 5), align 4
  br label %decided

decided:                                          ; preds = %decide_dead, %update_loop_col
  %199 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 10), align 4
  %200 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 1), align 4
  %201 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 2), align 4
  %202 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 5), align 4
  %203 = getelementptr [2 x [64 x [64 x i32]]], ptr %0, i64 0, i32 %199, i32 %200, i32 %201
  store i32 %202, ptr %203, align 4
  %204 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 2), align 4
  %205 = add i32 %204, 1
  store i32 %205, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 2), align 4
  %206 = icmp slt i32 %205, 64
  store i1 %206, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 1
  %207 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %208 = trunc i32 %207 to i1
  br i1 %208, label %update_loop_col, label %update_break_cols

update_break_cols:                                ; preds = %decided
  %209 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 1), align 4
  %210 = add i32 %209, 1
  store i32 %210, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 1), align 4
  %211 = icmp slt i32 %210, 64
  store i1 %211, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 1
  %212 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %213 = trunc i32 %212 to i1
  br i1 %213, label %update_loop_row, label %update_break_rows

update_break_rows:                                ; preds = %update_break_cols
  %214 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 10), align 4
  store i32 %214, ptr @regFile, align 4
  br label %while_render

end_render:                                       ; preds = %while_render
  ret void
}

declare void @simFlush()

declare void @do_DUMP()

declare void @draw_cell(i32, i32, i32)
