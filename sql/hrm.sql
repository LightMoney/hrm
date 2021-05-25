/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : 127.0.0.1:3306
 Source Schema         : hrm

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 25/05/2021 11:12:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bs_user
-- ----------------------------
DROP TABLE IF EXISTS `bs_user`;
CREATE TABLE `bs_user`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ID',
  `mobile` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号码',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名称',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `enable_state` int NULL DEFAULT 1 COMMENT '启用状态 0是禁用，1是启用',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `department_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门ID',
  `time_of_entry` datetime(0) NULL DEFAULT NULL COMMENT '入职时间',
  `form_of_employment` int NULL DEFAULT NULL COMMENT '聘用形式',
  `work_number` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工号',
  `form_of_management` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '管理形式',
  `working_city` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工作城市',
  `correction_time` datetime(0) NULL DEFAULT NULL COMMENT '转正时间',
  `in_service_status` int NULL DEFAULT NULL COMMENT '在职状态 1.在职  2.离职',
  `company_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '企业ID',
  `company_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `department_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `level` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户级别',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_phone`(`mobile`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bs_user
-- ----------------------------
INSERT INTO `bs_user` VALUES ('U1392765360640917504', '13038133516', 'colin', '123456', 1, NULL, '5', '2021-05-11 08:00:00', 1, '6544', NULL, 'CD', '2021-05-18 00:00:00', NULL, '1', '光源科技', '营销', 'saasAdmin');
INSERT INTO `bs_user` VALUES ('U1392765360640917874', '13000000000', 'fan', '123456', 1, NULL, '5', '2021-05-11 08:00:00', 1, '6544', NULL, 'CD', '2021-05-18 00:00:00', NULL, '1', '光源科技', '营销', 'coAdmin');
INSERT INTO `bs_user` VALUES ('U1392765360640917884', '13000000001', 'fgy', '123456', 1, NULL, '5', '2021-05-11 08:00:00', 1, '6544', NULL, 'CD', '2021-05-18 00:00:00', NULL, '1', '光源科技', '营销', 'user');
INSERT INTO `bs_user` VALUES ('U1396661106016563200', 'tyr', 'ee', '123456', 1, NULL, '5', '2021-05-11 08:00:00', 2, '5455', NULL, NULL, '2021-05-25 00:00:00', NULL, '1', '光源科技', '营销', NULL);

-- ----------------------------
-- Table structure for co_company
-- ----------------------------
DROP TABLE IF EXISTS `co_company`;
CREATE TABLE `co_company`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公司名称',
  `manager_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '企业登录账号ID',
  `version` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '当前版本',
  `renewal_date` datetime(0) NULL DEFAULT NULL COMMENT '续期时间',
  `expiration_date` datetime(0) NULL DEFAULT NULL COMMENT '到期时间',
  `company_area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公司地区',
  `company_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '公司地址',
  `business_license_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '营业执照-图片ID',
  `legal_representative` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '法人代表',
  `company_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公司电话',
  `mailbox` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '邮箱',
  `company_size` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公司规模',
  `industry` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '所属行业',
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  `audit_state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '审核状态',
  `state` tinyint NOT NULL DEFAULT 1 COMMENT '状态',
  `balance` double NOT NULL COMMENT '当前余额',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of co_company
-- ----------------------------
INSERT INTO `co_company` VALUES ('1', '额', '1', NULL, NULL, NULL, NULL, NULL, NULL, '小明', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, '2021-05-08 10:31:10');

-- ----------------------------
-- Table structure for co_department
-- ----------------------------
DROP TABLE IF EXISTS `co_department`;
CREATE TABLE `co_department`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `company_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '企业ID',
  `parent_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '父级部门ID',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '部门名称',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '部门编码',
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门类别',
  `manager_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '负责人ID',
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '城市',
  `introduce` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '介绍',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `manager` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '部门负责人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of co_department
-- ----------------------------
INSERT INTO `co_department` VALUES ('1', '1', NULL, '销售', 'xs', NULL, 'string', NULL, 'string', '2021-05-11 10:01:33', 'string');
INSERT INTO `co_department` VALUES ('3', '1', '1', '销售1', 'xs1', NULL, NULL, NULL, NULL, '2021-05-11 11:11:04', NULL);
INSERT INTO `co_department` VALUES ('4', '1', '1', '销售2', 'xs2', NULL, NULL, NULL, NULL, '2021-05-11 11:11:04', NULL);
INSERT INTO `co_department` VALUES ('5', '1', '3', '营销', 'yx', NULL, NULL, NULL, NULL, '2021-05-11 11:12:36', NULL);
INSERT INTO `co_department` VALUES ('D1391998312076091392', '1', '1', '销售3', 'xs3', NULL, NULL, NULL, '测试', '2021-05-11 14:07:14', '小芳');
INSERT INTO `co_department` VALUES ('D1392022760581861376', '1', '5', 'rrry', 'h', NULL, NULL, NULL, NULL, '2021-05-11 15:44:23', 'h');

-- ----------------------------
-- Table structure for em_archive
-- ----------------------------
DROP TABLE IF EXISTS `em_archive`;
CREATE TABLE `em_archive`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ID',
  `op_user` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作用户',
  `month` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '月份',
  `company_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '企业ID',
  `totals` int NOT NULL DEFAULT 0 COMMENT '总人数',
  `payrolls` int NOT NULL DEFAULT 0 COMMENT '在职人数',
  `departures` int NOT NULL DEFAULT 0 COMMENT '离职人数',
  `data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '数据',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of em_archive
-- ----------------------------

-- ----------------------------
-- Table structure for em_positive
-- ----------------------------
DROP TABLE IF EXISTS `em_positive`;
CREATE TABLE `em_positive`  (
  `user_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '员工ID',
  `date_of_correction` datetime(0) NULL DEFAULT NULL COMMENT '转正日期',
  `correction_evaluation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '转正评价',
  `enclosure` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '附件',
  `estatus` int NOT NULL COMMENT '单据状态 1是未执行，2是已执行',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of em_positive
-- ----------------------------
INSERT INTO `em_positive` VALUES ('1063705989926227968', '2018-12-23 08:00:00', '111', NULL, 1, '2018-12-15 21:45:10');

-- ----------------------------
-- Table structure for em_resignation
-- ----------------------------
DROP TABLE IF EXISTS `em_resignation`;
CREATE TABLE `em_resignation`  (
  `user_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `resignation_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `type_of_turnover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '离职类型',
  `reasons_for_leaving` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '申请离职原因',
  `compensation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '补偿金',
  `notifications` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '代通知金',
  `social_security_reduction_month` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '社保减员月',
  `provident_fund_reduction_month` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公积金减员月',
  `picture` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of em_resignation
-- ----------------------------
INSERT INTO `em_resignation` VALUES ('1063705989926227968', '2018-02-05', '主动离职', NULL, '100', '100', '离职日本月', '离职日次月', NULL, '2018-12-16 20:49:26');

-- ----------------------------
-- Table structure for em_transferposition
-- ----------------------------
DROP TABLE IF EXISTS `em_transferposition`;
CREATE TABLE `em_transferposition`  (
  `user_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `post` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '岗位',
  `rank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '职级',
  `reporting_object` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '汇报对象',
  `hrbp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'HRBP',
  `adjustment_time` datetime(0) NOT NULL COMMENT '调岗时间',
  `cause_of_adjusting_post` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '调岗原因',
  `enclosure` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '附件 [1,2,3]',
  `form_of_management` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '管理形式',
  `working_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工作城市',
  `taxable_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '纳税城市',
  `current_contract_start_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '现合同开始时间',
  `closing_time_of_current_contract` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '现合同结束时间',
  `working_place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工作地点',
  `initial_contract_start_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '首次合同开始时间',
  `first_contract_termination_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '首次合同结束时间',
  `contract_period` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '合同期限',
  `renewal_number` int NULL DEFAULT NULL COMMENT '续签次数',
  `recommender_business_people` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '推荐企业人',
  `estatus` int NOT NULL COMMENT '单据状态 1是未执行，2是已执行',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of em_transferposition
-- ----------------------------
INSERT INTO `em_transferposition` VALUES ('1063705989926227968', '', '', '', '', '2018-12-03 08:00:00', 'aaaaa', '', '', '', '', '2018-12-03', '2018-12-04', '', '', '', '12月', 1, '', 1, '2018-12-15 22:01:08');

-- ----------------------------
-- Table structure for em_user_company_jobs
-- ----------------------------
DROP TABLE IF EXISTS `em_user_company_jobs`;
CREATE TABLE `em_user_company_jobs`  (
  `user_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '员工ID',
  `company_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '企业ID',
  `post` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '岗位',
  `work_mailbox` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工作邮箱',
  `rank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '职级',
  `correction_evaluation` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '转正评价',
  `report_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '汇报对象',
  `report_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `state_of_correction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '转正状态',
  `hrbp` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'hrbp',
  `working_time_for_the_first_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '首次参加工作时间',
  `adjustment_agedays` int NULL DEFAULT NULL COMMENT '调整司龄天',
  `adjustment_of_length_of_service` int NULL DEFAULT NULL COMMENT '调整工龄天',
  `working_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工作城市',
  `taxable_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '纳税城市',
  `current_contract_start_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '现合同开始时间',
  `closing_time_of_current_contract` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '现合同结束时间',
  `initial_contract_start_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '首次合同开始时间',
  `first_contract_termination_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '首次合同结束时间',
  `contract_period` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '合同期限',
  `contract_documents` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '合同文件',
  `renewal_number` int NULL DEFAULT NULL COMMENT '续签次数',
  `other_recruitment_channels` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '其他招聘渠道',
  `recruitment_channels` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '招聘渠道',
  `social_recruitment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '社招校招',
  `recommender_business_people` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '推荐企业人',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of em_user_company_jobs
-- ----------------------------
INSERT INTO `em_user_company_jobs` VALUES ('1063705989926227968', '1', '文员', NULL, NULL, NULL, NULL, NULL, NULL, '1066370498633486336', NULL, 1, NULL, NULL, NULL, '2018-12-25', '2018-12-21', '2018-12-03', '2018-12-04', '6月', NULL, 1, '拉勾网', '猎头', '社招', '百度');

-- ----------------------------
-- Table structure for em_user_company_personal
-- ----------------------------
DROP TABLE IF EXISTS `em_user_company_personal`;
CREATE TABLE `em_user_company_personal`  (
  `user_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户ID',
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `time_of_entry` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `department_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `company_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公司ID',
  `sex` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `date_of_birth` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '出生日期',
  `the_highest_degree_of_education` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '最高学历',
  `national_area` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '国家地区',
  `passport_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '护照号',
  `id_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '身份证号',
  `id_card_photo_positive` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '身份证照片-正面',
  `id_card_photo_back` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '身份证照片-背面',
  `native_place` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '籍贯',
  `nation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '民族',
  `english_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '英文名',
  `marital_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '婚姻状况',
  `staff_photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '员工照片',
  `birthday` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '生日',
  `zodiac` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '属相',
  `age` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '年龄',
  `constellation` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '星座',
  `blood_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '血型',
  `domicile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '户籍所在地',
  `political_outlook` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '政治面貌',
  `time_to_join_the_party` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '入党时间',
  `archiving_organization` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '存档机构',
  `state_of_children` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子女状态',
  `do_children_have_commercial_insurance` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子女有无商业保险',
  `is_there_any_violation_of_law_or_discipline` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '有无违法违纪行为',
  `are_there_any_major_medical_histories` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '有无重大病史',
  `qq` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'QQ',
  `wechat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信',
  `residence_card_city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '居住证城市',
  `date_of_residence_permit` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '居住证办理日期',
  `residence_permit_deadline` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '居住证截止日期',
  `place_of_residence` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '现居住地',
  `postal_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '通讯地址',
  `contact_the_mobile_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `personal_mailbox` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `emergency_contact` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '紧急联系人',
  `emergency_contact_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '紧急联系电话',
  `social_security_computer_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '社保电脑号',
  `provident_fund_account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '公积金账号',
  `bank_card_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '银行卡号',
  `opening_bank` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '开户行',
  `educational_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学历类型',
  `graduate_school` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '毕业学校',
  `enrolment_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '入学时间',
  `graduation_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '毕业时间',
  `major` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '专业',
  `graduation_certificate` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '毕业证书',
  `certificate_of_academic_degree` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '学位证书',
  `home_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '上家公司',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '职称',
  `resume` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '简历',
  `is_there_any_competition_restriction` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '有无竞业限制',
  `proof_of_departure_of_former_company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '前公司离职证明',
  `remarks` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of em_user_company_personal
-- ----------------------------

-- ----------------------------
-- Table structure for pe_permission
-- ----------------------------
DROP TABLE IF EXISTS `pe_permission`;
CREATE TABLE `pe_permission`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '权限描述',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限名称',
  `type` tinyint NULL DEFAULT NULL COMMENT '权限类型 1为菜单 2为功能 3为API',
  `parent_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '主键',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `en_visible` int NULL DEFAULT NULL COMMENT '企业可见性 0：不可见，1：可见',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pe_permission
-- ----------------------------
INSERT INTO `pe_permission` VALUES ('P1392777118873071616', NULL, 'Saas企业管理', 1, '0', 'saas-clients', 0);
INSERT INTO `pe_permission` VALUES ('P1394205148048801792', NULL, '组织管理', 1, '0', 'departments', 1);
INSERT INTO `pe_permission` VALUES ('P1394205469349265408', NULL, '员工管理', 1, '0', 'employees', 1);
INSERT INTO `pe_permission` VALUES ('P1394205759095980032', NULL, '公司设置', 1, '0', 'settings', 1);
INSERT INTO `pe_permission` VALUES ('P1394205903430369280', NULL, '权限管理', 1, '0', 'permissions', 1);
INSERT INTO `pe_permission` VALUES ('P1394209818767015936', NULL, '用户删除按钮', 2, 'P1394205469349265408', 'point-user-delete', 1);
INSERT INTO `pe_permission` VALUES ('P1394220277125664768', NULL, '用户添加', 2, 'P1394205469349265408', 'point-user-save', 1);
INSERT INTO `pe_permission` VALUES ('P1394585812006871040', NULL, '用户删除api', 3, 'P1394209818767015936', 'api-user-delete', 1);

-- ----------------------------
-- Table structure for pe_permission_api
-- ----------------------------
DROP TABLE IF EXISTS `pe_permission_api`;
CREATE TABLE `pe_permission_api`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键ID',
  `api_level` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限等级，1为通用接口权限，2为需校验接口权限',
  `api_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '请求类型',
  `api_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pe_permission_api
-- ----------------------------
INSERT INTO `pe_permission_api` VALUES ('P1394585812006871040', '2', 'DELETE', '/sys/user');

-- ----------------------------
-- Table structure for pe_permission_menu
-- ----------------------------
DROP TABLE IF EXISTS `pe_permission_menu`;
CREATE TABLE `pe_permission_menu`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键ID',
  `menu_icon` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限代码',
  `menu_order` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pe_permission_menu
-- ----------------------------
INSERT INTO `pe_permission_menu` VALUES ('P1392777118873071616', '11', '1');
INSERT INTO `pe_permission_menu` VALUES ('P1394205148048801792', '22', '2');
INSERT INTO `pe_permission_menu` VALUES ('P1394205469349265408', '33', '3');
INSERT INTO `pe_permission_menu` VALUES ('P1394205759095980032', '55', '5');
INSERT INTO `pe_permission_menu` VALUES ('P1394205903430369280', '66', '6');

-- ----------------------------
-- Table structure for pe_permission_point
-- ----------------------------
DROP TABLE IF EXISTS `pe_permission_point`;
CREATE TABLE `pe_permission_point`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键ID',
  `point_class` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '按钮类型',
  `point_icon` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '按钮icon',
  `point_status` int NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pe_permission_point
-- ----------------------------
INSERT INTO `pe_permission_point` VALUES ('P1394209818767015936', 'xxx', 'xxx', 1);
INSERT INTO `pe_permission_point` VALUES ('P1394218781772402688', '33', '33', 333);
INSERT INTO `pe_permission_point` VALUES ('P1394220277125664768', '33', '33', 33);

-- ----------------------------
-- Table structure for pe_role
-- ----------------------------
DROP TABLE IF EXISTS `pe_role`;
CREATE TABLE `pe_role`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键ID',
  `name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '角色名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '说明',
  `company_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '企业id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK_k3beff7qglfn58qsf2yvbg41i`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pe_role
-- ----------------------------
INSERT INTO `pe_role` VALUES ('R1392769581637468160', '系统管理员', NULL, '1');
INSERT INTO `pe_role` VALUES ('R1392769612767592448', '部门经理', NULL, '1');
INSERT INTO `pe_role` VALUES ('R1392769691796668416', '财务总监', NULL, '1');

-- ----------------------------
-- Table structure for pe_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `pe_role_permission`;
CREATE TABLE `pe_role_permission`  (
  `role_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色ID',
  `permission_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`role_id`, `permission_id`) USING BTREE,
  INDEX `FK74qx7rkbtq2wqms78gljv87a0`(`permission_id`) USING BTREE,
  INDEX `FKee9dk0vg99shvsytflym6egxd`(`role_id`) USING BTREE,
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`role_id`) REFERENCES `pe_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_4` FOREIGN KEY (`permission_id`) REFERENCES `pe_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pe_role_permission
-- ----------------------------
INSERT INTO `pe_role_permission` VALUES ('R1392769581637468160', 'P1394205469349265408');
INSERT INTO `pe_role_permission` VALUES ('R1392769612767592448', 'P1394205469349265408');
INSERT INTO `pe_role_permission` VALUES ('R1392769581637468160', 'P1394209818767015936');
INSERT INTO `pe_role_permission` VALUES ('R1392769581637468160', 'P1394220277125664768');
INSERT INTO `pe_role_permission` VALUES ('R1392769612767592448', 'P1394220277125664768');
INSERT INTO `pe_role_permission` VALUES ('R1392769581637468160', 'P1394585812006871040');

-- ----------------------------
-- Table structure for pe_user_role
-- ----------------------------
DROP TABLE IF EXISTS `pe_user_role`;
CREATE TABLE `pe_user_role`  (
  `role_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色ID',
  `user_id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '权限ID',
  PRIMARY KEY (`role_id`, `user_id`) USING BTREE,
  INDEX `FK74qx7rkbtq2wqms78gljv87a1`(`role_id`) USING BTREE,
  INDEX `FKee9dk0vg99shvsytflym6egx1`(`user_id`) USING BTREE,
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`user_id`) REFERENCES `bs_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`role_id`) REFERENCES `pe_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pe_user_role
-- ----------------------------
INSERT INTO `pe_user_role` VALUES ('R1392769581637468160', 'U1392765360640917504');
INSERT INTO `pe_user_role` VALUES ('R1392769612767592448', 'U1392765360640917884');

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'id',
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件原始名称',
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '存储路径',
  `uuid_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文件实际名称',
  `type` tinyint NULL DEFAULT NULL COMMENT '文件类型',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_file
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
