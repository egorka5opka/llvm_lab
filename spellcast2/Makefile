build: 
	bison -d -o parser.cpp parser.y
	flex -o lexer.cpp lexer.l
	clang++ -std=c++17 `llvm-config --cppflags --ldflags --libs` -iquote /usr/include/SDL2 -lSDL2 ../SDL/sim.c  parser.cpp lexer.cpp -o myparser