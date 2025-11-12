#include "../SDL/sim.h"
#include <cstdint>
#include <iostream>

const int REG_FILE_SIZE = 16;
uint32_t REG_FILE[REG_FILE_SIZE];
uint32_t data[2][64][64];

#define CELL_SIZE 8

void draw_cell(int row, int col, int color) {
    for (int i = 0; i < CELL_SIZE; ++i) {
        for (int j = 0; j < CELL_SIZE; ++j) {
            simPutPixel(row * CELL_SIZE + i, col * CELL_SIZE + j, color);
        }
    }
}

void do_DRAWC(int row, int col, int color) {
    draw_cell(REG_FILE[row], REG_FILE[col], REG_FILE[color]);
}

void do_FLUSH() {
    simFlush();
}

void do_ALLOC() {
    // nothing here
}

void ensure_val(int& val, int is_reg) {
    if (is_reg) {
        val = REG_FILE[val];
    }
}

void do_STORE(int i, int is_reg_i, int row, int is_reg_row, int col,
    int is_reg_col, int val, int is_reg_val) {
    ensure_val(i, is_reg_i);
    ensure_val(row, is_reg_row);
    ensure_val(col, is_reg_col);
    ensure_val(val, is_reg_val);
    data[i][row][col] = val;
}

void do_MOV(int dst, int src, int is_reg_src) {
    ensure_val(src, is_reg_src);
    REG_FILE[dst] = src;
}

// FROM ASM: b always imm
void do_INC_LESS(int dst, int reg, int b) {
    ++REG_FILE[reg];
    REG_FILE[dst] = (REG_FILE[reg] < b);
}

// FROM ASM: indexes always regs
void do_READ(int dst, int i, int row, int col) {
    REG_FILE[dst] = data[REG_FILE[i]][REG_FILE[row]][REG_FILE[col]];
}

void do_DUMP() {
    std::cout << "DUMP:\n";
    for (int i = 0; i < REG_FILE_SIZE; ++i) {
        std::cout << i << "=\t" << REG_FILE[i] << std::endl;
    }
}

// FROM ASM:
// a - always reg;
// b, iftrue - always imms
void do_SELECTEQ(int dst, int a, int b, int iftrue, int iffalse, int iffalse_reg) {
    ensure_val(iffalse, iffalse_reg);
    REG_FILE[dst] = (REG_FILE[a] == b) ? iftrue : iffalse;
}

// FROM ASM:
// a - always reg
// b - always imm
void do_EQ(int dst, int a, int b) { REG_FILE[dst] = (REG_FILE[a] == b); }

// FROM ASM:
// a - always reg
// b, c - always imms
void do_ADDAND(int dst, int a, int b, int c) {
    REG_FILE[dst] = (REG_FILE[a] + b) & c;
}

// FROM ASM:
// a, b - always regs
void do_ADD(int dst, int a, int b) {
    REG_FILE[dst] = REG_FILE[a] + REG_FILE[b];
}