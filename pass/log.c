#include <stdio.h>

void funcStartLogger(char *funcName) {
  printf("[LOG] Start fun '%s'\n", funcName);
}

void resIntLogger(long int res, long int valID) {
  printf("[LOG] Result %ld {%ld}\n", res, valID);
}

void funcEndLogger(char *funcName, long int valID) {
  printf("[LOG] End fun '%s' {%ld}\n", funcName, valID);
}

void useLogger(char* useName, char* operandName) {
  printf("%s <- %s\n", useName, operandName);
}