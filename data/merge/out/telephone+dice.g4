notation: number_0 | dice | number_1 | addOp;
number_0: gen_0 gen_1 gen_2 '0' .. '9' '0' .. '9' '0' .. '9' '0' .. '9' '0' .. '9' '0' .. '9' '0' .. '9' '0' .. '9' '0' .. '9' '0' .. '9';
addOp: gen_3 operand gen_6 gen_8;
operand: dice | number_1 | gen_5;
dice: gen_3 gen_4 DSEPARATOR DIGIT;
number_1: gen_3 DIGIT;
gen_0: '+1' | ϵ;
gen_1: '+' | ϵ;
gen_8: addOp | ϵ;
gen_6: gen_7 | ϵ;
gen_5: LPAREN notation RPAREN;
gen_3: ϵ | ADDOPERATOR;
gen_4: DIGIT | ϵ;
gen_7: MULTOPERATOR operand gen_6;
gen_2: '011' | '010'