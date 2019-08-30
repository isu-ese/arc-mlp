gen_0: root | prog;
root: gen_1 gen_142 EOF;
cqls: gen_2 gen_143;
cql: createKeyspace_alterKeyspace | alterMaterializedView | alterRole | alterTable | alterType | createUser_alterUser | applyBatch | createAggregate | createFunction | createIndex | createMaterializedView | createRole | createTable | createTrigger | createType | delete | dropType_dropAggregate_dropFunction | dropIndex | dropKeyspace | dropMaterializedView | dropUser_dropRole | dropTable | dropTrigger | grant | insert | listPermissions | listRoles | revoke | select | truncate | update | use | ϵ;
revoke: K_REVOKE priviledge K_ON resource K_FROM OBJECT_NAME;
listRoles: K_LIST K_ROLES gen_113 gen_115;
listPermissions: K_LIST priviledge gen_111 gen_113;
grant: K_GRANT priviledge K_ON resource K_TO OBJECT_NAME;
priviledge: K_ALL | kwAllPermissions | K_ALTER | K_AUTHORIZE | K_DESCRIBE | K_EXECUTE | K_CREATE | K_DROP | K_MODIFY | K_SELECT;
resource: gen_93 | gen_94 | gen_95 | gen_96 | gen_97 | truncate | gen_100 | gen_101;
createUser_alterUser: gen_6 K_USER gen_7 OBJECT_NAME K_WITH K_PASSWORD STRING_LITERAL gen_51;
createRole: K_CREATE K_ROLE gen_7 OBJECT_NAME gen_37;
createType: K_CREATE K_TYPE gen_7 gen_26 OBJECT_NAME LR_BRACKET keyspace_table_column dataTypeName gen_44 gen_47 RR_BRACKET;
createTrigger: K_CREATE K_TRIGGER gen_7 gen_26 OBJECT_NAME K_USING STRING_LITERAL;
createMaterializedView: K_CREATE K_MATERIALIZED K_VIEW gen_7 gen_26 OBJECT_NAME K_AS K_SELECT keyspace_table_column gen_48 K_FROM gen_26 keyspace_table_column K_WHERE keyspace_table_column K_IS K_NOT K_NULL gen_58 gen_60 K_PRIMARY K_KEY LR_BRACKET keyspace_table_column gen_48 RR_BRACKET gen_74;
materializedViewOptions: alterTableWith_tableOptions | clusteringOrder;
createKeyspace_alterKeyspace: gen_6 K_KEYSPACE gen_7 keyspace_table_column K_WITH K_REPLICATION OPERATOR_EQ LC_BRACKET replicationListItem gen_22 RC_BRACKET gen_24;
createFunction: K_CREATE gen_52 K_FUNCTION gen_7 gen_26 OBJECT_NAME LR_BRACKET gen_53 RR_BRACKET gen_55 K_ON K_NULL K_INPUT K_RETURNS dataTypeName gen_44 K_LANGUAGE OBJECT_NAME K_AS CODE_BLOCK;
paramList: gen_54 OBJECT_NAME dataTypeName gen_44 gen_53;
createAggregate: K_CREATE gen_52 K_AGGREGATE gen_7 gen_26 OBJECT_NAME LR_BRACKET dataTypeName gen_44 RR_BRACKET K_SFUNC OBJECT_NAME K_STYPE dataTypeName gen_44 K_FINALFUNC OBJECT_NAME K_INITCOND initCondDefinition_constant;
initCondDefinition_constant: UUID | STRING_LITERAL | DECIMAL_LITERAL | HEXADECIMAL_LITERAL | K_TRUE | K_FALSE | K_NULL | initCondList | initCondListNested | initCondHash;
initCondHash: LC_BRACKET OBJECT_NAME COLON_0 initCondDefinition_constant gen_17 RC_BRACKET;
initCondListNested: LR_BRACKET LR_BRACKET initCondDefinition_constant gen_10 RR_BRACKET gen_14 RR_BRACKET;
initCondList: LR_BRACKET initCondDefinition_constant gen_10 RR_BRACKET;
orReplace: K_OR K_REPLACE;
alterType: K_ALTER K_TYPE gen_26 OBJECT_NAME alterTypeOperation;
alterTypeOperation: alterTypeAlterType | alterTypeAdd_alterTableAdd | alterTypeRename_alterTableRename;
alterTypeRename_alterTableRename: gen_49 keyspace_table_column K_TO keyspace_table_column gen_50;
alterTypeAdd_alterTableAdd: gen_43 keyspace_table_column dataTypeName gen_44 gen_47;
alterTypeAlterType: K_ALTER keyspace_table_column K_TYPE dataTypeName gen_44;
alterTable: K_ALTER K_TABLE gen_26 keyspace_table_column alterTableOperation;
alterTableOperation: alterTypeAdd_alterTableAdd | alterTableDropColumns | alterTableDropCompactStorage | alterTypeRename_alterTableRename | alterTableWith_tableOptions;
alterTableWith_tableOptions: gen_29 tableOptionItem gen_35;
alterTableDropCompactStorage: K_DROP K_COMPACT K_STORAGE;
alterTableDropColumns: K_DROP keyspace_table_column gen_48;
alterRole: K_ALTER K_ROLE OBJECT_NAME gen_37;
roleWith: K_WITH roleWithOptions gen_41;
roleWithOptions: gen_38 | gen_39 | gen_40 | gen_31;
alterMaterializedView: K_ALTER K_MATERIALIZED K_VIEW gen_26 OBJECT_NAME gen_28;
dropUser_dropRole: K_DROP gen_92 gen_7 OBJECT_NAME;
dropType_dropAggregate_dropFunction: K_DROP gen_91 gen_7 gen_26 OBJECT_NAME;
dropMaterializedView: K_DROP K_MATERIALIZED K_VIEW gen_7 gen_26 OBJECT_NAME;
dropTrigger: K_DROP K_TRIGGER gen_7 OBJECT_NAME K_ON gen_26 keyspace_table_column;
dropTable: K_DROP K_TABLE gen_7 gen_26 keyspace_table_column;
dropKeyspace: K_DROP K_KEYSPACE gen_7 keyspace_table_column;
dropIndex: K_DROP K_INDEX gen_7 gen_26 indexName;
createTable: K_CREATE K_TABLE gen_7 gen_26 keyspace_table_column LR_BRACKET keyspace_table_column dataTypeName gen_44 gen_79 gen_80 gen_82 RR_BRACKET gen_84;
withElement: K_WITH gen_28 gen_85;
clusteringOrder: gen_76 K_CLUSTERING K_ORDER K_BY LR_BRACKET keyspace_table_column gen_78 RR_BRACKET;
tableOptionItem: gen_30 | gen_31;
tableOptionValue_optionHashValue: STRING_LITERAL | DECIMAL_LITERAL | FLOAT_LITERAL;
primaryKeyColumn: K_PRIMARY K_KEY;
primaryKeyDefinition: OBJECT_NAME | gen_19 | compoundKey | compositeKey;
compoundKey: keyspace_table_column COMMA_0 keyspace_table_column gen_48;
compositeKey: LR_BRACKET keyspace_table_column gen_48 RR_BRACKET COMMA_0 keyspace_table_column gen_48;
applyBatch: K_APPLY K_BATCH;
beginBatch: K_BEGIN gen_87 K_BATCH gen_88;
replicationListItem: gen_20 | gen_21;
use: K_USE keyspace_table_column;
truncate: gen_98 gen_99 gen_26 keyspace_table_column;
createIndex: K_CREATE K_INDEX gen_7 indexName K_ON gen_26 keyspace_table_column LR_BRACKET indexColumnSpec RR_BRACKET;
indexName: OBJECT_NAME | STRING_LITERAL | ϵ;
indexColumnSpec: OBJECT_NAME | gen_19 | indexKeysSpec_indexEntriesSSpec_indexFullSpec;
indexKeysSpec_indexEntriesSSpec_indexFullSpec: gen_57 LR_BRACKET OBJECT_NAME RR_BRACKET;
delete: gen_86 K_DELETE gen_89 K_FROM fromSpecElement gen_88 K_WHERE relationElement gen_60 gen_7;
deleteColumnList: gen_54 deleteColumnItem gen_89;
deleteColumnItem: OBJECT_NAME | gen_90;
update: gen_86 K_UPDATE gen_26 keyspace_table_column gen_107 K_SET assignmentElement gen_140 K_WHERE relationElement gen_60 gen_7;
ifSpec: gen_9 OBJECT_NAME OPERATOR_EQ initCondDefinition_constant gen_7;
assignmentElement: gen_128 | gen_129 | gen_131 | gen_138 | gen_139;
assignmentSet: LC_BRACKET initCondDefinition_constant gen_10 RC_BRACKET;
assignmentMap: gen_12 initCondDefinition_constant COLON_0 initCondDefinition_constant gen_10 gen_13;
assignmentList: LS_BRACKET initCondDefinition_constant gen_103 RS_BRACKET;
insert: gen_86 K_INSERT K_INTO gen_26 keyspace_table_column '(' keyspace_table_column gen_48 ')' K_VALUES '(' gen_102 gen_105 ')' gen_7 gen_107;
usingTimestampSpec: K_USING K_TIMESTAMP DECIMAL_LITERAL;
ifNotExist_ifExist: K_IF gen_8 K_EXISTS;
select: K_SELECT gen_116 selectElement gen_122 K_FROM fromSpecElement gen_124 gen_125 gen_126 gen_127;
allowFilteringSpec: K_ALLOW K_FILTERING;
limitSpec: K_LIMIT DECIMAL_LITERAL;
fromSpecElement: OBJECT_NAME | gen_64;
orderSpec: K_ORDER K_BY OBJECT_NAME gen_78;
whereSpec: K_WHERE relationElement gen_60;
selectElement: gen_117 | gen_118 | gen_121 | '*';
relationElement: gen_62 | gen_64 | gen_66 | gen_72 | gen_68 | relalationContains_relalationContainsKey;
relalationContains_relalationContainsKey: OBJECT_NAME K_CONTAINS gen_73 initCondDefinition_constant;
functionCall: gen_67 | gen_68;
functionArgs: gen_54 gen_71 gen_70;
booleanLiteral: K_TRUE | K_FALSE;
keyspace_table_column: OBJECT_NAME | gen_19 | ϵ;
dataTypeName: OBJECT_NAME | K_TIMESTAMP | K_SET | K_ASCII | K_BIGINT | K_BLOB | K_BOOLEAN | K_COUNTER | K_DATE | K_DECIMAL | K_DOUBLE | K_FLOAT | K_FROZEN | K_INET | K_INT | K_LIST | K_MAP | K_SMALLINT | K_TEXT | K_TIME | K_TIMEUUID | K_TINYINT | K_TUPLE | K_VARCHAR | K_VARINT | K_UUID;
dataTypeDefinition: OPERATOR_LT dataTypeName gen_45 OPERATOR_GT;
kwAllPermissions: K_ALL K_PERMISSIONS;
prog: statement_stmt_atom SEMICOLON gen_305;
statement_stmt_atom: dual_add_r | gen_154 | gen_202 | gen_175 | gen_191 | gen_203 | gen_216 | gen_156 | gen_165 | gen_168 | gen_171 | gen_172 | gen_174 | gen_220 | gen_193 | gen_233 | flow_contorl_8 | flow_control_9_and_11 | flow_control_10 | flow_control_8a | flow_control_8b | flow_control_9a | flow_control_9b | flow_control_11a | flow_control_11b | flow_control_12 | flow_control_13 | imm_mov_14a | imm_mov_14b | declaration_exp5_imm_mov_16_imm_mov_17 | gen_271 | mov_exp_4a_mem_addr_ia_int_mem_addr_dm_ia_int_mem_addr_ic_int_mem_addr_pm_ic_int_mov_exp_4c | gen_273 | gen_278 | NOP | IDLE | IDLE16 | gen_279 | RFRAME | declaration | if_compute_mov | compute_mov_exp | sec | seg | DOT_ENDSEG | gen_294 | DOT_COMPRESS | declaration_exp1 | gen_295 | gen_296 | DOT_FORCECOMPRESS | gen_297 | gen_298 | value_exp2 | DOT_LIST | DOT_LIST_DATA | DOT_LIST_DATFILE | DOT_LIST_WRAPDATA | DOT_NEWPAGE | DOT_NOCOMPRESS | DOT_NOLIST_DATA | DOT_NOLIST_DATFILE | DOT_NOLIST_WRAPDATA | gen_301 | DOT_ROUND_MINUS | DOT_ROUND_NEAREST | DOT_ROUND_PLUS | DOT_ROUND_ZERO | DOT_PREVIOUS | gen_302 | gen_303 | ϵ;
sec: DOT_SECTION seg_qualifier ID;
seg: DOT_SEGMENT seg_qualifier ID;
seg_qualifier: seg_qualifier1 | seg_qualifier2 | seg_qualifier3;
seg_qualifier1: DIV gen_290 gen_291;
seg_qualifier2: DIV seg_qualifier_3 gen_292;
seg_qualifier3: DIV DMAONLY gen_293;
seg_qualifier_3: NO_INIT | ZERO_INIT | RUNTIME_INIT;
declaration: DOT_VAR gen_280;
declaration_exp1: gen_281 ID gen_282;
declaration_exp2: gen_284 initExpression gen_285;
declaration_exp3: ID LBRACKET RBRACKET gen_287;
declaration_exp4: ID LBRACKET gen_151 factor_atom gen_152 RBRACKET gen_287;
declaration_exp5_imm_mov_16_imm_mov_17: lcntr_v_u_reg_u_reg2 EQU gen_151 factor_atom gen_152;
declaration_exp_f1_declaration_exp_f2: declaration_exp2 | StringLiteral | gen_289;
initExpression: value_exp2 | CharLiteral;
value_exp2: gen_153 gen_151 factor_atom gen_152;
factor_atom: INT | gen_146 | gen_147 | ID | jump_addr_pc;
compute_if_compute_mov_exp: dual_add_r | gen_154 | gen_202 | gen_175 | gen_191 | gen_203 | gen_216 | gen_156 | gen_165 | gen_168 | gen_171 | gen_172 | gen_174 | gen_220 | gen_193 | gen_233 | compute_mov_exp;
if_compute_mov: IF ccondition compute_if_compute_mov_exp;
compute_mov_exp: gen_254 gen_256;
mov_exp_1: gen_257 DM LPARENTHESE ia COMMA_1 mb RPARENTHESE gen_259 COMMA_1 gen_257 PM LPARENTHESE ic COMMA_1 md RPARENTHESE gen_259;
mov_exp_3a: gen_261 EQU lcntr_v_u_reg_u_reg2;
mov_exp_3b: gen_262 EQU lcntr_v_u_reg_u_reg2;
mov_exp_3c: lcntr_v_u_reg_u_reg2 EQU gen_261;
mov_exp_3d: lcntr_v_u_reg_u_reg2 EQU gen_262;
mov_exp_4a_mem_addr_ia_int_mem_addr_dm_ia_int_mem_addr_ic_int_mem_addr_pm_ic_int_mov_exp_4c: gen_257 gen_251 LPARENTHESE gen_263 COMMA_1 gen_151 factor_atom gen_152 RPARENTHESE gen_259;
mov_exp_5: lcntr_v_u_reg_u_reg2 EQU lcntr_v_u_reg_u_reg2;
mov_exp_7: MODIFY gen_261;
mem_addr_ia_mb_mem_addr_dm_ia_mb: gen_251 LPARENTHESE ia COMMA_1 mb RPARENTHESE;
mem_addr_ic_md_mem_addr_pm_ic_md: gen_251 LPARENTHESE ic COMMA_1 md RPARENTHESE;
mem_addr_md_ic_mem_addr_pm_md_ic: gen_251 LPARENTHESE md COMMA_1 ic RPARENTHESE;
mem_addr_dm_mb_ia: DM LPARENTHESE mb COMMA_1 ia RPARENTHESE;
fixpoint_alu_op: gen_175 | gen_191;
r_exp: gen_176 | gen_177 | gen_183 | gen_179 | gen_182 | gen_184 | gen_185 | gen_186 | gen_187 | gen_188 | gen_189 | gen_190 | gen_191 | gen_193 | gen_195 | gen_196 | gen_197 | gen_200;
floating_point_alu_op: gen_203 | gen_216 | ϵ;
f_exp: gen_204 | gen_205 | gen_206 | gen_207 | gen_208 | gen_209 | gen_210 | gen_211 | gen_212 | gen_213 | gen_214 | gen_215 | gen_216 | gen_217 | gen_218;
multi_r: gen_157 sec_op_sec_op2_r_reg MULT sec_op_sec_op2_r_reg gen_159;
multi_exp_r: multi_r | gen_161 | gen_164 | MRB | MRF;
multi_exp_mrf: multi_r | gen_166 | gen_167;
multi_exp_mrb: multi_r | gen_169 | gen_170;
mr: MRB | MRF;
shifter_exp: gen_193 | gen_221 | gen_223 | gen_227 | gen_230 | gen_231 | gen_232;
sec_op_sec_op2_r_reg: R0 | R1 | R2 | R3 | R4 | R5 | R6 | R7 | R8 | R9 | R10 | R11 | R12 | R13 | R14 | R15 | INT | gen_146 | gen_147 | ID | gen_148 | bit_data | ϵ;
bit_data: INT COLON_1 INT;
add_or_sub: PLUS_1 | MINUS_1;
dual_add_r: sec_op_sec_op2_r_reg EQU sec_op_sec_op2_r_reg PLUS_1 sec_op_sec_op2_r_reg COMMA_1 sec_op_sec_op2_r_reg EQU sec_op_sec_op2_r_reg MINUS_1 sec_op_sec_op2_r_reg;
flow_contorl_8: IF ccondition flow_contorl_8_exp;
flow_contorl_8_exp: flow_control_8a | flow_control_8b;
flow_control_9_and_11: IF ccondition flow_control_9_and_11_exp COMMA_1 ELSE compute_if_compute_mov_exp;
flow_control_9_and_11_exp: flow_control_9a | flow_control_9b | flow_control_11a | flow_control_11b;
flow_control_10: IF ccondition JUMP flow_control_10_frag COMMA_1 ELSE gen_254 gen_257 DM LPARENTHESE ia COMMA_1 mb RPARENTHESE gen_259;
flow_control_10_frag: mem_addr_md_ic_mem_addr_pm_md_ic | jump_addr_pc;
flow_control_12: LCNTR EQU lcntr_v_u_reg_u_reg2 COMMA_1 DO jump_addr_int_or_pc UNTIL LCE;
lcntr_v_u_reg_u_reg2: value_exp2 | R0 | R1 | R2 | R3 | R4 | R5 | R6 | R7 | R8 | R9 | R10 | R11 | R12 | R13 | R14 | R15 | F0 | F1 | F2 | F3 | F4 | F5 | F6 | F7 | F8 | F9 | F10 | F11 | F12 | F13 | F14 | F15 | PC | PCSTK | PCSTKP | FADDR | DADDR | LADDR | CURLCNTR | LCNTR | I0 | I1 | I2 | I3 | I4 | I5 | I6 | I7 | I8 | I9 | I10 | I11 | I12 | I13 | I14 | I15 | M0 | M1 | M2 | M3 | M4 | M5 | M6 | M7 | M8 | M9 | M10 | M11 | M12 | M13 | M14 | M15 | B0 | B1 | B2 | B3 | B4 | B5 | B6 | B7 | B8 | B9 | B10 | B11 | B12 | B13 | B14 | B15 | L0 | L1 | L2 | L3 | L4 | L5 | L6 | L7 | L8 | L9 | L10 | L11 | L12 | L13 | L14 | L15 | PX1 | PX2 | PX | TPERIOD | TCOUNT | MODE1 | MODE2 | IRPTL | IMASK | IMASKP | ASTAT | STKY | USTAT1 | USTAT2 | ID | mem_addr_ia_mb_mem_addr_dm_ia_mb | mem_addr_ic_md_mem_addr_pm_ic_md;
flow_control_13: DO jump_addr_int_or_pc UNTIL ccondition;
flow_control_8a: JUMP gen_151 factor_atom gen_152 gen_246;
flow_control_8b: CALL gen_151 factor_atom gen_152 gen_250;
flow_control_9a: JUMP flow_control_10_frag gen_246 gen_252;
flow_control_9b: CALL flow_control_10_frag gen_250 gen_252;
flow_control_11a: RTS gen_267 gen_252;
flow_control_11b: RTI gen_250 gen_252;
jump_addr_int_or_pc: value_exp2 | jump_addr_pc;
jump_addr_pc: LPARENTHESE gen_149 gen_151 factor_atom gen_152 RPARENTHESE;
jump_modifier_: LPARENTHESE gen_247 RPARENTHESE;
jump_modifier_1: DB gen_248;
jump_modifier2: LPARENTHESE DB RPARENTHESE;
jump_modifier3_: LPARENTHESE gen_268 RPARENTHESE;
jump_modifier3_1: DB gen_269;
imm_mov_14a: gen_265 EQU lcntr_v_u_reg_u_reg2;
imm_mov_15a_imm_mov_15b: gen_264 gen_265 LPARENTHESE gen_151 factor_atom gen_152 COMMA_1 gen_263 RPARENTHESE gen_266;
imm_mov_14b: lcntr_v_u_reg_u_reg2 EQU gen_265;
f_reg: F0 | F1 | F2 | F3 | F4 | F5 | F6 | F7 | F8 | F9 | F10 | F11 | F12 | F13 | F14 | F15 | ϵ;
s_reg: MODE1 | MODE2 | IRPTL | IMASK | IMASKP | ASTAT | STKY | USTAT1 | USTAT2;
ia: I0 | I1 | I2 | I3 | I4 | I5 | I6 | I7;
mb: M0 | M1 | M2 | M3 | M4 | M5 | M6 | M7;
ic: I8 | I9 | I10 | I11 | I12 | I13 | I14 | I15;
md: M8 | M9 | M10 | M11 | M12 | M13 | M14 | M15;
d_reg: R0 | R1 | R2 | R3 | R4 | R5 | R6 | R7 | R8 | R9 | R10 | R11 | R12 | R13 | R14 | R15 | F0 | F1 | F2 | F3 | F4 | F5 | F6 | F7 | F8 | F9 | F10 | F11 | F12 | F13 | F14 | F15;
ccondition: EQ | LT | LE | AC | AV | MV | MS | SV | SZ | FLAG0_IN | FLAG1_IN | FLAG2_IN | FLAG3_IN | TF | BM | LCE | gen_234 | NE | GE | GT | gen_235 | gen_236 | gen_237 | gen_238 | gen_239 | gen_240 | gen_241 | gen_242 | gen_243 | gen_244 | gen_245 | NBM | FOREVER | TRUE;
multi_mod1_: LPARENTHESE gen_163 RPARENTHESE;
multi_mod2_: LPARENTHESE gen_160 RPARENTHESE;
gen_1: cqls | ϵ;
gen_142: MINUSMINUS | ϵ;
gen_5: cql gen_142 SEMI;
gen_4: gen_5 | SEMI;
gen_2: gen_3 | ϵ;
gen_145: gen_5 | ϵ;
gen_144: cql gen_145;
gen_143: gen_144 | SEMI;
gen_114: K_OF OBJECT_NAME;
gen_113: gen_114 | ϵ;
gen_115: K_NORECURSIVE | ϵ;
gen_112: K_ON resource;
gen_111: gen_112 | ϵ;
gen_93: K_ALL K_FUNCTIONS;
gen_94: K_ALL K_FUNCTIONS K_IN K_KEYSPACE keyspace_table_column;
gen_27: keyspace_table_column DOT;
gen_26: gen_27 | ϵ;
gen_95: K_FUNCTION gen_26 OBJECT_NAME;
gen_96: K_ALL K_KEYSPACES;
gen_97: K_KEYSPACE keyspace_table_column;
gen_99: K_TABLE | ϵ;
gen_100: K_ALL K_ROLES;
gen_101: K_ROLE OBJECT_NAME;
gen_7: ifNotExist_ifExist | ϵ | ifSpec;
gen_51: K_SUPERUSER | K_NOSUPERUSER | ϵ;
gen_37: roleWith | ϵ;
gen_47: alterTypeAdd_alterTableAdd | ϵ;
gen_75: K_WITH materializedViewOptions;
gen_74: gen_75 | ϵ;
gen_61: K_AND relationElement gen_60;
gen_60: gen_61 | ϵ;
gen_58: gen_59 | ϵ;
gen_25: K_AND K_DURABLE_WRITES OPERATOR_EQ booleanLiteral;
gen_24: gen_25 | ϵ;
gen_52: orReplace | ϵ;
gen_53: paramList | ϵ;
gen_56: K_RETURNS K_NULL;
gen_55: K_CALLED | gen_56;
gen_17: gen_18 | ϵ;
gen_11: COMMA_0 initCondDefinition_constant gen_10;
gen_16: gen_11 | initCondList;
gen_14: gen_15 | ϵ;
gen_10: ϵ | gen_11 | assignmentMap;
gen_50: alterTypeRename_alterTableRename | ϵ;
gen_48: compoundKey | ϵ;
gen_41: gen_42 | ϵ;
gen_38: K_PASSWORD OPERATOR_EQ STRING_LITERAL;
gen_39: K_LOGIN OPERATOR_EQ booleanLiteral;
gen_40: K_SUPERUSER OPERATOR_EQ booleanLiteral;
gen_31: gen_32 OPERATOR_EQ LC_BRACKET STRING_LITERAL COLON_0 tableOptionValue_optionHashValue gen_33 RC_BRACKET;
gen_28: alterTableWith_tableOptions | ϵ;
gen_84: withElement | ϵ;
gen_85: clusteringOrder | ϵ;
gen_78: K_ASC | K_DESC | ϵ;
gen_35: gen_36 | ϵ;
gen_30: OBJECT_NAME OPERATOR_EQ tableOptionValue_optionHashValue;
gen_33: gen_34 | ϵ;
gen_80: gen_81 | ϵ;
gen_83: COMMA_0 K_PRIMARY K_KEY LR_BRACKET primaryKeyDefinition RR_BRACKET;
gen_82: gen_83 | ϵ;
gen_79: primaryKeyColumn | ϵ;
gen_87: K_LOGGED | K_UNLOGGED | ϵ;
gen_88: usingTimestampSpec | ϵ;
gen_22: gen_23 | ϵ;
gen_20: STRING_LITERAL COLON_0 STRING_LITERAL;
gen_21: STRING_LITERAL COLON_0 DECIMAL_LITERAL;
gen_86: beginBatch | ϵ;
gen_89: deleteColumnList | ϵ;
gen_90: OBJECT_NAME LS_BRACKET tableOptionValue_optionHashValue RS_BRACKET;
gen_107: gen_108 | gen_109 | usingTimestampSpec | gen_110 | ϵ;
gen_140: gen_141 | ϵ;
gen_102: UUID | STRING_LITERAL | DECIMAL_LITERAL | HEXADECIMAL_LITERAL | K_TRUE | K_FALSE | K_NULL | assignmentMap | assignmentSet | assignmentList;
gen_128: OBJECT_NAME OPERATOR_EQ gen_102;
gen_130: PLUS_0 | MINUS_0;
gen_129: OBJECT_NAME OPERATOR_EQ OBJECT_NAME gen_130 DECIMAL_LITERAL;
gen_131: OBJECT_NAME OPERATOR_EQ gen_132 LC_BRACKET gen_134 initCondDefinition_constant gen_10 RC_BRACKET gen_136;
gen_138: OBJECT_NAME OPERATOR_EQ gen_132 LS_BRACKET initCondDefinition_constant gen_103 RS_BRACKET gen_136;
gen_139: OBJECT_NAME LS_BRACKET DECIMAL_LITERAL RS_BRACKET OPERATOR_EQ initCondDefinition_constant;
gen_103: gen_104 | ϵ;
gen_108: K_USING K_TTL DECIMAL_LITERAL;
gen_109: K_USING K_TTL DECIMAL_LITERAL K_AND K_TIMESTAMP DECIMAL_LITERAL;
gen_110: K_USING K_TIMESTAMP DECIMAL_LITERAL K_AND K_TTL DECIMAL_LITERAL;
gen_105: gen_106 | ϵ;
gen_116: K_DISTINCT | ϵ;
gen_124: whereSpec | ϵ;
gen_125: orderSpec | ϵ;
gen_126: limitSpec | ϵ;
gen_127: allowFilteringSpec | ϵ;
gen_64: OBJECT_NAME '.' OBJECT_NAME gen_65;
gen_122: gen_123 | ϵ;
gen_117: OBJECT_NAME '.' '*';
gen_120: K_AS OBJECT_NAME;
gen_119: gen_120 | ϵ;
gen_118: OBJECT_NAME gen_119;
gen_121: functionCall gen_119;
gen_63: OPERATOR_EQ | OPERATOR_LT | OPERATOR_GT | OPERATOR_LTE | OPERATOR_GTE;
gen_62: indexName gen_63 initCondDefinition_constant;
gen_66: functionCall gen_63 initCondDefinition_constant;
gen_72: functionCall gen_63 functionCall;
gen_70: functionArgs | ϵ;
gen_68: OBJECT_NAME gen_69 '(' gen_70 ')';
gen_67: OBJECT_NAME '(' STAR ')';
gen_71: UUID | STRING_LITERAL | DECIMAL_LITERAL | HEXADECIMAL_LITERAL | K_TRUE | K_FALSE | K_NULL | OBJECT_NAME | gen_67 | gen_68;
gen_19: DQUOTE OBJECT_NAME DQUOTE;
gen_44: dataTypeDefinition | ϵ;
gen_45: gen_46 | ϵ;
gen_305: prog | ϵ;
gen_304: gen_303 | ϵ;
gen_303: ID COLON_1 gen_304 statement_stmt_atom;
gen_290: PM | CODE | DM | DATA | DATA64;
gen_280: declaration_exp1 | declaration_exp2 | declaration_exp3 | declaration_exp4 | declaration_exp5_imm_mov_16_imm_mov_17;
gen_282: gen_283 | ϵ;
gen_285: gen_286 | ϵ;
gen_288: EQU declaration_exp_f1_declaration_exp_f2;
gen_287: gen_288 | ϵ;
gen_289: LBRACE declaration_exp_f1_declaration_exp_f2 RBRACE;
gen_146: AT ID;
gen_147: LENGTH LPARENTHESE ID RPARENTHESE;
gen_152: value_exp2 | ϵ;
gen_151: MINUS_1 | ϵ;
gen_255: compute_if_compute_mov_exp COMMA_1;
gen_254: gen_255 | ϵ;
gen_256: mov_exp_1 | mov_exp_3a | mov_exp_3b | mov_exp_3c | mov_exp_3d | mov_exp_4a_mem_addr_ia_int_mem_addr_dm_ia_int_mem_addr_ic_int_mem_addr_pm_ic_int_mov_exp_4c | imm_mov_15a_imm_mov_15b | mov_exp_5 | mov_exp_7;
gen_261: mem_addr_ia_mb_mem_addr_dm_ia_mb | mem_addr_ic_md_mem_addr_pm_ic_md | ϵ;
gen_262: mem_addr_dm_mb_ia | mem_addr_md_ic_mem_addr_pm_md_ic;
gen_175: sec_op_sec_op2_r_reg EQU r_exp;
gen_191: gen_192 LPARENTHESE sec_op_sec_op2_r_reg COMMA_1 sec_op_sec_op2_r_reg RPARENTHESE;
gen_176: sec_op_sec_op2_r_reg add_or_sub sec_op_sec_op2_r_reg;
gen_177: gen_178 sec_op_sec_op2_r_reg PLUS_1 CI gen_181;
gen_183: LPARENTHESE sec_op_sec_op2_r_reg PLUS_1 sec_op_sec_op2_r_reg RPARENTHESE DIV INT;
gen_179: sec_op_sec_op2_r_reg PLUS_1 gen_180;
gen_182: sec_op_sec_op2_r_reg MINUS_1 INT;
gen_184: MINUS_1 sec_op_sec_op2_r_reg;
gen_185: ABS sec_op_sec_op2_r_reg;
gen_186: PASS sec_op_sec_op2_r_reg;
gen_187: sec_op_sec_op2_r_reg AND sec_op_sec_op2_r_reg;
gen_188: sec_op_sec_op2_r_reg OR sec_op_sec_op2_r_reg;
gen_189: sec_op_sec_op2_r_reg XOR sec_op_sec_op2_r_reg;
gen_190: NOT sec_op_sec_op2_r_reg;
gen_193: gen_194 sec_op_sec_op2_r_reg BY sec_op_sec_op2_r_reg;
gen_195: MANT f_reg;
gen_196: LOGB f_reg;
gen_199: BY sec_op_sec_op2_r_reg;
gen_198: gen_199 | ϵ;
gen_197: FIX f_reg gen_198;
gen_200: TRUNC f_reg gen_198;
gen_203: f_reg EQU f_exp;
gen_216: gen_192 LPARENTHESE f_reg COMMA_1 f_reg RPARENTHESE;
gen_204: f_reg PLUS_1 f_reg;
gen_205: f_reg MINUS_1 f_reg;
gen_206: ABS LPARENTHESE f_reg add_or_sub f_reg RPARENTHESE;
gen_207: LPARENTHESE f_reg PLUS_1 f_reg RPARENTHESE DIV INT;
gen_208: ABS f_reg;
gen_209: PASS f_reg;
gen_210: RND f_reg;
gen_211: SCALB f_reg BY sec_op_sec_op2_r_reg;
gen_212: FLOAT sec_op_sec_op2_r_reg gen_198;
gen_213: RECIPS f_reg;
gen_214: RSQRTS f_reg;
gen_215: f_reg COPYSIGN f_reg;
gen_217: CLIP f_reg BY f_reg;
gen_218: f_reg MULT f_reg;
gen_156: sec_op_sec_op2_r_reg EQU multi_exp_r;
gen_165: MRF EQU multi_exp_mrf;
gen_168: MRB EQU multi_exp_mrb;
gen_171: mr EQU INT;
gen_173: MR0F | MR1F | MR2F | MR0B | MR1B | MR2B;
gen_172: gen_173 EQU sec_op_sec_op2_r_reg;
gen_174: sec_op_sec_op2_r_reg EQU gen_173;
gen_159: multi_mod2_ | ϵ;
gen_162: multi_mod1_ | ϵ;
gen_161: SAT mr gen_162;
gen_164: RND mr gen_162;
gen_166: SAT MRF gen_162;
gen_167: RND MRF gen_162;
gen_169: SAT MRB gen_162;
gen_170: RND MRB gen_162;
gen_220: sec_op_sec_op2_r_reg EQU shifter_exp;
gen_233: f_reg EQU FUNPACK sec_op_sec_op2_r_reg;
gen_221: sec_op_sec_op2_r_reg OR gen_222 sec_op_sec_op2_r_reg BY sec_op_sec_op2_r_reg;
gen_226: LPARENTHESE SE RPARENTHESE;
gen_225: gen_226 | ϵ;
gen_223: gen_224 sec_op_sec_op2_r_reg BY sec_op_sec_op2_r_reg gen_225;
gen_229: LPARENTHESE EX RPARENTHESE;
gen_228: gen_229 | ϵ;
gen_227: EXP sec_op_sec_op2_r_reg gen_228;
gen_230: LEFTZ sec_op_sec_op2_r_reg;
gen_231: LEFTO sec_op_sec_op2_r_reg;
gen_232: FPACK f_reg;
gen_148: MINUS_1 factor_atom;
gen_201: gen_154 | ϵ;
gen_154: gen_155 COMMA_1 fixpoint_alu_op gen_201;
gen_219: gen_202 | ϵ;
gen_202: floating_point_alu_op COMMA_1 floating_point_alu_op gen_219;
gen_246: jump_modifier_ | ϵ;
gen_250: jump_modifier2 | ϵ;
gen_253: COMMA_1 compute_if_compute_mov_exp;
gen_252: gen_253 | ϵ;
gen_267: jump_modifier3_ | ϵ;
gen_247: jump_modifier_1 | LA | CI;
gen_249: COMMA_1 gen_247;
gen_248: gen_249 | ϵ;
gen_268: jump_modifier3_1 | LR;
gen_270: COMMA_1 LR;
gen_269: gen_270 | ϵ;
gen_265: DM | PM;
gen_272: SET | CLR | TGL | TST | XOR;
gen_271: BIT gen_272 s_reg gen_151 factor_atom gen_152;
gen_277: gen_273 | ϵ;
gen_273: gen_274 gen_275 gen_276 gen_277;
gen_278: FLUSH CACHE;
gen_279: CJUMP jump_addr_int_or_pc gen_250;
gen_275: PUSH | POP;
gen_276: LOOP | STS | PCSTK;
gen_294: DOT_ALGIGN INT;
gen_295: DOT_FILE StringLiteral;
gen_296: DOT_FILE_ATTR .;
gen_297: DOT_GLOBAL ID gen_282;
gen_299: gen_300 | ϵ;
gen_298: DOT_IMPORT StringLiteral gen_299;
gen_284: EQU | ϵ;
gen_301: DOT_PRECISION gen_284 INT;
gen_302: DOT_WEAK ID;
gen_234: NOT LCE;
gen_235: NOT AC;
gen_236: NOT AV;
gen_237: NOT MV;
gen_238: NOT MS;
gen_239: NOT SV;
gen_240: NOT SZ;
gen_241: NOT FLAG0_IN;
gen_242: NOT FLAG1_IN;
gen_243: NOT FLAG2_IN;
gen_244: NOT FLAG3_IN;
gen_245: NOT TF;
gen_163: SI | UI | SF | UF;
gen_160: SSI | SUI | USI | UUI | SSF | SUF | USF | UUF | SSFR | SUFR | USFR | UUFR;
gen_3: gen_4 gen_2;
gen_59: K_AND keyspace_table_column K_IS K_NOT K_NULL gen_58;
gen_18: COMMA_0 OBJECT_NAME COLON_0 initCondDefinition_constant gen_17;
gen_15: gen_16 gen_14;
gen_42: K_AND roleWithOptions gen_41;
gen_36: K_AND tableOptionItem gen_35;
gen_34: COMMA_0 STRING_LITERAL COLON_0 tableOptionValue_optionHashValue gen_33;
gen_81: COMMA_0 keyspace_table_column dataTypeName gen_44 gen_79 gen_80;
gen_23: COMMA_0 replicationListItem gen_22;
gen_141: COMMA_0 assignmentElement gen_140;
gen_104: COLON_0 initCondDefinition_constant gen_103;
gen_106: COMMA_0 gen_102 gen_105;
gen_123: COMMA_0 selectElement gen_122;
gen_46: COMMA_0 dataTypeName gen_45;
gen_283: COMMA_1 ID gen_282;
gen_286: COMMA_1 initExpression gen_285;
gen_300: COMMA_1 StringLiteral gen_299;
gen_251: ϵ | DM | MODIFY | PM;
gen_54: ϵ | COMMA_0;
gen_69: K_IN | ϵ;
gen_32: K_OPTIONS | OBJECT_NAME;
gen_6: K_CREATE | K_ALTER;
gen_98: K_TRUNCATE | ϵ;
gen_73: ϵ | K_KEY;
gen_155: gen_156 | gen_165 | gen_168 | gen_171 | gen_172 | gen_174 | ϵ;
gen_274: ϵ | COMMA_1;
gen_150: PC COMMA_1;
gen_149: gen_150 | ϵ;
gen_192: COMP | MIN | MAX;
gen_181: ϵ | gen_182;
gen_222: LSHIFT | ASHIFT | FDEP;
gen_77: tableOptionItem gen_35 K_AND;
gen_76: ϵ | gen_77;
gen_49: K_RENAME | K_AND;
gen_43: K_ADD | COMMA_0;
gen_29: K_WITH | ϵ;
gen_91: K_TYPE | K_AGGREGATE | K_FUNCTION;
gen_9: K_IF | K_AND;
gen_12: LC_BRACKET | ϵ;
gen_13: RC_BRACKET | ϵ;
gen_8: K_NOT | ϵ;
gen_291: ϵ | seg_qualifier2 | seg_qualifier3;
gen_292: ϵ | seg_qualifier1 | seg_qualifier3;
gen_293: ϵ | seg_qualifier1 | seg_qualifier2;
gen_281: ϵ | DOT_EXTERN;
gen_158: mr add_or_sub;
gen_157: ϵ | gen_158;
gen_133: OBJECT_NAME gen_130;
gen_132: gen_133 | ϵ;
gen_137: gen_130 OBJECT_NAME;
gen_136: ϵ | gen_137;
gen_224: FDEP | FEXT;
gen_92: K_USER | K_ROLE;
gen_57: K_KEYS | K_ENTRIES | K_FULL;
gen_153: ϵ | DOT_LEFTMARGIN | DOT_LIST_DEFTAB | DOT_LIST_LOCTAB | DOT_PAGELENGTH | DOT_PAGEWIDTH | PLUS_1 | MINUS_1 | MULT | DIV | DIV_MOD | I_OR | I_XOR;
gen_263: I0 | I1 | I2 | I3 | I4 | I5 | I6 | I7 | I8 | I9 | I10 | I11 | I12 | I13 | I14 | I15;
gen_260: EQU d_reg;
gen_258: d_reg EQU;
gen_257: ϵ | BITREV | gen_258;
gen_259: gen_260 | ϵ;
gen_264: ϵ | mov_exp_3c;
gen_266: mov_exp_3a | ϵ;
gen_135: initCondDefinition_constant COLON_0;
gen_134: ϵ | gen_135;
gen_65: ϵ | gen_62;
gen_178: gen_179 | ϵ;
gen_180: INT | ϵ;
gen_194: CLIP | BTST | LSHIFT | ASHIFT | ROT | BCLR | BSET | BTGL