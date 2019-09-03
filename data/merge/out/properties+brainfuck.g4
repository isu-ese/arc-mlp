file: propertiesFile_COMMENT_decl_TEXT_STRING | ϵ | '=' | '\"' | ']';
propertiesFile_COMMENT_decl_TEXT_STRING: gen_0 file file;
gen_1: ~'\"';
gen_3: '\r' | '\n';
gen_2: ~gen_3;
gen_0: propertiesFile_COMMENT_decl_TEXT_STRING | '>' | '<' | '+' | '-' | '.' | ',' | '\"\"' | gen_1 | '#' | gen_2 | 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | ' ' | '@' | ':' | '_' | '/' | '%' | '{' | '}' | ϵ | '\"' | '['