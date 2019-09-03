field_tags_result: csvFile_STRING_TEXT_game | ϵ | ',' | '\r' | '\n' | '\"' | '\"\"' | gen_0 | gen_1 | '1/2-1/2' | '1-0' | '0-1' | '*' | '.' | '[' | gen_3 | ']' | '0' .. '9' | 'a' .. 'z' | 'A' .. 'Z' | '_';
csvFile_STRING_TEXT_game: field_tags_result field_tags_result;
gen_3: ~field_tags_result;
gen_0: ~'\"';
gen_2: 'x' | '-';
gen_1: gen_2 '0' .. '9'