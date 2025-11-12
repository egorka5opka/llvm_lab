entry
    ALLOC
    MOV x0 0
// zeroinitialize loop
init_loop_arr
    MOV x1 0 
init_loop_rows
    MOV x2 0
init_loop_cols
    STORE x0 x1 x2 0
    INC_LESS x3 x2 64
    BR_COND x3 init_loop_cols init_break_cols
init_break_cols
    INC_LESS x3 x1 64
    BR_COND x3 init_loop_rows init_break_rows
init_break_rows
    INC_LESS x3 x0 2
    BR_COND x3 init_loop_arr init_break
init_break

// initialize center 
    STORE 0 28 29 2
    STORE 0 28 30 2
    STORE 0 28 33 2
    STORE 0 28 34 2
    STORE 0 29 28 2
    STORE 0 29 29 2
    STORE 0 29 33 2
    STORE 0 29 34 2
    STORE 0 30 28 2
    STORE 0 30 33 2
    STORE 0 30 34 2
    STORE 0 30 35 2
    STORE 0 31 33 2
    STORE 0 31 34 2
    STORE 0 31 35 2
    STORE 0 33 28 2
    STORE 0 33 29 2
    STORE 0 33 30 2
    STORE 0 33 31 2
    STORE 0 34 28 2
    STORE 0 34 29 2
    STORE 0 34 30 2
    STORE 0 34 31 2
    STORE 0 35 30 2
    STORE 0 35 31 2
    STORE 0 35 35 2

// step
    MOV x0 0 
// t
    MOV x11 0
// main while
while_render
    INC_LESS x3 x11 4
    BR_COND x3 continue_render end_render
continue_render

    MOV x1 0
draw_loop_row
    MOV x2 0
draw_loop_col
    READ x4 x0 x1 x2
    SELECTEQ x5 x4 1 -13041685 0
    SELECTEQ x5 x4 2 16777215 x5
    DRAWC x1 x2 x5
    INC_LESS x3 x2 64
    BR_COND x3 draw_loop_col draw_break_cols
draw_break_cols
    INC_LESS x3 x1 64
    BR_COND x3 draw_loop_row draw_break_rows
draw_break_rows
    FLUSH
 //   SUB x10 1 x0 equivalent to
    ADDAND x10 x0 1 1

    MOV x1 0
update_loop_row
    MOV x2 0
update_loop_col
    READ x4 x0 x1 x2
    SELECTEQ x5 x4 2 1 3
    SELECTEQ x5 x4 1 0 x5
    EQ x3 x5 3
    BR_COND x3 decide_dead decided
decide_dead
// row + 1
    ADDAND x6 x1 1 63
// row - 1
    ADDAND x7 x1 63 63
// col + 1
    ADDAND x8 x2 1 63
// col - 1
    ADDAND x9 x2 63 63

    MOV x13 0
// arr[row][col+1]
    READ x12 x0 x1 x8
    EQ x3 x12 2
    ADD x13 x13 x3
// arr[row+1][col+1]
    READ x12 x0 x6 x8
    EQ x3 x12 2
    ADD x13 x13 x3
// arr[row-1][col+1]
    READ x12 x0 x7 x8
    EQ x3 x12 2
    ADD x13 x13 x3

// arr[row+1][col]
    READ x12 x0 x6 x2
    EQ x3 x12 2
    ADD x13 x13 x3
// arr[row-1][col]
    READ x12 x0 x7 x2
    EQ x3 x12 2
    ADD x13 x13 x3

// arr[row][col-1]
    READ x12 x0 x1 x9
    EQ x3 x12 2
    ADD x13 x13 x3

// arr[row+1][col-1]
    READ x12 x0 x6 x9
    EQ x3 x12 2
    ADD x13 x13 x3

// arr[row-1][col-1]
    READ x12 x0 x7 x9
    EQ x3 x12 2
    ADD x13 x13 x3
    
    SELECTEQ x5 x13 2 2 0

decided
// next state in x5
    STORE x10 x1 x2 x5

    INC_LESS x3 x2 64
    BR_COND x3 update_loop_col update_break_cols
update_break_cols
    INC_LESS x3 x1 64
    BR_COND x3 update_loop_row update_break_rows
update_break_rows

    MOV x0 x10
    GOTO while_render
end_render
    EXIT