field: ϵ | uri_hostnumber_hostname_frag_STRING_login_DIGITS_query_WS_EOL_tsvFile_TEXT_STRING_HEX | '\"' | '@' | '\t' | gen_5 | '\"\"' | gen_6 | '\n' | '\r' | ',' | ':';
uri_hostnumber_hostname_frag_STRING_login_DIGITS_query_WS_EOL_tsvFile_TEXT_STRING_HEX: gen_0 gen_0;
gen_0: ϵ | uri_hostnumber_hostname_frag_STRING_login_DIGITS_query_WS_EOL_tsvFile_TEXT_STRING_HEX | '/' | '?' | '&' | '.' | '#' | 'a' .. 'z' | 'A' .. 'Z' | '~' | '0' .. '9' | '-' | '://' | gen_1 | '=' | gen_2 | gen_4;
gen_3: 'a' .. 'f' | 'A' .. 'F' | '0' .. '9';
gen_5: ~field;
gen_6: ~'\"';
gen_1: '.' '0' .. '9';
gen_2: '%' gen_3 gen_3;
gen_4: field field