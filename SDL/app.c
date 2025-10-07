#include "sim.h"

#define CELL_SIZE 8
#define ROWS (SIM_X_SIZE / CELL_SIZE)
#define COLS (SIM_Y_SIZE / CELL_SIZE)
#define COLOR_DEAD 0xff000000
#define COLOR_DYING 0xff38ffeb 
#define COLOR_ALIVE 0xffffff
#define DEAD 0
#define DYING 1
#define ALIVE 2


void draw_cell(int row, int col, int color) {
  for (int i = 0; i < CELL_SIZE; ++i) {
    for (int j = 0; j < CELL_SIZE; ++j) {
      simPutPixel(row * CELL_SIZE + i, col * CELL_SIZE + j, color);
    }
  }
}


void app() {
  
  int data[2][ROWS][COLS];
  for (int i = 0; i < ROWS; ++i) {
    for (int j = 0; j < COLS; ++j) {
      data[0][i][j] = data[1][i][j] = DEAD;
    }
  }

  for (int i = ROWS / 2 - 4; i < ROWS / 2 + 4; ++i) {
    for (int j = COLS / 2 - 4; j < COLS / 2 + 4; ++j) {
        if (((i * j) >> 3) & 1) {
          data[0][i][j] = ALIVE;
        }
    }
  }

  int step = 0;
  int t = 0;
  while (1) {
    if (t == 2) {
      break;
    }
    ++t;

    for (int r = 0; r < ROWS; ++r) {
      for (int c = 0;c < COLS; ++c) {
        int cur = data[step][r][c];
        if (cur == data[1 - step][r][c]) {
          continue;
        }
        int color = DEAD;
        if (cur == ALIVE) {
          color = COLOR_ALIVE;
        } else if (cur == DYING) {
          color = COLOR_DYING;
        }
        draw_cell(r, c, color);
      }
    }
    simFlush();

    int next_step = 1 - step;
    for (int r = 0; r < ROWS; ++r) {
      for (int c = 0;c < COLS; ++c) {
        int cur = data[step][r][c];
        int nxt = DEAD;
        if (cur == ALIVE) {
          nxt = DYING;
        } else if (cur == DYING) {
          nxt = DEAD;
        } else {
          int cnt = 0;
          for (int dx = -1; dx <= 1; ++dx) {
            for (int dy = -1; dy <= 1; ++dy) {
              if (data[step][(r + dx + ROWS) % ROWS][(c + dy + COLS) % COLS] == ALIVE) {
                ++cnt;
              }
            }
          }
          if (cnt == 2) {
            nxt = ALIVE;
          }
        }
        data[next_step][r][c] = nxt;
      }
    }
    step = next_step;
  }
}