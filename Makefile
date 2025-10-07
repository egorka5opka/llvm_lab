build:
	clang -O2 SDL/start.c SDL/sim.c SDL/app.c -lSDL2 -iquote /usr/include/SDL2 -o out/brain.out

emitllvm:
	clang -O1 SDL/app.c -lSDL2 -iquote /usr/include/SDL2 -emit-llvm -S -o SDL/llvmIR/O1/app.ll
	clang -O2 SDL/app.c -lSDL2 -iquote /usr/include/SDL2 -emit-llvm -S -o SDL/llvmIR/O2/app.ll
	clang -O3 SDL/app.c -lSDL2 -iquote /usr/include/SDL2 -emit-llvm -S -o SDL/llvmIR/O3/app.ll

run:
	./out/brain.out

passcmake:
	cmake -S pass -B pass/build

irtrace:
	make -C pass/build
	clang -O2 -fpass-plugin=./pass/build/libMyPass.so pass/log.c SDL/sim.c SDL/app.c SDL/start.c -lSDL2 -iquote /usr/include/SDL2 -o out/traced_brain
	./out/traced_brain > pass/IRtrace.log