Instruction set

Количество регистров: 16

- EXIT - exit
- DRAWC *r* *c* *color* - нарисовать клетку 
- ALLOC - выделить массив 2 x 64 x 64
    везде в последующих инструкция *arr* относится к этому выделенному массиву
- STORE *i* *row* *col* *val* - store значния *val* в *arr* по соотвуствующим индексам
- BR_COND *cond* *dest_true* *dest_false*
- MOV *dst* *val*
- INC_LESS *dst* *reg* *b* - инкремент *reg* и проверка на меньше, очевидно используется для циклоа
- FLUSH - simFlush
- READ *dst* *i* *row* *col* читаем из *arr* в *dst*
- SELECTEQ *dst* *a* *b* *iftrue* *iffalse* записать если a == b
- GOTO *dst*
- EQ *dst* *a* *b*
- ADDAND *dst* *a* *b* *c*  (dst = (a + b) & c)
- ADD *dst* *a* *b*