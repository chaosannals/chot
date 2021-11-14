grammar CHot;

@header { package chot.grammar; }

program: statements;

statements: statement statements;

statement: expression ';';

expression: INT;

INT: [1-9][0-9]*;

WS: [ \t\r\n]+ -> skip;
