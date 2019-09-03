file_tags: ϵ | game | '.' | '>' | '<' | '+' | '-' | ',' | gen_0 | '[' | ']' | gen_2;
game: file_tags file_tags;
gen_5: ~'\"';
gen_1: 'x' | '-';
gen_0: gen_1 '0' .. '9';
gen_3: game | ϵ | '1/2-1/2' | '1-0' | '0-1' | '*';
gen_4: ϵ | 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' | '\"\"' | gen_5 | '\"';
gen_2: gen_3 gen_3 gen_4