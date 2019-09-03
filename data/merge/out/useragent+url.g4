gen_0: prog_hostname_frag_STRING_login_uri_query_DIGITS_hostnumber_WS_COMMENT_HEX | ϵ | '.' | '#' | 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '~' | '-' | '@' | '/' | ':' | gen_1 | '?' | '&' | gen_2 | '://' | '=' | '\r' | '\n' | ')' | '(' | 'a' .. 'f' | 'A' .. 'F' | '%';
prog_hostname_frag_STRING_login_uri_query_DIGITS_hostnumber_WS_COMMENT_HEX: gen_0 gen_0 gen_0;
gen_1: ~')';
gen_2: '.' '0' .. '9'