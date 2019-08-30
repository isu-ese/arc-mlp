field_row: csvFile_propertiesFile_TEXT_COMMENT_decl_TEXT_STRING | ϵ | ',' | gen_0 | '#' | 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | ' ' | '@' | ':' | '.' | '_' | '/' | '%' | '{' | '}' | '-' | '\"' | '\"\"' | gen_1 | '\r' | '\n' | '=';
csvFile_propertiesFile_TEXT_COMMENT_decl_TEXT_STRING: field_row field_row field_row field_row;
gen_0: ~field_row;
gen_1: ~'\"'