inf: section_sexpr | ϵ | NUMBER | EOF | ']';
section_sexpr: string_item inf gen_9 inf;
string_item: CHARS_SYMBOL | STRING | ϵ | NUMBER | '.' | list;
CHARS_SYMBOL: gen_0 string_item;
STRING: '\"' gen_1 '\"';
list: '(' inf ')';
NUMBER: gen_1 string_item gen_8 string_item;
gen_5: '\"' | '\n' | '\\';
gen_4: ~gen_5;
gen_1: gen_2 | ϵ | gen_7;
gen_6: '\\' .;
gen_2: gen_3 gen_1;
gen_8: '+' | '-' | ϵ | '.';
gen_7: gen_8 '0' .. '9';
gen_0: 'a' .. 'z' | 'A' .. 'Z' | '+' | '-' | '*' | '/' | '.' | '0' .. '9' | '%' | '\"' | '\\' | '@' | '&' | '_' | '{' | '}' | '<' | '>' | '[' | ϵ | '=' | ',';
gen_9: ϵ | '\r' | '\n' | section_sexpr;
gen_3: gen_4 | gen_6