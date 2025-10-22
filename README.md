# HW 1 - SDL
Симуляция клеточного автомата https://en.wikipedia.org/wiki/Brian%27s_Brain

Сборка и запуск
```
make build
make run
```

Сборка llvm IR со `-O1/2/3`
```
make emitllvm
```

# HW 2 - pass

Пришлось уменьшить поле автомата и ограничить количество отрисовываемых кадров тремя, т.к. иначе файл с логами раздувался до абсурдных размеров

Собрана трасса с оптимизацией -O2, [код](pass/insert_log_pass.cpp), [логи](pass/IRtrace.log)
Анализ часто встречающихся паттернов [код](pass/analyse.py), [результат](pass/frequency.log)

```
make passcmake
make irtrace
make analysepass
```

# HW 3 - IRGen 

[Генератор](IRGen/appgen.cpp) генерирует app.ll аналогичный полученному при компиляции с `-O2`

```
make IRGen
```