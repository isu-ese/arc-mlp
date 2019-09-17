gen_0: K_ALTER | webIDL;
K_ALTER: A L T E R;
A: 'a' | 'A';
E: 'E' | 'e';
L: 'l' | 'L';
R: 'r' | 'R';
T: 't' | 'T';
webIDL: definitions EOF;
definitions: gen_1 | ϵ;
definition: gen_43 | interface_ | class_ | partial | dictionary | enum_ | typedef | implementsStatement;
callbackRestOrInterface: callbackRest | interface_;
interface_: 'interface' gen_31 gen_32 inheritance '{' interfaceMembers '}' ';';
class_: 'class' gen_31 gen_32 extension '{' interfaceMembers '}' ';';
partial: 'partial' partialDefinition;
partialDefinition: partialInterface | partialDictionary;
partialInterface: 'interface' gen_31 gen_32 '{' interfaceMembers '}' ';';
interfaceMembers: gen_68 | ϵ;
interfaceMember: const_ | gen_69 | specialOperation | serializer | stringifier | staticMember | iterable | readonlyMember | gen_79 | attributeRest | maplikeRest | setlikeRest;
dictionary: 'dictionary' gen_31 gen_32 inheritance '{' dictionaryMembers '}' ';';
dictionaryMembers: gen_81 | ϵ;
required: 'required' | ϵ;
partialDictionary: 'dictionary' gen_31 gen_32 '{' dictionaryMembers '}' ';';
default_: gen_63 | ϵ;
defaultValue: 'true' | 'false' | FLOAT_WEBIDL | '-Infinity' | 'Infinity' | 'NaN' | INTEGER_WEBIDL | 'null' | STRING_WEBIDL | gen_64;
inheritance: gen_67 | ϵ;
extension: gen_80 | ϵ;
enum_: 'enum' gen_31 gen_32 '{' '\"' gen_35 '\"' enumValueListComma '}' ';';
enumValueList: '\"' gen_35 '\"' enumValueListComma;
enumValueListComma: gen_82 | ϵ;
enumValueListString: enumValueList | ϵ;
callbackRest: gen_31 gen_32 '=' returnType '(' argumentList ')' ';';
typedef: 'typedef' type gen_31 gen_32 ';';
implementsStatement: gen_31 gen_32 'implements' gen_31 gen_32 ';';
const_: 'const' constType gen_31 gen_32 '=' constValue ';';
constValue: 'true' | 'false' | FLOAT_WEBIDL | '-Infinity' | 'Infinity' | 'NaN' | INTEGER_WEBIDL | 'null';
serializer: 'serializer' serializerRest;
serializerRest: operationRest | gen_71 | ';';
serializationPattern: gen_72 | gen_76 | IDENTIFIER_WEBIDL;
serializationPatternMap: 'getter' | gen_73 | gen_75 | ϵ;
serializationPatternList: 'getter' | gen_75 | ϵ;
stringifier: 'stringifier' stringifierRest;
stringifierRest: gen_77 | gen_69 | ';';
staticMember: 'static' staticMemberRest;
staticMemberRest: gen_77 | gen_69;
readonlyMember: 'readonly' readonlyMemberRest;
readonlyMemberRest: attributeRest | maplikeRest | setlikeRest;
attributeRest: 'attribute' type attributeName ';';
attributeName: 'required' | IDENTIFIER_WEBIDL;
readOnly: 'readonly' | ϵ;
specialOperation: special specials returnType optionalIdentifier '(' argumentList ')' ';';
specials: gen_70 | ϵ;
special: 'getter' | 'setter' | 'deleter' | 'legacycaller';
operationRest: optionalIdentifier '(' argumentList ')' ';';
optionalIdentifier: IDENTIFIER_WEBIDL | ϵ;
argumentList: gen_61 | ϵ;
arguments: gen_66 | ϵ;
optionalOrRequiredArgument: gen_62 | gen_65;
argumentName: 'attribute' | 'callback' | 'const' | 'deleter' | 'dictionary' | 'enum' | 'getter' | 'implements' | 'inherit' | 'interface' | 'iterable' | 'legacycaller' | 'maplike' | 'partial' | 'required' | 'serializer' | 'setlike' | 'setter' | 'static' | 'stringifier' | 'typedef' | 'unrestricted' | IDENTIFIER_WEBIDL;
ellipsis: '...' | ϵ;
iterable: 'iterable' '<' type optionalType '>' ';';
optionalType: gen_78 | ϵ;
maplikeRest: 'maplike' '<' type ',' type '>' ';';
setlikeRest: 'setlike' '<' type '>' ';';
extendedAttributeList: gen_2 | ϵ;
extendedAttributes: gen_42 | ϵ;
extendedAttribute: gen_3 | gen_39 | gen_40 | gen_41;
extendedAttributeRest: gen_3 | gen_39 | gen_40 | gen_41 | ϵ;
extendedAttributeInner: gen_4 | gen_5 | gen_6 | gen_7 | ϵ;
other: INTEGER_WEBIDL | FLOAT_WEBIDL | IDENTIFIER_WEBIDL | STRING_WEBIDL | OTHER_WEBIDL | '-' | '-Infinity' | '.' | '...' | ':' | ';' | '<' | '=' | '>' | '?' | 'ByteString' | 'DOMString' | 'FrozenArray' | 'Infinity' | 'NaN' | 'RegExp' | 'USVString' | 'any' | 'boolean' | 'byte' | 'double' | 'false' | 'float' | 'long' | 'null' | 'object' | 'octet' | 'or' | 'optional' | 'sequence' | 'short' | 'true' | 'unsigned' | 'void' | 'attribute' | 'callback' | 'const' | 'deleter' | 'dictionary' | 'enum' | 'getter' | 'implements' | 'inherit' | 'interface' | 'iterable' | 'legacycaller' | 'maplike' | 'partial' | 'required' | 'serializer' | 'setlike' | 'setter' | 'static' | 'stringifier' | 'typedef' | 'unrestricted' | 'ArrayBuffer' | 'DataView' | 'Int8Array' | 'Int16Array' | 'Int32Array' | 'Uint8Array' | 'Uint16Array' | 'Uint32Array' | 'Uint8ClampedArray' | 'Float32Array' | 'Float64Array';
otherOrComma: INTEGER_WEBIDL | FLOAT_WEBIDL | IDENTIFIER_WEBIDL | STRING_WEBIDL | OTHER_WEBIDL | '-' | '-Infinity' | '.' | '...' | ':' | ';' | '<' | '=' | '>' | '?' | 'ByteString' | 'DOMString' | 'FrozenArray' | 'Infinity' | 'NaN' | 'RegExp' | 'USVString' | 'any' | 'boolean' | 'byte' | 'double' | 'false' | 'float' | 'long' | 'null' | 'object' | 'octet' | 'or' | 'optional' | 'sequence' | 'short' | 'true' | 'unsigned' | 'void' | 'attribute' | 'callback' | 'const' | 'deleter' | 'dictionary' | 'enum' | 'getter' | 'implements' | 'inherit' | 'interface' | 'iterable' | 'legacycaller' | 'maplike' | 'partial' | 'required' | 'serializer' | 'setlike' | 'setter' | 'static' | 'stringifier' | 'typedef' | 'unrestricted' | 'ArrayBuffer' | 'DataView' | 'Int8Array' | 'Int16Array' | 'Int32Array' | 'Uint8Array' | 'Uint16Array' | 'Uint32Array' | 'Uint8ClampedArray' | 'Float32Array' | 'Float64Array' | ',';
type: gen_44 | gen_48 | gen_49 | gen_50 | gen_51 | gen_52 | gen_53 | gen_54 | gen_55 | gen_56 | gen_57 | gen_58 | 'any' | gen_59;
unionMemberType: gen_44 | gen_48 | gen_49 | gen_50 | gen_51 | gen_52 | gen_53 | gen_54 | gen_55 | gen_56 | gen_57 | gen_58 | gen_59;
unionMemberTypes: gen_60 | ϵ;
bufferRelatedType: 'ArrayBuffer' | 'DataView' | 'Int8Array' | 'Int16Array' | 'Int32Array' | 'Uint8Array' | 'Uint16Array' | 'Uint32Array' | 'Uint8ClampedArray' | 'Float32Array' | 'Float64Array';
constType: gen_44 | gen_52;
primitiveType: gen_45 | 'short' | gen_46 | gen_47 | 'float' | 'double' | 'boolean' | 'byte' | 'octet';
floatType: 'float' | 'double';
integerType: 'short' | gen_46;
optionalLong: 'long' | ϵ;
null_: '?' | ϵ;
returnType: gen_44 | gen_48 | gen_49 | gen_50 | gen_51 | gen_52 | gen_53 | gen_54 | gen_55 | gen_56 | gen_57 | gen_58 | 'any' | gen_59 | 'void';
identifiers: gen_74 | ϵ;
INTEGER_WEBIDL: gen_8 gen_9;
FLOAT_WEBIDL: gen_8 gen_22;
IDENTIFIER_WEBIDL: gen_31 gen_32;
STRING_WEBIDL: '\"' gen_35 '\"';
OTHER_WEBIDL: ~gen_38;
gen_1: extendedAttributeList definition definitions;
gen_43: 'callback' callbackRestOrInterface;
gen_68: extendedAttributeList interfaceMember interfaceMembers;
gen_81: extendedAttributeList required type gen_31 gen_32 default_ ';' dictionaryMembers;
gen_63: '=' defaultValue;
gen_64: '[' ']';
gen_67: ':' gen_31 gen_32;
gen_80: 'extends' gen_31 gen_32;
gen_82: ',' enumValueListString;
gen_71: '=' serializationPattern ';';
gen_72: '{' serializationPatternMap '}';
gen_76: '[' serializationPatternList ']';
gen_73: 'inherit' identifiers;
gen_75: gen_31 gen_32 identifiers;
gen_77: readOnly 'attribute' type attributeName ';';
gen_69: returnType optionalIdentifier '(' argumentList ')' ';';
gen_79: 'inherit' readOnly 'attribute' type attributeName ';';
gen_70: special specials;
gen_61: extendedAttributeList optionalOrRequiredArgument arguments;
gen_66: ',' extendedAttributeList optionalOrRequiredArgument arguments;
gen_62: 'optional' type argumentName default_;
gen_65: type ellipsis argumentName;
gen_78: ',' type;
gen_2: '[' extendedAttribute extendedAttributes ']';
gen_42: ',' extendedAttribute extendedAttributes;
gen_3: '(' extendedAttributeInner ')' extendedAttributeRest;
gen_39: '[' extendedAttributeInner ']' extendedAttributeRest;
gen_40: '{' extendedAttributeInner '}' extendedAttributeRest;
gen_41: other extendedAttributeRest;
gen_4: '(' extendedAttributeInner ')' extendedAttributeInner;
gen_5: '[' extendedAttributeInner ']' extendedAttributeInner;
gen_6: '{' extendedAttributeInner '}' extendedAttributeInner;
gen_7: otherOrComma extendedAttributeInner;
gen_59: '(' unionMemberType 'or' unionMemberType unionMemberTypes ')' null_;
gen_60: 'or' unionMemberType unionMemberTypes;
gen_44: primitiveType null_;
gen_48: 'Promise' '<' returnType '>' null_;
gen_49: 'ByteString' null_;
gen_50: 'DOMString' null_;
gen_51: 'USVString' null_;
gen_52: gen_31 gen_32 null_;
gen_53: 'sequence' '<' type '>' null_;
gen_54: 'object' null_;
gen_55: 'RegExp' null_;
gen_56: 'DOMException' null_;
gen_57: bufferRelatedType null_;
gen_58: 'FrozenArray' '<' type '>' null_;
gen_47: 'unrestricted' floatType;
gen_45: 'unsigned' integerType;
gen_46: 'long' optionalLong;
gen_74: ',' gen_31 gen_32 identifiers;
gen_8: '-' | ϵ;
gen_13: 'X' | 'x';
gen_14: '0' .. '9' | 'A' .. 'F' | 'a' .. 'f';
gen_15: gen_16 | ϵ;
gen_12: gen_13 gen_14 gen_15;
gen_18: gen_17 | ϵ;
gen_11: gen_12 | gen_17 | ϵ;
gen_10: '0' gen_11;
gen_20: gen_21 | ϵ;
gen_19: '1' .. '9' gen_20;
gen_9: gen_10 | gen_19;
gen_25: '0' .. '9' gen_20 '.' gen_20;
gen_26: gen_20 '.' '0' .. '9' gen_20;
gen_24: gen_25 | gen_26;
gen_29: '+' | '-' | ϵ;
gen_28: E gen_29 '0' .. '9' gen_20;
gen_27: gen_28 | ϵ;
gen_23: gen_24 gen_27;
gen_30: '0' .. '9' gen_20 E gen_29 '0' .. '9' gen_20;
gen_22: gen_23 | gen_30;
gen_31: 'A' .. 'Z' | '_' | 'a' .. 'z';
gen_34: '0' .. '9' | 'A' .. 'Z' | '_' | 'a' .. 'z';
gen_32: gen_33 | ϵ;
gen_37: ~'\"';
gen_35: gen_36 | ϵ;
gen_38: '\t' | '\n' | '\r' | ' ' | '0' .. '9' | 'A' .. 'Z' | '_' | 'a' .. 'z';
gen_16: gen_14 gen_15;
gen_17: '0' .. '7' gen_18;
gen_21: '0' .. '9' gen_20;
gen_33: gen_34 gen_32;
gen_36: gen_37 gen_35