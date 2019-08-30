item_SYMBOL_START: ϵ | uri_hostname_frag_STRING_login_query_sexpr_WS_STRING_list_hostnumber_DIGITS_NUMBER_SYMBOL_HEX | '.' | '/' | 'a' .. 'z' | 'A' .. 'Z' | '+' | '-' | '*' | '0' .. '9' | '~' | ':' | '#' | '?' | '&' | EOF | '@' | '\r' | '\n' | '=' | '\\' | '\"' | '(' | gen_0 | gen_1 | 'a' .. 'f' | 'A' .. 'F' | '://' | ')' | '%';
uri_hostname_frag_STRING_login_query_sexpr_WS_STRING_list_hostnumber_DIGITS_NUMBER_SYMBOL_HEX: item_SYMBOL_START item_SYMBOL_START item_SYMBOL_START;
gen_0: '\\' .;
gen_1: ~item_SYMBOL_START