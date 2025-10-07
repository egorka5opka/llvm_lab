#include <stdio.h>

void funcStartLogger(char *funcName) {
  printf("[LOG] Start fun '%s'\n", funcName);
}

void callLogger(char *callerName, char *calleeName, long int valID) {
  printf("[LOG] CALL '%s' -> '%s' {%ld}\n", callerName, calleeName, valID);
}

void resIntLogger(long int res, long int valID) {
  printf("[LOG] Result %ld {%ld}\n", res, valID);
}

void funcEndLogger(char *funcName, long int valID) {
  printf("[LOG] End fun '%s' {%ld}\n", funcName, valID);
}

void binOptLogger(int val, int arg0, int arg1, char *opName, char *funcName,
                  long int valID) {
  printf("[LOG] In fun '%s': %d = %d %s %d {%ld}\n", funcName, val, arg0,
         opName, arg1, valID);
}

void nameLogger(char *opName, char* funcName) {
  printf("[LOG] In fun '%s': %s\n", funcName, opName);
}

void operand0Logger(char* varName, char* opName) {
  printf("%s <- %s\n");
}

void operand1Logger(char* opName, long int o1) {
  printf("%s <- %ld\n", opName, o1);
}

// void operand2Logger(char* opName, long int o1, long int o2) {
//   printf("%s <- %ld, %d\n", opName, o1, o2);
// }

void operand2Logger(char* varName, char* opName, char* o1, char* o2) {
  printf("%s <- %s, %s, %s\n", varName, opName, o1, o2);
}

void operand3Logger(char* opName, long int o1, long int o2, long int o3) {
  printf("%s <- %ld, %ld, %ld\n", opName, o1, o2, o3);
}

void operand4Logger(char* opName, long int o1, long int o2, long int o3, long int o4) {
  printf("%s <- %ld, %ld, %ld, %ld\n", opName, o1, o2, o3, o4);
}

void operand5Logger(char* opName, long int o1, long int o2, long int o3, long int o4, long int o5) {
  printf("%s <- %ld, %ld, %ld, %ld, %ld, \n", opName, o1, o2, o3, o4, o5);
} 

void operand6Logger(char* opName, long int o1, long int o2, long int o3, long int o4, long int o5, long int o6) {
  printf("%s <- %ld, %ld, %ld, %ld, %ld, %ld\n", opName, o1, o2, o3, o4, o5, o6);
}