file: uri | gen_24 | ϵ;
uri: gen_0 gen_3 '://' gen_6 gen_7 gen_8 gen_11 gen_13 gen_15 gen_21 gen_22;
hostname: gen_9 gen_0 gen_3 gen_10;
hostnumber: '0' .. '9' gen_11 '.' '0' .. '9' gen_11 '.' '0' .. '9' gen_11 '.' '0' .. '9' gen_11;
login: gen_0 gen_3 ':' gen_0 gen_3 '@';
frag_STRING: gen_20 gen_0 gen_3;
query: gen_16 gen_0 gen_3 gen_17 gen_15;
DIGITS: gen_12 '0' .. '9' gen_11;
HEX: '%' gen_1 gen_1 gen_2;
WS: gen_23 gen_22;
statement: '>' | '<' | '+' | '-' | '.' | ',' | gen_25;
gen_6: login | ϵ;
gen_11: DIGITS | ϵ;
gen_14: '/' gen_0 gen_3 gen_13;
gen_13: gen_14 | ϵ;
gen_15: query | ϵ;
gen_21: frag_STRING | ϵ;
gen_22: WS | ϵ;
gen_7: '/' | ϵ;
gen_8: hostname | hostnumber;
gen_10: hostname | ϵ;
gen_19: frag_STRING | DIGITS | HEX;
gen_18: '=' gen_19;
gen_17: gen_18 | ϵ;
gen_1: 'a' .. 'f' | 'A' .. 'F' | '0' .. '9';
gen_2: HEX | ϵ;
gen_0: 'a' .. 'z' | 'A' .. 'Z' | '~' | '0' .. '9' | HEX;
gen_5: 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '.' | '-' | HEX;
gen_3: gen_4 | ϵ;
gen_23: '\r' | '\n';
gen_25: '[' file ']';
gen_24: statement file;
gen_4: gen_5 gen_3;
gen_9: ϵ | '.';
gen_20: '#' | ϵ;
gen_16: '?' | '&';
gen_12: ϵ | ':'