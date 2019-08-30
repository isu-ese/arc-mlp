gen_0: specification | startRule_causedByLine;
specification: gen_1 EOF_0;
paragraph: gen_3 | gen_18 | gen_21 | gen_22 | TEXT | gen_23;
formals: gen_27 NAME gen_26;
operatorTemplate: gen_4 | gen_16 | gen_17;
categoryTemplate_template: prefixTemplate | postfixTemplate | infixTemplate | nofixTemplate;
assoc: LEFTASSOC | RIGHTASSOC;
prefixTemplate: LEFT_PARENTHESIS gen_5 RIGHT_PARENTHESIS;
postfixTemplate: LEFT_PARENTHESIS postfixName RIGHT_PARENTHESIS;
infixTemplate: gen_14 LEFT_PARENTHESIS infixName RIGHT_PARENTHESIS;
nofixTemplate: LEFT_PARENTHESIS NAME gen_9 gen_11 RIGHT_PARENTHESIS;
optArgName_argName: ARGUMENT NAME gen_8;
optListName_listName: LIST NAME;
postfixName: optArgName_argName | gen_13;
infixName: optArgName_argName | gen_7;
startRule_causedByLine: gen_30 gen_31 JavaCharacter gen_32 gen_34 gen_36 gen_37 gen_38;
stackTraceLine: atLine | ellipsisLine;
atLine: 'at' gen_31 JavaCharacter gen_32 gen_34 '.' gen_32 '(' classFile gen_42 ')';
ellipsisLine: '...' '0' .. '9' gen_42 'more';
classFile: JavaWord | 'Native Method' | 'Unknown Source';
packagePath: JavaCharacter gen_32 '.' gen_31;
message: ':' gen_19;
JavaWord: JavaCharacter gen_32 gen_33;
JavaCharacter: 'A' .. 'Z' | 'a' .. 'z' | '_' | '0' .. '9';
gen_1: gen_2 | ϵ;
gen_26: formals | ϵ;
gen_28: gen_29 | ϵ;
gen_23: ZED SECTION NAME gen_24 END gen_28;
gen_3: ZED operatorTemplate END;
gen_19: gen_20 | ϵ;
gen_18: AX gen_19 END;
gen_21: SCH gen_19 END;
gen_22: ZED gen_19 END;
gen_4: RELATION categoryTemplate_template;
gen_16: FUNCTION categoryTemplate_template;
gen_17: GENERIC categoryTemplate_template;
gen_12: POWERSET ARGUMENT;
gen_5: gen_6 | gen_7 | gen_12;
gen_6: NAME ARGUMENT;
gen_11: optArgName_argName | optListName_listName;
gen_9: gen_10 | ϵ;
gen_7: gen_8 NAME gen_9 gen_11 ARGUMENT;
gen_13: ARGUMENT NAME gen_9 gen_11;
gen_37: startRule_causedByLine | ϵ;
gen_40: gen_41 | ϵ;
gen_43: gen_44 '0' .. '9' gen_42;
gen_42: gen_43 | ϵ;
gen_36: message | ϵ;
gen_31: packagePath | ϵ;
gen_34: gen_35 | ϵ;
gen_32: JavaWord | '<init>' | ϵ;
gen_2: paragraph gen_1;
gen_29: paragraph gen_28;
gen_20: . gen_19;
gen_10: gen_11 gen_9;
gen_41: stackTraceLine gen_40;
gen_35: '$' JavaCharacter gen_32 gen_34;
gen_45: EOF_1 | ϵ;
gen_8: ϵ | ARGUMENT;
gen_25: PARENTS gen_26;
gen_24: gen_25 | ϵ;
gen_27: ϵ | COMMA;
gen_33: ϵ | '.java';
gen_44: ':' | ϵ;
gen_15: NUMERAL assoc;
gen_14: ϵ | gen_15;
gen_30: ϵ | 'Caused by:';
gen_39: gen_40 gen_37 gen_45;
gen_38: gen_39 | ϵ