gen_0: uom | file | ϵ;
uom: gen_1 gen_2 unit gen_3 gen_0;
exponent: gen_4 '0' .. '9' gen_3;
unit: 'm' | 'g' | 's' | 'A' | 'K' | 'mol' | 'cd' | 'rad' | 'Hz' | 'sr' | 'N' | 'Pa' | 'J' | 'W' | 'C' | 'V' | 'F' | '\u03A9' | 'S' | 'Wb' | 'T' | 'H' | '\u02DAC' | 'lm' | 'lx' | 'Bq' | 'Gy' | 'Sv' | 'kat';
file: gen_3 EOF;
compound_argument: gen_5 '(' gen_5 ')' gen_3;
Identifier_Unquoted_argument_Escape_identity_Quoted_cont: gen_6 gen_5;
Quoted_argument: '\"' gen_5 '\"';
Bracket_argument: '[' Bracket_arg_nested ']';
Bracket_arg_nested: gen_7 | Bracket_argument | gen_8 | ϵ;
gen_2: 'E' | 'P' | 'T' | 'G' | 'M' | 'k' | 'h' | 'da' | 'd' | 'c' | 'm' | '\u00B5' | 'n' | 'p' | 'f' | 'a' | ϵ;
gen_3: exponent | ϵ | compound_argument;
gen_5: Identifier_Unquoted_argument_Escape_identity_Quoted_cont | ϵ | '\n' | gen_13;
gen_6: 'A' .. 'Z' | 'a' .. 'z' | '_' | '0' .. '9' | ';' | Identifier_Unquoted_argument_Escape_identity_Quoted_cont | Bracket_argument | Quoted_argument | compound_argument | gen_9 | '\\t' | '\\r' | '\\n' | '\\;' | gen_11 | '\r' | '\\';
gen_10: ' ' | '\t' | '\r' | '\n' | '(' | ')' | '#' | '\"' | '\\';
gen_9: ~gen_10;
gen_13: ~gen_6;
gen_12: '\\' | '\"';
gen_11: ~gen_12;
gen_7: '=' Bracket_arg_nested '=';
gen_8: . Bracket_arg_nested;
gen_1: ϵ | '*' | '/';
gen_4: '^' | ϵ