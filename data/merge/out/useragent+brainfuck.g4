file: prog | gen_9 | ϵ;
prog: gen_0 gen_1 '/' gen_0 gen_1 gen_3 gen_5 file;
COMMENT: '(' gen_6 ')';
statement: '>' | '<' | '+' | '-' | '.' | ',' | gen_10;
gen_5: COMMENT | ϵ;
gen_3: gen_4 | ϵ;
gen_8: ~')';
gen_6: gen_7 | ϵ;
gen_0: 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9';
gen_1: gen_2 | ϵ;
gen_10: '[' file ']';
gen_9: statement file;
gen_4: '.' gen_0 gen_1 gen_3;
gen_7: gen_8 gen_6;
gen_2: gen_0 gen_1