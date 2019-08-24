notation: dice_number | addOp | proposition;
addOp: gen_0 operand gen_3 gen_3;
operand: dice_number | gen_4;
dice_number: gen_0 gen_1 DIGIT;
proposition: relExpression_atom_variable relExpression_atom_variable '|-' relExpression_atom_variable relExpression_atom_variable;
relExpression_atom_variable: gen_5 | ϵ | equiv_implies;
equiv_implies: gen_7 relExpression_atom_variable gen_8 relExpression_atom_variable gen_1;
gen_3: addOp | ϵ | DIGIT;
gen_4: LPAREN notation RPAREN;
gen_0: ϵ | ADDOPERATOR | MULTOPERATOR;
gen_5: gen_6 relExpression_atom_variable;
gen_2: gen_3 DSEPARATOR;
gen_1: gen_2 | ϵ | ')';
gen_7: ϵ | '(' | '^' | 'v';
gen_8: '<->' | '->' | ϵ;
gen_6: '!' | 'a' .. 'z' | 'A' .. 'Z'