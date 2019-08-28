gen_0: gen_1 | gen_17 | gen_18 | gen_20 | gen_21 | gen_22 | gen_23 | 'void' | sourceFile;
declaration: gen_1 | gen_17 | gen_18 | gen_20 | gen_21 | gen_22 | gen_23 | 'void';
value: DECIMAL | HEXADECIMAL | OCTAL | IDENTIFIER_0;
typeSpecifier: gen_2 | gen_4 | 'float' | 'double' | 'quadruple' | 'bool' | enumTypeSpec | structTypeSpec | unionTypeSpec | IDENTIFIER_0;
enumTypeSpec: 'enum' '{' gen_5 gen_6 '=' value gen_15 '}';
structTypeSpec: 'struct' '{' declaration ';' gen_24 '}';
unionTypeSpec: 'union' 'switch' '(' declaration ')' '{' 'case' value ':' gen_26 declaration ';' gen_28 gen_30 '}';
OCTAL: '0' '1' .. '7' gen_13;
DECIMAL: gen_9 '0' .. '9' gen_10;
HEXADECIMAL: '0x' HEX_DIGIT gen_11;
IDENTIFIER_0: gen_5 gen_6;
sourceFile: 'package' LETTER gen_32 eos gen_35 gen_49;
importSpec: gen_38 STRING_LIT;
topLevelDecl: constDecl | typeDecl | varDecl | functionDecl | methodDecl;
constDecl: 'const' gen_51;
constSpec: LETTER gen_32 gen_52 gen_54;
identifierList: LETTER gen_32 gen_52;
expressionList: expression gen_103;
typeDecl: 'type' gen_94;
typeSpec: LETTER gen_32 type;
functionDecl: 'func' LETTER gen_32 gen_161;
function: signature '{' statementList '}';
methodDecl: 'func' '(' gen_71 ')' LETTER gen_32 gen_161;
varDecl: 'var' gen_98;
varSpec: LETTER gen_32 gen_52 gen_99;
block: '{' statementList '}';
statementList: gen_93 | ϵ;
statement: constDecl | typeDecl | varDecl | labeledStmt | sendStmt | DECIMAL_LIT | OCTAL_LIT | HEX_LIT | gen_58 | gen_62 | gen_63 | IMAGINARY_LIT | RUNE_LIT | RAW_STRING_LIT | INTERPRETED_STRING_LIT | compositeLit | functionLit | IDENTIFIER_1 | qualifiedIdent | methodExpr | gen_110 | conversion | gen_111 | gen_112 | gen_113 | gen_117 | gen_118 | gen_123 | gen_125 | incDecStmt | assignment | shortVarDecl | ';' | goStmt | returnStmt | breakStmt | continueStmt | gotoStmt | 'fallthrough' | block | ifStmt | exprSwitchStmt | typeSwitchStmt | selectStmt | forStmt | deferStmt;
simpleStmt: sendStmt | DECIMAL_LIT | OCTAL_LIT | HEX_LIT | gen_58 | gen_62 | gen_63 | IMAGINARY_LIT | RUNE_LIT | RAW_STRING_LIT | INTERPRETED_STRING_LIT | compositeLit | functionLit | IDENTIFIER_1 | qualifiedIdent | methodExpr | gen_110 | conversion | gen_111 | gen_112 | gen_113 | gen_117 | gen_118 | gen_123 | gen_125 | incDecStmt | assignment | shortVarDecl | ';';
sendStmt: expression '<-' expression;
incDecStmt: expression gen_128;
assignment: expression gen_103 gen_129 '=' expression gen_103;
shortVarDecl: LETTER gen_32 gen_52 ':=' expression gen_103;
labeledStmt: LETTER gen_32 ':' statement;
returnStmt: 'return' gen_130;
breakStmt: 'break' gen_131;
continueStmt: 'continue' gen_131;
gotoStmt: 'goto' LETTER gen_32;
deferStmt: 'defer' expression;
ifStmt: 'if' gen_132 expression '{' statementList '}' gen_134;
exprSwitchStmt: 'switch' gen_132 gen_116 '{' gen_137 '}';
exprSwitchCase: gen_139 | 'default';
typeSwitchStmt: 'switch' gen_132 gen_140 primaryExpr '.' '(' 'type' ')' '{' gen_142 '}';
typeSwitchCase: gen_144 | 'default';
selectStmt: 'select' '{' gen_147 '}';
commCase: gen_149 | 'default';
recvStmt: gen_151 expression;
forStmt: 'for' gen_154 '{' statementList '}';
forClause: gen_155 ';' gen_116 ';' gen_155;
rangeClause: gen_151 'range' expression;
goStmt: 'go' expression;
type: IDENTIFIER_1 | qualifiedIdent | arrayType | structType | pointerType | functionType | interfaceType | sliceType | mapType | channelType | gen_85;
typeName_operandName: IDENTIFIER_1 | qualifiedIdent;
arrayType: '[' expression ']' type;
pointerType: '*' type;
interfaceType: 'interface' '{' gen_78 '}';
sliceType: '[' ']' type;
mapType: 'map' '[' type ']' type;
channelType: gen_82 type;
methodSpec: gen_80 | IDENTIFIER_1 | qualifiedIdent | gen_81;
functionType: 'func' signature;
signature: gen_70 | parameters;
result: parameters | IDENTIFIER_1 | qualifiedIdent | arrayType | structType | pointerType | functionType | interfaceType | sliceType | mapType | channelType | gen_85;
parameters: '(' gen_71 ')';
qualifiedIdent: LETTER gen_32 '.' LETTER gen_32;
compositeLit: literalType '{' gen_89 '}';
literalType: structType | arrayType | gen_88 | sliceType | mapType | IDENTIFIER_1 | qualifiedIdent;
literalValue: '{' gen_89 '}';
key_element: DECIMAL_LIT | OCTAL_LIT | HEX_LIT | gen_58 | gen_62 | gen_63 | IMAGINARY_LIT | RUNE_LIT | RAW_STRING_LIT | INTERPRETED_STRING_LIT | compositeLit | functionLit | IDENTIFIER_1 | qualifiedIdent | methodExpr | gen_110 | conversion | gen_111 | gen_112 | gen_113 | gen_117 | gen_118 | gen_123 | gen_125 | literalValue;
structType: 'struct' '{' gen_66 '}';
anonymousField: gen_86 typeName_operandName;
functionLit: 'func' signature '{' statementList '}';
primaryExpr: DECIMAL_LIT | OCTAL_LIT | HEX_LIT | gen_58 | gen_62 | gen_63 | IMAGINARY_LIT | RUNE_LIT | RAW_STRING_LIT | INTERPRETED_STRING_LIT | compositeLit | functionLit | IDENTIFIER_1 | qualifiedIdent | methodExpr | gen_110 | conversion | gen_111 | gen_112 | gen_113 | gen_117 | gen_118;
methodExpr: receiverType '.' LETTER gen_32;
receiverType: IDENTIFIER_1 | qualifiedIdent | gen_108 | gen_109;
expression: DECIMAL_LIT | OCTAL_LIT | HEX_LIT | gen_58 | gen_62 | gen_63 | IMAGINARY_LIT | RUNE_LIT | RAW_STRING_LIT | INTERPRETED_STRING_LIT | compositeLit | functionLit | IDENTIFIER_1 | qualifiedIdent | methodExpr | gen_110 | conversion | gen_111 | gen_112 | gen_113 | gen_117 | gen_118 | gen_123 | gen_125;
unaryExpr: DECIMAL_LIT | OCTAL_LIT | HEX_LIT | gen_58 | gen_62 | gen_63 | IMAGINARY_LIT | RUNE_LIT | RAW_STRING_LIT | INTERPRETED_STRING_LIT | compositeLit | functionLit | IDENTIFIER_1 | qualifiedIdent | methodExpr | gen_110 | conversion | gen_111 | gen_112 | gen_113 | gen_117 | gen_118 | gen_123;
conversion: type '(' expression gen_77 ')';
eos: ';' | EOF | ϵ;
IDENTIFIER_1: LETTER gen_32;
DECIMAL_LIT: '1' .. '9' gen_10;
OCTAL_LIT: '0' gen_13;
HEX_LIT: '0' gen_57 HEX_DIGIT gen_11;
DECIMALS: '0' .. '9' gen_10;
EXPONENT: gen_60 gen_61 '0' .. '9' gen_10;
IMAGINARY_LIT: gen_64 'i';
RUNE_LIT: '\'' gen_65 '\'';
OCTAL_BYTE_VALUE: '\\' '0' .. '7' '0' .. '7' '0' .. '7';
HEX_BYTE_VALUE: '\\' 'x' HEX_DIGIT HEX_DIGIT;
LITTLE_U_VALUE: '\\u' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT;
BIG_U_VALUE: '\\U' HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT HEX_DIGIT;
ESCAPED_CHAR: '\\' gen_45;
STRING_LIT: RAW_STRING_LIT | INTERPRETED_STRING_LIT;
RAW_STRING_LIT: '`' gen_39 '`';
INTERPRETED_STRING_LIT: '\"' gen_42 '\"';
LETTER: 'A' .. 'Z' | 'a' .. 'z' | '\u00AA' | '\u00B5' | '\u00BA' | '\u00C0' .. '\u00D6' | '\u00D8' .. '\u00F6' | '\u00F8' .. '\u021F' | '\u0222' .. '\u0233' | '\u0250' .. '\u02AD' | '\u02B0' .. '\u02B8' | '\u02BB' .. '\u02C1' | '\u02D0' .. '\u02D1' | '\u02E0' .. '\u02E4' | '\u02EE' | '\u037A' | '\u0386' | '\u0388' .. '\u038A' | '\u038C' | '\u038E' .. '\u03A1' | '\u03A3' .. '\u03CE' | '\u03D0' .. '\u03D7' | '\u03DA' .. '\u03F3' | '\u0400' .. '\u0481' | '\u048C' .. '\u04C4' | '\u04C7' .. '\u04C8' | '\u04CB' .. '\u04CC' | '\u04D0' .. '\u04F5' | '\u04F8' .. '\u04F9' | '\u0531' .. '\u0556' | '\u0559' | '\u0561' .. '\u0587' | '\u05D0' .. '\u05EA' | '\u05F0' .. '\u05F2' | '\u0621' .. '\u063A' | '\u0640' .. '\u064A' | '\u0671' .. '\u06D3' | '\u06D5' | '\u06E5' .. '\u06E6' | '\u06FA' .. '\u06FC' | '\u0710' | '\u0712' .. '\u072C' | '\u0780' .. '\u07A5' | '\u0905' .. '\u0939' | '\u093D' | '\u0950' | '\u0958' .. '\u0961' | '\u0985' .. '\u098C' | '\u098F' .. '\u0990' | '\u0993' .. '\u09A8' | '\u09AA' .. '\u09B0' | '\u09B2' | '\u09B6' .. '\u09B9' | '\u09DC' .. '\u09DD' | '\u09DF' .. '\u09E1' | '\u09F0' .. '\u09F1' | '\u0A05' .. '\u0A0A' | '\u0A0F' .. '\u0A10' | '\u0A13' .. '\u0A28' | '\u0A2A' .. '\u0A30' | '\u0A32' .. '\u0A33' | '\u0A35' .. '\u0A36' | '\u0A38' .. '\u0A39' | '\u0A59' .. '\u0A5C' | '\u0A5E' | '\u0A72' .. '\u0A74' | '\u0A85' .. '\u0A8B' | '\u0A8D' | '\u0A8F' .. '\u0A91' | '\u0A93' .. '\u0AA8' | '\u0AAA' .. '\u0AB0' | '\u0AB2' .. '\u0AB3' | '\u0AB5' .. '\u0AB9' | '\u0ABD' | '\u0AD0' | '\u0AE0' | '\u0B05' .. '\u0B0C' | '\u0B0F' .. '\u0B10' | '\u0B13' .. '\u0B28' | '\u0B2A' .. '\u0B30' | '\u0B32' .. '\u0B33' | '\u0B36' .. '\u0B39' | '\u0B3D' | '\u0B5C' .. '\u0B5D' | '\u0B5F' .. '\u0B61' | '\u0B85' .. '\u0B8A' | '\u0B8E' .. '\u0B90' | '\u0B92' .. '\u0B95' | '\u0B99' .. '\u0B9A' | '\u0B9C' | '\u0B9E' .. '\u0B9F' | '\u0BA3' .. '\u0BA4' | '\u0BA8' .. '\u0BAA' | '\u0BAE' .. '\u0BB5' | '\u0BB7' .. '\u0BB9' | '\u0C05' .. '\u0C0C' | '\u0C0E' .. '\u0C10' | '\u0C12' .. '\u0C28' | '\u0C2A' .. '\u0C33' | '\u0C35' .. '\u0C39' | '\u0C60' .. '\u0C61' | '\u0C85' .. '\u0C8C' | '\u0C8E' .. '\u0C90' | '\u0C92' .. '\u0CA8' | '\u0CAA' .. '\u0CB3' | '\u0CB5' .. '\u0CB9' | '\u0CDE' | '\u0CE0' .. '\u0CE1' | '\u0D05' .. '\u0D0C' | '\u0D0E' .. '\u0D10' | '\u0D12' .. '\u0D28' | '\u0D2A' .. '\u0D39' | '\u0D60' .. '\u0D61' | '\u0D85' .. '\u0D96' | '\u0D9A' .. '\u0DB1' | '\u0DB3' .. '\u0DBB' | '\u0DBD' | '\u0DC0' .. '\u0DC6' | '\u0E01' .. '\u0E30' | '\u0E32' .. '\u0E33' | '\u0E40' .. '\u0E46' | '\u0E81' .. '\u0E82' | '\u0E84' | '\u0E87' .. '\u0E88' | '\u0E8A' | '\u0E8D' | '\u0E94' .. '\u0E97' | '\u0E99' .. '\u0E9F' | '\u0EA1' .. '\u0EA3' | '\u0EA5' | '\u0EA7' | '\u0EAA' .. '\u0EAB' | '\u0EAD' .. '\u0EB0' | '\u0EB2' .. '\u0EB3' | '\u0EBD' .. '\u0EC4' | '\u0EC6' | '\u0EDC' .. '\u0EDD' | '\u0F00' | '\u0F40' .. '\u0F6A' | '\u0F88' .. '\u0F8B' | '\u1000' .. '\u1021' | '\u1023' .. '\u1027' | '\u1029' .. '\u102A' | '\u1050' .. '\u1055' | '\u10A0' .. '\u10C5' | '\u10D0' .. '\u10F6' | '\u1100' .. '\u1159' | '\u115F' .. '\u11A2' | '\u11A8' .. '\u11F9' | '\u1200' .. '\u1206' | '\u1208' .. '\u1246' | '\u1248' | '\u124A' .. '\u124D' | '\u1250' .. '\u1256' | '\u1258' | '\u125A' .. '\u125D' | '\u1260' .. '\u1286' | '\u1288' | '\u128A' .. '\u128D' | '\u1290' .. '\u12AE' | '\u12B0' | '\u12B2' .. '\u12B5' | '\u12B8' .. '\u12BE' | '\u12C0' | '\u12C2' .. '\u12C5' | '\u12C8' .. '\u12CE' | '\u12D0' .. '\u12D6' | '\u12D8' .. '\u12EE' | '\u12F0' .. '\u130E' | '\u1310' | '\u1312' .. '\u1315' | '\u1318' .. '\u131E' | '\u1320' .. '\u1346' | '\u1348' .. '\u135A' | '\u13A0' .. '\u13B0' | '\u13B1' .. '\u13F4' | '\u1401' .. '\u1676' | '\u1681' .. '\u169A' | '\u16A0' .. '\u16EA' | '\u1780' .. '\u17B3' | '\u1820' .. '\u1877' | '\u1880' .. '\u18A8' | '\u1E00' .. '\u1E9B' | '\u1EA0' .. '\u1EE0' | '\u1EE1' .. '\u1EF9' | '\u1F00' .. '\u1F15' | '\u1F18' .. '\u1F1D' | '\u1F20' .. '\u1F39' | '\u1F3A' .. '\u1F45' | '\u1F48' .. '\u1F4D' | '\u1F50' .. '\u1F57' | '\u1F59' | '\u1F5B' | '\u1F5D' | '\u1F5F' .. '\u1F7D' | '\u1F80' .. '\u1FB4' | '\u1FB6' .. '\u1FBC' | '\u1FBE' | '\u1FC2' .. '\u1FC4' | '\u1FC6' .. '\u1FCC' | '\u1FD0' .. '\u1FD3' | '\u1FD6' .. '\u1FDB' | '\u1FE0' .. '\u1FEC' | '\u1FF2' .. '\u1FF4' | '\u1FF6' .. '\u1FFC' | '\u207F' | '\u2102' | '\u2107' | '\u210A' .. '\u2113' | '\u2115' | '\u2119' .. '\u211D' | '\u2124' | '\u2126' | '\u2128' | '\u212A' .. '\u212D' | '\u212F' .. '\u2131' | '\u2133' .. '\u2139' | '\u2160' .. '\u2183' | '\u3005' .. '\u3007' | '\u3021' .. '\u3029' | '\u3031' .. '\u3035' | '\u3038' .. '\u303A' | '\u3041' .. '\u3094' | '\u309D' .. '\u309E' | '\u30A1' .. '\u30FA' | '\u30FC' .. '\u30FE' | '\u3105' .. '\u312C' | '\u3131' .. '\u318E' | '\u31A0' .. '\u31B7' | '\u3400' .. '\u4DB5' | '\u4E00' .. '\u9FA5' | '\uA000' .. '\uA48C' | '\uAC00' | '\uD7A3' | '\uF900' .. '\uFA2D' | '\uFB00' .. '\uFB06' | '\uFB13' .. '\uFB17' | '\uFB1D' | '\uFB1F' .. '\uFB28' | '\uFB2A' .. '\uFB36' | '\uFB38' .. '\uFB3C' | '\uFB3E' | '\uFB40' .. '\uFB41' | '\uFB43' .. '\uFB44' | '\uFB46' .. '\uFBB1' | '\uFBD3' .. '\uFD3D' | '\uFD50' .. '\uFD8F' | '\uFD92' .. '\uFDC7' | '\uFDF0' .. '\uFDFB' | '\uFE70' .. '\uFE72' | '\uFE74' | '\uFE76' .. '\uFEFC' | '\uFF21' .. '\uFF3A' | '\uFF41' .. '\uFF5A' | '\uFF66' .. '\uFFBE' | '\uFFC2' .. '\uFFC7' | '\uFFCA' .. '\uFFCF' | '\uFFD2' .. '\uFFD7' | '\uFFDA' .. '\uFFDC' | '_';
HEX_DIGIT: 'a' .. 'f' | 'A' .. 'F' | '0' .. '9';
UNICODE_CHAR: ~'\n';
gen_1: typeSpecifier gen_5 gen_6;
gen_17: typeSpecifier gen_5 gen_6 '[' value ']';
gen_19: DECIMAL | HEXADECIMAL | OCTAL | IDENTIFIER_0 | ϵ;
gen_18: typeSpecifier gen_5 gen_6 '<' gen_19 '>';
gen_20: 'opaque' gen_5 gen_6 '[' value ']';
gen_21: 'opaque' gen_5 gen_6 '<' gen_19 '>';
gen_22: 'string' gen_5 gen_6 '<' gen_19 '>';
gen_23: typeSpecifier '*' gen_5 gen_6;
gen_3: 'unsigned' | ϵ;
gen_2: gen_3 'int';
gen_4: gen_3 'hyper';
gen_15: gen_16 | ϵ;
gen_24: gen_25 | ϵ;
gen_28: gen_29 | ϵ;
gen_31: 'default' ':' declaration ';';
gen_30: gen_31 | ϵ;
gen_26: gen_27 | ϵ;
gen_13: gen_14 | ϵ;
gen_9: '-' | ϵ;
gen_10: DECIMALS | ϵ;
gen_11: gen_12 | ϵ;
gen_5: 'a' .. 'z' | 'A' .. 'Z';
gen_8: 'a' .. 'z' | 'A' .. 'Z' | '0' .. '9' | '_';
gen_6: gen_7 | ϵ;
gen_35: gen_36 | ϵ;
gen_49: gen_50 | ϵ;
gen_47: gen_48 | ϵ;
gen_46: '(' gen_47 ')';
gen_37: importSpec | gen_46;
gen_38: '.' | IDENTIFIER_1 | ϵ;
gen_159: gen_160 | ϵ;
gen_158: '(' gen_159 ')';
gen_51: constSpec | gen_158;
gen_56: IDENTIFIER_1 | qualifiedIdent | arrayType | structType | pointerType | functionType | interfaceType | sliceType | mapType | channelType | gen_85 | ϵ;
gen_55: gen_56 '=' expression gen_103;
gen_54: gen_55 | ϵ;
gen_52: gen_53 | ϵ;
gen_103: gen_104 | ϵ;
gen_96: gen_97 | ϵ;
gen_95: '(' gen_96 ')';
gen_94: typeSpec | gen_95;
gen_161: function | gen_70 | parameters;
gen_106: gen_107 | ϵ;
gen_105: '(' gen_106 ')';
gen_98: varSpec | gen_105;
gen_102: '=' expression gen_103;
gen_101: gen_102 | ϵ;
gen_100: type gen_101;
gen_99: gen_100 | gen_102;
gen_128: '++' | '--';
gen_129: '+' | '-' | '|' | '^' | '*' | '/' | '%' | '<<' | '>>' | '&' | '&^' | ϵ;
gen_130: expressionList | ϵ;
gen_131: IDENTIFIER_1 | ϵ;
gen_133: simpleStmt ';';
gen_132: gen_133 | ϵ;
gen_136: ifStmt | block;
gen_135: 'else' gen_136;
gen_134: gen_135 | ϵ;
gen_116: DECIMAL_LIT | OCTAL_LIT | HEX_LIT | gen_58 | gen_62 | gen_63 | IMAGINARY_LIT | RUNE_LIT | RAW_STRING_LIT | INTERPRETED_STRING_LIT | compositeLit | functionLit | IDENTIFIER_1 | qualifiedIdent | methodExpr | gen_110 | conversion | gen_111 | gen_112 | gen_113 | gen_117 | gen_118 | gen_123 | gen_125 | ϵ;
gen_137: gen_138 | ϵ;
gen_139: 'case' expression gen_103;
gen_142: gen_143 | ϵ;
gen_141: LETTER gen_32 ':=';
gen_140: gen_141 | ϵ;
gen_144: 'case' type gen_145;
gen_145: gen_146 | ϵ;
gen_147: gen_148 | ϵ;
gen_150: sendStmt | recvStmt;
gen_149: 'case' gen_150;
gen_152: expression gen_103 '=';
gen_153: LETTER gen_32 gen_52 ':=';
gen_151: gen_152 | gen_153 | ϵ;
gen_154: DECIMAL_LIT | OCTAL_LIT | HEX_LIT | gen_58 | gen_62 | gen_63 | IMAGINARY_LIT | RUNE_LIT | RAW_STRING_LIT | INTERPRETED_STRING_LIT | compositeLit | functionLit | IDENTIFIER_1 | qualifiedIdent | methodExpr | gen_110 | conversion | gen_111 | gen_112 | gen_113 | gen_117 | gen_118 | gen_123 | gen_125 | forClause | rangeClause | ϵ;
gen_155: sendStmt | DECIMAL_LIT | OCTAL_LIT | HEX_LIT | gen_58 | gen_62 | gen_63 | IMAGINARY_LIT | RUNE_LIT | RAW_STRING_LIT | INTERPRETED_STRING_LIT | compositeLit | functionLit | IDENTIFIER_1 | qualifiedIdent | methodExpr | gen_110 | conversion | gen_111 | gen_112 | gen_113 | gen_117 | gen_118 | gen_123 | gen_125 | incDecStmt | assignment | shortVarDecl | ';' | ϵ;
gen_85: '(' type ')';
gen_78: gen_79 | ϵ;
gen_83: 'chan' '<-';
gen_84: '<-' 'chan';
gen_82: 'chan' | gen_83 | gen_84;
gen_80: LETTER gen_32 '(' gen_71 ')' result;
gen_81: LETTER gen_32 '(' gen_71 ')';
gen_70: '(' gen_71 ')' result;
gen_77: ',' | ϵ;
gen_72: gen_73 gen_74 type gen_75 gen_77;
gen_71: gen_72 | ϵ;
gen_75: gen_76 | ϵ;
gen_73: identifierList | ϵ;
gen_74: '...' | ϵ;
gen_110: '(' expression ')';
gen_88: '[' '...' ']' type;
gen_90: gen_91 key_element gen_156 gen_77;
gen_89: gen_90 | ϵ;
gen_156: gen_157 | ϵ;
gen_92: key_element ':';
gen_91: gen_92 | ϵ;
gen_66: gen_67 | ϵ;
gen_69: LETTER gen_32 gen_52 type;
gen_68: gen_69 | anonymousField;
gen_87: RAW_STRING_LIT | INTERPRETED_STRING_LIT | ϵ;
gen_86: '*' | ϵ;
gen_111: primaryExpr '.' LETTER gen_32;
gen_112: primaryExpr '[' expression ']';
gen_113: primaryExpr '[' gen_114 ']';
gen_117: primaryExpr '.' '(' type ')';
gen_118: primaryExpr '(' gen_119 ')';
gen_115: gen_116 ':' gen_116;
gen_127: gen_116 ':' expression ':' expression;
gen_114: gen_115 | gen_127;
gen_104: ',' expression gen_103;
gen_122: type gen_103;
gen_121: expressionList | gen_122;
gen_120: gen_121 gen_74 gen_77;
gen_119: gen_120 | ϵ;
gen_108: '(' '*' typeName_operandName ')';
gen_109: '(' receiverType ')';
gen_126: '||' | '&&' | '==' | '!=' | '<' | '<=' | '>' | '>=' | '+' | '-' | '|' | '^' | '*' | '/' | '%' | '<<' | '>>' | '&' | '&^';
gen_125: expression gen_126 expression;
gen_124: '+' | '-' | '!' | '^' | '*' | '&' | '<-';
gen_123: gen_124 unaryExpr;
gen_34: 'A' .. 'Z' | 'a' .. 'z' | '\u00AA' | '\u00B5' | '\u00BA' | '\u00C0' .. '\u00D6' | '\u00D8' .. '\u00F6' | '\u00F8' .. '\u021F' | '\u0222' .. '\u0233' | '\u0250' .. '\u02AD' | '\u02B0' .. '\u02B8' | '\u02BB' .. '\u02C1' | '\u02D0' .. '\u02D1' | '\u02E0' .. '\u02E4' | '\u02EE' | '\u037A' | '\u0386' | '\u0388' .. '\u038A' | '\u038C' | '\u038E' .. '\u03A1' | '\u03A3' .. '\u03CE' | '\u03D0' .. '\u03D7' | '\u03DA' .. '\u03F3' | '\u0400' .. '\u0481' | '\u048C' .. '\u04C4' | '\u04C7' .. '\u04C8' | '\u04CB' .. '\u04CC' | '\u04D0' .. '\u04F5' | '\u04F8' .. '\u04F9' | '\u0531' .. '\u0556' | '\u0559' | '\u0561' .. '\u0587' | '\u05D0' .. '\u05EA' | '\u05F0' .. '\u05F2' | '\u0621' .. '\u063A' | '\u0640' .. '\u064A' | '\u0671' .. '\u06D3' | '\u06D5' | '\u06E5' .. '\u06E6' | '\u06FA' .. '\u06FC' | '\u0710' | '\u0712' .. '\u072C' | '\u0780' .. '\u07A5' | '\u0905' .. '\u0939' | '\u093D' | '\u0950' | '\u0958' .. '\u0961' | '\u0985' .. '\u098C' | '\u098F' .. '\u0990' | '\u0993' .. '\u09A8' | '\u09AA' .. '\u09B0' | '\u09B2' | '\u09B6' .. '\u09B9' | '\u09DC' .. '\u09DD' | '\u09DF' .. '\u09E1' | '\u09F0' .. '\u09F1' | '\u0A05' .. '\u0A0A' | '\u0A0F' .. '\u0A10' | '\u0A13' .. '\u0A28' | '\u0A2A' .. '\u0A30' | '\u0A32' .. '\u0A33' | '\u0A35' .. '\u0A36' | '\u0A38' .. '\u0A39' | '\u0A59' .. '\u0A5C' | '\u0A5E' | '\u0A72' .. '\u0A74' | '\u0A85' .. '\u0A8B' | '\u0A8D' | '\u0A8F' .. '\u0A91' | '\u0A93' .. '\u0AA8' | '\u0AAA' .. '\u0AB0' | '\u0AB2' .. '\u0AB3' | '\u0AB5' .. '\u0AB9' | '\u0ABD' | '\u0AD0' | '\u0AE0' | '\u0B05' .. '\u0B0C' | '\u0B0F' .. '\u0B10' | '\u0B13' .. '\u0B28' | '\u0B2A' .. '\u0B30' | '\u0B32' .. '\u0B33' | '\u0B36' .. '\u0B39' | '\u0B3D' | '\u0B5C' .. '\u0B5D' | '\u0B5F' .. '\u0B61' | '\u0B85' .. '\u0B8A' | '\u0B8E' .. '\u0B90' | '\u0B92' .. '\u0B95' | '\u0B99' .. '\u0B9A' | '\u0B9C' | '\u0B9E' .. '\u0B9F' | '\u0BA3' .. '\u0BA4' | '\u0BA8' .. '\u0BAA' | '\u0BAE' .. '\u0BB5' | '\u0BB7' .. '\u0BB9' | '\u0C05' .. '\u0C0C' | '\u0C0E' .. '\u0C10' | '\u0C12' .. '\u0C28' | '\u0C2A' .. '\u0C33' | '\u0C35' .. '\u0C39' | '\u0C60' .. '\u0C61' | '\u0C85' .. '\u0C8C' | '\u0C8E' .. '\u0C90' | '\u0C92' .. '\u0CA8' | '\u0CAA' .. '\u0CB3' | '\u0CB5' .. '\u0CB9' | '\u0CDE' | '\u0CE0' .. '\u0CE1' | '\u0D05' .. '\u0D0C' | '\u0D0E' .. '\u0D10' | '\u0D12' .. '\u0D28' | '\u0D2A' .. '\u0D39' | '\u0D60' .. '\u0D61' | '\u0D85' .. '\u0D96' | '\u0D9A' .. '\u0DB1' | '\u0DB3' .. '\u0DBB' | '\u0DBD' | '\u0DC0' .. '\u0DC6' | '\u0E01' .. '\u0E30' | '\u0E32' .. '\u0E33' | '\u0E40' .. '\u0E46' | '\u0E81' .. '\u0E82' | '\u0E84' | '\u0E87' .. '\u0E88' | '\u0E8A' | '\u0E8D' | '\u0E94' .. '\u0E97' | '\u0E99' .. '\u0E9F' | '\u0EA1' .. '\u0EA3' | '\u0EA5' | '\u0EA7' | '\u0EAA' .. '\u0EAB' | '\u0EAD' .. '\u0EB0' | '\u0EB2' .. '\u0EB3' | '\u0EBD' .. '\u0EC4' | '\u0EC6' | '\u0EDC' .. '\u0EDD' | '\u0F00' | '\u0F40' .. '\u0F6A' | '\u0F88' .. '\u0F8B' | '\u1000' .. '\u1021' | '\u1023' .. '\u1027' | '\u1029' .. '\u102A' | '\u1050' .. '\u1055' | '\u10A0' .. '\u10C5' | '\u10D0' .. '\u10F6' | '\u1100' .. '\u1159' | '\u115F' .. '\u11A2' | '\u11A8' .. '\u11F9' | '\u1200' .. '\u1206' | '\u1208' .. '\u1246' | '\u1248' | '\u124A' .. '\u124D' | '\u1250' .. '\u1256' | '\u1258' | '\u125A' .. '\u125D' | '\u1260' .. '\u1286' | '\u1288' | '\u128A' .. '\u128D' | '\u1290' .. '\u12AE' | '\u12B0' | '\u12B2' .. '\u12B5' | '\u12B8' .. '\u12BE' | '\u12C0' | '\u12C2' .. '\u12C5' | '\u12C8' .. '\u12CE' | '\u12D0' .. '\u12D6' | '\u12D8' .. '\u12EE' | '\u12F0' .. '\u130E' | '\u1310' | '\u1312' .. '\u1315' | '\u1318' .. '\u131E' | '\u1320' .. '\u1346' | '\u1348' .. '\u135A' | '\u13A0' .. '\u13B0' | '\u13B1' .. '\u13F4' | '\u1401' .. '\u1676' | '\u1681' .. '\u169A' | '\u16A0' .. '\u16EA' | '\u1780' .. '\u17B3' | '\u1820' .. '\u1877' | '\u1880' .. '\u18A8' | '\u1E00' .. '\u1E9B' | '\u1EA0' .. '\u1EE0' | '\u1EE1' .. '\u1EF9' | '\u1F00' .. '\u1F15' | '\u1F18' .. '\u1F1D' | '\u1F20' .. '\u1F39' | '\u1F3A' .. '\u1F45' | '\u1F48' .. '\u1F4D' | '\u1F50' .. '\u1F57' | '\u1F59' | '\u1F5B' | '\u1F5D' | '\u1F5F' .. '\u1F7D' | '\u1F80' .. '\u1FB4' | '\u1FB6' .. '\u1FBC' | '\u1FBE' | '\u1FC2' .. '\u1FC4' | '\u1FC6' .. '\u1FCC' | '\u1FD0' .. '\u1FD3' | '\u1FD6' .. '\u1FDB' | '\u1FE0' .. '\u1FEC' | '\u1FF2' .. '\u1FF4' | '\u1FF6' .. '\u1FFC' | '\u207F' | '\u2102' | '\u2107' | '\u210A' .. '\u2113' | '\u2115' | '\u2119' .. '\u211D' | '\u2124' | '\u2126' | '\u2128' | '\u212A' .. '\u212D' | '\u212F' .. '\u2131' | '\u2133' .. '\u2139' | '\u2160' .. '\u2183' | '\u3005' .. '\u3007' | '\u3021' .. '\u3029' | '\u3031' .. '\u3035' | '\u3038' .. '\u303A' | '\u3041' .. '\u3094' | '\u309D' .. '\u309E' | '\u30A1' .. '\u30FA' | '\u30FC' .. '\u30FE' | '\u3105' .. '\u312C' | '\u3131' .. '\u318E' | '\u31A0' .. '\u31B7' | '\u3400' .. '\u4DB5' | '\u4E00' .. '\u9FA5' | '\uA000' .. '\uA48C' | '\uAC00' | '\uD7A3' | '\uF900' .. '\uFA2D' | '\uFB00' .. '\uFB06' | '\uFB13' .. '\uFB17' | '\uFB1D' | '\uFB1F' .. '\uFB28' | '\uFB2A' .. '\uFB36' | '\uFB38' .. '\uFB3C' | '\uFB3E' | '\uFB40' .. '\uFB41' | '\uFB43' .. '\uFB44' | '\uFB46' .. '\uFBB1' | '\uFBD3' .. '\uFD3D' | '\uFD50' .. '\uFD8F' | '\uFD92' .. '\uFDC7' | '\uFDF0' .. '\uFDFB' | '\uFE70' .. '\uFE72' | '\uFE74' | '\uFE76' .. '\uFEFC' | '\uFF21' .. '\uFF3A' | '\uFF41' .. '\uFF5A' | '\uFF66' .. '\uFFBE' | '\uFFC2' .. '\uFFC7' | '\uFFCA' .. '\uFFCF' | '\uFFD2' .. '\uFFD7' | '\uFFDA' .. '\uFFDC' | '_' | '0' .. '9' | '\u0660' .. '\u0669' | '\u06F0' .. '\u06F9' | '\u0966' .. '\u096F' | '\u09E6' .. '\u09EF' | '\u0A66' .. '\u0A6F' | '\u0AE6' .. '\u0AEF' | '\u0B66' .. '\u0B6F' | '\u0BE7' .. '\u0BEF' | '\u0C66' .. '\u0C6F' | '\u0CE6' .. '\u0CEF' | '\u0D66' .. '\u0D6F' | '\u0E50' .. '\u0E59' | '\u0ED0' .. '\u0ED9' | '\u0F20' .. '\u0F29' | '\u1040' .. '\u1049' | '\u1369' .. '\u1371' | '\u17E0' .. '\u17E9' | '\u1810' .. '\u1819' | '\uFF10' .. '\uFF19';
gen_32: gen_33 | ϵ;
gen_57: 'x' | 'X';
gen_59: EXPONENT | ϵ;
gen_58: '0' .. '9' gen_10 '.' gen_10 gen_59;
gen_62: '0' .. '9' gen_10 gen_60 gen_61 '0' .. '9' gen_10;
gen_63: '.' '0' .. '9' gen_10 gen_59;
gen_60: 'e' | 'E';
gen_61: '+' | '-' | ϵ;
gen_64: DECIMALS | gen_58 | gen_62 | gen_63;
gen_65: UNICODE_CHAR | LITTLE_U_VALUE | BIG_U_VALUE | ESCAPED_CHAR | OCTAL_BYTE_VALUE | HEX_BYTE_VALUE;
gen_45: 'a' | 'b' | 'f' | 'n' | 'r' | 't' | 'v' | '\\' | '\'' | '\"';
gen_41: UNICODE_CHAR | '\n' | '~' | '`';
gen_39: gen_40 | ϵ;
gen_44: '\\\"' | UNICODE_CHAR | LITTLE_U_VALUE | BIG_U_VALUE | ESCAPED_CHAR | OCTAL_BYTE_VALUE | HEX_BYTE_VALUE;
gen_42: gen_43 | ϵ;
gen_93: statement eos statementList;
gen_16: ',' gen_5 gen_6 '=' value gen_15;
gen_25: declaration ';' gen_24;
gen_29: 'case' value ':' gen_26 declaration ';' gen_28;
gen_27: 'case' value ':' gen_26;
gen_14: '0' .. '7' gen_13;
gen_12: HEX_DIGIT gen_11;
gen_7: gen_8 gen_6;
gen_36: 'import' gen_37 eos gen_35;
gen_50: topLevelDecl eos gen_49;
gen_48: gen_38 STRING_LIT eos gen_47;
gen_160: LETTER gen_32 gen_52 gen_54 eos gen_159;
gen_53: ',' LETTER gen_32 gen_52;
gen_97: LETTER gen_32 type eos gen_96;
gen_107: LETTER gen_32 gen_52 gen_99 eos gen_106;
gen_138: exprSwitchCase ':' statementList gen_137;
gen_143: typeSwitchCase ':' statementList gen_142;
gen_146: ',' type gen_145;
gen_148: commCase ':' statementList gen_147;
gen_79: methodSpec eos gen_78;
gen_76: ',' gen_73 gen_74 type gen_75;
gen_157: ',' gen_91 key_element gen_156;
gen_67: gen_68 gen_87 eos gen_66;
gen_33: gen_34 gen_32;
gen_40: gen_41 gen_39;
gen_43: gen_44 gen_42