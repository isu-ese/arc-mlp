gen_0: DecimalIntegerLiteral_INTEGER_LITERAL | HexIntegerLiteral_HEX_LITERAL_HexadecimalFloatingPointLiteral_OctalIntegerLiteral | BinaryIntegerLiteral_DigitsAndUnderscores_BinaryDigitsAndUnderscores | Digits_ExponentPart | 'true' | 'false' | WIDE_CHARACTER_LITERAL_CHARACTER_LITERAL | StringLiteral_context_expr_WIDE_STRING_LITERAL_STRING_LITERAL | 'null' | specification;
DecimalIntegerLiteral_INTEGER_LITERAL: gen_1 gen_27 gen_54;
HexIntegerLiteral_HEX_LITERAL_HexadecimalFloatingPointLiteral_OctalIntegerLiteral: '0' gen_88 gen_43 gen_27 gen_31;
BinaryIntegerLiteral_DigitsAndUnderscores_BinaryDigitsAndUnderscores: gen_27 Digit_DigitOrUnderscore_BinaryDigit_BinaryDigitOrUnderscore gen_32 gen_27;
Digits_ExponentPart: gen_32 gen_31 FloatTypeSuffix_FLOAT_TYPE_SUFFIX;
Digit_DigitOrUnderscore_BinaryDigit_BinaryDigitOrUnderscore: '0' | '1' .. '9' | '_' | '1';
Underscores_EXPONENT: gen_35 gen_31 gen_31;
HexDigits_HexDigitsAndUnderscores: gen_43 HexDigit_HEX_DIGIT_HexDigitOrUnderscore gen_43;
HexDigit_HEX_DIGIT_HexDigitOrUnderscore: '0' .. '9' | 'a' .. 'f' | 'A' .. 'F' | '_';
OctalDigitsAndUnderscores: gen_44 gen_43 gen_44;
ExponentIndicator: 'e' | 'E';
Sign_unary_operator: ϵ | '+' | '-' | '~';
FloatTypeSuffix_FLOAT_TYPE_SUFFIX: ϵ | 'f' | 'F' | 'd' | 'D';
SingleCharacter: ~gen_37;
StringLiteral_context_expr_WIDE_STRING_LITERAL_STRING_LITERAL: gen_27 '\"' gen_36 '\"' gen_68;
StringCharacters: StringCharacter_EscapeSequence gen_36;
StringCharacter_EscapeSequence: SingleCharacter | gen_38 | gen_40 | UnicodeEscape_UNICODE_ESCAPE | 'u';
UnicodeEscape_UNICODE_ESCAPE: '\\' 'u' gen_36 HexDigit_HEX_DIGIT_HexDigitOrUnderscore HexDigit_HEX_DIGIT_HexDigitOrUnderscore HexDigit_HEX_DIGIT_HexDigitOrUnderscore HexDigit_HEX_DIGIT_HexDigitOrUnderscore;
specification: gen_36 definition_export_value_element_home_export gen_76;
definition_export_value_element_home_export: gen_21 | gen_77 | gen_72 | interface_decl_value_abs_decl_event_abs_decl_value_decl_event_decl_component_decl_interface_inheritance_spec_supported_interface_spec_scoped_name_component_inheritance_spec_home_inheritance_spec_primary_key_spec_raises_expr_set_excep_expr_init_decl | gen_78 | state_member_struct_type_union_type | gen_79;
interface_decl_value_abs_decl_event_abs_decl_value_decl_event_decl_component_decl_interface_inheritance_spec_supported_interface_spec_scoped_name_component_inheritance_spec_home_inheritance_spec_primary_key_spec_raises_expr_set_excep_expr_init_decl: gen_47 LETTER gen_11 gen_60 interface_type gen_64;
forward_decl_value_forward_decl_event_forward_decl: gen_49 gen_50 gen_11;
interface_body_component_body: gen_20 | ϵ | ',';
value_box_decl_component_forward_decl_ID: gen_12 LETTER gen_11 gen_13 const_type_op_type_spec_param_type_spec_type_spec_simple_type_spec_switch_type_spec gen_13;
state_member_struct_type_union_type: gen_70 const_type_op_type_spec_param_type_spec_type_spec_simple_type_spec_switch_type_spec declarator_case_label gen_1 ';' gen_76 gen_74;
init_param_decls: interface_body_component_body gen_17 LETTER gen_11 gen_59;
const_type_op_type_spec_param_type_spec_type_spec_simple_type_spec_switch_type_spec: 'short' | 'long' | signed_longlong_int_unsigned_longlong_int | unsigned_short_int_unsigned_long_int | 'char' | 'wchar' | 'boolean' | 'float' | 'double' | gen_82 | array_declarator | 'string' | 'wstring' | 'fixed' | interface_decl_value_abs_decl_event_abs_decl_value_decl_event_decl_component_decl_interface_inheritance_spec_supported_interface_spec_scoped_name_component_inheritance_spec_home_inheritance_spec_primary_key_spec_raises_expr_set_excep_expr_init_decl | 'octet' | 'any' | 'Object' | 'ValueBase' | 'void' | gen_83 | fixed_pt_type | state_member_struct_type_union_type | enum_type | ϵ | ')' | ':';
unary_expr_primary_expr: gen_4 | interface_decl_value_abs_decl_event_abs_decl_value_decl_event_decl_component_decl_interface_inheritance_spec_supported_interface_spec_scoped_name_component_inheritance_spec_home_inheritance_spec_primary_key_spec_raises_expr_set_excep_expr_init_decl | HexIntegerLiteral_HEX_LITERAL_HexadecimalFloatingPointLiteral_OctalIntegerLiteral | DecimalIntegerLiteral_INTEGER_LITERAL | StringLiteral_context_expr_WIDE_STRING_LITERAL_STRING_LITERAL | WIDE_CHARACTER_LITERAL_CHARACTER_LITERAL | Underscores_EXPONENT | 'TRUE' | 'FALSE' | array_declarator;
declarator_case_label: value_box_decl_component_forward_decl_ID | array_declarator | gen_53;
signed_longlong_int_unsigned_longlong_int: gen_17 'long' 'long';
unsigned_short_int_unsigned_long_int: 'unsigned' gen_81;
enum_type: 'enum' LETTER gen_11 '{' LETTER gen_11 gen_59 '}';
array_declarator: gen_5 gen_5 gen_5;
param_attribute: 'in' | 'out' | 'inout';
fixed_pt_type: 'fixed' '<' unary_expr_primary_expr gen_1 gen_5 gen_5 gen_5 gen_5 gen_5 ',' unary_expr_primary_expr gen_1 gen_5 gen_5 gen_5 gen_5 gen_5 '>';
imported_scope_readonly_attr_declarator_attr_declarator: interface_decl_value_abs_decl_event_abs_decl_value_decl_event_decl_component_decl_interface_inheritance_spec_supported_interface_spec_scoped_name_component_inheritance_spec_home_inheritance_spec_primary_key_spec_raises_expr_set_excep_expr_init_decl | StringLiteral_context_expr_WIDE_STRING_LITERAL_STRING_LITERAL | init_param_decls;
interface_type: interface_decl_value_abs_decl_event_abs_decl_value_decl_event_decl_component_decl_interface_inheritance_spec_supported_interface_spec_scoped_name_component_inheritance_spec_home_inheritance_spec_primary_key_spec_raises_expr_set_excep_expr_init_decl | 'Object' | ϵ;
WIDE_CHARACTER_LITERAL_CHARACTER_LITERAL: gen_27 '\'' StringCharacter_EscapeSequence '\'';
LETTER: '$' | 'A' .. 'Z' | '_' | 'a' .. 'z' | '\u00C0' .. '\u00D6' | '\u00D8' .. '\u00F6' | '\u00F8' .. '\u00FF' | '\u0100' .. '\u1FFF' | '\u3040' .. '\u318F' | '\u3300' .. '\u337F' | '\u3400' .. '\u3D2D' | '\u4E00' .. '\u9FFF' | '\uF900' .. '\uFAFF' | '0' .. '9' | '\u0660' .. '\u0669' | '\u06F0' .. '\u06F9' | '\u0966' .. '\u096F' | '\u09E6' .. '\u09EF' | '\u0A66' .. '\u0A6F' | '\u0AE6' .. '\u0AEF' | '\u0B66' .. '\u0B6F' | '\u0BE7' .. '\u0BEF' | '\u0C66' .. '\u0C6F' | '\u0CE6' .. '\u0CEF' | '\u0D66' .. '\u0D6F' | '\u0E50' .. '\u0E59' | '\u0ED0' .. '\u0ED9' | '\u1040' .. '\u1049';
gen_27: ϵ | 'l' | 'L' | '.' | gen_14 | ',' | gen_28 | gen_30 | BinaryIntegerLiteral_DigitsAndUnderscores_BinaryDigitsAndUnderscores | gen_33;
gen_31: Digits_ExponentPart | ϵ | Underscores_EXPONENT | '0' .. '3' | 'readonly';
gen_91: gen_92 gen_31 gen_92;
gen_32: BinaryIntegerLiteral_DigitsAndUnderscores_BinaryDigitsAndUnderscores | ϵ | gen_33;
gen_90: 'x' | 'X';
gen_43: HexDigits_HexDigitsAndUnderscores | ϵ | OctalDigitsAndUnderscores;
gen_34: 'b' | 'B';
gen_37: '\'' | '\\' | '\r' | '\n' | '\"';
gen_36: StringCharacters | ϵ | gen_46;
gen_39: 'b' | 't' | 'n' | 'f' | 'r' | '\"' | '\'' | '\\';
gen_38: '\\' gen_39;
gen_40: '\\' gen_41 '0' .. '7';
gen_76: specification | ϵ | state_member_struct_type_union_type;
gen_21: gen_22 ';';
gen_77: 'const' const_type_op_type_spec_param_type_spec_type_spec_simple_type_spec_switch_type_spec LETTER gen_11 '=' unary_expr_primary_expr gen_1 gen_5 gen_5 gen_5 gen_5 gen_5 ';';
gen_72: gen_73 LETTER gen_11 '{' gen_74;
gen_49: 'abstract' | 'local' | ϵ | 'custom';
gen_78: gen_31 'attribute' const_type_op_type_spec_param_type_spec_type_spec_simple_type_spec_switch_type_spec imported_scope_readonly_attr_declarator_attr_declarator ';';
gen_59: '::' | ϵ | init_param_decls;
gen_5: ϵ | array_declarator | gen_4 | gen_6 | gen_86 | '>';
gen_3: '*' | '/' | '%';
gen_1: gen_2 | ϵ | gen_23 | gen_91 | '0';
gen_4: Sign_unary_operator unary_expr_primary_expr gen_5;
gen_23: gen_24 declarator_case_label gen_1;
gen_82: 'long' 'double';
gen_70: gen_71 | ϵ | 'public' | 'private' | gen_72;
gen_53: gen_54 ':' gen_55;
gen_83: 'sequence' '<' const_type_op_type_spec_param_type_spec_type_spec_simple_type_spec_switch_type_spec '>';
gen_60: gen_61 | ϵ | gen_63;
gen_61: gen_24 param_attribute const_type_op_type_spec_param_type_spec_type_spec_simple_type_spec_switch_type_spec LETTER gen_11 gen_60 gen_62;
gen_63: '(' gen_59 ')';
gen_79: gen_80 interface_type LETTER gen_11 ';';
gen_11: 'multiple' | ϵ | value_box_decl_component_forward_decl_ID;
gen_20: definition_export_value_element_home_export interface_body_component_body;
gen_46: 'import' imported_scope_readonly_attr_declarator_attr_declarator ';' gen_36;
gen_2: gen_3 unary_expr_primary_expr gen_1;
gen_71: gen_11 declarator_case_label gen_70;
gen_50: 'valuetype' | 'eventtype' | 'interface';
gen_58: gen_55 gen_11 gen_19;
gen_57: gen_58 | 'setraises' | 'getraises';
gen_85: 'sequence' | 'string' | 'wstring';
gen_18: gen_19 const_type_op_type_spec_param_type_spec_type_spec_simple_type_spec_switch_type_spec interface_body_component_body;
gen_17: gen_18 | ϵ | 'unsigned';
gen_62: ')' | ϵ | ':';
gen_24: '(' | ',' | gen_25;
gen_86: gen_87 gen_5 gen_62;
gen_42: gen_43 '.';
gen_41: ϵ | gen_42 | gen_45;
gen_80: 'provides' | gen_58;
gen_30: gen_31 ExponentIndicator Sign_unary_operator;
gen_29: gen_30 | 'p' | 'P';
gen_48: gen_49 'interface';
gen_14: gen_15 '(';
gen_45: gen_31 '0' .. '7';
gen_10: gen_11 '[';
gen_84: gen_85 '<' gen_17;
gen_56: gen_11 gen_57 '(';
gen_69: gen_62 interface_type gen_64;
gen_74: '}' | ϵ | gen_75;
gen_9: gen_10 | gen_84 | '(' | '|' | 'case' | '^' | '&' | '>>' | '<<';
gen_25: gen_26 const_type_op_type_spec_param_type_spec_type_spec_simple_type_spec_switch_type_spec;
gen_28: gen_29 Sign_unary_operator;
gen_51: gen_52 gen_59;
gen_73: 'exception' | 'module' | 'struct';
gen_75: gen_76 '}' ';';
gen_68: ϵ | ';' | gen_25;
gen_33: '0' gen_34;
gen_44: '0' .. '7' | '_' | ϵ;
gen_67: '{' interface_body_component_body '}' gen_68;
gen_66: gen_67 | gen_51;
gen_65: interface_type gen_66;
gen_12: 'valuetype' | 'component' | ϵ | 'native' | 'struct' | 'union';
gen_13: ϵ | gen_14 | gen_16;
gen_16: ')' '{';
gen_47: gen_48 | forward_decl_value_forward_decl_event_forward_decl | 'component' | interface_decl_value_abs_decl_event_abs_decl_value_decl_event_decl_component_decl_interface_inheritance_spec_supported_interface_spec_scoped_name_component_inheritance_spec_home_inheritance_spec_primary_key_spec_raises_expr_set_excep_expr_init_decl | 'home' | gen_51 | '::' | 'factory' | 'finder' | gen_25;
gen_64: gen_65 | gen_69 | gen_21 | ϵ;
gen_81: 'short' | 'long';
gen_8: gen_9 unary_expr_primary_expr;
gen_7: gen_8 | ϵ | DecimalIntegerLiteral_INTEGER_LITERAL;
gen_92: '1' .. '9' | '.' | ϵ;
gen_6: gen_7 gen_1;
gen_35: '_' | gen_6;
gen_54: ϵ | '0' .. '9' | 'default';
gen_89: gen_90 gen_41 HexDigit_HEX_DIGIT_HexDigitOrUnderscore;
gen_88: gen_89 | gen_45;
gen_22: gen_23 | state_member_struct_type_union_type | enum_type | value_box_decl_component_forward_decl_ID | interface_decl_value_abs_decl_event_abs_decl_value_decl_event_decl_component_decl_interface_inheritance_spec_supported_interface_spec_scoped_name_component_inheritance_spec_home_inheritance_spec_primary_key_spec_raises_expr_set_excep_expr_init_decl | forward_decl_value_forward_decl_event_forward_decl | StringLiteral_context_expr_WIDE_STRING_LITERAL_STRING_LITERAL | ϵ;
gen_55: ϵ | 'truncatable' | 'uses';
gen_19: 'raises' | ϵ | 'in';
gen_87: ϵ | ']';
gen_15: 'context' | 'switch';
gen_26: 'oneway' | ϵ | StringLiteral_context_expr_WIDE_STRING_LITERAL_STRING_LITERAL | 'typedef';
gen_52: gen_53 | 'supports' | ',' | ϵ | ':' | 'primarykey' | gen_56 | 'typeid' | 'typeprefix' | 'emits' | 'publishes' | 'consumes' | 'manages'