gen_0: file | game | ϵ;
file: tags EOF;
compound_argument: gen_3 '(' gen_3 ')' tags;
Identifier_Unquoted_argument_Escape_identity_Quoted_cont: gen_2 gen_3;
Quoted_argument: '\"' gen_3 '\"';
Bracket_argument: '[' Bracket_arg_nested ']';
Bracket_arg_nested: gen_5 | Bracket_argument | gen_6 | ϵ;
game: gen_11 '0' .. '9' gen_11 gen_18 '0' .. '9' gen_11 result gen_0 gen_13;
tags: ϵ | gen_1 | compound_argument;
result: '1/2-1/2' | '1-0' | '0-1' | '*' | ϵ;
gen_3: Identifier_Unquoted_argument_Escape_identity_Quoted_cont | ϵ | '\n' | gen_4;
gen_2: 'A' .. 'Z' | 'a' .. 'z' | '_' | '0' .. '9' | ';' | Identifier_Unquoted_argument_Escape_identity_Quoted_cont | Bracket_argument | Quoted_argument | compound_argument | gen_7 | '\\t' | '\\r' | '\\n' | '\\;' | gen_9 | '\r' | '\\';
gen_8: ' ' | '\t' | '\r' | '\n' | '(' | ')' | '#' | '\"' | '\\';
gen_7: ~gen_8;
gen_4: ~gen_2;
gen_10: '\\' | '\"';
gen_9: ~gen_10;
gen_5: '=' Bracket_arg_nested '=';
gen_11: gen_12 | ϵ | gen_15;
gen_17: ~'\"';
gen_16: '\"\"' | gen_17;
gen_1: '[' gen_2 gen_2 gen_3 '\"' gen_11 '\"' ']' tags;
gen_6: . Bracket_arg_nested;
gen_12: tags '0' .. '9' gen_11 gen_13;
gen_15: gen_16 gen_11;
gen_18: 'x' | '-';
gen_14: gen_0 result;
gen_13: gen_14 | ϵ | '.'