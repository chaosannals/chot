grammar CHot;

@header { package chot.grammar; }

program: statements;

statements: | statement statements;

statement:
	expression SEMICOLON															# asExpressionStatement
	| KW_BREAK SEMICOLON															# asBreak
	| KW_CONTINUE SEMICOLON															# asContinue
	| CL statements CR																# asBlock
	| KW_IF PL expression PR statement												# asIf
	| KW_IF PL expression PR statement KW_ELSE statement							# asIfElse
	| KW_WHILE PL expression PR statement											# asWhile
	| KW_FOR PL expression SEMICOLON expression SEMICOLON expression PR statement	# asFor;

expression:
	INTEGER
	| NUMBER
	| PL expression PR
	| PL expression PR AR CL statements CR
	| expression op = (STAR | SLASH) expression
	| expression op = (PLUS | MINUS) expression
	| IDENTIFIER PL expressions PR
	| IDENTIFIER BL expression BR
	| IDENTIFIER EQUAL expression
	| KW_CLASS CL statements CR;

expressions: | expression COMMA expression;

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
AL: '<-';
AR: '->';

KW_IF: 'if';
KW_ELSE: 'else';
KW_WHILE: 'while';
KW_FOR: 'for';
KW_BREAK: 'break';
KW_CONTINUE: 'continue';
KW_CLASS: 'class';
KW_LET: 'let';

INTEGER: [1-9][0-9]*;
NUMBER: [1-9][0-9]* '.' [0-9]+;
IDENTIFIER: [A-Za-z][0-9A-Za-z]*;

WS: [ \t\r\n]+ -> skip;
