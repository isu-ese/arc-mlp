inf: gen_0 | ϵ | propertiesFile;
section: '[' string ']' EOL gen_6;
string: CHARS | STRING_0 | ϵ;
CHARS: gen_1 string;
STRING_0: '\"' gen_2 '\"';
EOL: '\r' | '\n' | section;
propertiesFile: row inf;
row: COMMENT | decl;
decl: gen_15 gen_16 '=' gen_16;
TEXT: gen_15 gen_16;
STRING_1: '\"' gen_17 '\"';
COMMENT: '#' gen_12;
gen_6: gen_7 | ϵ;
gen_11: '=' string gen_8;
gen_10: gen_11 | ϵ;
gen_8: gen_9 | ϵ;
gen_1: 'A' .. 'Z' | '0' .. '9' | 'a' .. 'z' | '.' | '%' | '\"' | '\\' | '/' | '*' | '@' | '&' | '_' | '{' | '}' | '<' | '>' | '-';
gen_5: '\"' | '\n';
gen_4: ~gen_5;
gen_2: gen_3 | ϵ;
gen_16: TEXT | STRING_1 | ϵ;
gen_15: 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | ' ' | '@' | ':' | '.' | '_' | '/' | ',' | '%' | '{' | '}' | '-';
gen_20: ~'\"';
gen_19: '\"\"' | gen_20;
gen_17: gen_18 | ϵ;
gen_14: ~EOL;
gen_12: gen_13 | ϵ;
gen_0: EOL inf;
gen_7: string gen_8 gen_10 EOL gen_6;
gen_9: ',' string gen_8;
gen_3: gen_4 gen_2;
gen_18: gen_19 gen_17;
gen_13: gen_14 gen_12