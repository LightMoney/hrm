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

 Date: 13/05/2021 15:26:07
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
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_user_phone`(`mobile`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bs_user
-- ----------------------------

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
-- Table structure for pe_permission
-- ----------------------------
DROP TABLE IF EXISTS `pe_permission`;
CREATE TABLE `pe_permission`  (
  `id` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '权限描述',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限名称',
  `type` tinyint NULL DEFAULT NULL COMMENT '权限类型 1为菜单 2为功能 3为API',
  `pid` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '0' COMMENT '主键',
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `en_visible` int NULL DEFAULT NULL COMMENT '企业可见性 0：不可见，1：可见',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pe_permission
-- ----------------------------

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
