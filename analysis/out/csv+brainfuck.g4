file_field: csvFile_STRING_TEXT | ϵ | ',' | '\r' | '\n' | '\"' | '>' | '<' | '+' | '-' | '.' | '\"\"' | gen_0 | ']' | gen_1 | '[';
csvFile_STRING_TEXT: file_field file_field file_field;
gen_1: ~file_field;
gen_0: ~'\"'