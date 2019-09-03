gen_0: ϵ | uri_hostname_frag_STRING_login_query_DIGITS_number_variable_WS_hostnumber_HEX | equation | '@' | 'S' | '0' | '/' | '\r' | '\n' | '://' | 'A' | 'E' | '%';
uri_hostname_frag_STRING_login_query_DIGITS_number_variable_WS_hostnumber_HEX: gen_1 gen_0 gen_1;
equation: expression expression;
expression: uri_hostname_frag_STRING_login_query_DIGITS_number_variable_WS_hostnumber_HEX | equation | ϵ | ':' | '=' | '~' | '+' | '*' | ')' | '\'' | '0' .. '9' | '(' | 'a' .. 'z' | 'A' .. 'Z' | '.' | '-' | '#' | '?' | '&' | '/';
gen_1: ϵ | uri_hostname_frag_STRING_login_query_DIGITS_number_variable_WS_hostnumber_HEX | 'a' .. 'f' | 'A' .. 'F' | '0' .. '9' | 'a' | 'b' | 'c' | 'd' | 'e'