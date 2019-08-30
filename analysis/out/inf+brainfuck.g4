inf_file_string: section_CHARS_STRING | ϵ | gen_0 | ']' | '\"' | '[' | '=' | ',' | 'A' .. 'Z' | '0' .. '9' | 'a' .. 'z' | '.' | '%' | '\\' | '/' | '*' | '@' | '&' | '_' | '{' | '}' | '<' | '>' | '-' | '\r' | '\n' | '+';
section_CHARS_STRING: inf_file_string inf_file_string inf_file_string;
gen_0: ~inf_file_string