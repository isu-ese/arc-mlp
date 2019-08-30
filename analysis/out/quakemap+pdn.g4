map_tags_result: game | ϵ | ')' | '.' | '+' | '-' | '1/2-1/2' | '1-0' | '0-1' | '*' | ']' | gen_2;
game: gen_0 gen_0 map_tags_result;
gen_1: ~'\"';
gen_0: ϵ | game | '{' | '0' .. '9' | '}' | '(' | '[' | '\"' | '\"\"' | gen_1 | 'a' .. 'z' | 'A' .. 'Z' | '_';
gen_3: 'x' | '-';
gen_2: gen_3 '0' .. '9'