gen_0: gen_1 | ϵ | tsvFile;
inf: gen_1 | ϵ;
section: '[' string ']' EOL gen_9;
string: CHARS | STRING_0;
CHARS: gen_3 gen_4;
STRING_0: '\"' gen_5 '\"';
EOL: '\n' | '\r';
tsvFile: field gen_23 EOL gen_25 gen_27;
field: TEXT | STRING_1;
TEXT: gen_16 gen_18;
STRING_1: '\"' gen_19 '\"';
gen_2: section | '\n' | '\r';
gen_9: gen_10 | ϵ;
gen_15: '=' string gen_11;
gen_14: gen_15 | ϵ;
gen_13: CHARS | STRING_0 | ϵ;
gen_11: gen_12 | ϵ;
gen_3: 'A' .. 'Z' | '0' .. '9' | 'a' .. 'z' | '.' | '%' | '\"' | '\\' | '/' | '*' | '@' | '&' | '_' | '{' | '}' | '<' | '>' | '-';
gen_4: CHARS | ϵ;
gen_8: '\"' | '\n';
gen_7: ~gen_8;
gen_5: gen_6 | ϵ;
gen_27: tsvFile | ϵ;
gen_23: gen_24 | ϵ;
gen_25: gen_26 | ϵ;
gen_17: ',' | '\n' | '\r' | '\"';
gen_16: ~gen_17;
gen_18: TEXT | ϵ;
gen_22: ~'\"';
gen_21: '\"\"' | gen_22;
gen_19: gen_20 | ϵ;
gen_1: gen_2 inf;
gen_10: string gen_11 gen_14 EOL gen_9;
gen_12: ',' gen_13 gen_11;
gen_6: gen_7 gen_5;
gen_24: '\t' field gen_23;
gen_26: EOL gen_25;
gen_20: gen_21 gen_19