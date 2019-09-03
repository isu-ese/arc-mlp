gen_0: number | uom_exponent | ϵ | '+1' | '+' | '^' | '*' | '/';
number: gen_0 gen_0 gen_1 '0' .. '9' '0' .. '9' '0' .. '9' '0' .. '9' '0' .. '9' '0' .. '9' '0' .. '9' '0' .. '9' '0' .. '9' '0' .. '9';
uom_exponent: gen_0 gen_2 gen_0 gen_0;
unit: 'm' | 'g' | 's' | 'A' | 'K' | 'mol' | 'cd' | 'rad' | 'Hz' | 'sr' | 'N' | 'Pa' | 'J' | 'W' | 'C' | 'V' | 'F' | '\u03A9' | 'S' | 'Wb' | 'T' | 'H' | '\u02DAC' | 'lm' | 'lx' | 'Bq' | 'Gy' | 'Sv' | 'kat';
gen_4: 'E' | 'P' | 'T' | 'G' | 'M' | 'k' | 'h' | 'da' | 'd' | 'c' | 'm' | '\u00B5' | 'n' | 'p' | 'f' | 'a' | ϵ;
gen_1: '011' | '010';
gen_3: gen_4 unit;
gen_2: gen_3 | '0' .. '9'