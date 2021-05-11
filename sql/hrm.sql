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

 Date: 11/05/2021 17:48:37
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
  `in_service_status` int NULL DEFAULT NULL COMMENT '在职状态 1.在职 2.离职',
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

SET FOREIGN_KEY_CHECKS = 1;
