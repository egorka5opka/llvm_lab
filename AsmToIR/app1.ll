; ModuleID = 'top'
source_filename = "top"

@regFile = external global [16 x i32]

define void @app() {
entry:
  call void @do_ALLOC()
  call void @do_MOV(i32 0, i32 0, i32 0)
  br label %init_loop_arr

init_loop_arr:                                    ; preds = %init_break_rows, %entry
  call void @do_MOV(i32 1, i32 0, i32 0)
  br label %init_loop_rows

init_loop_rows:                                   ; preds = %init_break_cols, %init_loop_arr
  call void @do_MOV(i32 2, i32 0, i32 0)
  br label %init_loop_cols

init_loop_cols:                                   ; preds = %init_loop_cols, %init_loop_rows
  call void @do_STORE(i32 0, i32 1, i32 1, i32 1, i32 2, i32 1, i32 0, i32 0)
  call void @do_INC_LESS(i32 3, i32 2, i32 64)
  %0 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %1 = trunc i32 %0 to i1
  br i1 %1, label %init_loop_cols, label %init_break_cols

init_break_cols:                                  ; preds = %init_loop_cols
  call void @do_INC_LESS(i32 3, i32 1, i32 64)
  %2 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %3 = trunc i32 %2 to i1
  br i1 %3, label %init_loop_rows, label %init_break_rows

init_break_rows:                                  ; preds = %init_break_cols
  call void @do_INC_LESS(i32 3, i32 0, i32 2)
  %4 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %5 = trunc i32 %4 to i1
  br i1 %5, label %init_loop_arr, label %init_break

init_break:                                       ; preds = %init_break_rows
  call void @do_STORE(i32 0, i32 0, i32 28, i32 0, i32 29, i32 0, i32 2, i32 0)
  call void @do_STORE(i32 0, i32 0, i32 28, i32 0, i32 30, i32 0, i32 2, i32 0)
  call void @do_STORE(i32 0, i32 0, i32 28, i32 0, i32 33, i32 0, i32 2, i32 0)
  call void @do_STORE(i32 0, i32 0, i32 28, i32 0, i32 34, i32 0, i32 2, i32 0)
  call void @do_STORE(i32 0, i32 0, i32 29, i32 0, i32 28, i32 0, i32 2, i32 0)
  call void @do_STORE(i32 0, i32 0, i32 29, i32 0, i32 29, i32 0, i32 2, i32 0)
  call void @do_STORE(i32 0, i32 0, i32 29, i32 0, i32 33, i32 0, i32 2, i32 0)
  call void @do_STORE(i32 0, i32 0, i32 29, i32 0, i32 34, i32 0, i32 2, i32 0)
  call void @do_STORE(i32 0, i32 0, i32 30, i32 0, i32 28, i32 0, i32 2, i32 0)
  call void @do_STORE(i32 0, i32 0, i32 30, i32 0, i32 33, i32 0, i32 2, i32 0)
  call void @do_STORE(i32 0, i32 0, i32 30, i32 0, i32 34, i32 0, i32 2, i32 0)
  call void @do_STORE(i32 0, i32 0, i32 30, i32 0, i32 35, i32 0, i32 2, i32 0)
  call void @do_STORE(i32 0, i32 0, i32 31, i32 0, i32 33, i32 0, i32 2, i32 0)
  call void @do_STORE(i32 0, i32 0, i32 31, i32 0, i32 34, i32 0, i32 2, i32 0)
  call void @do_STORE(i32 0, i32 0, i32 31, i32 0, i32 35, i32 0, i32 2, i32 0)
  call void @do_STORE(i32 0, i32 0, i32 33, i32 0, i32 28, i32 0, i32 2, i32 0)
  call void @do_STORE(i32 0, i32 0, i32 33, i32 0, i32 29, i32 0, i32 2, i32 0)
  call void @do_STORE(i32 0, i32 0, i32 33, i32 0, i32 30, i32 0, i32 2, i32 0)
  call void @do_STORE(i32 0, i32 0, i32 33, i32 0, i32 31, i32 0, i32 2, i32 0)
  call void @do_STORE(i32 0, i32 0, i32 34, i32 0, i32 28, i32 0, i32 2, i32 0)
  call void @do_STORE(i32 0, i32 0, i32 34, i32 0, i32 29, i32 0, i32 2, i32 0)
  call void @do_STORE(i32 0, i32 0, i32 34, i32 0, i32 30, i32 0, i32 2, i32 0)
  call void @do_STORE(i32 0, i32 0, i32 34, i32 0, i32 31, i32 0, i32 2, i32 0)
  call void @do_STORE(i32 0, i32 0, i32 35, i32 0, i32 30, i32 0, i32 2, i32 0)
  call void @do_STORE(i32 0, i32 0, i32 35, i32 0, i32 31, i32 0, i32 2, i32 0)
  call void @do_STORE(i32 0, i32 0, i32 35, i32 0, i32 35, i32 0, i32 2, i32 0)
  call void @do_MOV(i32 0, i32 0, i32 0)
  call void @do_MOV(i32 11, i32 0, i32 0)
  br label %while_render

while_render:                                     ; preds = %update_break_rows, %init_break
  call void @do_INC_LESS(i32 3, i32 11, i32 4)
  %6 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %7 = trunc i32 %6 to i1
  br i1 %7, label %continue_render, label %end_render

continue_render:                                  ; preds = %while_render
  call void @do_MOV(i32 1, i32 0, i32 0)
  br label %draw_loop_row

draw_loop_row:                                    ; preds = %draw_break_cols, %continue_render
  call void @do_MOV(i32 2, i32 0, i32 0)
  br label %draw_loop_col

draw_loop_col:                                    ; preds = %draw_loop_col, %draw_loop_row
  call void @do_READ(i32 4, i32 0, i32 1, i32 2)
  call void @do_SELECTEQ(i32 5, i32 4, i32 1, i32 -13041685, i32 0, i32 0)
  call void @do_SELECTEQ(i32 5, i32 4, i32 2, i32 16777215, i32 5, i32 1)
  call void @do_DRAWC(i32 1, i32 2, i32 5)
  call void @do_INC_LESS(i32 3, i32 2, i32 64)
  %8 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %9 = trunc i32 %8 to i1
  br i1 %9, label %draw_loop_col, label %draw_break_cols

draw_break_cols:                                  ; preds = %draw_loop_col
  call void @do_INC_LESS(i32 3, i32 1, i32 64)
  %10 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %11 = trunc i32 %10 to i1
  br i1 %11, label %draw_loop_row, label %draw_break_rows

draw_break_rows:                                  ; preds = %draw_break_cols
  call void @do_FLUSH()
  call void @do_ADDAND(i32 10, i32 0, i32 1, i32 1)
  call void @do_MOV(i32 1, i32 0, i32 0)
  br label %update_loop_row

update_loop_row:                                  ; preds = %update_break_cols, %draw_break_rows
  call void @do_MOV(i32 2, i32 0, i32 0)
  br label %update_loop_col

update_loop_col:                                  ; preds = %decided, %update_loop_row
  call void @do_READ(i32 4, i32 0, i32 1, i32 2)
  call void @do_SELECTEQ(i32 5, i32 4, i32 2, i32 1, i32 3, i32 0)
  call void @do_SELECTEQ(i32 5, i32 4, i32 1, i32 0, i32 5, i32 1)
  call void @do_EQ(i32 3, i32 5, i32 3)
  %12 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %13 = trunc i32 %12 to i1
  br i1 %13, label %decide_dead, label %decided

decide_dead:                                      ; preds = %update_loop_col
  call void @do_ADDAND(i32 6, i32 1, i32 1, i32 63)
  call void @do_ADDAND(i32 7, i32 1, i32 63, i32 63)
  call void @do_ADDAND(i32 8, i32 2, i32 1, i32 63)
  call void @do_ADDAND(i32 9, i32 2, i32 63, i32 63)
  call void @do_MOV(i32 13, i32 0, i32 0)
  call void @do_READ(i32 12, i32 0, i32 1, i32 8)
  call void @do_EQ(i32 3, i32 12, i32 2)
  call void @do_ADD(i32 13, i32 13, i32 3)
  call void @do_READ(i32 12, i32 0, i32 6, i32 8)
  call void @do_EQ(i32 3, i32 12, i32 2)
  call void @do_ADD(i32 13, i32 13, i32 3)
  call void @do_READ(i32 12, i32 0, i32 7, i32 8)
  call void @do_EQ(i32 3, i32 12, i32 2)
  call void @do_ADD(i32 13, i32 13, i32 3)
  call void @do_READ(i32 12, i32 0, i32 6, i32 2)
  call void @do_EQ(i32 3, i32 12, i32 2)
  call void @do_ADD(i32 13, i32 13, i32 3)
  call void @do_READ(i32 12, i32 0, i32 7, i32 2)
  call void @do_EQ(i32 3, i32 12, i32 2)
  call void @do_ADD(i32 13, i32 13, i32 3)
  call void @do_READ(i32 12, i32 0, i32 1, i32 9)
  call void @do_EQ(i32 3, i32 12, i32 2)
  call void @do_ADD(i32 13, i32 13, i32 3)
  call void @do_READ(i32 12, i32 0, i32 6, i32 9)
  call void @do_EQ(i32 3, i32 12, i32 2)
  call void @do_ADD(i32 13, i32 13, i32 3)
  call void @do_READ(i32 12, i32 0, i32 7, i32 9)
  call void @do_EQ(i32 3, i32 12, i32 2)
  call void @do_ADD(i32 13, i32 13, i32 3)
  call void @do_SELECTEQ(i32 5, i32 13, i32 2, i32 2, i32 0, i32 0)
  br label %decided

decided:                                          ; preds = %decide_dead, %update_loop_col
  call void @do_STORE(i32 10, i32 1, i32 1, i32 1, i32 2, i32 1, i32 5, i32 1)
  call void @do_INC_LESS(i32 3, i32 2, i32 64)
  %14 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %15 = trunc i32 %14 to i1
  br i1 %15, label %update_loop_col, label %update_break_cols

update_break_cols:                                ; preds = %decided
  call void @do_INC_LESS(i32 3, i32 1, i32 64)
  %16 = load i32, ptr getelementptr inbounds ([16 x i32], ptr @regFile, i32 0, i32 3), align 4
  %17 = trunc i32 %16 to i1
  br i1 %17, label %update_loop_row, label %update_break_rows

update_break_rows:                                ; preds = %update_break_cols
  call void @do_MOV(i32 0, i32 10, i32 1)
  br label %while_render

end_render:                                       ; preds = %while_render
  ret void
}

declare void @do_FLUSH()

declare void @do_DRAWC(i32, i32, i32)

declare void @do_ALLOC()

declare void @do_STORE(i32, i32, i32, i32, i32, i32, i32, i32)

declare void @do_MOV(i32, i32, i32)

declare void @do_INC_LESS(i32, i32, i32)

declare void @do_READ(i32, i32, i32, i32)

declare void @do_SELECTEQ(i32, i32, i32, i32, i32, i32)

declare void @do_EQ(i32, i32, i32)

declare void @do_ADDAND(i32, i32, i32, i32)

declare void @do_ADD(i32, i32, i32)

declare void @do_DUMP()
