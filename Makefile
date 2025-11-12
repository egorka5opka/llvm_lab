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
	
analysepass:
	python3 pass/analyse.py > pass/frequency.log

irgen: 
	clang++ `llvm-config --cppflags --ldflags --libs` IRGen/appgen.cpp SDL/sim.c  -iquote /usr/include/SDL2 -lSDL2 -o IRGen/genbrain.out
	./IRGen/genbrain.out > IRGen/app.ll
	clang `llvm-config --cppflags --ldflags --libs` SDL/start.c IRGen/app.ll SDL/sim.c  -iquote /usr/include/SDL2 -lSDL2 -o IRGen/brain.out

asm_to_ir1:
	clang++ `llvm-config --cppflags --ldflags --libs` AsmToIR/app_asm_IRgen1.cpp AsmToIR/INSTR.cpp SDL/sim.c  -iquote /usr/include/SDL2 -lSDL2 -o AsmToIR/genbrain.out
	./AsmToIR/genbrain.out ./AsmToIR/asm_app.s ./AsmToIR/app1.ll
	
asm_to_ir2:
	clang++ `llvm-config --cppflags --ldflags --libs` AsmToIR/app_asm_IRgen2.cpp AsmToIR/INSTR.cpp SDL/sim.c  -iquote /usr/include/SDL2 -lSDL2 -o AsmToIR/genbrain2.out
	./AsmToIR/genbrain2.out ./AsmToIR/asm_app.s ./AsmToIR/app2.ll