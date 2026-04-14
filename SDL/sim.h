#define SIM_X_SIZE 512
#define SIM_Y_SIZE 512

#ifndef __sim__
void simInit();
void app();
void simExit();
void simFlush();
void draw_cell(int row, int col, int color);
#endif