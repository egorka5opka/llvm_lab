#include "../SDL/sim.h"
#include <cstdint>

void draw_cell(int row, int col, int color);

void do_DRAWC(int row, int col, int color);

void do_FLUSH();
void do_ALLOC();

void do_STORE(int i, int is_reg_i, int row, int is_reg_row, int col,
    int is_reg_col, int val, int is_reg_val);

void do_MOV(int dst, int src, int is_reg_src);

// FROM ASM: b always imm
void do_INC_LESS(int dst, int reg, int b);

// FROM ASM: indexes always regs
void do_READ(int dst, int i, int row, int col);

// FROM ASM:
// a - always reg;
// b, iftrue, iffalse - always imms
void do_SELECTEQ(int dst, int a, int b, int iftrue, int iffalse, int iffalse_reg)   ;
// FROM ASM:
// a - always reg
// b - always imm
void do_EQ(int dst, int a, int b);

// FROM ASM:
// a - always reg
// b, c - always imms
void do_ADDAND(int dst, int a, int b, int c);

// FROM ASM:
// a, b - always regs
void do_ADD(int dst, int a, int b);

void do_DUMP();