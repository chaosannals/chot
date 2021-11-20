grammar CHot;

@header { package chot.grammar; }

program: statements;

statements: 
    | statement statements
    ;

statement: expression SEMICOLON
    | KW_BREAK SEMICOLON
    | KW_CONTINUE SEMICOLON
    | CL statements CR
    | KW_IF PL expression PR statement
    | KW_WHILE PL expression PR statement
    | KW_FOR PL expression SEMICOLON expression SEMICOLON expression PR statement
    ;

expression: INTEGER
    | NUMBER
    | PL expression PR
    | expression op=(STAR|SLASH) expression
    | expression op=(PLUS|MINUS) expression
    | IDENTIFIER EQUAL expression
    | IDENTIFIER PL expressions PR
    | IDENTIFIER BL expression BR
    ;

expressions:
    | expression COMMA expression
    ;

DOT: '.';
COMMA: ',';
SEMICOLON: ';';
PLUS: '+';
MINUS: '-';
STAR: '*';
SLASH: '/';
BACKSLASH: '\\';
EQUAL: '=';
PL: '(';
PR: ')';
BL: '[';
BR: ']';
CL: '{';
CR: '}';

KW_IF: 'if';
KW_ELSE: 'else';
KW_WHILE: 'while';
KW_FOR: 'for';
KW_BREAK: 'break';
KW_CONTINUE: 'continue';
KW_CLASS: 'class';

INTEGER: [1-9][0-9]*;
NUMBER: [1-9][0-9]*'.'[0-9]+;
IDENTIFIER: [A-Za-z][0-9A-Za-z]*;

WS: [ \t\r\n]+ -> skip;
