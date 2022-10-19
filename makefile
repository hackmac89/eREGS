# the app target
TARGET=bin/eregs

# Compiler
CC=gcc
# optimization
OPT=-O0
# warnings
WARN=-Wall
# pedantic
PED=-pedantic
# standard
STD=-std=c99

CCFLAGS=$(OPT) $(WARN) $(PED) $(STD)

# linker
LD=gcc

OBJS= y.tab.c lex.yy.c bin/eregs.o 

all: $(OBJS)
	$(LD) -o $(TARGET) bin/eregs.o

bin/eregs.o: y.tab.c lex.yy.c
	$(CC) -c $(CCFLAGS) lex.yy.c -o bin/eregs.o

y.tab.c:	parser.y
	yacc parser.y

lex.yy.c:	main.l 
	flex main.l

clean:
	rm -f bin/*.o $(TARGET) y.tab.c lex.yy.c
	