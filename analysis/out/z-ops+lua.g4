categoryTemplate_template_infixName_operatorAddSub_HexDigit_paragraph_exp_field_NESTED_STR_varOrExp: ϵ | specification_HEX_UtfEscape_formals_prefixTemplate_postfixTemplate_infixTemplate_nofixTemplate_optArgName_argName_optListName_listName_chunk_functiondef_retstat_label_NAME_prefixexp_functioncall_INT_HexExponentPart_ExponentPart_explist_fieldlist_var_tableconstructor_NORMALSTRING_CHARSTRING_LONGSTRING_HexEscape | '...' | '0' .. '9' | '.' | 'a' .. 'z' | 'A' .. 'Z' | '_' | 'function' | gen_0 | NAME | '+' | '-' | 'a' .. 'f' | 'A' .. 'F' | TEXT | PARENTS | END | 'p' | 'P' | '\r' | gen_1 | '}' | EOF_0 | 'end' | '(' | 'in' | 'nil' | 'false' | 'true' | gen_2 | EOF_1 | gen_3 | 'return' | 'do' | '{' | '\"' | '\n' | '\'' | '=' | '0' .. '2' | COMMA | gen_4 | '[' | 'if' | 'elseif' | RELATION | FUNCTION | GENERIC | ']' | 'then' | ARGUMENT | LEFT_PARENTHESIS | RIGHT_PARENTHESIS | LIST | 'else' | 'repeat' | 'not' | '#' | '~' | 'while' | 'until' | ZED | AX | SCH | ';' | 'break' | ')' | . | ',' | 'local' | '::' | 'goto' | ':' | 'for' | 'e' | 'E' | '^' | '*' | '/' | '%' | '//' | '..' | '<' | '>' | '<=' | '>=' | '~=' | '==' | 'and' | 'or' | '&' | '|' | '<<' | '>>' | '\\' | 'a' | 'b' | 'f' | 'n' | 'r' | 't' | 'v' | 'z' | 'u{' | 'x' | 'X' | '0';
specification_HEX_UtfEscape_formals_prefixTemplate_postfixTemplate_infixTemplate_nofixTemplate_optArgName_argName_optListName_listName_chunk_functiondef_retstat_label_NAME_prefixexp_functioncall_INT_HexExponentPart_ExponentPart_explist_fieldlist_var_tableconstructor_NORMALSTRING_CHARSTRING_LONGSTRING_HexEscape: categoryTemplate_template_infixName_operatorAddSub_HexDigit_paragraph_exp_field_NESTED_STR_varOrExp categoryTemplate_template_infixName_operatorAddSub_HexDigit_paragraph_exp_field_NESTED_STR_varOrExp;
assoc: LEFTASSOC | RIGHTASSOC;
gen_0: POWERSET ARGUMENT;
gen_2: ',' '...';
gen_1: ~categoryTemplate_template_infixName_operatorAddSub_HexDigit_paragraph_exp_field_NESTED_STR_varOrExp;
gen_3: NUMERAL assoc;
gen_4: ZED SECTION