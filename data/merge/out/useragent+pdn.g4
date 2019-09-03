tags: ϵ | prog_COMMENT_game | '.' | gen_2 | '0' .. '9' | '(' | 'a' .. 'z' | 'A' .. 'Z' | '_' | '\"\"' | gen_3 | '[';
prog_COMMENT_game: gen_0 tags tags;
gen_2: ~')';
gen_3: ~'\"';
gen_1: '\"' ']';
gen_0: ϵ | '1/2-1/2' | '1-0' | '0-1' | '*' | prog_COMMENT_game | '/' | ')' | '\"' | gen_1 | 'x' | '-'