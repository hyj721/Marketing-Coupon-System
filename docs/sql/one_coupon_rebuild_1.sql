/*
 Navicat Premium Dump SQL

 Source Server         : local-mysql
 Source Server Type    : MySQL
 Source Server Version : 90100 (9.1.0)
 Source Host           : localhost:3306
 Source Schema         : one_coupon_rebuild_1

 Target Server Type    : MySQL
 Target Server Version : 90100 (9.1.0)
 File Encoding         : 65001

 Date: 17/01/2025 16:12:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_coupon_template_10
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_template_10`;
CREATE TABLE `t_coupon_template_10` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(256) DEFAULT NULL COMMENT '优惠券名称',
  `shop_number` bigint DEFAULT NULL COMMENT '店铺编号',
  `source` tinyint(1) DEFAULT NULL COMMENT '优惠券来源 0：店铺券 1：平台券',
  `target` tinyint(1) DEFAULT NULL COMMENT '优惠对象 0：商品专属 1：全店通用',
  `goods` varchar(64) DEFAULT NULL COMMENT '优惠商品编码',
  `type` tinyint(1) DEFAULT NULL COMMENT '优惠类型 0：立减券 1：满减券 2：折扣券',
  `valid_start_time` datetime DEFAULT NULL COMMENT '有效期开始时间',
  `valid_end_time` datetime DEFAULT NULL COMMENT '有效期结束时间',
  `stock` int DEFAULT NULL COMMENT '库存',
  `receive_rule` json DEFAULT NULL COMMENT '领取规则',
  `consume_rule` json DEFAULT NULL COMMENT '消耗规则',
  `status` tinyint(1) DEFAULT NULL COMMENT '优惠券状态 0：生效中 1：已结束',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`),
  KEY `idx_shop_number` (`shop_number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='优惠券模板表';

-- ----------------------------
-- Records of t_coupon_template_10
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_coupon_template_11
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_template_11`;
CREATE TABLE `t_coupon_template_11` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(256) DEFAULT NULL COMMENT '优惠券名称',
  `shop_number` bigint DEFAULT NULL COMMENT '店铺编号',
  `source` tinyint(1) DEFAULT NULL COMMENT '优惠券来源 0：店铺券 1：平台券',
  `target` tinyint(1) DEFAULT NULL COMMENT '优惠对象 0：商品专属 1：全店通用',
  `goods` varchar(64) DEFAULT NULL COMMENT '优惠商品编码',
  `type` tinyint(1) DEFAULT NULL COMMENT '优惠类型 0：立减券 1：满减券 2：折扣券',
  `valid_start_time` datetime DEFAULT NULL COMMENT '有效期开始时间',
  `valid_end_time` datetime DEFAULT NULL COMMENT '有效期结束时间',
  `stock` int DEFAULT NULL COMMENT '库存',
  `receive_rule` json DEFAULT NULL COMMENT '领取规则',
  `consume_rule` json DEFAULT NULL COMMENT '消耗规则',
  `status` tinyint(1) DEFAULT NULL COMMENT '优惠券状态 0：生效中 1：已结束',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`),
  KEY `idx_shop_number` (`shop_number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='优惠券模板表';

-- ----------------------------
-- Records of t_coupon_template_11
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_coupon_template_12
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_template_12`;
CREATE TABLE `t_coupon_template_12` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(256) DEFAULT NULL COMMENT '优惠券名称',
  `shop_number` bigint DEFAULT NULL COMMENT '店铺编号',
  `source` tinyint(1) DEFAULT NULL COMMENT '优惠券来源 0：店铺券 1：平台券',
  `target` tinyint(1) DEFAULT NULL COMMENT '优惠对象 0：商品专属 1：全店通用',
  `goods` varchar(64) DEFAULT NULL COMMENT '优惠商品编码',
  `type` tinyint(1) DEFAULT NULL COMMENT '优惠类型 0：立减券 1：满减券 2：折扣券',
  `valid_start_time` datetime DEFAULT NULL COMMENT '有效期开始时间',
  `valid_end_time` datetime DEFAULT NULL COMMENT '有效期结束时间',
  `stock` int DEFAULT NULL COMMENT '库存',
  `receive_rule` json DEFAULT NULL COMMENT '领取规则',
  `consume_rule` json DEFAULT NULL COMMENT '消耗规则',
  `status` tinyint(1) DEFAULT NULL COMMENT '优惠券状态 0：生效中 1：已结束',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`),
  KEY `idx_shop_number` (`shop_number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='优惠券模板表';

-- ----------------------------
-- Records of t_coupon_template_12
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_coupon_template_13
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_template_13`;
CREATE TABLE `t_coupon_template_13` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(256) DEFAULT NULL COMMENT '优惠券名称',
  `shop_number` bigint DEFAULT NULL COMMENT '店铺编号',
  `source` tinyint(1) DEFAULT NULL COMMENT '优惠券来源 0：店铺券 1：平台券',
  `target` tinyint(1) DEFAULT NULL COMMENT '优惠对象 0：商品专属 1：全店通用',
  `goods` varchar(64) DEFAULT NULL COMMENT '优惠商品编码',
  `type` tinyint(1) DEFAULT NULL COMMENT '优惠类型 0：立减券 1：满减券 2：折扣券',
  `valid_start_time` datetime DEFAULT NULL COMMENT '有效期开始时间',
  `valid_end_time` datetime DEFAULT NULL COMMENT '有效期结束时间',
  `stock` int DEFAULT NULL COMMENT '库存',
  `receive_rule` json DEFAULT NULL COMMENT '领取规则',
  `consume_rule` json DEFAULT NULL COMMENT '消耗规则',
  `status` tinyint(1) DEFAULT NULL COMMENT '优惠券状态 0：生效中 1：已结束',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`),
  KEY `idx_shop_number` (`shop_number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='优惠券模板表';

-- ----------------------------
-- Records of t_coupon_template_13
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_coupon_template_14
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_template_14`;
CREATE TABLE `t_coupon_template_14` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(256) DEFAULT NULL COMMENT '优惠券名称',
  `shop_number` bigint DEFAULT NULL COMMENT '店铺编号',
  `source` tinyint(1) DEFAULT NULL COMMENT '优惠券来源 0：店铺券 1：平台券',
  `target` tinyint(1) DEFAULT NULL COMMENT '优惠对象 0：商品专属 1：全店通用',
  `goods` varchar(64) DEFAULT NULL COMMENT '优惠商品编码',
  `type` tinyint(1) DEFAULT NULL COMMENT '优惠类型 0：立减券 1：满减券 2：折扣券',
  `valid_start_time` datetime DEFAULT NULL COMMENT '有效期开始时间',
  `valid_end_time` datetime DEFAULT NULL COMMENT '有效期结束时间',
  `stock` int DEFAULT NULL COMMENT '库存',
  `receive_rule` json DEFAULT NULL COMMENT '领取规则',
  `consume_rule` json DEFAULT NULL COMMENT '消耗规则',
  `status` tinyint(1) DEFAULT NULL COMMENT '优惠券状态 0：生效中 1：已结束',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`),
  KEY `idx_shop_number` (`shop_number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='优惠券模板表';

-- ----------------------------
-- Records of t_coupon_template_14
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_coupon_template_15
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_template_15`;
CREATE TABLE `t_coupon_template_15` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(256) DEFAULT NULL COMMENT '优惠券名称',
  `shop_number` bigint DEFAULT NULL COMMENT '店铺编号',
  `source` tinyint(1) DEFAULT NULL COMMENT '优惠券来源 0：店铺券 1：平台券',
  `target` tinyint(1) DEFAULT NULL COMMENT '优惠对象 0：商品专属 1：全店通用',
  `goods` varchar(64) DEFAULT NULL COMMENT '优惠商品编码',
  `type` tinyint(1) DEFAULT NULL COMMENT '优惠类型 0：立减券 1：满减券 2：折扣券',
  `valid_start_time` datetime DEFAULT NULL COMMENT '有效期开始时间',
  `valid_end_time` datetime DEFAULT NULL COMMENT '有效期结束时间',
  `stock` int DEFAULT NULL COMMENT '库存',
  `receive_rule` json DEFAULT NULL COMMENT '领取规则',
  `consume_rule` json DEFAULT NULL COMMENT '消耗规则',
  `status` tinyint(1) DEFAULT NULL COMMENT '优惠券状态 0：生效中 1：已结束',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`),
  KEY `idx_shop_number` (`shop_number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='优惠券模板表';

-- ----------------------------
-- Records of t_coupon_template_15
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_coupon_template_8
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_template_8`;
CREATE TABLE `t_coupon_template_8` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(256) DEFAULT NULL COMMENT '优惠券名称',
  `shop_number` bigint DEFAULT NULL COMMENT '店铺编号',
  `source` tinyint(1) DEFAULT NULL COMMENT '优惠券来源 0：店铺券 1：平台券',
  `target` tinyint(1) DEFAULT NULL COMMENT '优惠对象 0：商品专属 1：全店通用',
  `goods` varchar(64) DEFAULT NULL COMMENT '优惠商品编码',
  `type` tinyint(1) DEFAULT NULL COMMENT '优惠类型 0：立减券 1：满减券 2：折扣券',
  `valid_start_time` datetime DEFAULT NULL COMMENT '有效期开始时间',
  `valid_end_time` datetime DEFAULT NULL COMMENT '有效期结束时间',
  `stock` int DEFAULT NULL COMMENT '库存',
  `receive_rule` json DEFAULT NULL COMMENT '领取规则',
  `consume_rule` json DEFAULT NULL COMMENT '消耗规则',
  `status` tinyint(1) DEFAULT NULL COMMENT '优惠券状态 0：生效中 1：已结束',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`),
  KEY `idx_shop_number` (`shop_number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='优惠券模板表';

-- ----------------------------
-- Records of t_coupon_template_8
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_coupon_template_9
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_template_9`;
CREATE TABLE `t_coupon_template_9` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(256) DEFAULT NULL COMMENT '优惠券名称',
  `shop_number` bigint DEFAULT NULL COMMENT '店铺编号',
  `source` tinyint(1) DEFAULT NULL COMMENT '优惠券来源 0：店铺券 1：平台券',
  `target` tinyint(1) DEFAULT NULL COMMENT '优惠对象 0：商品专属 1：全店通用',
  `goods` varchar(64) DEFAULT NULL COMMENT '优惠商品编码',
  `type` tinyint(1) DEFAULT NULL COMMENT '优惠类型 0：立减券 1：满减券 2：折扣券',
  `valid_start_time` datetime DEFAULT NULL COMMENT '有效期开始时间',
  `valid_end_time` datetime DEFAULT NULL COMMENT '有效期结束时间',
  `stock` int DEFAULT NULL COMMENT '库存',
  `receive_rule` json DEFAULT NULL COMMENT '领取规则',
  `consume_rule` json DEFAULT NULL COMMENT '消耗规则',
  `status` tinyint(1) DEFAULT NULL COMMENT '优惠券状态 0：生效中 1：已结束',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`),
  KEY `idx_shop_number` (`shop_number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='优惠券模板表';

-- ----------------------------
-- Records of t_coupon_template_9
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_coupon_template_log_10
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_template_log_10`;
CREATE TABLE `t_coupon_template_log_10` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `shop_number` bigint DEFAULT NULL COMMENT '店铺编号',
  `coupon_template_id` bigint DEFAULT NULL COMMENT '优惠券模板ID',
  `operator_id` bigint DEFAULT NULL COMMENT '操作人',
  `operation_log` text COMMENT '操作日志',
  `original_data` varchar(1024) DEFAULT NULL COMMENT '原始数据',
  `modified_data` varchar(1024) DEFAULT NULL COMMENT '修改后数据',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_shop_number` (`shop_number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='优惠券模板操作日志表';

-- ----------------------------
-- Records of t_coupon_template_log_10
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_coupon_template_log_11
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_template_log_11`;
CREATE TABLE `t_coupon_template_log_11` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `shop_number` bigint DEFAULT NULL COMMENT '店铺编号',
  `coupon_template_id` bigint DEFAULT NULL COMMENT '优惠券模板ID',
  `operator_id` bigint DEFAULT NULL COMMENT '操作人',
  `operation_log` text COMMENT '操作日志',
  `original_data` varchar(1024) DEFAULT NULL COMMENT '原始数据',
  `modified_data` varchar(1024) DEFAULT NULL COMMENT '修改后数据',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_shop_number` (`shop_number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='优惠券模板操作日志表';

-- ----------------------------
-- Records of t_coupon_template_log_11
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_coupon_template_log_12
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_template_log_12`;
CREATE TABLE `t_coupon_template_log_12` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `shop_number` bigint DEFAULT NULL COMMENT '店铺编号',
  `coupon_template_id` bigint DEFAULT NULL COMMENT '优惠券模板ID',
  `operator_id` bigint DEFAULT NULL COMMENT '操作人',
  `operation_log` text COMMENT '操作日志',
  `original_data` varchar(1024) DEFAULT NULL COMMENT '原始数据',
  `modified_data` varchar(1024) DEFAULT NULL COMMENT '修改后数据',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_shop_number` (`shop_number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='优惠券模板操作日志表';

-- ----------------------------
-- Records of t_coupon_template_log_12
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_coupon_template_log_13
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_template_log_13`;
CREATE TABLE `t_coupon_template_log_13` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `shop_number` bigint DEFAULT NULL COMMENT '店铺编号',
  `coupon_template_id` bigint DEFAULT NULL COMMENT '优惠券模板ID',
  `operator_id` bigint DEFAULT NULL COMMENT '操作人',
  `operation_log` text COMMENT '操作日志',
  `original_data` varchar(1024) DEFAULT NULL COMMENT '原始数据',
  `modified_data` varchar(1024) DEFAULT NULL COMMENT '修改后数据',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_shop_number` (`shop_number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='优惠券模板操作日志表';

-- ----------------------------
-- Records of t_coupon_template_log_13
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_coupon_template_log_14
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_template_log_14`;
CREATE TABLE `t_coupon_template_log_14` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `shop_number` bigint DEFAULT NULL COMMENT '店铺编号',
  `coupon_template_id` bigint DEFAULT NULL COMMENT '优惠券模板ID',
  `operator_id` bigint DEFAULT NULL COMMENT '操作人',
  `operation_log` text COMMENT '操作日志',
  `original_data` varchar(1024) DEFAULT NULL COMMENT '原始数据',
  `modified_data` varchar(1024) DEFAULT NULL COMMENT '修改后数据',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_shop_number` (`shop_number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='优惠券模板操作日志表';

-- ----------------------------
-- Records of t_coupon_template_log_14
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_coupon_template_log_15
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_template_log_15`;
CREATE TABLE `t_coupon_template_log_15` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `shop_number` bigint DEFAULT NULL COMMENT '店铺编号',
  `coupon_template_id` bigint DEFAULT NULL COMMENT '优惠券模板ID',
  `operator_id` bigint DEFAULT NULL COMMENT '操作人',
  `operation_log` text COMMENT '操作日志',
  `original_data` varchar(1024) DEFAULT NULL COMMENT '原始数据',
  `modified_data` varchar(1024) DEFAULT NULL COMMENT '修改后数据',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_shop_number` (`shop_number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='优惠券模板操作日志表';

-- ----------------------------
-- Records of t_coupon_template_log_15
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_coupon_template_log_8
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_template_log_8`;
CREATE TABLE `t_coupon_template_log_8` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `shop_number` bigint DEFAULT NULL COMMENT '店铺编号',
  `coupon_template_id` bigint DEFAULT NULL COMMENT '优惠券模板ID',
  `operator_id` bigint DEFAULT NULL COMMENT '操作人',
  `operation_log` text COMMENT '操作日志',
  `original_data` varchar(1024) DEFAULT NULL COMMENT '原始数据',
  `modified_data` varchar(1024) DEFAULT NULL COMMENT '修改后数据',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_shop_number` (`shop_number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='优惠券模板操作日志表';

-- ----------------------------
-- Records of t_coupon_template_log_8
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_coupon_template_log_9
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_template_log_9`;
CREATE TABLE `t_coupon_template_log_9` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `shop_number` bigint DEFAULT NULL COMMENT '店铺编号',
  `coupon_template_id` bigint DEFAULT NULL COMMENT '优惠券模板ID',
  `operator_id` bigint DEFAULT NULL COMMENT '操作人',
  `operation_log` text COMMENT '操作日志',
  `original_data` varchar(1024) DEFAULT NULL COMMENT '原始数据',
  `modified_data` varchar(1024) DEFAULT NULL COMMENT '修改后数据',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`),
  KEY `idx_shop_number` (`shop_number`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='优惠券模板操作日志表';

-- ----------------------------
-- Records of t_coupon_template_log_9
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Procedure structure for drop_coupon_template_id
-- ----------------------------
DROP PROCEDURE IF EXISTS `drop_coupon_template_id`;
delimiter ;;
CREATE PROCEDURE `drop_coupon_template_id`()
BEGIN
  DECLARE i INT DEFAULT 0;
  WHILE i <= 15 DO
    SET @sql_stmt = CONCAT('ALTER TABLE t_coupon_template_', i, ' DROP COLUMN coupon_template_id;');
    PREPARE stmt FROM @sql_stmt;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
    SET i = i + 1;
  END WHILE;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for drop_coupon_template_id_range
-- ----------------------------
DROP PROCEDURE IF EXISTS `drop_coupon_template_id_range`;
delimiter ;;
CREATE PROCEDURE `drop_coupon_template_id_range`()
BEGIN
  DECLARE i INT DEFAULT 8;
  WHILE i <= 15 DO
    SET @sql_stmt = CONCAT('ALTER TABLE t_coupon_template_', i, ' DROP COLUMN coupon_template_id;');
    PREPARE stmt FROM @sql_stmt;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
    SET i = i + 1;
  END WHILE;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for drop_coupon_template_log_id_range
-- ----------------------------
DROP PROCEDURE IF EXISTS `drop_coupon_template_log_id_range`;
delimiter ;;
CREATE PROCEDURE `drop_coupon_template_log_id_range`()
BEGIN
  DECLARE i INT DEFAULT 8;
  WHILE i <= 15 DO
    SET @sql_stmt = CONCAT('ALTER TABLE t_coupon_template_log_', i, ' DROP COLUMN coupon_template_log_id;');
    PREPARE stmt FROM @sql_stmt;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
    SET i = i + 1;
  END WHILE;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
