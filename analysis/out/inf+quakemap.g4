inf_map: gen_0 | ϵ | gen_7;
section: gen_2 string inf_map gen_1;
string: CHARS | STRING | ϵ;
CHARS: gen_3 string;
STRING: '\"' gen_1 '\"';
EOL: '\r' | '\n' | section;
gen_1: section | ϵ | gen_4 | gen_5 | ']';
gen_3: 'A' .. 'Z' | '0' .. '9' | 'a' .. 'z' | '.' | '%' | '\"' | '\\' | '/' | '*' | '@' | '&' | '_' | '{' | '}' | '<' | '>' | '-';
gen_6: '\"' | '\n';
gen_5: ~gen_6;
gen_8: gen_9 | ϵ | gen_14;
gen_15: ϵ | gen_16 | gen_17 | gen_19;
gen_20: 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_';
gen_17: gen_18 '0' .. '9' gen_15 gen_15 gen_15;
gen_13: ~'\"';
gen_12: '\"\"' | gen_13;
gen_10: gen_11 | ϵ | '{';
gen_0: gen_1 EOL inf_map;
gen_7: '{' gen_8 gen_8 '}' inf_map;
gen_4: gen_1 gen_1;
gen_9: '\"' gen_10 '\"' '\"' gen_10 '\"' gen_8;
gen_14: gen_10 gen_15 gen_20 gen_20 gen_15 gen_15 gen_8 gen_21;
gen_16: '(' gen_15 ')' gen_15;
gen_19: gen_20 gen_15;
gen_11: gen_12 gen_10;
gen_22: '}' gen_8;
gen_21: gen_22 | ϵ;
gen_2: '[' | ϵ | '=' | ',';
gen_18: '.' | ϵ | '+' | '-'