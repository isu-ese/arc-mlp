gen_0: file | tsvFile;
file: gen_1 EOF;
compound_argument: '(' gen_7 ')';
Identifier: gen_3 gen_4;
Unquoted_argument: gen_10 gen_15;
Escape_identity: '\\' gen_13;
Quoted_argument: '\"' gen_20 '\"';
Quoted_cont: '\\' gen_25;
Bracket_argument: '[' Bracket_arg_nested ']';
Bracket_arg_nested: gen_16 | gen_17;
tsvFile: field gen_35 gen_37 gen_38 gen_40;
field: TEXT | STRING;
TEXT: gen_28 gen_30;
STRING: '\"' gen_31 '\"';
gen_1: gen_2 | ϵ;
gen_9: Identifier | Unquoted_argument | Bracket_argument | Quoted_argument | compound_argument;
gen_7: gen_8 | ϵ;
gen_3: 'A' .. 'Z' | 'a' .. 'z' | '_';
gen_6: 'A' .. 'Z' | 'a' .. 'z' | '0' .. '9' | '_';
gen_4: gen_5 | ϵ;
gen_12: ' ' | '\t' | '\r' | '\n' | '(' | ')' | '#' | '\"' | '\\';
gen_11: ~gen_12;
gen_10: gen_11 | Escape_identity | '\\t' | '\\r' | '\\n' | '\\;';
gen_15: Unquoted_argument | ϵ;
gen_14: 'A' .. 'Z' | 'a' .. 'z' | '0' .. '9' | ';';
gen_13: ~gen_14;
gen_24: '\\' | '\"';
gen_23: ~gen_24;
gen_22: gen_23 | Escape_identity | '\\t' | '\\r' | '\\n' | '\\;' | Quoted_cont;
gen_20: gen_21 | ϵ;
gen_27: '\n' | ϵ;
gen_26: '\r' gen_27;
gen_25: gen_26 | '\n';
gen_16: '=' Bracket_arg_nested '=';
gen_18: gen_19 | ϵ;
gen_17: '[' gen_18 ']';
gen_40: tsvFile | ϵ;
gen_35: gen_36 | ϵ;
gen_37: '\n' | '\r';
gen_38: gen_39 | ϵ;
gen_29: ',' | '\n' | '\r' | '\"';
gen_28: ~gen_29;
gen_30: TEXT | ϵ;
gen_34: ~'\"';
gen_33: '\"\"' | gen_34;
gen_31: gen_32 | ϵ;
gen_2: gen_3 gen_4 '(' gen_7 ')' gen_1;
gen_8: gen_9 gen_7;
gen_5: gen_6 gen_4;
gen_21: gen_22 gen_20;
gen_19: . gen_18;
gen_36: '\t' field gen_35;
gen_39: gen_37 gen_38;
gen_32: gen_33 gen_31