inf_EOL_string: ϵ | prog_COMMENT_CHARS_section_STRING | '.' | '/' | '\r' | '\n' | gen_0 | '(' | ']' | ')' | gen_1 | '\"' | '[' | '=' | ',' | 'A' .. 'Z' | '0' .. '9' | 'a' .. 'z' | '%' | '\\' | '*' | '@' | '&' | '_' | '{' | '}' | '<' | '>' | '-';
prog_COMMENT_CHARS_section_STRING: inf_EOL_string inf_EOL_string inf_EOL_string;
gen_0: ~')';
gen_1: ~inf_EOL_string