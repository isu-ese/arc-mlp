E: ϵ | K_ALTER_schema_namespace_decl_root_decl_ns_ident_enum_decl_type_decl_IDENT_object_FLOAT_CONSTANT_rpc_decl_attribute_decl_file_extension_decl_STRING_CONSTANT_file_identifier_decl | ';' | ')' | ':' | 'e' | 'E' | gen_5 | '[' | gen_6 | '(';
K_ALTER_schema_namespace_decl_root_decl_ns_ident_enum_decl_type_decl_IDENT_object_FLOAT_CONSTANT_rpc_decl_attribute_decl_file_extension_decl_STRING_CONSTANT_file_identifier_decl: gen_0 gen_2;
A: 'a' | 'A';
L: 'l' | 'L';
T: 't' | 'T';
gen_2: '\"' | '\r' | '\n' | K_ALTER_schema_namespace_decl_root_decl_ns_ident_enum_decl_type_decl_IDENT_object_FLOAT_CONSTANT_rpc_decl_attribute_decl_file_extension_decl_STRING_CONSTANT_file_identifier_decl | gen_3 | 'a' .. 'z' | 'A' .. 'Z' | '_' | '0' .. '9' | ϵ | ']';
gen_5: ~gen_2;
gen_6: ')' ':';
gen_1: A L T;
gen_4: 'r' | 'R' | K_ALTER_schema_namespace_decl_root_decl_ns_ident_enum_decl_type_decl_IDENT_object_FLOAT_CONSTANT_rpc_decl_attribute_decl_file_extension_decl_STRING_CONSTANT_file_identifier_decl | 'bool' | 'byte' | 'ubyte' | 'short' | 'ushort' | 'int' | 'uint' | 'float' | 'long' | 'ulong' | 'double' | 'int8' | 'uint8' | 'int16' | 'uint16' | 'int32' | 'uint32' | 'int64' | 'uint64' | 'float32' | 'float64' | 'string' | 'true' | 'false' | ϵ | '{';
gen_3: E gen_4;
gen_0: 'attribute' | 'include' | 'file_extension' | ϵ | 'file_identifier' | K_ALTER_schema_namespace_decl_root_decl_ns_ident_enum_decl_type_decl_IDENT_object_FLOAT_CONSTANT_rpc_decl_attribute_decl_file_extension_decl_STRING_CONSTANT_file_identifier_decl | gen_1 | ',' | '{' | '=' | 'namespace' | 'root_type' | '.' | 'table' | 'struct' | 'rpc_service' | '(' | 'union' | 'enum' | '-' | '+' | '}' | 'true' | 'false'