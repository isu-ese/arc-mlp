file: gen_0 | ϵ | sexpr | NUMBER | '0' .. '9';
statement: '>' | '<' | '+' | '-' | '.' | ',' | gen_1 | ϵ;
sexpr: item file gen_2;
item: STRING | SYMBOL | NUMBER | '.' | list | ϵ;
list: '(' file ')';
STRING: '\"' gen_2 '\"';
NUMBER: file item item item;
SYMBOL: SYMBOL_START item;
SYMBOL_START: 'a' .. 'z' | 'A' .. 'Z' | '+' | '-' | '*' | '/' | '.' | '0' .. '9';
gen_1: '[' file ']';
gen_5: '\\' .;
gen_7: '\\' | '\"';
gen_6: ~gen_7;
gen_4: gen_5 | gen_6;
gen_2: gen_3 | ϵ | EOF;
gen_0: statement file;
gen_3: gen_4 gen_2