item_SYMBOL_START: ϵ | prog_NUMBER_SYMBOL_sexpr_COMMENT_list_STRING | '.' | '+' | '-' | 'a' .. 'z' | 'A' .. 'Z' | '*' | '/' | '0' .. '9' | gen_0 | EOF | gen_1 | gen_2 | '\\' | '\"' | '(' | ')';
prog_NUMBER_SYMBOL_sexpr_COMMENT_list_STRING: item_SYMBOL_START item_SYMBOL_START item_SYMBOL_START;
gen_0: ~')';
gen_1: '\\' .;
gen_2: ~item_SYMBOL_START