gen_0: specification | modelUnit;
specification: gen_1 EOF_0;
paragraph: gen_10 | gen_25 | gen_28 | gen_29;
formals: NAME gen_6;
operatorTemplate: gen_11 | gen_22 | gen_24;
categoryTemplate: prefixTemplate | postfixTemplate | gen_23 | nofixTemplate;
assoc: LEFTASSOC | RIGHTASSOC;
template: prefixTemplate | postfixTemplate | infixTemplate | nofixTemplate;
prefixTemplate: LEFT_PARENTHESIS gen_12 RIGHT_PARENTHESIS;
postfixTemplate: LEFT_PARENTHESIS postfixName RIGHT_PARENTHESIS;
infixTemplate: LEFT_PARENTHESIS infixName RIGHT_PARENTHESIS;
nofixTemplate: LEFT_PARENTHESIS NAME gen_15 gen_17 RIGHT_PARENTHESIS;
optArgName_argName: ARGUMENT NAME;
optListName_listName: LIST NAME;
postfixName: optArgName_argName | gen_19;
infixName: gen_20 | gen_21;
modelUnit: NAMESPACE IDENTIFIER gen_31 gen_33 gen_37 EOF_1;
typeDeclaration: assetDeclaration | conceptDeclaration | enumDeclaration | participantDeclaration | transactionDeclaration | eventDeclaration;
classModifier: decorator | ABSTRACT;
assetDeclaration: gen_39 ASSET IDENTIFIER extendsOrIdentified '{' gen_46 '}';
conceptDeclaration: gen_39 CONCEPT IDENTIFIER gen_66 '{' gen_46 '}';
enumDeclaration: ENUM IDENTIFIER '{' gen_67 '}';
eventDeclaration: EVENT IDENTIFIER '{' gen_46 '}';
participantDeclaration: gen_39 PARTICIPANT IDENTIFIER extendsOrIdentified '{' gen_46 '}';
transactionDeclaration: gen_39 TRANSACTION IDENTIFIER '{' gen_46 '}';
extendsOrIdentified: gen_45 | identified;
identified: IDENTIFIED IDENTIFIER;
classBodyDeclaration: ';' | gen_48 | gen_54 | gen_56 | gen_62 | gen_64 | gen_65;
numericPrimitive: DOUBLE | INTEGER | LONG;
defaultDate: DEFAULT ASSIGN DATE_TIME_LITERAL;
regexDeclaration: REGEX ASSIGN REGEX_EXPR;
rangeValidation: RANGE ASSIGN rangeDeclaration;
rangeDeclaration: gen_59 | gen_60 | gen_61;
defaultBoolean: DEFAULT ASSIGN BOOL_LITERAL;
defaultString: DEFAULT ASSIGN stringLiteral;
defaultNumber: DEFAULT ASSIGN numberLiteral;
identifier: IDENTIFIER | ASSET | PARTICIPANT;
literal: DECIMAL_LITERAL | OCT_LITERAL | FLOAT_LITERAL | CHAR_LITERAL | STRING_LITERAL | BOOL_LITERAL;
numberLiteral: DECIMAL_LITERAL | OCT_LITERAL | FLOAT_LITERAL;
stringLiteral: CHAR_LITERAL | STRING_LITERAL;
decorator: AT IDENTIFIER gen_31 gen_41;
gen_3: TEXT | gen_4 | gen_30 | gen_10 | gen_25 | gen_28 | gen_29;
gen_1: gen_2 | ϵ;
gen_5: formals | ϵ;
gen_8: gen_9 | ϵ;
gen_4: ZED SECTION NAME PARENTS gen_5 END gen_8;
gen_30: ZED SECTION NAME END gen_8;
gen_10: ZED operatorTemplate END;
gen_26: gen_27 | ϵ;
gen_25: AX gen_26 END;
gen_28: SCH gen_26 END;
gen_29: ZED gen_26 END;
gen_6: gen_7 | ϵ;
gen_11: RELATION template;
gen_22: FUNCTION categoryTemplate;
gen_24: GENERIC categoryTemplate;
gen_23: NUMERAL assoc LEFT_PARENTHESIS infixName RIGHT_PARENTHESIS;
gen_18: POWERSET ARGUMENT;
gen_12: gen_13 | gen_14 | gen_18;
gen_13: NAME ARGUMENT;
gen_17: optArgName_argName | optListName_listName;
gen_15: gen_16 | ϵ;
gen_14: NAME gen_15 gen_17 ARGUMENT;
gen_19: ARGUMENT NAME gen_15 gen_17;
gen_20: ARGUMENT NAME ARGUMENT;
gen_21: ARGUMENT NAME gen_15 gen_17 ARGUMENT;
gen_33: gen_34 | ϵ;
gen_37: gen_38 | ϵ;
gen_36: '.' '*';
gen_35: gen_36 | ϵ;
gen_39: gen_40 | ϵ;
gen_45: EXTENDS IDENTIFIER;
gen_66: gen_45 | ϵ;
gen_67: gen_68 | ϵ;
gen_46: gen_47 | ϵ;
gen_51: defaultString | ϵ;
gen_52: regexDeclaration | ϵ;
gen_53: OPTIONAL | ϵ;
gen_48: VAR STRING gen_49 identifier gen_51 gen_52 gen_53;
gen_55: defaultBoolean | ϵ;
gen_54: VAR BOOLEAN gen_49 identifier gen_55 gen_53;
gen_57: defaultNumber | ϵ;
gen_58: rangeValidation | ϵ;
gen_56: VAR numericPrimitive gen_49 identifier gen_57 gen_58 gen_53;
gen_63: defaultDate | ϵ;
gen_62: VAR DATE_TIME gen_49 identifier gen_63 gen_53;
gen_64: VAR IDENTIFIER gen_49 identifier;
gen_65: REF IDENTIFIER gen_49 identifier;
gen_49: gen_50 | ϵ;
gen_31: gen_32 | ϵ;
gen_59: '[' numberLiteral ',' ']';
gen_60: '[' ',' numberLiteral ']';
gen_61: '[' numberLiteral ',' numberLiteral ']';
gen_42: '(' literal gen_43 ')';
gen_41: gen_42 | ϵ;
gen_43: gen_44 | ϵ;
gen_2: gen_3 gen_1;
gen_9: paragraph gen_8;
gen_27: . gen_26;
gen_7: COMMA NAME gen_6;
gen_16: gen_17 gen_15;
gen_34: IMPORT IDENTIFIER gen_31 gen_35 gen_33;
gen_38: typeDeclaration gen_37;
gen_40: classModifier gen_39;
gen_68: VAR IDENTIFIER gen_67;
gen_47: classBodyDeclaration gen_46;
gen_50: '[' ']' gen_49;
gen_32: '.' IDENTIFIER gen_31;
gen_44: ',' literal gen_43