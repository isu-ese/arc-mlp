gen_0: file | translationUnit;
file: gen_1 gen_6 EOF_0;
ncl: null_clause gen_1;
null_clause: gen_2 | label_list | STMT_INCLUDE;
delim: SEMICOL | EOL;
label_list: label COLON_0 gen_3 gen_5;
label: VAR_SYMBOL | CONST_SYMBOL | NUMBER;
instruction_list: instruction gen_6;
instruction: do_ | if_ | select_ | gen_53;
single_instruction: assignment | address_ | arg_ | call_ | drop_ | exit_ | interpret_ | iterate_ | leave_ | KWD_NOP | numeric_ | options_ | parse_ | procedure_ | pull_ | push_ | queue_ | return_ | say_ | signal_ | trace_ | upper_ | expression_0;
assignment: gen_9 EQ gen_10 term gen_16 gen_18 gen_20 gen_22 gen_25 gen_27 gen_29;
do_: KWD_DO gen_7 gen_44 null_clause gen_1 gen_6 KWD_END gen_47 gen_1;
dot: KWD_TO gen_10 term gen_16 gen_18 gen_20 gen_22 gen_25 gen_27 gen_29;
dob: KWD_BY gen_10 term gen_16 gen_18 gen_20 gen_22 gen_25 gen_27 gen_29;
dof: KWD_FOR gen_10 term gen_16 gen_18 gen_20 gen_22 gen_25 gen_27 gen_29;
if_: KWD_IF gen_10 term gen_16 gen_18 gen_20 gen_22 gen_25 gen_27 gen_29 gen_3 KWD_THEN gen_1 instruction gen_48;
select_: KWD_SELECT delim gen_3 KWD_WHEN gen_10 term gen_16 gen_18 gen_20 gen_22 gen_25 gen_27 gen_29 gen_3 KWD_THEN gen_1 instruction gen_50 gen_52 KWD_END gen_1;
otherwise_: KWD_OTHERWISE gen_3 gen_6;
address_: KWD_ADDRESS gen_54;
taken_constant: VAR_SYMBOL | SPECIAL_VAR | CONST_SYMBOL | NUMBER | STRING;
valueexp: KWD_VALUE gen_10 term gen_16 gen_18 gen_20 gen_22 gen_25 gen_27 gen_29;
arg_: KWD_ARG gen_57;
call_: KWD_CALL gen_64;
callable_condition: KWD_ERROR | KWD_FAILURE | KWD_HALT;
expression_list: gen_14 gen_10 term gen_16 gen_18 gen_20 gen_22 gen_25 gen_27 gen_29 gen_31;
drop_: KWD_DROP gen_71 gen_72;
vref: BR_O var_symbol BR_C;
var_symbol: VAR_SYMBOL | SPECIAL_VAR;
exit_: KWD_EXIT gen_56;
interpret_: KWD_INTERPRET gen_10 term gen_16 gen_18 gen_20 gen_22 gen_25 gen_27 gen_29;
iterate_: KWD_ITERATE gen_47;
leave_: KWD_LEAVE gen_47;
numeric_: KWD_NUMERIC gen_74;
numeric_digits: KWD_DIGITS gen_56;
numeric_form: KWD_FORM gen_75;
numeric_fuzz: KWD_FUZZ gen_56;
options_: KWD_OPTIONS gen_10 term gen_16 gen_18 gen_20 gen_22 gen_25 gen_27 gen_29;
parse_: KWD_PARSE gen_76 parse_type gen_57;
parse_type: KWD_ARG | KWD_EXTERNAL | KWD_NUMERIC | KWD_PULL | KWD_SOURCE | KWD_VERSION | parse_value | parse_var;
parse_value: KWD_VALUE gen_56 KWD_WITH;
parse_var: KWD_VAR var_symbol;
procedure_: KWD_PROCEDURE gen_77;
pull_: KWD_PULL gen_57;
push_: KWD_PUSH gen_56;
queue_: KWD_QUEUE gen_56;
return_: KWD_RETURN gen_56;
say_: KWD_SAY gen_56;
signal_: KWD_SIGNAL gen_79;
condition: KWD_ERROR | KWD_FAILURE | KWD_HALT | KWD_NOVALUE | KWD_SYNTAX;
trace_: KWD_TRACE gen_82;
upper_: KWD_UPPER var_symbol gen_83;
template_list: gen_14 gen_58 gen_60 gen_62;
position_: NUMBER | vref;
relative_positional: additive_operator position_;
expression_0: gen_10 term gen_16 gen_18 gen_20 gen_22 gen_25 gen_27 gen_29;
or_operator: OR_0 | XOR;
comparison_operator: EQ | CMP_NEq | CMP_LM | CMP_ML | CMP_M | CMP_L | CMP_MEq | CMP_LEq | CMP_NM | CMP_NL | CMPS_Eq | CMPS_Neq | CMPS_M | CMPS_L | CMPS_MEq | CMPS_LEq | CMPS_NM | CMPS_NL;
additive_operator: PLUS | MINUS;
multiplicative_operator: MUL_0 | DIV_0 | QUOTINENT | REMAINDER;
term: function_ | gen_33 | VAR_SYMBOL | SPECIAL_VAR | CONST_SYMBOL | NUMBER | STRING;
function_: function_name BR_O gen_13 BR_C;
function_name: KWD_ADDRESS | KWD_ARG | KWD_DIGITS | KWD_FORM | KWD_FUZZ | KWD_TRACE | KWD_VALUE | VAR_SYMBOL | SPECIAL_VAR | CONST_SYMBOL | NUMBER | STRING;
function_parameters: BR_O gen_13 BR_C;
translationUnit: gen_85 EOF_1;
topLevelDeclaration: importDeclaration | functionDeclaration | functionCallExpression | enumDeclaration | varDeclaration | typedefDeclaration | classInterface | classImplementation | categoryInterface | categoryImplementation | protocolDeclaration | protocolDeclarationList | classDeclarationList | functionDefinition;
importDeclaration: '@import' identifier ';';
classInterface: gen_299 '@interface' identifier gen_128 gen_300 gen_302 gen_303 gen_307 '@end';
categoryInterface: '@interface' identifier gen_128 LP gen_141 RP gen_302 gen_303 gen_307 '@end';
classImplementation: '@implementation' identifier gen_128 gen_300 gen_303 gen_324 '@end';
categoryImplementation: '@implementation' identifier gen_128 LP identifier RP gen_324 '@end';
genericTypeSpecifier: identifier gen_128;
protocolDeclaration: '@protocol' protocolName gen_302 gen_333 '@end';
protocolDeclarationSection: gen_335 | gen_338;
protocolDeclarationList: '@protocol' protocolName gen_132 ';';
classDeclarationList: '@class' identifier gen_339 ';';
propertyDeclaration: '@property' gen_316 gen_322 gen_323 gen_127 gen_142 fieldDeclarator gen_177 gen_179 ';';
propertyAttribute: ATOMIC | NONATOMIC | STRONG | WEAK | RETAIN | ASSIGN | UNSAFE_UNRETAINED | COPY | READONLY | READWRITE | gen_318 | gen_319 | NULL_UNSPECIFIED | NULLABLE | NONNULL | NULL_RESETTABLE | IDENTIFIER | BOOL | Class | BYCOPY | BYREF | ID | IMP | IN | INOUT | ONEWAY | OUT | PROTOCOL_ | SEL | SELF | SUPER | AUTORELEASING_QUALIFIER | BLOCK | BRIDGE_RETAINED | BRIDGE_TRANSFER | COVARIANT | CONTRAVARIANT | DEPRECATED | KINDOF | UNUSED | NS_INLINE | NS_ENUM | NS_OPTIONS | GETTER | SETTER | IB_OUTLET | IB_OUTLET_COLLECTION | IB_INSPECTABLE | IB_DESIGNABLE;
protocolName: gen_129 | gen_130;
instanceVariables: '{' gen_304 '}';
visibilitySection: gen_306 | gen_185;
accessModifier: PRIVATE | PROTECTED | PACKAGE | PUBLIC;
interfaceDeclarationList: gen_308 gen_307;
classMethodDeclaration: '+' gen_309 methodSelector gen_179 ';';
instanceMethodDeclaration: '-' gen_309 methodSelector gen_179 ';';
implementationDefinitionList: gen_325 gen_324;
classMethodDefinition: '+' gen_309 methodSelector gen_326 gen_234 '{' gen_217 '}';
instanceMethodDefinition: '-' gen_309 methodSelector gen_326 gen_234 '{' gen_217 '}';
methodSelector: IDENTIFIER | BOOL | Class | BYCOPY | BYREF | ID | IMP | IN | INOUT | ONEWAY | OUT | PROTOCOL_ | SEL | SELF | SUPER | ATOMIC | NONATOMIC | RETAIN | AUTORELEASING_QUALIFIER | BLOCK | BRIDGE_RETAINED | BRIDGE_TRANSFER | COVARIANT | CONTRAVARIANT | DEPRECATED | KINDOF | UNUSED | NS_INLINE | NS_ENUM | NS_OPTIONS | NULL_UNSPECIFIED | NULLABLE | NONNULL | NULL_RESETTABLE | ASSIGN | COPY | GETTER | SETTER | STRONG | READONLY | READWRITE | WEAK | UNSAFE_UNRETAINED | IB_OUTLET | IB_OUTLET_COLLECTION | IB_INSPECTABLE | IB_DESIGNABLE | 'return' | gen_310;
methodType: LP typeName RP;
blockType: gen_152 typeSpecifier gen_152 LP '^' gen_156 RP gen_172;
genericsSpecifier: LT gen_134 GT;
dictionaryExpression: '@' '{' gen_289 '}';
arrayExpression: '@' '[' gen_271 ']';
blockParameters: LP gen_153 RP;
typeVariableDeclaratorOrName: typeVariableDeclarator | gen_126 | blockType;
blockExpression: '^' gen_295 gen_152 gen_172 '{' gen_217 '}';
messageExpression: '[' receiver_argumentExpression messageSelector ']';
receiver_argumentExpression: gen_104 | gen_106 | gen_120 | gen_122 | gen_124 | gen_125 | gen_197 | gen_199 | gen_201 | gen_205 | gen_207 | gen_209 | gen_210 | gen_211 | gen_212 | gen_213 | gen_214 | gen_216 | gen_270 | 'void' | 'char' | 'short' | 'int' | 'long' | 'float' | 'double' | 'signed' | 'unsigned' | typeofExpression | genericTypeSpecifier | structOrUnionSpecifier | gen_157 | gen_169 | gen_171;
messageSelector: IDENTIFIER | BOOL | Class | BYCOPY | BYREF | ID | IMP | IN | INOUT | ONEWAY | OUT | PROTOCOL_ | SEL | SELF | SUPER | ATOMIC | NONATOMIC | RETAIN | AUTORELEASING_QUALIFIER | BLOCK | BRIDGE_RETAINED | BRIDGE_TRANSFER | COVARIANT | CONTRAVARIANT | DEPRECATED | KINDOF | UNUSED | NS_INLINE | NS_ENUM | NS_OPTIONS | NULL_UNSPECIFIED | NULLABLE | NONNULL | NULL_RESETTABLE | ASSIGN | COPY | GETTER | SETTER | STRONG | READONLY | READWRITE | WEAK | UNSAFE_UNRETAINED | IB_OUTLET | IB_OUTLET_COLLECTION | IB_INSPECTABLE | IB_DESIGNABLE | 'return' | gen_278;
selectorExpression: '@selector' LP selectorName RP;
selectorName: IDENTIFIER | BOOL | Class | BYCOPY | BYREF | ID | IMP | IN | INOUT | ONEWAY | OUT | PROTOCOL_ | SEL | SELF | SUPER | ATOMIC | NONATOMIC | RETAIN | AUTORELEASING_QUALIFIER | BLOCK | BRIDGE_RETAINED | BRIDGE_TRANSFER | COVARIANT | CONTRAVARIANT | DEPRECATED | KINDOF | UNUSED | NS_INLINE | NS_ENUM | NS_OPTIONS | NULL_UNSPECIFIED | NULLABLE | NONNULL | NULL_RESETTABLE | ASSIGN | COPY | GETTER | SETTER | STRONG | READONLY | READWRITE | WEAK | UNSAFE_UNRETAINED | IB_OUTLET | IB_OUTLET_COLLECTION | IB_INSPECTABLE | IB_DESIGNABLE | 'return' | gen_287;
protocolExpression: '@protocol' LP protocolName RP;
encodeExpression: '@encode' LP typeName RP;
typeVariableDeclarator: gen_88 gen_87 gen_144 directDeclarator;
throwStatement: gen_262 | gen_263;
functionDeclaration: gen_87 identifier LP gen_296 RP gen_220 ';';
functionDefinition: gen_87 identifier LP gen_296 RP gen_220 '{' gen_217 '}';
attribute: attributeName gen_89;
attributeName: 'const' | IDENTIFIER | BOOL | Class | BYCOPY | BYREF | ID | IMP | IN | INOUT | ONEWAY | OUT | PROTOCOL_ | SEL | SELF | SUPER | ATOMIC | NONATOMIC | RETAIN | AUTORELEASING_QUALIFIER | BLOCK | BRIDGE_RETAINED | BRIDGE_TRANSFER | COVARIANT | CONTRAVARIANT | DEPRECATED | KINDOF | UNUSED | NS_INLINE | NS_ENUM | NS_OPTIONS | NULL_UNSPECIFIED | NULLABLE | NONNULL | NULL_RESETTABLE | ASSIGN | COPY | GETTER | SETTER | STRONG | READONLY | READWRITE | WEAK | UNSAFE_UNRETAINED | IB_OUTLET | IB_OUTLET_COLLECTION | IB_INSPECTABLE | IB_DESIGNABLE;
attributeParameters: LP gen_90 RP;
attributeParameterList: attributeParameter gen_99;
attributeParameter: attribute | HEX_LITERAL | OCTAL_LITERAL | BINARY_LITERAL | gen_91 | gen_93 | CHARACTER_LITERAL | NIL | NULL | YES | NO | TRUE | FALSE | stringLiteral | attributeParameterAssignment;
attributeParameterAssignment: attributeName '=' gen_98;
functionCallExpression: gen_220 identifier gen_220 LP directDeclarator RP ';';
enumDeclaration: gen_220 gen_221 enumSpecifier gen_141 ';';
varDeclaration: gen_222 ';';
typedefDeclaration: gen_220 TYPEDEF gen_228 ';';
typeDeclarator_declarator: gen_144 directDeclarator;
declarationSpecifiers: gen_88 gen_87;
attributeSpecifier: '__attribute__' LP LP attributeName gen_89 gen_101 RP RP;
initDeclaratorList: gen_144 directDeclarator gen_224 gen_226;
structOrUnionSpecifier: gen_138 gen_139;
typePrefix: BRIDGE | BRIDGE_TRANSFER | BRIDGE_RETAINED | BLOCK | INLINE | NS_INLINE | KINDOF;
typeSpecifier: 'void' | 'char' | 'short' | 'int' | 'long' | 'float' | 'double' | 'signed' | 'unsigned' | typeofExpression | genericTypeSpecifier | structOrUnionSpecifier | gen_157 | gen_169 | gen_171;
typeofExpression: TYPEOF LP expression_1 RP;
fieldDeclarator: typeDeclarator_declarator | gen_175;
enumSpecifier: gen_157 | gen_169;
enumeratorIdentifier: IDENTIFIER | BOOL | Class | BYCOPY | BYREF | ID | IMP | IN | INOUT | ONEWAY | OUT | PROTOCOL_ | SEL | SELF | SUPER | ATOMIC | NONATOMIC | RETAIN | AUTORELEASING_QUALIFIER | BLOCK | BRIDGE_RETAINED | BRIDGE_TRANSFER | COVARIANT | CONTRAVARIANT | DEPRECATED | KINDOF | UNUSED | NS_INLINE | NS_ENUM | NS_OPTIONS | NULL_UNSPECIFIED | NULLABLE | NONNULL | NULL_RESETTABLE | ASSIGN | COPY | GETTER | SETTER | STRONG | READONLY | READWRITE | WEAK | UNSAFE_UNRETAINED | IB_OUTLET | IB_OUTLET_COLLECTION | IB_INSPECTABLE | IB_DESIGNABLE | 'default';
directDeclarator: gen_145 | gen_151;
declaratorSuffix: '[' gen_150 ']';
parameterList: parameterDeclaration gen_193 gen_297;
pointer: '*' gen_87 gen_144;
macro: identifier gen_180;
arrayInitializer: '{' gen_271 '}';
structInitializer: '{' gen_273 '}';
typeName: gen_126 | blockType;
abstractDeclaratorSuffix: declaratorSuffix | gen_191;
parameterDeclarationList: parameterDeclaration gen_193;
parameterDeclaration: typeVariableDeclarator | 'void';
statement: gen_232 | gen_233 | gen_235 | gen_251 | gen_256 | gen_259 | gen_260 | gen_261 | gen_264 | gen_269 | ';';
rangeExpression: constantExpression gen_243;
selectionStatement: gen_236 | switchStatement;
switchStatement: 'switch' LP expression_1 RP '{' gen_239 '}';
switchLabel: gen_241 | gen_246;
iterationStatement: whileStatement | doStatement | forStatement | forInStatement;
whileStatement: 'while' LP expression_1 RP statement;
doStatement: 'do' statement 'while' LP expression_1 RP ';';
forStatement: 'for' LP gen_252 ';' gen_215 ';' gen_255 RP statement;
forInStatement: 'for' LP gen_88 gen_87 gen_144 directDeclarator 'in' gen_215 RP statement;
jumpStatement: gen_257 | CONTINUE | BREAK | gen_258;
expressions: expression_1 gen_253;
expression_1: gen_104 | gen_106 | gen_120 | gen_122 | gen_124 | gen_125 | gen_197 | gen_199 | gen_201 | gen_205 | gen_207 | gen_209 | gen_210 | gen_211 | gen_212 | gen_213 | gen_214 | gen_216 | gen_270;
assignmentOperator: '=' | '*=' | '/=' | '%=' | '+=' | '-=' | '<<=' | '>>=' | '&=' | '^=' | '|=';
castExpression: gen_104 | gen_106 | gen_120 | gen_122 | gen_124 | gen_125;
initializer: gen_104 | gen_106 | gen_120 | gen_122 | gen_124 | gen_125 | gen_197 | gen_199 | gen_201 | gen_205 | gen_207 | gen_209 | gen_210 | gen_211 | gen_212 | gen_213 | gen_214 | gen_216 | gen_270 | arrayInitializer | structInitializer;
constantExpression: HEX_LITERAL | OCTAL_LITERAL | BINARY_LITERAL | gen_91 | gen_93 | CHARACTER_LITERAL | NIL | NULL | YES | NO | TRUE | FALSE | IDENTIFIER | BOOL | Class | BYCOPY | BYREF | ID | IMP | IN | INOUT | ONEWAY | OUT | PROTOCOL_ | SEL | SELF | SUPER | ATOMIC | NONATOMIC | RETAIN | AUTORELEASING_QUALIFIER | BLOCK | BRIDGE_RETAINED | BRIDGE_TRANSFER | COVARIANT | CONTRAVARIANT | DEPRECATED | KINDOF | UNUSED | NS_INLINE | NS_ENUM | NS_OPTIONS | NULL_UNSPECIFIED | NULLABLE | NONNULL | NULL_RESETTABLE | ASSIGN | COPY | GETTER | SETTER | STRONG | READONLY | READWRITE | WEAK | UNSAFE_UNRETAINED | IB_OUTLET | IB_OUTLET_COLLECTION | IB_INSPECTABLE | IB_DESIGNABLE;
unaryExpression: gen_104 | gen_106 | gen_120 | gen_122 | gen_124;
unaryOperator: '&' | '*' | '+' | '-' | '~' | BANG;
postfixExpression: gen_104 | gen_106;
postfix: gen_110 | gen_111 | gen_115 | INC | DEC;
argumentExpressionList: receiver_argumentExpression gen_113;
primaryExpression: IDENTIFIER | BOOL | Class | BYCOPY | BYREF | ID | IMP | IN | INOUT | ONEWAY | OUT | PROTOCOL_ | SEL | SELF | SUPER | ATOMIC | NONATOMIC | RETAIN | AUTORELEASING_QUALIFIER | BLOCK | BRIDGE_RETAINED | BRIDGE_TRANSFER | COVARIANT | CONTRAVARIANT | DEPRECATED | KINDOF | UNUSED | NS_INLINE | NS_ENUM | NS_OPTIONS | NULL_UNSPECIFIED | NULLABLE | NONNULL | NULL_RESETTABLE | ASSIGN | COPY | GETTER | SETTER | STRONG | READONLY | READWRITE | WEAK | UNSAFE_UNRETAINED | IB_OUTLET | IB_OUTLET_COLLECTION | IB_INSPECTABLE | IB_DESIGNABLE | HEX_LITERAL | OCTAL_LITERAL | BINARY_LITERAL | gen_91 | gen_93 | CHARACTER_LITERAL | NIL | NULL | YES | NO | TRUE | FALSE | stringLiteral | gen_105 | messageExpression | selectorExpression | protocolExpression | encodeExpression | dictionaryExpression | arrayExpression | gen_293 | gen_294 | blockExpression;
constant: HEX_LITERAL | OCTAL_LITERAL | BINARY_LITERAL | gen_91 | gen_93 | CHARACTER_LITERAL | NIL | NULL | YES | NO | TRUE | FALSE;
stringLiteral: STRING_START gen_94 STRING_END gen_97;
identifier: IDENTIFIER | BOOL | Class | BYCOPY | BYREF | ID | IMP | IN | INOUT | ONEWAY | OUT | PROTOCOL_ | SEL | SELF | SUPER | ATOMIC | NONATOMIC | RETAIN | AUTORELEASING_QUALIFIER | BLOCK | BRIDGE_RETAINED | BRIDGE_TRANSFER | COVARIANT | CONTRAVARIANT | DEPRECATED | KINDOF | UNUSED | NS_INLINE | NS_ENUM | NS_OPTIONS | NULL_UNSPECIFIED | NULLABLE | NONNULL | NULL_RESETTABLE | ASSIGN | COPY | GETTER | SETTER | STRONG | READONLY | READWRITE | WEAK | UNSAFE_UNRETAINED | IB_OUTLET | IB_OUTLET_COLLECTION | IB_INSPECTABLE | IB_DESIGNABLE;
gen_1: ncl | ϵ;
gen_6: instruction_list | ϵ;
gen_3: gen_4 | ϵ;
gen_5: label_list | ϵ;
gen_2: delim gen_3 gen_5;
gen_53: single_instruction gen_1;
gen_9: VAR_SYMBOL | SPECIAL_VAR | CONST_SYMBOL;
gen_7: gen_8 | KWD_FOREVER | expression_0 | ϵ;
gen_44: gen_45 | gen_46 | ϵ;
gen_47: VAR_SYMBOL | SPECIAL_VAR | ϵ;
gen_34: gen_35 | gen_38 | gen_39 | gen_41 | gen_42 | gen_43 | ϵ;
gen_8: gen_9 EQ gen_10 term gen_16 gen_18 gen_20 gen_22 gen_25 gen_27 gen_29 gen_34;
gen_36: dob | ϵ;
gen_37: dof | ϵ;
gen_35: KWD_TO gen_10 term gen_16 gen_18 gen_20 gen_22 gen_25 gen_27 gen_29 gen_36 gen_37;
gen_38: KWD_TO gen_10 term gen_16 gen_18 gen_20 gen_22 gen_25 gen_27 gen_29 gen_37 gen_36;
gen_40: dot | ϵ;
gen_39: KWD_BY gen_10 term gen_16 gen_18 gen_20 gen_22 gen_25 gen_27 gen_29 gen_40 gen_37;
gen_41: KWD_BY gen_10 term gen_16 gen_18 gen_20 gen_22 gen_25 gen_27 gen_29 gen_37 gen_40;
gen_42: KWD_FOR gen_10 term gen_16 gen_18 gen_20 gen_22 gen_25 gen_27 gen_29 gen_40 gen_36;
gen_43: KWD_FOR gen_10 term gen_16 gen_18 gen_20 gen_22 gen_25 gen_27 gen_29 gen_36 gen_40;
gen_45: KWD_WHILE gen_10 term gen_16 gen_18 gen_20 gen_22 gen_25 gen_27 gen_29;
gen_46: KWD_UNTIL gen_10 term gen_16 gen_18 gen_20 gen_22 gen_25 gen_27 gen_29;
gen_49: delim gen_3 KWD_ELSE gen_1 instruction;
gen_48: gen_49 | ϵ;
gen_50: gen_51 | ϵ;
gen_52: otherwise_ | ϵ;
gen_56: expression_0 | ϵ;
gen_55: taken_constant gen_56;
gen_54: gen_55 | valueexp | ϵ;
gen_57: template_list | ϵ;
gen_70: function_parameters | expression_list | ϵ;
gen_69: function_name gen_70;
gen_64: gen_65 | gen_68 | gen_69;
gen_67: KWD_NAME function_name;
gen_66: gen_67 | ϵ;
gen_65: KWD_ON callable_condition gen_66;
gen_68: KWD_OFF callable_condition;
gen_13: expression_list | ϵ;
gen_14: gen_15 | ϵ;
gen_31: gen_32 | ϵ;
gen_71: vref | VAR_SYMBOL | SPECIAL_VAR;
gen_72: gen_73 | ϵ;
gen_74: numeric_digits | numeric_form | numeric_fuzz;
gen_75: KWD_ENGINEERING | KWD_SCIENTIFIC | valueexp | expression_0 | ϵ;
gen_76: KWD_UPPER | ϵ;
gen_78: KWD_EXPOSE gen_71 gen_72;
gen_77: gen_78 | ϵ;
gen_79: gen_80 | gen_81 | valueexp | VAR_SYMBOL | SPECIAL_VAR | CONST_SYMBOL | NUMBER | STRING;
gen_80: KWD_ON condition gen_66;
gen_81: KWD_OFF condition;
gen_82: VAR_SYMBOL | SPECIAL_VAR | CONST_SYMBOL | NUMBER | STRING | valueexp | expression_0 | KWD_ERROR | KWD_FAILURE | KWD_OFF;
gen_83: gen_84 | ϵ;
gen_62: gen_63 | ϵ;
gen_58: STRING | vref | NUMBER | gen_59 | relative_positional | VAR_SYMBOL | SPECIAL_VAR | STOP;
gen_60: gen_61 | ϵ;
gen_59: EQ position_;
gen_29: gen_30 | ϵ;
gen_27: gen_28 | ϵ;
gen_25: gen_26 | ϵ;
gen_24: CONCAT | ϵ;
gen_22: gen_23 | ϵ;
gen_20: gen_21 | ϵ;
gen_18: gen_19 | ϵ;
gen_16: gen_17 | ϵ;
gen_12: PLUS | MINUS | NOT;
gen_10: gen_11 | ϵ;
gen_33: BR_O gen_10 term gen_16 gen_18 gen_20 gen_22 gen_25 gen_27 gen_29 BR_C;
gen_85: gen_86 | ϵ;
gen_299: IB_DESIGNABLE | ϵ;
gen_301: ':' identifier;
gen_300: gen_301 | ϵ;
gen_129: LT protocolName gen_132 GT;
gen_302: gen_129 | ϵ;
gen_303: instanceVariables | ϵ;
gen_307: interfaceDeclarationList | ϵ;
gen_141: IDENTIFIER | BOOL | Class | BYCOPY | BYREF | ID | IMP | IN | INOUT | ONEWAY | OUT | PROTOCOL_ | SEL | SELF | SUPER | ATOMIC | NONATOMIC | RETAIN | AUTORELEASING_QUALIFIER | BLOCK | BRIDGE_RETAINED | BRIDGE_TRANSFER | COVARIANT | CONTRAVARIANT | DEPRECATED | KINDOF | UNUSED | NS_INLINE | NS_ENUM | NS_OPTIONS | NULL_UNSPECIFIED | NULLABLE | NONNULL | NULL_RESETTABLE | ASSIGN | COPY | GETTER | SETTER | STRONG | READONLY | READWRITE | WEAK | UNSAFE_UNRETAINED | IB_OUTLET | IB_OUTLET_COLLECTION | IB_INSPECTABLE | IB_DESIGNABLE | ϵ;
gen_324: implementationDefinitionList | ϵ;
gen_128: gen_129 | genericsSpecifier | ϵ;
gen_333: gen_334 | ϵ;
gen_336: REQUIRED | OPTIONAL;
gen_337: gen_338 | ϵ;
gen_335: gen_336 gen_337;
gen_338: gen_308 gen_307 gen_337;
gen_339: gen_340 | ϵ;
gen_132: gen_133 | ϵ;
gen_317: LP propertyAttribute gen_320 RP;
gen_316: gen_317 | ϵ;
gen_322: gen_103 | IB_OUTLET | ϵ;
gen_323: IB_INSPECTABLE | ϵ;
gen_320: gen_321 | ϵ;
gen_318: GETTER '=' identifier;
gen_319: SETTER '=' identifier ':';
gen_131: '__covariant' | '__contravariant' | ϵ;
gen_130: gen_131 identifier;
gen_304: gen_305 | ϵ;
gen_184: gen_185 | ϵ;
gen_306: accessModifier gen_184;
gen_185: gen_127 gen_142 fieldDeclarator gen_177 gen_179 ';' gen_184;
gen_308: functionCallExpression | enumDeclaration | varDeclaration | typedefDeclaration | classMethodDeclaration | instanceMethodDeclaration | propertyDeclaration | functionDeclaration;
gen_309: methodType | ϵ;
gen_179: macro | ϵ;
gen_325: functionDefinition | functionCallExpression | enumDeclaration | varDeclaration | typedefDeclaration | classMethodDefinition | instanceMethodDefinition | gen_327 | gen_332;
gen_326: initDeclaratorList | ϵ;
gen_234: ';' | ϵ;
gen_314: gen_315 | ϵ;
gen_298: ',' '...';
gen_297: gen_298 | ϵ;
gen_310: gen_279 ':' gen_311 gen_313 identifier gen_314 gen_297;
gen_279: IDENTIFIER | BOOL | Class | BYCOPY | BYREF | ID | IMP | IN | INOUT | ONEWAY | OUT | PROTOCOL_ | SEL | SELF | SUPER | ATOMIC | NONATOMIC | RETAIN | AUTORELEASING_QUALIFIER | BLOCK | BRIDGE_RETAINED | BRIDGE_TRANSFER | COVARIANT | CONTRAVARIANT | DEPRECATED | KINDOF | UNUSED | NS_INLINE | NS_ENUM | NS_OPTIONS | NULL_UNSPECIFIED | NULLABLE | NONNULL | NULL_RESETTABLE | ASSIGN | COPY | GETTER | SETTER | STRONG | READONLY | READWRITE | WEAK | UNSAFE_UNRETAINED | IB_OUTLET | IB_OUTLET_COLLECTION | IB_INSPECTABLE | IB_DESIGNABLE | 'return' | ϵ;
gen_311: gen_312 | ϵ;
gen_313: WEAK_QUALIFIER | STRONG_QUALIFIER | AUTORELEASING_QUALIFIER | UNSAFE_UNRETAINED_QUALIFIER | ϵ;
gen_327: '@synthesize' identifier gen_328 gen_330 ';';
gen_332: '@dynamic' identifier gen_328 gen_330 ';';
gen_330: gen_331 | ϵ;
gen_329: '=' identifier;
gen_328: gen_329 | ϵ;
gen_152: NULL_UNSPECIFIED | NULLABLE | NONNULL | NULL_RESETTABLE | ϵ;
gen_156: NULL_UNSPECIFIED | NULLABLE | NONNULL | NULL_RESETTABLE | 'void' | 'char' | 'short' | 'int' | 'long' | 'float' | 'double' | 'signed' | 'unsigned' | typeofExpression | genericTypeSpecifier | structOrUnionSpecifier | gen_157 | gen_169 | gen_171 | ϵ;
gen_172: blockParameters | ϵ;
gen_186: gen_187 | ϵ;
gen_135: gen_136 typeSpecifier gen_186;
gen_134: gen_135 | ϵ;
gen_136: gen_137 | ϵ;
gen_291: gen_292 | ϵ;
gen_168: ',' | ϵ;
gen_290: castExpression ':' expression_1 gen_291 gen_168;
gen_289: gen_290 | ϵ;
gen_272: expression_1 gen_253 gen_168;
gen_271: gen_272 | ϵ;
gen_293: '@' LP expression_1 RP;
gen_294: '@' constantExpression;
gen_155: typeVariableDeclarator | gen_126 | blockType | 'void';
gen_173: gen_174 | ϵ;
gen_154: gen_155 gen_173;
gen_153: gen_154 | ϵ;
gen_295: 'void' | 'char' | 'short' | 'int' | 'long' | 'float' | 'double' | 'signed' | 'unsigned' | typeofExpression | genericTypeSpecifier | structOrUnionSpecifier | gen_157 | gen_169 | gen_171 | ϵ;
gen_286: gen_278 | ϵ;
gen_278: gen_279 ':' expression_1 gen_253 gen_152 gen_280 gen_284 gen_286;
gen_284: gen_285 | ϵ;
gen_281: '{' initializer gen_282 gen_168 '}';
gen_280: gen_281 | ϵ;
gen_288: gen_287 | ϵ;
gen_287: gen_279 ':' gen_288;
gen_262: '@throw' LP identifier RP;
gen_263: '@throw' expression_1;
gen_265: gen_266 | ϵ;
gen_268: '@finally' '{' gen_217 '}';
gen_267: gen_268 | ϵ;
gen_87: declarationSpecifiers | ϵ;
gen_296: parameterList | ϵ;
gen_220: attributeSpecifier | ϵ;
gen_89: attributeParameters | ϵ;
gen_90: attributeParameterList | ϵ;
gen_99: gen_100 | ϵ;
gen_98: HEX_LITERAL | OCTAL_LITERAL | BINARY_LITERAL | gen_91 | gen_93 | CHARACTER_LITERAL | NIL | NULL | YES | NO | TRUE | FALSE | 'const' | IDENTIFIER | BOOL | Class | BYCOPY | BYREF | ID | IMP | IN | INOUT | ONEWAY | OUT | PROTOCOL_ | SEL | SELF | SUPER | ATOMIC | NONATOMIC | RETAIN | AUTORELEASING_QUALIFIER | BLOCK | BRIDGE_RETAINED | BRIDGE_TRANSFER | COVARIANT | CONTRAVARIANT | DEPRECATED | KINDOF | UNUSED | NS_INLINE | NS_ENUM | NS_OPTIONS | NULL_UNSPECIFIED | NULLABLE | NONNULL | NULL_RESETTABLE | ASSIGN | COPY | GETTER | SETTER | STRONG | READONLY | READWRITE | WEAK | UNSAFE_UNRETAINED | IB_OUTLET | IB_OUTLET_COLLECTION | IB_INSPECTABLE | IB_DESIGNABLE | stringLiteral;
gen_221: TYPEDEF | ϵ;
gen_223: gen_88 gen_87 gen_144 directDeclarator gen_224 gen_226;
gen_222: gen_223 | declarationSpecifiers;
gen_229: gen_88 gen_87 gen_144 directDeclarator gen_230;
gen_228: gen_229 | declarationSpecifiers;
gen_230: gen_231 | ϵ;
gen_144: pointer | ϵ;
gen_88: AUTO | REGISTER | STATIC | EXTERN | attributeSpecifier | WEAK_QUALIFIER | STRONG_QUALIFIER | AUTORELEASING_QUALIFIER | UNSAFE_UNRETAINED_QUALIFIER | NULL_UNSPECIFIED | NULLABLE | NONNULL | NULL_RESETTABLE | gen_103 | IB_OUTLET | BRIDGE | BRIDGE_TRANSFER | BRIDGE_RETAINED | BLOCK | INLINE | NS_INLINE | KINDOF | CONST | VOLATILE | RESTRICT | 'in' | 'out' | 'inout' | 'bycopy' | 'byref' | 'oneway' | 'void' | 'char' | 'short' | 'int' | 'long' | 'float' | 'double' | 'signed' | 'unsigned' | typeofExpression | genericTypeSpecifier | structOrUnionSpecifier | gen_157 | gen_169 | gen_171;
gen_101: gen_102 | ϵ;
gen_226: gen_227 | ϵ;
gen_225: '=' initializer;
gen_224: gen_225 | ϵ;
gen_138: 'struct' | 'union';
gen_140: gen_141 '{' gen_127 gen_142 fieldDeclarator gen_177 gen_179 ';' gen_184 '}';
gen_139: IDENTIFIER | BOOL | Class | BYCOPY | BYREF | ID | IMP | IN | INOUT | ONEWAY | OUT | PROTOCOL_ | SEL | SELF | SUPER | ATOMIC | NONATOMIC | RETAIN | AUTORELEASING_QUALIFIER | BLOCK | BRIDGE_RETAINED | BRIDGE_TRANSFER | COVARIANT | CONTRAVARIANT | DEPRECATED | KINDOF | UNUSED | NS_INLINE | NS_ENUM | NS_OPTIONS | NULL_UNSPECIFIED | NULLABLE | NONNULL | NULL_RESETTABLE | ASSIGN | COPY | GETTER | SETTER | STRONG | READONLY | READWRITE | WEAK | UNSAFE_UNRETAINED | IB_OUTLET | IB_OUTLET_COLLECTION | IB_INSPECTABLE | IB_DESIGNABLE | gen_140;
gen_127: WEAK_QUALIFIER | STRONG_QUALIFIER | AUTORELEASING_QUALIFIER | UNSAFE_UNRETAINED_QUALIFIER | NULL_UNSPECIFIED | NULLABLE | NONNULL | NULL_RESETTABLE | gen_103 | IB_OUTLET | BRIDGE | BRIDGE_TRANSFER | BRIDGE_RETAINED | BLOCK | INLINE | NS_INLINE | KINDOF | CONST | VOLATILE | RESTRICT | 'in' | 'out' | 'inout' | 'bycopy' | 'byref' | 'oneway' | 'void' | 'char' | 'short' | 'int' | 'long' | 'float' | 'double' | 'signed' | 'unsigned' | typeofExpression | genericTypeSpecifier | structOrUnionSpecifier | gen_157 | gen_169 | gen_171;
gen_142: gen_143 | ϵ;
gen_103: IB_OUTLET_COLLECTION LP identifier RP;
gen_171: identifier gen_144;
gen_105: LP expression_1 RP;
gen_177: gen_178 | ϵ;
gen_176: typeDeclarator_declarator | ϵ;
gen_175: gen_176 ':' constant;
gen_159: gen_141 ':' typeName;
gen_158: gen_159 | ϵ;
gen_163: '{' enumeratorIdentifier gen_164 gen_166 gen_168 '}';
gen_162: gen_163 | ϵ;
gen_161: identifier gen_162;
gen_160: gen_161 | gen_163;
gen_157: 'enum' gen_158 gen_160;
gen_170: 'NS_OPTIONS' | 'NS_ENUM';
gen_169: gen_170 LP typeName ',' identifier RP '{' enumeratorIdentifier gen_164 gen_166 gen_168 '}';
gen_166: gen_167 | ϵ;
gen_165: '=' expression_1;
gen_164: gen_165 | ϵ;
gen_147: LP gen_144 directDeclarator RP;
gen_146: IDENTIFIER | BOOL | Class | BYCOPY | BYREF | ID | IMP | IN | INOUT | ONEWAY | OUT | PROTOCOL_ | SEL | SELF | SUPER | ATOMIC | NONATOMIC | RETAIN | AUTORELEASING_QUALIFIER | BLOCK | BRIDGE_RETAINED | BRIDGE_TRANSFER | COVARIANT | CONTRAVARIANT | DEPRECATED | KINDOF | UNUSED | NS_INLINE | NS_ENUM | NS_OPTIONS | NULL_UNSPECIFIED | NULLABLE | NONNULL | NULL_RESETTABLE | ASSIGN | COPY | GETTER | SETTER | STRONG | READONLY | READWRITE | WEAK | UNSAFE_UNRETAINED | IB_OUTLET | IB_OUTLET_COLLECTION | IB_INSPECTABLE | IB_DESIGNABLE | gen_147;
gen_148: gen_149 | ϵ;
gen_145: gen_146 gen_148;
gen_151: LP '^' gen_152 gen_141 RP LP gen_153 RP;
gen_150: HEX_LITERAL | OCTAL_LITERAL | BINARY_LITERAL | gen_91 | gen_93 | CHARACTER_LITERAL | NIL | NULL | YES | NO | TRUE | FALSE | IDENTIFIER | BOOL | Class | BYCOPY | BYREF | ID | IMP | IN | INOUT | ONEWAY | OUT | PROTOCOL_ | SEL | SELF | SUPER | ATOMIC | NONATOMIC | RETAIN | AUTORELEASING_QUALIFIER | BLOCK | BRIDGE_RETAINED | BRIDGE_TRANSFER | COVARIANT | CONTRAVARIANT | DEPRECATED | KINDOF | UNUSED | NS_INLINE | NS_ENUM | NS_OPTIONS | NULL_UNSPECIFIED | NULLABLE | NONNULL | NULL_RESETTABLE | ASSIGN | COPY | GETTER | SETTER | STRONG | READONLY | READWRITE | WEAK | UNSAFE_UNRETAINED | IB_OUTLET | IB_OUTLET_COLLECTION | IB_INSPECTABLE | IB_DESIGNABLE | ϵ;
gen_182: gen_183 | ϵ;
gen_181: LP primaryExpression gen_182 RP;
gen_180: gen_181 | ϵ;
gen_275: gen_276 | ϵ;
gen_274: '.' expression_1 gen_275 gen_168;
gen_273: gen_274 | ϵ;
gen_282: gen_283 | ϵ;
gen_188: gen_189 | gen_190 | gen_149 | ϵ;
gen_126: gen_127 gen_142 gen_188;
gen_189: '*' gen_87 gen_144 gen_188;
gen_195: gen_196 | ϵ;
gen_190: LP gen_188 RP abstractDeclaratorSuffix gen_195;
gen_149: '[' gen_150 ']' gen_148;
gen_192: parameterDeclarationList | ϵ;
gen_191: LP gen_192 RP;
gen_193: gen_194 | ϵ;
gen_232: identifier ':' statement gen_234;
gen_233: '{' gen_217 '}' gen_234;
gen_235: selectionStatement gen_234;
gen_251: iterationStatement gen_234;
gen_256: jumpStatement gen_234;
gen_259: '@synchronized' LP expression_1 RP '{' gen_217 '}' gen_234;
gen_260: '@autoreleasepool' '{' gen_217 '}' gen_234;
gen_261: throwStatement gen_234;
gen_264: '@try' '{' gen_217 '}' gen_265 gen_267 gen_234;
gen_269: expression_1 gen_253 gen_234;
gen_244: '...' constantExpression;
gen_243: gen_244 | ϵ;
gen_219: functionCallExpression | enumDeclaration | varDeclaration | typedefDeclaration | gen_232 | gen_233 | gen_235 | gen_251 | gen_256 | gen_259 | gen_260 | gen_261 | gen_264 | gen_269 | ';';
gen_217: gen_218 | ϵ;
gen_238: ELSE statement;
gen_237: gen_238 | ϵ;
gen_236: IF LP expression_1 RP statement gen_237;
gen_239: gen_240 | ϵ;
gen_247: gen_248 | ϵ;
gen_249: gen_250 | ϵ;
gen_245: LP constantExpression gen_243 RP;
gen_242: rangeExpression | gen_245;
gen_241: 'case' gen_242 ':';
gen_246: 'default' ':';
gen_252: gen_223 | expressions | ϵ;
gen_215: gen_104 | gen_106 | gen_120 | gen_122 | gen_124 | gen_125 | gen_197 | gen_199 | gen_201 | gen_205 | gen_207 | gen_209 | gen_210 | gen_211 | gen_212 | gen_213 | gen_214 | gen_216 | gen_270 | ϵ;
gen_255: expressions | ϵ;
gen_257: GOTO identifier;
gen_258: RETURN gen_215;
gen_253: gen_254 | ϵ;
gen_198: MUL_1 | DIV_1 | MOD;
gen_197: expression_1 gen_198 expression_1;
gen_200: ADD | SUB;
gen_199: expression_1 gen_200 expression_1;
gen_203: LT LT;
gen_204: GT GT;
gen_202: gen_203 | gen_204;
gen_201: expression_1 gen_202 expression_1;
gen_206: LE | GE | LT | GT;
gen_205: expression_1 gen_206 expression_1;
gen_208: NOTEQUAL | EQUAL;
gen_207: expression_1 gen_208 expression_1;
gen_209: expression_1 BITAND expression_1;
gen_210: expression_1 BITXOR expression_1;
gen_211: expression_1 BITOR expression_1;
gen_212: expression_1 AND_1 expression_1;
gen_213: expression_1 OR_1 expression_1;
gen_214: expression_1 QUESTION gen_215 COLON_1 expression_1;
gen_216: LP '{' gen_217 '}' RP;
gen_270: unaryExpression assignmentOperator expression_1;
gen_125: LP typeName RP initializer;
gen_277: LP typeSpecifier RP;
gen_121: gen_104 | gen_106 | gen_120 | gen_122 | gen_124 | gen_277;
gen_120: SIZEOF gen_121;
gen_123: INC | DEC;
gen_122: gen_123 unaryExpression;
gen_124: unaryOperator castExpression;
gen_108: gen_109 | ϵ;
gen_104: primaryExpression gen_108;
gen_107: DOT | STRUCTACCESS;
gen_106: postfixExpression gen_107 identifier gen_108;
gen_110: LBRACK expression_1 RBRACK;
gen_112: argumentExpressionList | ϵ;
gen_111: LP gen_112 RP;
gen_117: ~RP;
gen_116: COMMA_1 | gen_117;
gen_118: gen_119 | ϵ;
gen_115: LP gen_116 gen_118 RP;
gen_113: gen_114 | ϵ;
gen_92: '+' | '-' | ϵ;
gen_91: gen_92 DECIMAL_LITERAL;
gen_93: gen_92 FLOATING_POINT_LITERAL;
gen_96: STRING_VALUE | STRING_NEWLINE;
gen_94: gen_95 | ϵ;
gen_97: stringLiteral | ϵ;
gen_4: delim gen_3;
gen_51: KWD_WHEN gen_10 term gen_16 gen_18 gen_20 gen_22 gen_25 gen_27 gen_29 gen_3 KWD_THEN gen_1 instruction gen_50;
gen_15: COMMA_0 gen_14;
gen_32: COMMA_0 gen_14 gen_10 term gen_16 gen_18 gen_20 gen_22 gen_25 gen_27 gen_29 gen_31;
gen_73: gen_71 gen_72;
gen_84: var_symbol gen_83;
gen_63: COMMA_0 gen_14 gen_58 gen_60 gen_62;
gen_61: gen_58 gen_60;
gen_30: or_operator gen_10 term gen_16 gen_18 gen_20 gen_22 gen_25 gen_27 gen_29;
gen_28: AND_0 gen_10 term gen_16 gen_18 gen_20 gen_22 gen_25 gen_27;
gen_26: comparison_operator gen_10 term gen_16 gen_18 gen_20 gen_22 gen_25;
gen_23: gen_24 gen_10 term gen_16 gen_18 gen_20 gen_22;
gen_21: additive_operator gen_10 term gen_16 gen_18 gen_20;
gen_19: multiplicative_operator gen_10 term gen_16 gen_18;
gen_17: POW gen_10 term gen_16;
gen_11: gen_12 gen_10;
gen_86: topLevelDeclaration gen_85;
gen_334: protocolDeclarationSection gen_333;
gen_340: ',' identifier gen_339;
gen_133: ',' protocolName gen_132;
gen_321: ',' propertyAttribute gen_320;
gen_305: visibilitySection gen_304;
gen_315: gen_279 ':' gen_311 gen_313 identifier gen_314;
gen_312: LP typeName RP gen_311;
gen_331: ',' identifier gen_328 gen_330;
gen_187: ',' gen_136 typeSpecifier gen_186;
gen_137: typePrefix gen_136;
gen_292: ',' castExpression ':' expression_1 gen_291;
gen_174: ',' typeVariableDeclaratorOrName gen_173;
gen_285: ',' expression_1 gen_253 gen_152 gen_280 gen_284;
gen_266: '@catch' LP gen_88 gen_87 gen_144 directDeclarator RP '{' gen_217 '}' gen_265;
gen_100: ',' attributeParameter gen_99;
gen_231: ',' gen_144 directDeclarator gen_230;
gen_102: ',' attributeName gen_89 gen_101;
gen_227: ',' gen_144 directDeclarator gen_224 gen_226;
gen_143: gen_127 gen_142;
gen_178: ',' fieldDeclarator gen_177;
gen_167: ',' enumeratorIdentifier gen_164 gen_166;
gen_183: ',' primaryExpression gen_182;
gen_276: ',' '.' expression_1 gen_275;
gen_283: ',' initializer gen_282;
gen_196: abstractDeclaratorSuffix gen_195;
gen_194: ',' parameterDeclaration gen_193;
gen_218: gen_219 gen_217;
gen_240: switchLabel gen_247 statement gen_249 gen_239;
gen_248: switchLabel gen_247;
gen_250: statement gen_249;
gen_254: ',' expression_1 gen_253;
gen_109: postfix gen_108;
gen_119: gen_116 gen_118;
gen_114: ',' receiver_argumentExpression gen_113;
gen_95: gen_96 gen_94