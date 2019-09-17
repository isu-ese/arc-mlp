programBlocks: document | gen_42 | EOF;
document: definition gen_41;
definition: selectionSet | inlineFragment_fragmentDefinition;
selectionSet: '{' selection gen_38 '}';
selection: field | fragmentSpread | inlineFragment_fragmentDefinition;
field: fieldName gen_3 gen_23 gen_28;
fieldName: alias | variable_NAME;
alias: gen_0 gen_1 ':' gen_0 gen_1;
arguments: gen_4 gen_0 gen_1 ':' valueOrVariable_value gen_3 gen_22;
fragmentSpread: '...' gen_0 gen_1 gen_23;
inlineFragment_fragmentDefinition: gen_29 gen_0 gen_1 gen_33 gen_23 '{' selection gen_38 '}';
directives: directive gen_23;
directive: gen_24 | gen_27;
variableDefinitions: gen_4 '$' gen_0 gen_1 ':' type gen_37 gen_33 gen_22;
variable_NAME: gen_2 gen_0 gen_1;
defaultValue: '=' valueOrVariable_value;
valueOrVariable_value: STRING | gen_11 | EXP | 'true' | 'false' | gen_18 | gen_21 | variable_NAME;
type: gen_34 | gen_36;
STRING: '\"' gen_5 '\"';
ESC: '\\' gen_8;
UNICODE: 'u' HEX HEX HEX HEX;
HEX: '0' .. '9' | 'a' .. 'f' | 'A' .. 'F';
INT_0: '0' | gen_13;
EXP: gen_16 E gen_12 INT_0;
feature: gen_47 | gen_49;
expression: gen_54 | gen_63 | gen_64 | gen_65 | gen_69 | gen_70 | gen_73 | gen_74 | gen_75 | gen_76 | gen_77 | gen_78 | gen_79 | gen_80 | gen_81 | gen_82 | gen_83 | gen_84 | OBJECTID | INT_1 | STRING | TRUE | FALSE | gen_85;
FALSE: 'f' A L S E;
TRUE: 't' R U E;
INT_1: '0' .. '9' gen_14;
OBJECTID: 'a' .. 'z' gen_1;
A: 'a' | 'A';
C: 'c' | 'C';
D: 'd' | 'D';
E: 'E' | 'e' | ϵ;
F: 'f' | 'F';
H: 'h' | 'H';
I: 'i' | 'I';
L: 'l' | 'L';
N: 'n' | 'N';
O: 'o' | 'O';
P: 'p' | 'P';
R: 'r' | 'R';
S: 's' | 'S';
T: 't' | 'T';
U: 'u' | 'U';
V: 'v' | 'V';
W: 'w' | 'W';
gen_41: document | ϵ;
gen_33: ϵ | variableDefinitions;
gen_23: directives | ϵ;
gen_40: ',' | ϵ;
gen_38: gen_39 | ϵ;
gen_3: arguments | ϵ;
gen_28: selectionSet | ϵ;
gen_24: '@' gen_0 gen_1 gen_25;
gen_27: '@' gen_0 gen_1 '(' gen_0 gen_1 ':' valueOrVariable_value ')';
gen_37: defaultValue | ϵ;
gen_35: '!' | ϵ;
gen_34: gen_0 gen_1 gen_35;
gen_36: '[' type ']' gen_35;
gen_19: gen_20 | ϵ;
gen_18: '[' valueOrVariable_value gen_19 ']';
gen_21: '[' ']';
gen_0: '_' | 'A' .. 'Z' | 'a' .. 'z' | '0' .. '9';
gen_1: variable_NAME | ϵ;
gen_10: '\"' | '\\';
gen_9: ~gen_10;
gen_7: ESC | gen_9;
gen_5: gen_6 | ϵ;
gen_8: '\"' | '\\' | '/' | 'b' | 'f' | 'n' | 'r' | 't' | UNICODE;
gen_12: '-' | ϵ | '+';
gen_14: INT_1 | ϵ;
gen_15: EXP | ϵ;
gen_11: gen_12 INT_0 '.' '0' .. '9' gen_14 gen_15;
gen_13: '1' .. '9' gen_14;
gen_42: C L A S S 'A' .. 'Z' gen_1 gen_43 '{' gen_45 '}' ';' programBlocks;
gen_44: I N H E R I T S 'A' .. 'Z' gen_1;
gen_43: gen_44 | ϵ;
gen_45: gen_46 | ϵ;
gen_48: ϵ | gen_49;
gen_47: 'a' .. 'z' gen_1 '(' gen_48 ')' ':' 'A' .. 'Z' gen_1 '{' expression '}';
gen_53: '<-' expression;
gen_52: gen_53 | ϵ;
gen_49: gen_40 'a' .. 'z' gen_1 ':' 'A' .. 'Z' gen_1 gen_50;
gen_58: '@' 'A' .. 'Z' gen_1;
gen_57: gen_58 | ϵ;
gen_61: gen_62 | ϵ;
gen_59: gen_60 | ϵ;
gen_54: gen_55 'a' .. 'z' gen_1 '(' gen_59 ')';
gen_63: I F expression T H E N expression E L S E expression F I;
gen_64: W H I L E expression L O O P expression P O O L;
gen_67: gen_65 | ϵ;
gen_65: gen_66 expression ';' gen_67 gen_68;
gen_69: L E T 'a' .. 'z' gen_1 ':' 'A' .. 'Z' gen_1 gen_52 gen_48 I N expression;
gen_71: gen_72 | ϵ;
gen_70: C A S E expression O F 'a' .. 'z' gen_1 ':' 'A' .. 'Z' gen_1 '=>' expression ';' gen_71 E S A C;
gen_73: N E W 'A' .. 'Z' gen_1;
gen_74: '~' expression;
gen_75: I S V O I D expression;
gen_76: expression '*' expression;
gen_77: expression '/' expression;
gen_78: expression '+' expression;
gen_79: expression '-' expression;
gen_80: expression '<' expression;
gen_81: expression '<=' expression;
gen_82: expression '=' expression;
gen_83: N O T expression;
gen_84: '(' expression ')';
gen_85: 'a' .. 'z' gen_1 '<-' expression;
gen_39: gen_40 selection gen_38;
gen_20: ',' valueOrVariable_value gen_19;
gen_6: gen_7 gen_5;
gen_46: feature ';' gen_45;
gen_62: ',' expression gen_61;
gen_60: expression gen_61 gen_59;
gen_72: 'a' .. 'z' gen_1 ':' 'A' .. 'Z' gen_1 '=>' expression ';' gen_71;
gen_4: '(' | ',';
gen_22: ')' | ϵ;
gen_32: 'fragment' gen_0 gen_1;
gen_31: '...' | gen_32;
gen_2: '$' | ϵ;
gen_30: gen_31 'on';
gen_29: gen_30 | 'query' | 'mutation';
gen_56: expression gen_57 '.';
gen_55: gen_56 | ϵ;
gen_17: gen_12 INT_0;
gen_16: ϵ | gen_17;
gen_26: ':' valueOrVariable_value;
gen_25: gen_26 | ϵ;
gen_51: gen_52 gen_48;
gen_86: gen_48 gen_48;
gen_50: gen_51 | gen_86;
gen_66: '{' | ϵ;
gen_68: '}' | ϵ