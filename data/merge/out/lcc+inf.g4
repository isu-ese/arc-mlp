inf_string: ϵ | lcc_section_CHARS_STRING | '\r' | '\n' | '0' .. '9' | gen_0 | ']' | '\"' | 'A' .. 'Z' | gen_1 | ' ' | '.' | '[' | '=' | ',' | 'a' .. 'z' | '%' | '\\' | '/' | '*' | '@' | '&' | '_' | '{' | '}' | '<' | '>' | '-' | EOF;
lcc_section_CHARS_STRING: inf_string inf_string inf_string;
gen_1: ' ' '0' .. '9' '0' .. '9' '0' .. '9' '0' .. '9';
gen_0: ~inf_string