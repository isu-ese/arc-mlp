map: gen_0 | ϵ | sexpr;
NUMBER: gen_13 '0' .. '9' gen_14 gen_14 gen_12;
sexpr: gen_23 EOF;
item: STRING | SYMBOL | NUMBER | '.' | list | gen_32;
list: '(' gen_23 ')';
STRING: '\"' gen_25 '\"';
SYMBOL: SYMBOL_START gen_31;
SYMBOL_START: 'a' .. 'z' | 'A' .. 'Z' | '+' | '-' | '*' | '/' | '.' | '0' .. '9';
gen_1: gen_2 | ϵ;
gen_7: gen_8 | ϵ;
gen_10: gen_11 | ϵ;
gen_12: ϵ | NUMBER;
gen_17: 'a' .. 'z' | 'A' .. 'Z';
gen_18: 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_';
gen_19: gen_20 | ϵ;
gen_13: '+' | '-' | ϵ;
gen_14: gen_15 | ϵ;
gen_15: gen_16 '0' .. '9' gen_14;
gen_6: ~'\"';
gen_5: '\"\"' | gen_6;
gen_3: gen_4 | ϵ;
gen_23: gen_24 | ϵ;
gen_32: '(' item '.' item ')';
gen_28: '\\' .;
gen_30: '\\' | '\"';
gen_29: ~gen_30;
gen_27: gen_28 | gen_29;
gen_25: gen_26 | ϵ;
gen_31: SYMBOL | ϵ;
gen_0: '{' gen_1 gen_7 '}' map;
gen_2: '\"' gen_3 '\"' '\"' gen_3 '\"' gen_1;
gen_8: gen_9 gen_10 gen_17 gen_18 gen_19 gen_12 gen_7 gen_21;
gen_11: '(' gen_12 ')' gen_10;
gen_20: gen_18 gen_19;
gen_4: gen_5 gen_3;
gen_24: item gen_23;
gen_26: gen_27 gen_25;
gen_16: '.' | ϵ;
gen_9: '{' | ϵ;
gen_22: '}' gen_7;
gen_21: gen_22 | ϵ