gen_0: ϵ | schema | webIDL;
schema: gen_1 null_ optionalLong gen_0;
namespace_decl_root_decl_ns_ident_enum_decl_IDENT_IDENTIFIER_WEBIDL_type_decl_object_attribute_decl_file_extension_decl_STRING_CONSTANT_file_identifier_decl_enum__enumValueList_STRING_WEBIDL: interfaceMembers_dictionaryMembers_required_default__specials_argumentList_arguments_serializationPatternMap_serializationPatternList_identifiers_extendedAttributeList_extendedAttribute_extendedAttributeRest_extendedAttributeInner metadata_definitions_inheritance_optionalIdentifier_enumValueListComma_attributeName_constType_definition_callbackRestOrInterface gen_50 metadata_definitions_inheritance_optionalIdentifier_enumValueListComma_attributeName_constType_definition_callbackRestOrInterface gen_0;
rpc_decl: metadata_definitions_inheritance_optionalIdentifier_enumValueListComma_attributeName_constType_definition_callbackRestOrInterface gen_35 metadata_definitions_inheritance_optionalIdentifier_enumValueListComma_attributeName_constType_definition_callbackRestOrInterface '(' gen_35 metadata_definitions_inheritance_optionalIdentifier_enumValueListComma_attributeName_constType_definition_callbackRestOrInterface ')' ':' gen_35 metadata_definitions_inheritance_optionalIdentifier_enumValueListComma_attributeName_constType_definition_callbackRestOrInterface metadata_definitions_inheritance_optionalIdentifier_enumValueListComma_attributeName_constType_definition_callbackRestOrInterface ';' optionalLong optionalLong;
type: gen_7 | 'bool' | 'byte' | 'ubyte' | 'short' | 'ushort' | 'int' | 'uint' | 'float' | 'long' | 'ulong' | 'double' | 'int8' | 'uint8' | 'int16' | 'uint16' | 'int32' | 'uint32' | 'int64' | 'uint64' | 'float32' | 'float64' | 'string' | namespace_decl_root_decl_ns_ident_enum_decl_IDENT_IDENTIFIER_WEBIDL_type_decl_object_attribute_decl_file_extension_decl_STRING_CONSTANT_file_identifier_decl_enum__enumValueList_STRING_WEBIDL | ϵ | 'getter' | gen_9 | interface__partialInterface_class__dictionary_partialDictionary_partial_implementsStatement_callbackRest_specialOperation_operationRest_typedef | gen_15 | 'true' | 'false' | FLOAT_CONSTANT | iterable_setlikeRest_maplikeRest;
metadata_definitions_inheritance_optionalIdentifier_enumValueListComma_attributeName_constType_definition_callbackRestOrInterface: ϵ | namespace_decl_root_decl_ns_ident_enum_decl_IDENT_IDENTIFIER_WEBIDL_type_decl_object_attribute_decl_file_extension_decl_STRING_CONSTANT_file_identifier_decl_enum__enumValueList_STRING_WEBIDL | gen_31 | 'required' | schema | webIDL | interface__partialInterface_class__dictionary_partialDictionary_partial_implementsStatement_callbackRest_specialOperation_operationRest_typedef | 'attribute' | 'include' | 'file_extension' | 'file_identifier';
scalar_single_value_value_INTEGER_CONSTANT_defaultValue_constValue_type_returnType_unionMemberType: gen_15 | 'true' | 'false' | FLOAT_CONSTANT | namespace_decl_root_decl_ns_ident_enum_decl_IDENT_IDENTIFIER_WEBIDL_type_decl_object_attribute_decl_file_extension_decl_STRING_CONSTANT_file_identifier_decl_enum__enumValueList_STRING_WEBIDL | gen_7 | INTEGER_WEBIDL_FLOAT_WEBIDL | '-Infinity' | 'Infinity' | 'NaN' | 'null' | schema | iterable_setlikeRest_maplikeRest | 'any' | gen_30 | 'void' | ϵ;
FLOAT_CONSTANT: gen_14 gen_14 '.' gen_14 gen_14 gen_14;
webIDL: gen_26 metadata_definitions_inheritance_optionalIdentifier_enumValueListComma_attributeName_constType_definition_callbackRestOrInterface gen_32;
interface__partialInterface_class__dictionary_partialDictionary_partial_implementsStatement_callbackRest_specialOperation_operationRest_typedef: gen_2 metadata_definitions_inheritance_optionalIdentifier_enumValueListComma_attributeName_constType_definition_callbackRestOrInterface interfaceMembers_dictionaryMembers_required_default__specials_argumentList_arguments_serializationPatternMap_serializationPatternList_identifiers_extendedAttributeList_extendedAttribute_extendedAttributeRest_extendedAttributeInner extendedAttributes_unionMemberTypes gen_43;
interfaceMembers_dictionaryMembers_required_default__specials_argumentList_arguments_serializationPatternMap_serializationPatternList_identifiers_extendedAttributeList_extendedAttribute_extendedAttributeRest_extendedAttributeInner: ϵ | interface__partialInterface_class__dictionary_partialDictionary_partial_implementsStatement_callbackRest_specialOperation_operationRest_typedef | 'required' | gen_36 | gen_45 | '=' | gen_46 | 'getter' | gen_9 | gen_7 | gen_48;
interfaceMember_readonlyMemberRest: const__attributeRest | interface__partialInterface_class__dictionary_partialDictionary_partial_implementsStatement_callbackRest_specialOperation_operationRest_typedef | serializer_stringifier_staticMember | iterable_setlikeRest_maplikeRest | readonlyMember | ϵ | '}' | ')';
const__attributeRest: gen_38 metadata_definitions_inheritance_optionalIdentifier_enumValueListComma_attributeName_constType_definition_callbackRestOrInterface gen_40 scalar_single_value_value_INTEGER_CONSTANT_defaultValue_constValue_type_returnType_unionMemberType metadata_definitions_inheritance_optionalIdentifier_enumValueListComma_attributeName_constType_definition_callbackRestOrInterface ';';
serializer_stringifier_staticMember: gen_41 serializerRest_stringifierRest_staticMemberRest;
serializerRest_stringifierRest_staticMemberRest: interface__partialInterface_class__dictionary_partialDictionary_partial_implementsStatement_callbackRest_specialOperation_operationRest_typedef | gen_42 | ';' | const__attributeRest;
serializationPattern: interface__partialInterface_class__dictionary_partialDictionary_partial_implementsStatement_callbackRest_specialOperation_operationRest_typedef | gen_7 | namespace_decl_root_decl_ns_ident_enum_decl_IDENT_IDENTIFIER_WEBIDL_type_decl_object_attribute_decl_file_extension_decl_STRING_CONSTANT_file_identifier_decl_enum__enumValueList_STRING_WEBIDL;
readonlyMember: optionalLong interfaceMember_readonlyMemberRest interfaceMembers_dictionaryMembers_required_default__specials_argumentList_arguments_serializationPatternMap_serializationPatternList_identifiers_extendedAttributeList_extendedAttribute_extendedAttributeRest_extendedAttributeInner;
argumentName: 'attribute' | 'callback' | 'const' | 'deleter' | 'dictionary' | 'enum' | 'getter' | 'implements' | 'inherit' | 'interface' | 'iterable' | 'legacycaller' | 'maplike' | 'partial' | 'required' | 'serializer' | 'setlike' | 'setter' | 'static' | 'stringifier' | 'typedef' | 'unrestricted' | namespace_decl_root_decl_ns_ident_enum_decl_IDENT_IDENTIFIER_WEBIDL_type_decl_object_attribute_decl_file_extension_decl_STRING_CONSTANT_file_identifier_decl_enum__enumValueList_STRING_WEBIDL;
iterable_setlikeRest_maplikeRest: gen_3 gen_2 scalar_single_value_value_INTEGER_CONSTANT_defaultValue_constValue_type_returnType_unionMemberType gen_2 gen_2 gen_3;
extendedAttributes_unionMemberTypes: ϵ | interface__partialInterface_class__dictionary_partialDictionary_partial_implementsStatement_callbackRest_specialOperation_operationRest_typedef | gen_30 | readonlyMember | 'typedef';
floatType: 'float' | 'double';
integerType: 'short' | schema;
optionalLong: 'long' | ϵ | namespace_decl_root_decl_ns_ident_enum_decl_IDENT_IDENTIFIER_WEBIDL_type_decl_object_attribute_decl_file_extension_decl_STRING_CONSTANT_file_identifier_decl_enum__enumValueList_STRING_WEBIDL | rpc_decl | '}' | 'readonly';
null_: ϵ | '?' | gen_7 | '{' | ';' | namespace_decl_root_decl_ns_ident_enum_decl_IDENT_IDENTIFIER_WEBIDL_type_decl_object_attribute_decl_file_extension_decl_STRING_CONSTANT_file_identifier_decl_enum__enumValueList_STRING_WEBIDL;
INTEGER_WEBIDL_FLOAT_WEBIDL: gen_11 gen_14 gen_35;
OTHER_WEBIDL: ~gen_35;
gen_7: gen_8 type gen_38 interfaceMembers_dictionaryMembers_required_default__specials_argumentList_arguments_serializationPatternMap_serializationPatternList_identifiers_extendedAttributeList_extendedAttribute_extendedAttributeRest_extendedAttributeInner;
gen_36: gen_37 interfaceMembers_dictionaryMembers_required_default__specials_argumentList_arguments_serializationPatternMap_serializationPatternList_identifiers_extendedAttributeList_extendedAttribute_extendedAttributeRest_extendedAttributeInner scalar_single_value_value_INTEGER_CONSTANT_defaultValue_constValue_type_returnType_unionMemberType;
gen_2: ϵ | ',' | iterable_setlikeRest_maplikeRest | 'inherit' | '{' | '(' | INTEGER_WEBIDL_FLOAT_WEBIDL;
gen_13: '\"' | '\r' | '\n';
gen_12: ~gen_13;
gen_14: INTEGER_WEBIDL_FLOAT_WEBIDL | ϵ | gen_15 | gen_19 | FLOAT_CONSTANT | '0' .. '9' | gen_25 | 'partial' | gen_29;
gen_35: 'A' .. 'Z' | '_' | 'a' .. 'z' | '0' .. '9' | gen_36 | '\t' | '\n' | '\r' | ' ' | ϵ;
gen_11: '-' | ϵ | '+' | '1' .. '9' | gen_12;
gen_15: gen_16 '0' .. '9' gen_14;
gen_18: 'E' | 'e' | ϵ;
gen_31: gen_2 optionalLong;
gen_42: '=' serializationPattern ';';
gen_9: gen_10 interfaceMembers_dictionaryMembers_required_default__specials_argumentList_arguments_serializationPatternMap_serializationPatternList_identifiers_extendedAttributeList_extendedAttribute_extendedAttributeRest_extendedAttributeInner optionalLong;
gen_45: gen_2 interfaceMembers_dictionaryMembers_required_default__specials_argumentList_arguments_serializationPatternMap_serializationPatternList_identifiers_extendedAttributeList_extendedAttribute_extendedAttributeRest_extendedAttributeInner gen_16 scalar_single_value_value_INTEGER_CONSTANT_defaultValue_constValue_type_returnType_unionMemberType gen_34 argumentName interfaceMembers_dictionaryMembers_required_default__specials_argumentList_arguments_serializationPatternMap_serializationPatternList_identifiers_extendedAttributeList_extendedAttribute_extendedAttributeRest_extendedAttributeInner interfaceMembers_dictionaryMembers_required_default__specials_argumentList_arguments_serializationPatternMap_serializationPatternList_identifiers_extendedAttributeList_extendedAttribute_extendedAttributeRest_extendedAttributeInner;
gen_30: gen_2 'or' scalar_single_value_value_INTEGER_CONSTANT_defaultValue_constValue_type_returnType_unionMemberType extendedAttributes_unionMemberTypes gen_0;
gen_54: 'unrestricted' floatType;
gen_53: 'unsigned' integerType;
gen_24: '0' .. '9' | 'A' .. 'F' | 'a' .. 'f';
gen_21: gen_22 | ϵ | gen_19;
gen_22: gen_23 gen_24 gen_21;
gen_19: gen_20 gen_21;
gen_27: ~'\"';
gen_25: gen_26 gen_14 gen_28;
gen_23: 'X' | 'x' | ϵ;
gen_17: gen_14 gen_18 gen_11;
gen_16: gen_17 | ϵ | 'optional';
gen_34: ϵ | '...' | gen_9;
gen_48: gen_49 gen_35;
gen_33: '{' gen_34;
gen_41: 'serializer' | 'stringifier' | 'static';
gen_5: 'iterable' | 'setlike' | 'maplike' | 'Promise' | 'sequence' | 'FrozenArray';
gen_47: ϵ | gen_48 | gen_7;
gen_29: extendedAttributes_unionMemberTypes scalar_single_value_value_INTEGER_CONSTANT_defaultValue_constValue_type_returnType_unionMemberType;
gen_37: ϵ | 'getter' | 'setter' | 'deleter' | 'legacycaller';
gen_39: 'const' metadata_definitions_inheritance_optionalIdentifier_enumValueListComma_attributeName_constType_definition_callbackRestOrInterface gen_35;
gen_38: gen_39 | ϵ | ']';
gen_40: '=' | 'attribute';
gen_51: ':' scalar_single_value_value_INTEGER_CONSTANT_defaultValue_constValue_type_returnType_unionMemberType optionalLong;
gen_46: gen_47 metadata_definitions_inheritance_optionalIdentifier_enumValueListComma_attributeName_constType_definition_callbackRestOrInterface;
gen_8: ':' | '[';
gen_26: ϵ | 'callback' | gen_27;
gen_32: EOF | '{' | gen_33 | ')' | ϵ;
gen_10: 'inherit' | INTEGER_WEBIDL_FLOAT_WEBIDL | namespace_decl_root_decl_ns_ident_enum_decl_IDENT_IDENTIFIER_WEBIDL_type_decl_object_attribute_decl_file_extension_decl_STRING_CONSTANT_file_identifier_decl_enum__enumValueList_STRING_WEBIDL | OTHER_WEBIDL | '-' | '-Infinity' | '.' | '...' | ':' | ';' | '<' | '=' | '>' | '?' | 'ByteString' | 'DOMString' | 'FrozenArray' | 'Infinity' | 'NaN' | 'RegExp' | 'USVString' | 'any' | 'boolean' | 'byte' | 'double' | 'false' | 'float' | 'long' | 'null' | 'object' | 'octet' | 'or' | 'optional' | 'sequence' | 'short' | 'true' | 'unsigned' | 'void' | 'attribute' | 'callback' | 'const' | 'deleter' | 'dictionary' | 'enum' | 'getter' | 'implements' | 'interface' | 'iterable' | 'legacycaller' | 'maplike' | 'partial' | 'required' | 'serializer' | 'setlike' | 'setter' | 'static' | 'stringifier' | 'typedef' | 'unrestricted' | 'ArrayBuffer' | 'DataView' | 'Int8Array' | 'Int16Array' | 'Int32Array' | 'Uint8Array' | 'Uint16Array' | 'Uint32Array' | 'Uint8ClampedArray' | 'Float32Array' | 'Float64Array' | ',' | ϵ;
gen_20: '0' | '0' .. '7';
gen_28: ϵ | 'interface' | 'class' | 'dictionary';
gen_4: gen_5 '<';
gen_3: gen_4 | ϵ | gen_6;
gen_6: '>' null_;
gen_44: ';' interfaceMembers_dictionaryMembers_required_default__specials_argumentList_arguments_serializationPatternMap_serializationPatternList_identifiers_extendedAttributeList_extendedAttribute_extendedAttributeRest_extendedAttributeInner;
gen_43: gen_44 | ϵ;
gen_52: '\"' gen_14 '\"';
gen_50: ϵ | gen_51 | gen_52;
gen_1: 'long' | ϵ | namespace_decl_root_decl_ns_ident_enum_decl_IDENT_IDENTIFIER_WEBIDL_type_decl_object_attribute_decl_file_extension_decl_STRING_CONSTANT_file_identifier_decl_enum__enumValueList_STRING_WEBIDL | rpc_decl | '}' | 'readonly' | gen_53 | 'short' | schema | gen_54 | 'float' | 'double' | 'boolean' | 'byte' | 'octet' | 'ByteString' | 'DOMString' | 'USVString' | 'object' | 'RegExp' | 'DOMException' | 'ArrayBuffer' | 'DataView' | 'Int8Array' | 'Int16Array' | 'Int32Array' | 'Uint8Array' | 'Uint16Array' | 'Uint32Array' | 'Uint8ClampedArray' | 'Float32Array' | 'Float64Array' | ')';
gen_49: 'implements' | 'namespace' | 'root_type' | ϵ | '.' | namespace_decl_root_decl_ns_ident_enum_decl_IDENT_IDENTIFIER_WEBIDL_type_decl_object_attribute_decl_file_extension_decl_STRING_CONSTANT_file_identifier_decl_enum__enumValueList_STRING_WEBIDL | ',' | 'union' | ':' | 'extends' | 'enum' | 'table' | 'struct' | 'rpc_service' | '(' | '{'