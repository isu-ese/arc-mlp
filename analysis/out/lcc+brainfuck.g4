gen_0: lcc | gen_13 | ϵ;
lcc: 'A' .. 'Z' gen_1 gen_2 gen_1 '0' .. '9' gen_3 gen_5 gen_1 gen_7 gen_11 EOF;
file: gen_13 | ϵ;
statement: '>' | '<' | '+' | '-' | '.' | ',' | gen_14;
gen_1: ' ' | ϵ;
gen_2: 'A' .. 'Z' | ϵ;
gen_8: '.' 'A' .. 'Z' '0' .. '9' gen_3 gen_9;
gen_7: gen_8 | ϵ;
gen_12: ' ' '0' .. '9' '0' .. '9' '0' .. '9' '0' .. '9';
gen_11: gen_12 | ϵ;
gen_5: gen_6 | ϵ;
gen_3: gen_4 | ϵ;
gen_9: gen_10 | ϵ;
gen_14: '[' file ']';
gen_13: statement file;
gen_6: '.' '0' .. '9' gen_3 gen_5;
gen_4: '0' .. '9' gen_3;
gen_10: ' ' 'A' .. 'Z' '0' .. '9' gen_3 gen_9