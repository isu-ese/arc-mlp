gen_0: collection | K_ALTER;
collection: '(' ';' gen_1 gen_22 gen_24 ')' gen_24;
property: gen_3 | gen_9 | TEXT | gen_10 | gen_13 | gen_14 | gen_15 | gen_17 | gen_18 | gen_19 | privateProp;
privateProp: 'A' .. 'Z' 'A' .. 'Z' gen_20 gen_16;
COLOR: 'W' | 'B';
TEXT: gen_5 '[' gen_6 ']';
K_ALTER: A L T E R;
A: 'a' | 'A';
E: 'e' | 'E';
L: 'l' | 'L';
R: 'r' | 'R';
T: 't' | 'T';
gen_24: collection | ϵ;
gen_22: gen_23 | ϵ;
gen_1: gen_2 | ϵ;
gen_4: '[]' | TEXT;
gen_3: COLOR gen_4;
gen_9: 'KO' '[]';
gen_12: gen_10 | ϵ;
gen_10: gen_11 '[' gen_6 ']' gen_12;
gen_13: 'DO' '[]';
gen_14: 'IT' '[]';
gen_16: '[]' | gen_10;
gen_15: 'DD' gen_16;
gen_17: 'FG' gen_4;
gen_18: 'TB' gen_16;
gen_19: 'TW' gen_16;
gen_20: gen_21 | ϵ;
gen_8: '\\]' | .;
gen_6: gen_7 | ϵ;
gen_23: ';' gen_1 gen_22;
gen_2: property gen_1;
gen_21: 'A' .. 'Z' gen_20;
gen_7: gen_8 gen_6;
gen_11: ϵ | 'AB' | 'AE' | 'AW' | 'AR' | 'CR' | 'LB' | 'LN' | 'MA' | 'SL' | 'SQ' | 'TR' | 'VW';
gen_5: ϵ | 'MN' | 'PL' | 'C' | 'DM' | 'GB' | 'GW' | 'HO' | 'N' | 'UC' | 'V' | 'BM' | 'TE' | 'AP' | 'CA' | 'FF' | 'GM' | 'ST' | 'SZ' | 'AN' | 'BR' | 'BT' | 'CP' | 'DT' | 'EV' | 'GN' | 'GC' | 'ON' | 'OT' | 'PB' | 'PC' | 'PW' | 'RE' | 'RO' | 'RU' | 'SO' | 'TM' | 'US' | 'WR' | 'WT' | 'BL' | 'OB' | 'OW' | 'WL' | 'PM' | 'AS' | 'IP' | 'IY' | 'SE' | 'SU' | 'HA' | 'KM'