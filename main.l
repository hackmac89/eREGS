%option noyywrap yylineno
%{
    #include "y.tab.c"
    //void parseComment(void);
%}
del         [ \t\n]+
number      [+-]?[0-9]+
lineComment "//".* 
COMMENT		"/*"([^*]|\*+[^*/])*\*+"/"
%%
{del}           { }
"push"          { return(PUSH); }
"pop"           { return(POP); }
"add"           { return(ADD); }
"sub"           { return(SUB); }
"mul"           { return(MUL); }
"div"           { return(DIV); }
"cmpl"          { return(CMPL); }
"cmpg"          { return(CMPG); }
"cmple"         { return(CMPLE); }
"cmpge"         { return(CMPGE); }
"cmpeq"         { return(CMPEQ); }
"cmpne"         { return(CMPNE); }
"print"         { return(PRINT); }
"jmp"           { return(JMP); }
"jfalse"        { return(JFALSE); }
{number}        { yylval.i = atoi(yytext); return(NUMBER); }
"L"             { return(L); }
"r"             { return(R); }
":"             { return(':'); }
{lineComment}   { }
"/*"            { /*parseComment();*/ }
{COMMENT}+      { }
"shl"           { return(SHL); }
"shr"           { return(SHR); }
"rol"           { return(ROL); }
"ror"           { return(ROR); }
"not"           { return(NOT); }
"and"           { return(AND); }
"xor"		{ return(XOR); }
"mod"		{ return(MOD); }
.               { return(yytext[0]); }
%% 

// Why did i leave this here again !?
void parseComment(void) {
    char c = input();
    while(1){
        if( c == '*' )
            if( (c = input()) == '/' )
                return;
        c = input();   
    };
}

int main(int argc, char **argv)
{
    if( argc != 2 ){
        printf("[!] Not enough parameters\n");
        printf("USAGE: ./regs <eREGS CODE INPUT FILE>\n");
        exit(1);
    }
    if( (yyin = fopen(argv[1], "r")) != NULL ) {
        yyparse();
    } else {
        printf("[!] ERROR: Couldn't read file...\n");
        exit(1);
    }
    return 0;
}
