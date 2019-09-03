map: file_compound_argument_Quoted_argument_Identifier_Unquoted_argument_Bracket_argument_Escape_identity_Quoted_cont | '\\' | ϵ | '\n' | '{' | ' ' | '\t' | '\r' | '(' | ')' | '#' | '\"' | '}' | EOF | ']' | '=' | '0' .. '9' | '[' | . | '.' | '+' | '-' | 'A' .. 'Z' | 'a' .. 'z' | '_' | ';' | gen_0 | '\\t' | '\\r' | '\\n' | '\\;' | '\"\"' | gen_1;
file_compound_argument_Quoted_argument_Identifier_Unquoted_argument_Bracket_argument_Escape_identity_Quoted_cont: map map;
gen_0: ~map;
gen_1: ~'\"'