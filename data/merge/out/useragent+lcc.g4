gen_0: ϵ | prog | lcc | '.' | ' ';
prog: gen_0 gen_1 gen_0 gen_2;
COMMENT: '(' gen_4 ')';
lcc: gen_0 gen_6 '0' .. '9' gen_0 gen_0 gen_0;
gen_4: COMMENT | ϵ | gen_5 | gen_9;
gen_8: ~')';
gen_9: ' ' '0' .. '9' '0' .. '9' '0' .. '9' '0' .. '9';
gen_5: gen_6 gen_4 gen_0;
gen_3: gen_0 gen_4 gen_10;
gen_7: 'A' .. 'Z' gen_0;
gen_6: gen_7 | ϵ | gen_8;
gen_1: 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | ϵ;
gen_2: gen_3 | '/' | ϵ;
gen_10: ϵ | EOF