gen_0: chunk | libraryDefinition | partDeclaration;
chunk: gen_1 gen_51 EOF_0;
stat: ';' | gen_3 | functioncall | label | 'break' | gen_84 | gen_85 | gen_86 | gen_87 | gen_88 | gen_93 | gen_96 | gen_97 | gen_100 | gen_101;
retstat: 'return' gen_52 gen_55;
label: '::' IDENTIFIER_START_NO_DOLLAR gen_5 '::';
explist: exp gen_53;
exp: 'nil' | 'false' | 'true' | INT | HEX | gen_13 | gen_17 | gen_18 | gen_19 | gen_22 | gen_23 | NORMALSTRING | CHARSTRING | LONGSTRING | '...' | functiondef | prefixexp | tableconstructor | gen_66 | gen_67 | gen_68 | gen_69 | gen_70 | gen_71 | gen_72 | gen_73 | gen_74;
prefixexp: varOrExp gen_58;
functioncall: varOrExp gen_60 args gen_58;
varOrExp: var | gen_81;
var: gen_4 gen_56;
args: gen_62 | tableconstructor | NORMALSTRING | CHARSTRING | LONGSTRING;
functiondef: 'function' '(' gen_45 ')' gen_1 gen_51 'end';
tableconstructor: '{' gen_63 '}';
fieldlist: field gen_75 gen_77;
field: gen_64 | gen_65 | 'nil' | 'false' | 'true' | INT | HEX | gen_13 | gen_17 | gen_18 | gen_19 | gen_22 | gen_23 | NORMALSTRING | CHARSTRING | LONGSTRING | '...' | functiondef | prefixexp | tableconstructor | gen_66 | gen_67 | gen_68 | gen_69 | gen_70 | gen_71 | gen_72 | gen_73 | gen_74;
fieldsep: ',' | ';';
operatorComparison: '<' | '>' | '<=' | '>=' | '~=' | '==';
operatorAddSub_additiveOperator: '+' | '-';
operatorMulDivMod: '*' | '/' | '%' | '//';
operatorBitwise: '&' | '|' | '~' | '<<' | '>>';
operatorUnary: 'not' | '#' | '-' | '~';
NAME: IDENTIFIER_START_NO_DOLLAR gen_5;
NORMALSTRING: '\"' gen_24 '\"';
CHARSTRING: '\'' gen_36 '\'';
LONGSTRING: '[' NESTED_STR ']';
NESTED_STR: gen_41 | gen_42;
INT: '0' .. '9' gen_9;
HEX: '0' gen_10 HexDigit_HEX_DIGIT gen_11;
ExponentPart_EXPONENT: gen_15 gen_16 '0' .. '9' gen_9;
HexExponentPart: gen_21 gen_16 '0' .. '9' gen_9;
HexEscape: '\\' 'x' HexDigit_HEX_DIGIT HexDigit_HEX_DIGIT;
UtfEscape: '\\' 'u{' HexDigit_HEX_DIGIT gen_11 '}';
HexDigit_HEX_DIGIT: 'a' .. 'f' | 'A' .. 'F' | '0' .. '9';
declaredIdentifier: metadata finalConstVarOrType IDENTIFIER_START gen_110;
finalConstVarOrType: gen_134 | gen_136 | 'var' | dtype;
varOrType: 'var' | dtype;
formalParameterPart: gen_122 formalParameterList;
functionBody: gen_155 | gen_157;
block: '{' statements '}';
formalParameterList: gen_129 | gen_130 | gen_141 | gen_154;
optionalFormalParameters: optionalPositionalFormalParameters | namedFormalParameters;
optionalPositionalFormalParameters: '[' normalFormalParameter gen_144 gen_146 gen_148 ']';
namedFormalParameters: '{' defaultNamedParameter gen_152 gen_148 '}';
normalFormalParameter: functionFormalParameter | fieldFormalParameter | declaredIdentifier | gen_138;
functionFormalParameter: metadata gen_131 gen_132 IDENTIFIER_START gen_110 gen_122 formalParameterList;
fieldFormalParameter: metadata gen_133 'this' '.' IDENTIFIER_START gen_110 gen_137;
defaultFormalParameter: normalFormalParameter gen_144;
defaultNamedParameter: defaultFormalParameter | gen_149;
mixins: 'with' typeName gen_124 gen_125;
classMemberDefinition: gen_341 | gen_368;
methodSignature: gen_369 | factoryConstructorSignature | gen_371 | gen_372 | gen_373 | operatorSignature;
declaration: gen_342 | gen_350 | gen_351 | gen_352 | gen_353 | gen_357 | gen_358 | gen_360 | gen_361 | gen_365 | gen_366;
operatorSignature: gen_132 'operator' operator formalParameterList;
operator: '~' | '*' | '/' | '%' | '~/' | '+' | '-' | '<<' | '>>' | '>>>' | '>=' | '>' | '<=' | '<' | '==' | '&' | '^' | '|' | '[]' | '[]=';
redirection: ':' 'this' gen_112 '(' gen_115 ')';
initializers: ':' initializerListEntry gen_348;
initializerListEntry: gen_344 | gen_345 | fieldInitializer | assertion;
fieldInitializer: gen_346 IDENTIFIER_START gen_110 '=' equalityExpression gen_212 gen_214 gen_216 gen_218 gen_221;
factoryConstructorSignature: 'factory' IDENTIFIER_START gen_110 gen_112 formalParameterList;
superclass: 'extends' typeName gen_124;
interfaces: 'implements' typeName gen_124 gen_125;
enumType: metadata 'enum' IDENTIFIER_START gen_110 '{' metadata IDENTIFIER_START gen_110 gen_375 gen_148 '}';
typeParameters: '<' metadata IDENTIFIER_START gen_110 gen_123 gen_127 '>';
metadata: gen_109 | ϵ;
expression: gen_118 | gen_167 | throwExpression;
expressionWithoutCascade: gen_220 | conditionalExpression | throwExpressionWithoutCascade;
expressionList: expression gen_230;
primary: 'this' | gen_120 | functionExpression | 'null' | 'true' | 'false' | gen_252 | gen_17 | gen_255 | gen_256 | stringLiteral | symbolLiteral | mapLiteral | listLiteral | IDENTIFIER | nayaExpression | constObjectExpression | gen_312;
stringLiteral: gen_257 gen_301;
StringContentDQ: gen_281 | gen_283;
StringContentSQ: gen_289 | gen_283;
StringContentTDQ: gen_34 | gen_261 | gen_263;
StringContentTSQ: gen_39 | gen_267 | gen_269;
NEWLINE: '\n' | '\r' | '\r\n';
symbolLiteral: '#' gen_302;
listLiteral: gen_305 gen_124 '[' gen_310 ']';
mapLiteral: gen_305 gen_124 '{' gen_306 '}';
throwExpression: 'throw' expression;
throwExpressionWithoutCascade: 'throw' expressionWithoutCascade;
functionExpression: gen_122 formalParameterList functionBody;
nayaExpression: 'new' typeName gen_124 gen_112 '(' gen_115 ')';
constObjectExpression: 'const' typeName gen_124 gen_112 '(' gen_115 ')';
arguments: '(' gen_115 ')';
argumentList: gen_117 | gen_318;
cascadeSelector: gen_121 | IDENTIFIER;
argumentPart: gen_124 '(' gen_115 ')';
assignmentOperator: '=' | '*=' | '/=' | '~/=' | '%=' | '+=' | '<<=' | '>>=' | '>>>=' | '&=' | '^=' | '|=' | '??=';
conditionalExpression: equalityExpression gen_212 gen_214 gen_216 gen_218;
equalityExpression: gen_168 | gen_211;
equalityOperator: '==' | '!=';
relationalExpression: gen_169 | gen_208;
relationalOperator: '>=' | '>' | '<=' | '<';
bitwiseOrExpression: gen_170 | gen_202;
bitwiseXorExpression: gen_171 | gen_199;
bitwiseAndExpression: gen_172 | gen_196;
shiftExpression: gen_173 | gen_193;
shiftOperator: '<<' | '>>' | '>>>';
additiveExpression: gen_174 | gen_190;
multiplicativeExpression: gen_175 | gen_187;
multiplicativeOperator: '*' | '/' | '%' | '~/';
unaryExpression: gen_176 | awaitExpression | gen_177 | gen_178 | gen_182 | gen_184;
prefixOperator: '-' | '!' | '~';
awaitExpression: 'await' unaryExpression;
selector: gen_121 | gen_113 | gen_181 | argumentPart;
incrementOperator: '++' | '--';
assignableExpression: gen_119 | gen_315;
unconditionalAssignableSelector: gen_121 | gen_113;
assignableSelector: gen_121 | gen_113 | gen_181;
qualified: IDENTIFIER_START gen_110 gen_112;
typeTest: 'is' gen_206 typeName gen_124;
typeCast: 'as' typeName gen_124;
statements: gen_159 | ϵ;
nonLabledStatment: block | localVariableDeclaration | forStatement | whileStatement | doStatement | switchStatement | ifStatement | rethrowStatment | tryStatement | breakStatement | continueStatement | returnStatement | yieldStatement | yieldEachStatement | expressionStatement | assertStatement | localFunctionDeclaration;
expressionStatement: gen_166 ';';
localVariableDeclaration: metadata finalConstVarOrType IDENTIFIER_START gen_110 gen_144 gen_162 ';';
localFunctionDeclaration: metadata gen_132 IDENTIFIER_START gen_110 gen_122 formalParameterList functionBody;
ifStatement: 'if' '(' expression ')' gen_160 nonLabledStatment gen_237;
forStatement: gen_164 'for' '(' forLoopParts ')' gen_160 nonLabledStatment;
forLoopParts: gen_165 | gen_232 | gen_233;
forInitializerStatement: localVariableDeclaration | expressionStatement;
whileStatement: 'while' '(' expression ')' gen_160 nonLabledStatment;
doStatement: 'do' gen_160 nonLabledStatment 'while' '(' expression ')' ';';
switchStatement: 'switch' '(' expression ')' '{' gen_234 gen_236 '}';
defaultCase: gen_160 'default' ':' statements;
rethrowStatment: 'rethrow' ';';
tryStatement: 'try' '{' statements '}' gen_239;
onPart: gen_241 | gen_244;
catchPart: 'catch' '(' IDENTIFIER_START gen_110 gen_242 ')';
finallyPart: 'finally' '{' statements '}';
returnStatement: 'return' gen_166 ';';
breakStatement: 'break' gen_249 ';';
continueStatement: 'continue' gen_249 ';';
yieldStatement: 'yield' expression ';';
yieldEachStatement: 'yield*' expression ';';
assertStatement: 'assert' '(' expression gen_250 gen_148 ')' ';';
assertion: 'assert' '(' expression gen_250 gen_148 ')';
topLevelDefinition: gen_335 | gen_374 | enumType | typeAlias | gen_377 | gen_378 | gen_379 | localFunctionDeclaration | gen_380 | gen_381 | gen_382 | gen_383;
libraryDefinition: gen_104 gen_108 gen_319 gen_331 gen_333;
scriptTag: '#!' gen_105 NEWLINE;
libraryName: metadata 'library' IDENTIFIER_START gen_110 gen_303 ';';
importOrExport: libraryimport | libraryExport;
dottedIdentifierList_identifierList: IDENTIFIER_START gen_110 gen_303;
libraryimport: metadata 'import' gen_257 gen_301 gen_321 gen_325 gen_327 ';';
combinator: gen_329 | gen_330;
libraryExport: metadata 'export' gen_257 gen_301 gen_321 gen_327 ';';
partDeclaration: metadata 'part' 'of' IDENTIFIER_START gen_110 gen_384 ';' gen_333 EOF_1;
dtype: typeName gen_124;
typeName: qualified | 'void';
typeArguments: '<' typeName gen_124 gen_125 '>';
typeAlias: metadata 'typedef' gen_132 IDENTIFIER_START gen_110 gen_122 formalParameterList ';';
IDENTIFIER: IDENTIFIER_START gen_110;
IDENTIFIER_START: 'a' .. 'z' | 'A' .. 'Z' | '_' | '$';
IDENTIFIER_START_NO_DOLLAR: 'a' .. 'z' | 'A' .. 'Z' | '_';
IDENTIFIER_PART: 'a' .. 'z' | 'A' .. 'Z' | '_' | '$' | '0' .. '9';
gen_1: gen_2 | ϵ;
gen_51: retstat | ϵ;
gen_3: gen_4 gen_56 gen_82 '=' exp gen_53;
gen_84: 'goto' IDENTIFIER_START_NO_DOLLAR gen_5;
gen_85: 'do' gen_1 gen_51 'end';
gen_86: 'while' exp 'do' gen_1 gen_51 'end';
gen_87: 'repeat' gen_1 gen_51 'until' exp;
gen_89: gen_90 | ϵ;
gen_92: 'else' gen_1 gen_51;
gen_91: gen_92 | ϵ;
gen_88: 'if' exp 'then' gen_1 gen_51 gen_89 gen_91 'end';
gen_95: ',' exp;
gen_94: gen_95 | ϵ;
gen_93: 'for' IDENTIFIER_START_NO_DOLLAR gen_5 '=' exp ',' exp gen_94 'do' gen_1 gen_51 'end';
gen_96: 'for' IDENTIFIER_START_NO_DOLLAR gen_5 gen_47 'in' exp gen_53 'do' gen_1 gen_51 'end';
gen_97: 'function' IDENTIFIER_START_NO_DOLLAR gen_5 gen_98 gen_60 '(' gen_45 ')' gen_1 gen_51 'end';
gen_100: 'local' 'function' IDENTIFIER_START_NO_DOLLAR gen_5 '(' gen_45 ')' gen_1 gen_51 'end';
gen_103: '=' exp gen_53;
gen_102: gen_103 | ϵ;
gen_101: 'local' IDENTIFIER_START_NO_DOLLAR gen_5 gen_47 gen_102;
gen_52: explist | ϵ;
gen_55: ';' | ϵ;
gen_80: '.' IDENTIFIER_START_NO_DOLLAR gen_5;
gen_98: gen_99 | ϵ;
gen_61: ':' IDENTIFIER_START_NO_DOLLAR gen_5;
gen_60: gen_61 | ϵ;
gen_82: gen_83 | ϵ;
gen_47: gen_48 | ϵ;
gen_53: gen_54 | ϵ;
gen_66: exp '^' exp;
gen_67: operatorUnary exp;
gen_68: exp operatorMulDivMod exp;
gen_69: exp operatorAddSub_additiveOperator exp;
gen_70: exp '..' exp;
gen_71: exp operatorComparison exp;
gen_72: exp 'and' exp;
gen_73: exp 'or' exp;
gen_74: exp operatorBitwise exp;
gen_58: gen_59 | ϵ;
gen_81: '(' exp ')';
gen_8: '(' exp ')' gen_58 gen_78;
gen_4: NAME | gen_8;
gen_56: gen_57 | ϵ;
gen_79: '[' exp ']';
gen_78: gen_79 | gen_80;
gen_62: '(' gen_52 ')';
gen_45: gen_46 | '...' | ϵ;
gen_50: ',' '...';
gen_49: gen_50 | ϵ;
gen_46: IDENTIFIER_START_NO_DOLLAR gen_5 gen_47 gen_49;
gen_63: fieldlist | ϵ;
gen_75: gen_76 | ϵ;
gen_77: ',' | ';' | ϵ;
gen_64: '[' exp ']' '=' exp;
gen_65: IDENTIFIER_START_NO_DOLLAR gen_5 '=' exp;
gen_7: 'a' .. 'z' | 'A' .. 'Z' | '_' | '0' .. '9';
gen_5: gen_6 | ϵ;
gen_35: '\\' | '\"';
gen_34: ~gen_35;
gen_26: gen_27 | gen_29 | gen_31 | gen_32 | gen_33 | HexEscape | UtfEscape | gen_34;
gen_24: gen_25 | ϵ;
gen_40: '\\' | '\'';
gen_39: ~gen_40;
gen_38: gen_27 | gen_29 | gen_31 | gen_32 | gen_33 | HexEscape | UtfEscape | gen_39;
gen_36: gen_37 | ϵ;
gen_41: '=' NESTED_STR '=';
gen_43: gen_44 | ϵ;
gen_42: '[' gen_43 ']';
gen_9: INT | ϵ;
gen_10: 'x' | 'X';
gen_11: gen_12 | ϵ;
gen_14: ExponentPart_EXPONENT | ϵ;
gen_13: '0' .. '9' gen_9 '.' gen_9 gen_14;
gen_17: '.' '0' .. '9' gen_9 gen_14;
gen_18: '0' .. '9' gen_9 gen_15 gen_16 '0' .. '9' gen_9;
gen_20: HexExponentPart | ϵ;
gen_19: '0' gen_10 HexDigit_HEX_DIGIT gen_11 '.' gen_11 gen_20;
gen_22: '0' gen_10 '.' HexDigit_HEX_DIGIT gen_11 gen_20;
gen_23: '0' gen_10 HexDigit_HEX_DIGIT gen_11 gen_21 gen_16 '0' .. '9' gen_9;
gen_15: 'e' | 'E';
gen_16: '+' | '-' | ϵ;
gen_21: 'p' | 'P';
gen_28: 'a' | 'b' | 'f' | 'n' | 'r' | 't' | 'v' | 'z' | '\"' | '\'' | '\\';
gen_27: '\\' gen_28;
gen_30: '\r' | ϵ;
gen_29: '\\' gen_30 '\n';
gen_31: '\\' '0' .. '9';
gen_32: '\\' '0' .. '9' '0' .. '9';
gen_33: '\\' '0' .. '2' '0' .. '9' '0' .. '9';
gen_243: ',' IDENTIFIER_START gen_110;
gen_303: gen_304 | ϵ;
gen_135: dtype | ϵ;
gen_134: 'final' gen_135;
gen_136: 'const' gen_135;
gen_145: '=' expression;
gen_144: gen_145 | ϵ;
gen_162: gen_163 | ϵ;
gen_132: 'void' | dtype | ϵ;
gen_122: typeParameters | ϵ;
gen_156: 'async' | ϵ;
gen_155: gen_156 '=>' expression ';';
gen_158: 'async' | 'async*' | 'sync*' | ϵ;
gen_157: gen_158 '{' statements '}';
gen_129: '(' ')';
gen_130: '(' normalFormalParameter gen_139 ')';
gen_143: ',' optionalFormalParameters;
gen_142: gen_143 | ϵ;
gen_141: '(' normalFormalParameter gen_139 gen_142 ')';
gen_154: '(' optionalFormalParameters ')';
gen_139: gen_140 | ϵ;
gen_146: gen_147 | ϵ;
gen_148: ',' | ϵ;
gen_152: gen_153 | ϵ;
gen_131: 'covariant' | ϵ;
gen_138: metadata gen_131 IDENTIFIER_START gen_110;
gen_133: gen_134 | gen_136 | 'var' | dtype | ϵ;
gen_137: formalParameterPart | ϵ;
gen_151: ':' expression;
gen_150: gen_151 | ϵ;
gen_149: normalFormalParameter gen_150;
gen_336: 'abstract' | ϵ;
gen_123: superclass | ϵ;
gen_337: mixins | ϵ;
gen_338: interfaces | ϵ;
gen_339: gen_340 | ϵ;
gen_335: metadata gen_336 'class' IDENTIFIER_START gen_110 gen_122 gen_123 gen_337 gen_338 '{' gen_339 '}';
gen_374: metadata gen_336 'class' IDENTIFIER_START gen_110 gen_122 '=' typeName gen_124 'with' typeName gen_124 gen_125 gen_338 ';';
gen_341: declaration ';';
gen_368: methodSignature functionBody;
gen_370: initializers | ϵ;
gen_369: IDENTIFIER_START gen_110 gen_112 formalParameterList gen_370;
gen_356: 'static' | ϵ;
gen_371: gen_356 metadata gen_132 IDENTIFIER_START gen_110 gen_122 formalParameterList;
gen_372: gen_356 gen_132 'get' IDENTIFIER_START gen_110;
gen_373: gen_356 gen_132 'set' IDENTIFIER_START gen_110 formalParameterList;
gen_343: redirection | initializers | ϵ;
gen_342: 'const' IDENTIFIER_START gen_110 gen_112 formalParameterList gen_343;
gen_350: IDENTIFIER_START gen_110 gen_112 formalParameterList gen_343;
gen_351: 'external' 'const' IDENTIFIER_START gen_110 gen_112 formalParameterList;
gen_352: 'external' IDENTIFIER_START gen_110 gen_112 formalParameterList;
gen_355: 'external' gen_356;
gen_354: gen_355 | ϵ;
gen_353: gen_354 gen_132 'get' IDENTIFIER_START gen_110;
gen_357: gen_354 gen_132 'set' IDENTIFIER_START gen_110 formalParameterList;
gen_359: 'external' | ϵ;
gen_358: gen_359 gen_132 'operator' operator formalParameterList;
gen_360: gen_354 metadata gen_132 IDENTIFIER_START gen_110 gen_122 formalParameterList;
gen_362: 'final' | 'const';
gen_361: 'static' gen_362 gen_135 IDENTIFIER_START gen_110 '=' expression gen_363;
gen_365: 'final' gen_135 IDENTIFIER_START gen_110 gen_144 gen_162;
gen_367: 'static' | 'covariant' | ϵ;
gen_366: gen_367 varOrType IDENTIFIER_START gen_110 gen_144 gen_162;
gen_363: gen_364 | ϵ;
gen_113: '.' IDENTIFIER_START gen_110;
gen_112: gen_113 | ϵ;
gen_348: gen_349 | ϵ;
gen_344: 'super' '(' gen_115 ')';
gen_345: 'super' '.' IDENTIFIER_START gen_110 '(' gen_115 ')';
gen_347: 'this' '.';
gen_346: gen_347 | ϵ;
gen_221: gen_222 | ϵ;
gen_375: gen_376 | ϵ;
gen_127: gen_128 | ϵ;
gen_114: arguments | ϵ;
gen_118: assignableExpression assignmentOperator expression;
gen_167: equalityExpression gen_212 gen_214 gen_216 gen_218 gen_221;
gen_220: assignableExpression assignmentOperator expressionWithoutCascade;
gen_251: ',' expression;
gen_230: gen_231 | ϵ;
gen_120: 'super' unconditionalAssignableSelector;
gen_312: '(' expression ')';
gen_254: '.' '0' .. '9' gen_9;
gen_253: gen_254 | ϵ;
gen_252: '0' .. '9' gen_9 gen_253 gen_14;
gen_255: '0x' HexDigit_HEX_DIGIT gen_11;
gen_256: '0X' HexDigit_HEX_DIGIT gen_11;
gen_257: gen_258 | gen_264 | gen_270 | gen_274 | gen_278 | gen_286 | gen_291 | gen_296;
gen_301: stringLiteral | ϵ;
gen_279: gen_280 | ϵ;
gen_278: '\"' gen_279 '\"';
gen_287: gen_288 | ϵ;
gen_286: '\'' gen_287 '\'';
gen_295: '\'' | '\n' | '\r';
gen_294: ~gen_295;
gen_292: gen_293 | ϵ;
gen_291: 'r\'' gen_292 '\'';
gen_300: '\"' | '\n' | '\r';
gen_299: ~gen_300;
gen_297: gen_298 | ϵ;
gen_296: 'r\"' gen_297 '\"';
gen_282: '\\' | '\"' | '\n' | '\r';
gen_281: ~gen_282;
gen_285: '\n' | '\r';
gen_284: ~gen_285;
gen_283: '\\' gen_284;
gen_290: '\\' | '\'' | '\n' | '\r';
gen_289: ~gen_290;
gen_259: gen_260 | ϵ;
gen_258: '\"\"\"' gen_259 '\"\"\"';
gen_265: gen_266 | ϵ;
gen_264: '\'\'\'' gen_265 '\'\'\'';
gen_262: ~'\"';
gen_261: '\"' gen_262;
gen_263: '\"\"' gen_262;
gen_273: gen_262 | gen_261 | gen_263;
gen_271: gen_272 | ϵ;
gen_270: 'r\"\"\"' gen_271 '\"\"\"';
gen_268: ~'\'';
gen_267: '\'' gen_268;
gen_269: '\'\'' gen_268;
gen_277: gen_268 | gen_267 | gen_269;
gen_275: gen_276 | ϵ;
gen_274: 'r\'\'\'' gen_275 '\'\'\'';
gen_302: '~' | '*' | '/' | '%' | '~/' | '+' | '-' | '<<' | '>>' | '>>>' | '>=' | '>' | '<=' | '<' | '==' | '&' | '^' | '|' | '[]' | '[]=' | dottedIdentifierList_identifierList;
gen_305: 'const' | ϵ;
gen_124: typeArguments | ϵ;
gen_311: expression gen_230 gen_148;
gen_310: gen_311 | ϵ;
gen_308: gen_309 | ϵ;
gen_307: expression ':' expression gen_308 gen_148;
gen_306: gen_307 | ϵ;
gen_116: argumentList gen_148;
gen_115: gen_116 | ϵ;
gen_316: gen_317 | ϵ;
gen_117: IDENTIFIER_START gen_110 ':' expression gen_316;
gen_318: expression gen_230 gen_316;
gen_223: gen_224 | ϵ;
gen_225: gen_226 | ϵ;
gen_228: assignmentOperator expressionWithoutCascade;
gen_227: gen_228 | ϵ;
gen_121: '[' expression ']';
gen_219: '?' expressionWithoutCascade ':' expressionWithoutCascade;
gen_218: gen_219 | ϵ;
gen_216: gen_217 | ϵ;
gen_214: gen_215 | ϵ;
gen_212: gen_213 | ϵ;
gen_210: equalityOperator relationalExpression;
gen_209: gen_210 | ϵ;
gen_168: relationalExpression gen_209;
gen_211: 'super' equalityOperator relationalExpression;
gen_207: relationalOperator bitwiseOrExpression;
gen_205: typeTest | typeCast | gen_207 | ϵ;
gen_169: bitwiseOrExpression gen_205;
gen_208: 'super' relationalOperator bitwiseOrExpression;
gen_200: gen_201 | ϵ;
gen_170: bitwiseXorExpression gen_200;
gen_203: gen_204 | ϵ;
gen_202: 'super' '|' bitwiseOrExpression gen_203;
gen_197: gen_198 | ϵ;
gen_171: bitwiseAndExpression gen_197;
gen_199: 'super' '^' bitwiseAndExpression gen_197;
gen_194: gen_195 | ϵ;
gen_172: shiftExpression gen_194;
gen_196: 'super' '&' shiftExpression gen_194;
gen_191: gen_192 | ϵ;
gen_173: additiveExpression gen_191;
gen_193: 'super' shiftOperator additiveExpression gen_191;
gen_188: gen_189 | ϵ;
gen_174: multiplicativeExpression gen_188;
gen_190: 'super' operatorAddSub_additiveOperator multiplicativeExpression gen_188;
gen_185: gen_186 | ϵ;
gen_175: unaryExpression gen_185;
gen_187: 'super' multiplicativeOperator unaryExpression gen_185;
gen_176: prefixOperator unaryExpression;
gen_183: '-' | '~';
gen_182: gen_183 'super';
gen_184: incrementOperator assignableExpression;
gen_177: assignableExpression incrementOperator;
gen_179: gen_180 | ϵ;
gen_178: primary gen_179;
gen_314: gen_223 assignableSelector;
gen_313: gen_314 | ϵ;
gen_119: primary gen_313;
gen_315: 'super' unconditionalAssignableSelector IDENTIFIER_START gen_110;
gen_181: '?.' IDENTIFIER_START gen_110;
gen_206: '!' | ϵ;
gen_160: gen_161 | ϵ;
gen_166: gen_118 | gen_167 | throwExpression | ϵ;
gen_238: 'else' gen_160 nonLabledStatment;
gen_237: gen_238 | ϵ;
gen_164: 'await' | ϵ;
gen_229: expressionList | ϵ;
gen_165: forInitializerStatement gen_166 ';' gen_229;
gen_232: metadata finalConstVarOrType IDENTIFIER_START gen_110 'in' expression;
gen_233: IDENTIFIER_START gen_110 'in' expression;
gen_234: gen_235 | ϵ;
gen_236: defaultCase | ϵ;
gen_246: gen_247 | ϵ;
gen_248: finallyPart | ϵ;
gen_240: onPart gen_246 gen_248;
gen_239: gen_240 | finallyPart;
gen_241: 'catch' '(' IDENTIFIER_START gen_110 gen_242 ')' '{' statements '}';
gen_245: catchPart | ϵ;
gen_244: 'on' typeName gen_124 gen_245 '{' statements '}';
gen_242: gen_243 | ϵ;
gen_249: IDENTIFIER | ϵ;
gen_250: gen_251 | ϵ;
gen_377: gen_359 metadata gen_132 IDENTIFIER_START gen_110 gen_122 formalParameterList ';';
gen_378: gen_359 gen_132 'get' IDENTIFIER_START gen_110 ';';
gen_379: gen_359 gen_132 'set' IDENTIFIER_START gen_110 formalParameterList ';';
gen_380: gen_132 'get' IDENTIFIER_START gen_110 functionBody;
gen_381: gen_132 'set' IDENTIFIER_START gen_110 formalParameterList functionBody;
gen_382: gen_362 gen_135 IDENTIFIER_START gen_110 '=' expression gen_363 ';';
gen_383: metadata finalConstVarOrType IDENTIFIER_START gen_110 gen_303 ';';
gen_104: scriptTag | ϵ;
gen_108: libraryName | ϵ;
gen_319: gen_320 | ϵ;
gen_331: gen_332 | ϵ;
gen_333: gen_334 | ϵ;
gen_107: ~NEWLINE;
gen_105: gen_106 | ϵ;
gen_326: 'as' IDENTIFIER_START gen_110;
gen_325: gen_326 | ϵ;
gen_327: gen_328 | ϵ;
gen_329: 'show' IDENTIFIER_START gen_110 gen_303;
gen_330: 'hide' IDENTIFIER_START gen_110 gen_303;
gen_384: gen_385 | ϵ;
gen_321: gen_322 | ϵ;
gen_324: '==' gen_257 gen_301;
gen_323: gen_324 | ϵ;
gen_125: gen_126 | ϵ;
gen_110: gen_111 | ϵ;
gen_109: '@' IDENTIFIER_START gen_110 gen_112 gen_112 gen_114 metadata;
gen_159: gen_160 nonLabledStatment statements;
gen_2: stat gen_1;
gen_90: 'elseif' exp 'then' gen_1 gen_51 gen_89;
gen_99: '.' IDENTIFIER_START_NO_DOLLAR gen_5 gen_98;
gen_83: ',' gen_4 gen_56 gen_82;
gen_48: ',' IDENTIFIER_START_NO_DOLLAR gen_5 gen_47;
gen_54: ',' exp gen_53;
gen_59: gen_60 args gen_58;
gen_57: gen_58 gen_78 gen_56;
gen_76: fieldsep field gen_75;
gen_6: gen_7 gen_5;
gen_25: gen_26 gen_24;
gen_37: gen_38 gen_36;
gen_44: . gen_43;
gen_12: HexDigit_HEX_DIGIT gen_11;
gen_304: ',' IDENTIFIER_START gen_110 gen_303;
gen_163: ',' IDENTIFIER_START gen_110 gen_144 gen_162;
gen_140: ',' normalFormalParameter gen_139;
gen_147: ',' normalFormalParameter gen_144 gen_146;
gen_153: ',' defaultNamedParameter gen_152;
gen_340: metadata classMemberDefinition gen_339;
gen_364: ',' IDENTIFIER_START gen_110 '=' expression gen_363;
gen_349: ',' initializerListEntry gen_348;
gen_222: '..' cascadeSelector gen_223 gen_225 gen_227 gen_221;
gen_376: ',' metadata IDENTIFIER_START gen_110 gen_375;
gen_128: ',' metadata IDENTIFIER_START gen_110 gen_123 gen_127;
gen_231: ',' expression gen_230;
gen_280: StringContentDQ gen_279;
gen_288: StringContentSQ gen_287;
gen_293: gen_294 gen_292;
gen_298: gen_299 gen_297;
gen_260: StringContentTDQ gen_259;
gen_266: StringContentTSQ gen_265;
gen_272: gen_273 gen_271;
gen_276: gen_277 gen_275;
gen_309: ',' expression ':' expression gen_308;
gen_317: ',' IDENTIFIER_START gen_110 ':' expression gen_316;
gen_224: gen_124 '(' gen_115 ')' gen_223;
gen_226: assignableSelector gen_223 gen_225;
gen_217: '??' equalityExpression gen_212 gen_214 gen_216;
gen_215: '||' equalityExpression gen_212 gen_214;
gen_213: '&&' equalityExpression gen_212;
gen_201: '|' bitwiseXorExpression gen_200;
gen_204: '|' bitwiseOrExpression gen_203;
gen_198: '^' bitwiseAndExpression gen_197;
gen_195: '&' shiftExpression gen_194;
gen_192: shiftOperator additiveExpression gen_191;
gen_189: operatorAddSub_additiveOperator multiplicativeExpression gen_188;
gen_186: multiplicativeOperator unaryExpression gen_185;
gen_180: selector gen_179;
gen_161: IDENTIFIER_START gen_110 ':' gen_160;
gen_235: gen_160 'case' expression ':' statements gen_234;
gen_247: onPart gen_246;
gen_320: importOrExport gen_319;
gen_332: metadata 'part' gen_257 gen_301 ';' gen_331;
gen_334: topLevelDefinition gen_333;
gen_106: gen_107 gen_105;
gen_328: combinator gen_327;
gen_385: '.' IDENTIFIER_START gen_110 gen_384;
gen_322: 'if' '(' IDENTIFIER_START gen_110 gen_303 gen_323 ')' gen_257 gen_301 gen_321;
gen_126: ',' typeName gen_124 gen_125;
gen_111: IDENTIFIER_PART gen_110