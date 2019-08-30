map_row: ϵ | propertiesFile_decl_TEXT_STRING_COMMENT | '0' .. '9' | '\"\"' | gen_1 | '\"' | '=' | ')' | '+' | '-' | '.' | '{' | 'a' .. 'z' | 'A' .. 'Z' | ' ' | '@' | ':' | '_' | '/' | ',' | '%' | '}' | '#' | gen_2 | '(';
propertiesFile_decl_TEXT_STRING_COMMENT: map_row map_row gen_0;
gen_1: ~'\"';
gen_3: '\r' | '\n';
gen_2: ~gen_3;
gen_0: propertiesFile_decl_TEXT_STRING_COMMENT | '0' .. '9' | ϵ