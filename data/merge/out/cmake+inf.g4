inf_string_Bracket_arg_nested_EOL: file_compound_argument_section_Identifier_Unquoted_argument_CHARS_Quoted_argument_STRING_Escape_identity_Quoted_cont_Bracket_argument | ϵ | '[' | '\r' | '\n' | gen_0 | 'A' .. 'Z' | 'a' .. 'z' | '_' | '0' .. '9' | ';' | '\\t' | '\\r' | '\\n' | '\\;' | '.' | '%' | '\"' | '\\' | '/' | '*' | '@' | '&' | '{' | '}' | '<' | '>' | '-' | . | '=' | ',' | ']' | EOF | '(' | ')' | ' ' | '\t' | '#';
file_compound_argument_section_Identifier_Unquoted_argument_CHARS_Quoted_argument_STRING_Escape_identity_Quoted_cont_Bracket_argument: inf_string_Bracket_arg_nested_EOL inf_string_Bracket_arg_nested_EOL inf_string_Bracket_arg_nested_EOL;
gen_0: ~inf_string_Bracket_arg_nested_EOL