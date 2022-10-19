%{
    int stack[1000];
    int stackpointer = -1;
    int regs[32];
    struct {
        int opcode;
        int regNr;
        int konstante;
        int label;
    } code[1000];
    int ip = 0;
    int anzInstructions = 0;
    struct {
        int instructionNr;
    } labels[1000];
    
    // Funktionsprototypen
    void initLabels(void);
    void insertInstruction(int, int, int, int);
    void interpreter(void); 
    void push(int);
    int pop(void); 
    void regTest(int); 
    void labTest(int);

    // Um den MacOS Linker zufrieden zu stellen
    void yyerror(const char*);
    int yylex(void);
%}
%union {
    int i;
};
/* OPERATOR-REIHENFOLGE ??? */
%token PUSH POP ADD SUB MUL SHL DIV SHR ROL ROR NOT AND XOR MOD CMPL CMPG CMPLE CMPGE
%token CMPEQ CMPNE PRINT JMP JFALSE L R 
%token <i> NUMBER

%%
prog:
    { initLabels(); yylineno = 1; } stmtlist { interpreter(); }
    ;
stmtlist:
    stmtlist stmt
    |
    ;
stmt:
    label
    | instruction { anzInstructions++; }
    ;
label:
    L NUMBER ':' { labTest($2); labels[$2].instructionNr = anzInstructions; }
    ;
instruction:
    PUSH R NUMBER       { insertInstruction(0, $3, 0, 0);
                            regTest($3); }
    | PUSH '$' NUMBER   { insertInstruction(1, 0, $3, 0); }
    | POP R NUMBER      { insertInstruction(2, $3, 0, 0);
                            regTest($3); }
    | ADD               { insertInstruction(3, 0, 0, 0); }
    | SUB               { insertInstruction(4, 0, 0, 0); }
    | MUL               { insertInstruction(5, 0, 0, 0); }
    | DIV               { insertInstruction(6, 0, 0, 0); }
    | CMPL              { insertInstruction(7, 0, 0, 0); }
    | CMPG              { insertInstruction(8, 0, 0, 0); }
    | CMPLE             { insertInstruction(9, 0, 0, 0); }
    | CMPGE             { insertInstruction(10, 0, 0, 0); }
    | CMPEQ             { insertInstruction(11, 0, 0, 0); }
    | CMPNE             { insertInstruction(12, 0, 0, 0); }
    | PRINT             { insertInstruction(13, 0, 0, 0); }
    | JMP L NUMBER      { labTest($3); 
                            insertInstruction(14, 0, 0, $3); }
    | JMP R NUMBER      { insertInstruction(15, $3, 0, 0);
                            regTest($3); }
    | JFALSE L NUMBER   { labTest($3); 
                            insertInstruction(16, 0, 0, $3); }
    | JFALSE R NUMBER   { insertInstruction(17, $3, 0, 0);
                            regTest($3); }
    | SHL           { insertInstruction(18, 0, 0, 0); }
    | SHR           { insertInstruction(19, 0, 0, 0); }
    | NOT           { insertInstruction(20, 0, 0, 0); }
    | ROL           { insertInstruction(21, 0, 0, 0); }
    | ROR           { insertInstruction(22, 0, 0, 0); }
    | AND           { insertInstruction(23, 0, 0, 0); }
    | XOR	    { insertInstruction(24, 0, 0, 0); }
    | MOD	    { insertInstruction(25, 0, 0, 0); }
    ;
%%
void yyerror(const char* msg) {
    fprintf(stderr, "%s\n", msg);
}

void initLabels(void) {
    for(int i = 0; i < 100; i++)
        labels[i].instructionNr = -1;
}

void insertInstruction(int opcode, int regNr, int konstante, int label) {
    code[anzInstructions].opcode = opcode;
    code[anzInstructions].regNr = regNr;
    code[anzInstructions].konstante = konstante;
    code[anzInstructions].label = label;
}

// TODO: UNTERSCHEIDUNG ZWISCHEN KONSTANTE UND FKONSTANTE ? ODER IMMER ALS FKONSTANTE RECHNEN ?
void interpreter(void) {
    // Deklarationen
    int op1, op2;

    while( ip < anzInstructions ) {
        switch(code[ip].opcode) {
            case 0: { push(regs[code[ip].regNr]); ip++; break; }
            case 1: { push(code[ip].konstante); ip++; break; }
            case 2: { regs[code[ip].regNr] = pop(); ip++; break; }
            case 3: { push(pop() + pop()); ip++; break; }
            case 4: { push(pop() - pop()); ip++; break; }
            case 5: { push(pop() * pop()); ip++; break; }
            case 6: { op1 = pop(); op2 = pop();
                        if( op1 == 0 ) {
                            printf("[!] Runtime-Fehler (Nahe Zeile %d): Division durch \"0\"\n", yylineno);
                            exit(4);
                        }
                        push((int) (op2 / op1)); ip++; break;
            }
            case 7: { op1 = pop(); op2 = pop();
                        if( op2 < op1 ) push(1); else push(0);
                        ip++; break;
            }
            case 8: { op1 = pop(); op2 = pop();
                        if( op2 > op1 ) push(1); else push(0);
                        ip++; break;
            }
            case 9: { op1 = pop(); op2 = pop();
                        if( op2 <= op1 ) push(1); else push(0);
                        ip++; break;
            }
            case 10: { op1 = pop(); op2 = pop();
                        if( op2 >= op1 ) push(1); else push(0);
                        ip++; break;
            }
            case 11: { op1 = pop(); op2 = pop();
                        if( op1 == op2 ) push(1); else push(0);
                        ip++; break;
            }
            case 12: { op1 = pop(); op2 = pop();
                        if( op1 != op2 ) push(1); else push(0);
                        ip++; break;
            }
            case 13: { printf("%d\n", pop()); ip++; break; }
            case 14: { labTest(labels[code[ip].label].instructionNr);
                        ip = labels[code[ip].label].instructionNr;
                        break;
            }
            case 15: { labTest(labels[regs[code[ip].regNr]].instructionNr);
                        ip = labels[regs[code[ip].regNr]].instructionNr;
                        break;
            }
            case 16: { op1 = pop();
                        labTest(labels[code[ip].label].instructionNr);
                        if( op1 == 0 )
                            ip = labels[code[ip].label].instructionNr;
                        else
                            ip++;
                        break;
            }
            case 17: { op1 = pop();
                        labTest(labels[regs[code[ip].regNr]].instructionNr);
                        if( op1 == 0 )
                            ip = labels[regs[code[ip].regNr]].instructionNr;
                        else    
                            ip++;
                        break;
            }
            case 18: { push(pop() << pop()); ip++; break; }
            case 19: { push(pop() >> pop()); ip++; break; }
            case 20: { (pop() == 0) ? push(1) : push(0); ip++; break; }
            case 21: { break; }
            case 22: { break; }
            case 23: { push(pop() & pop()); ip++; break; }
	    case 24: { push(pop() ^ pop()); ip++; break; }
            // NAND, OR ... EBENFALLS NOCH MITMACHEN
	    case 25: { push(pop() % pop()); ip++; break; }
            default: { printf("[!] Fehler im Interpreter (Nahe Zeile %d)\n", yylineno); exit(2); }
        }
    }
}

void push(int w)
{
    stackpointer++;
    if( stackpointer > 999 ) {
        printf("[!] Stack-Overfl0w\n");
        exit(1);
    }
    stack[stackpointer] = w;
}

int pop(void) 
{
    stackpointer--;
    if( stackpointer < -1 ) {
        printf("[!] Stack-Underfl0w\n");
        exit(1);
    }
    return(stack[stackpointer +1]);
}

void regTest(int r) 
{
    if( (r < 0) || (r > 31) ) {
        printf("[!] Register \"%d\" nicht verfügbar\n", r);
        exit(2);
    }
}

void labTest(int l)
{
    if( (l < 0) || (l > 999) ) {
        printf("[!] Label \"%d\" ist außerhalb des gültigen Bereichs\n", l);
        exit(3);
    }
}
