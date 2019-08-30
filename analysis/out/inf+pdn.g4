inf_string_EOL_tags: ϵ | section_game_CHARS_STRING | gen_1 | '\r' | '\n' | '\"\"' | gen_2 | 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_' | '\"' | '.' | '[' | '%' | '\\' | '/' | '*' | '@' | '&' | '{' | '}' | '<' | '>' | '-' | '=' | ',' | ']' | gen_3;
section_game_CHARS_STRING: result result;
result: ϵ | '1/2-1/2' | '1-0' | '0-1' | '*' | ']' | section_game_CHARS_STRING | gen_0;
gen_1: ~inf_string_EOL_tags;
gen_2: ~'\"';
gen_4: 'x' | '-';
gen_3: gen_4 '0' .. '9';
gen_0: inf_string_EOL_tags inf_string_EOL_tags