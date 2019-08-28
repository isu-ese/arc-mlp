cookie_word: number_STRING_TOKEN | ϵ | ';' | '+1' | '+' | gen_0 | '\"' | '\n' | gen_1 | '0' .. '9' | 'a' .. 'z' | 'A' .. 'Z' | '-' | ' ' | '/' | '_' | ':' | ',' | '=';
number_STRING_TOKEN: cookie_word cookie_word cookie_word;
gen_0: ~cookie_word;
gen_2: '011' | '010';
gen_1: gen_2 '0' .. '9' '0' .. '9' '0' .. '9' '0' .. '9' '0' .. '9' '0' .. '9' '0' .. '9' '0' .. '9' '0' .. '9' '0' .. '9'