/*
 Navicat Premium Dump SQL

 Source Server         : local-mysql
 Source Server Type    : MySQL
 Source Server Version : 90100 (9.1.0)
 Source Host           : localhost:3306
 Source Schema         : one_coupon_rebuild_0

 Target Server Type    : MySQL
 Target Server Version : 90100 (9.1.0)
 File Encoding         : 65001

 Date: 17/01/2025 16:12:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_coupon_task
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_task`;
CREATE TABLE `t_coupon_task` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `shop_number` bigint DEFAULT NULL COMMENT '店铺编号',
  `batch_id` bigint DEFAULT NULL COMMENT '批次ID',
  `task_name` varchar(128) DEFAULT NULL COMMENT '优惠券批次任务名称',
  `file_address` varchar(512) DEFAULT NULL COMMENT '文件地址',
  `fail_file_address` varchar(512) DEFAULT NULL COMMENT '发放失败用户文件地址',
  `send_num` int DEFAULT NULL COMMENT '发放优惠券数量',
  `notify_type` varchar(32) DEFAULT NULL COMMENT '通知方式，可组合使用 0：站内信 1：弹框推送 2：邮箱 3：短信',
  `coupon_template_id` bigint DEFAULT NULL COMMENT '优惠券模板ID',
  `send_type` tinyint(1) DEFAULT NULL COMMENT '发送类型 0：立即发送 1：定时发送',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `status` tinyint(1) DEFAULT NULL COMMENT '状态 0：待执行 1：执行中 2：执行失败 3：执行成功 4：取消',
  `completion_time` datetime DEFAULT NULL COMMENT '完成时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `operator_id` bigint DEFAULT NULL COMMENT '操作人',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`),
  KEY `idx_batch_id` (`batch_id`) USING BTREE,
  KEY `idx_coupon_template_id` (`coupon_template_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='优惠券模板发送任务表';

-- ----------------------------
-- Records of t_coupon_task
-- ----------------------------
BEGIN;
INSERT INTO `t_coupon_task` (`id`, `shop_number`, `batch_id`, `task_name`, `file_address`, `fail_file_address`, `send_num`, `notify_type`, `coupon_template_id`, `send_type`, `send_time`, `status`, `completion_time`, `create_time`, `operator_id`, `update_time`, `del_flag`) VALUES (1, 100001, 1863897501908733952, '发送10000个优惠券推送任务', '/Users/hyj/project/java-project/onecoupon/tmp/oneCoupon任务推送Excel.xlsx', NULL, 10000, '0,3', 1862785734868602880, 0, '2024-08-20 12:00:00', 1, NULL, '2024-12-03 18:46:09', 3430724549, '2024-12-03 18:46:09', 0);
INSERT INTO `t_coupon_task` (`id`, `shop_number`, `batch_id`, `task_name`, `file_address`, `fail_file_address`, `send_num`, `notify_type`, `coupon_template_id`, `send_type`, `send_time`, `status`, `completion_time`, `create_time`, `operator_id`, `update_time`, `del_flag`) VALUES (2, 100001, 1863912661364903936, '发送10000个优惠券推送任务', '/Users/hyj/project/java-project/onecoupon/tmp/oneCoupon任务推送Excel.xlsx', NULL, 50000, '0,3', 1862785734868602880, 0, '2024-08-20 12:00:00', 1, NULL, '2024-12-03 19:46:23', 3430724549, '2024-12-03 19:46:24', 0);
INSERT INTO `t_coupon_task` (`id`, `shop_number`, `batch_id`, `task_name`, `file_address`, `fail_file_address`, `send_num`, `notify_type`, `coupon_template_id`, `send_type`, `send_time`, `status`, `completion_time`, `create_time`, `operator_id`, `update_time`, `del_flag`) VALUES (3, 100001, 1863913059412742144, '发送10000个优惠券推送任务', '/Users/hyj/project/java-project/onecoupon/tmp/oneCoupon任务推送Excel.xlsx', NULL, 50000, '0,3', 1862785734868602880, 0, '2024-08-20 12:00:00', 1, NULL, '2024-12-03 19:47:58', 3430724549, '2024-12-03 19:47:58', 0);
INSERT INTO `t_coupon_task` (`id`, `shop_number`, `batch_id`, `task_name`, `file_address`, `fail_file_address`, `send_num`, `notify_type`, `coupon_template_id`, `send_type`, `send_time`, `status`, `completion_time`, `create_time`, `operator_id`, `update_time`, `del_flag`) VALUES (4, 100001, 1863913265160130560, '发送10000个优惠券推送任务', '/Users/hyj/project/java-project/onecoupon/tmp/oneCoupon任务推送Excel.xlsx', NULL, 50000, '0,3', 1862785734868602880, 0, '2024-08-20 12:00:00', 1, NULL, '2024-12-03 19:48:47', 3430724549, '2024-12-03 19:48:48', 0);
INSERT INTO `t_coupon_task` (`id`, `shop_number`, `batch_id`, `task_name`, `file_address`, `fail_file_address`, `send_num`, `notify_type`, `coupon_template_id`, `send_type`, `send_time`, `status`, `completion_time`, `create_time`, `operator_id`, `update_time`, `del_flag`) VALUES (5, 100001, 1868576979104698368, '发送10000个优惠券推送任务', '/Users/hyj/project/java-project/onecoupon/tmp/oneCoupon任务推送Excel.xlsx', NULL, 50000, '0,3', 1862785734868602880, 1, '2024-08-20 12:00:00', 1, NULL, '2024-12-16 16:41:09', 3430724549, '2024-12-16 16:48:01', 0);
INSERT INTO `t_coupon_task` (`id`, `shop_number`, `batch_id`, `task_name`, `file_address`, `fail_file_address`, `send_num`, `notify_type`, `coupon_template_id`, `send_type`, `send_time`, `status`, `completion_time`, `create_time`, `operator_id`, `update_time`, `del_flag`) VALUES (6, 100001, 1868578134513815552, '发送10000个优惠券推送任务', '/Users/hyj/project/java-project/onecoupon/tmp/oneCoupon任务推送Excel.xlsx', NULL, 50000, '0,3', 1862785734868602880, 1, '2024-08-20 12:00:00', 1, NULL, '2024-12-16 16:45:18', 3430724549, '2024-12-16 16:48:01', 0);
INSERT INTO `t_coupon_task` (`id`, `shop_number`, `batch_id`, `task_name`, `file_address`, `fail_file_address`, `send_num`, `notify_type`, `coupon_template_id`, `send_type`, `send_time`, `status`, `completion_time`, `create_time`, `operator_id`, `update_time`, `del_flag`) VALUES (7, 100001, 1868578236527677440, '发送10000个优惠券推送任务', '/Users/hyj/project/java-project/onecoupon/tmp/oneCoupon任务推送Excel.xlsx', NULL, 50000, '0,3', 1862785734868602880, 1, '2024-08-20 12:00:00', 1, NULL, '2024-12-16 16:45:43', 3430724549, '2024-12-16 16:48:01', 0);
INSERT INTO `t_coupon_task` (`id`, `shop_number`, `batch_id`, `task_name`, `file_address`, `fail_file_address`, `send_num`, `notify_type`, `coupon_template_id`, `send_type`, `send_time`, `status`, `completion_time`, `create_time`, `operator_id`, `update_time`, `del_flag`) VALUES (8, 100001, 1877003004750729216, '发送10000个优惠券推送任务', '/Users/hyj/project/java-project/onecoupon/tmp/oneCoupon任务推送Excel.xlsx', NULL, 50000, '0,3', 23, 0, '2024-08-20 12:00:00', 1, NULL, '2025-01-08 22:42:44', 3430724549, '2025-01-08 22:42:45', 0);
INSERT INTO `t_coupon_task` (`id`, `shop_number`, `batch_id`, `task_name`, `file_address`, `fail_file_address`, `send_num`, `notify_type`, `coupon_template_id`, `send_type`, `send_time`, `status`, `completion_time`, `create_time`, `operator_id`, `update_time`, `del_flag`) VALUES (9, 100001, 1877003884954783744, '发送10000个优惠券推送任务', '/Users/hyj/project/java-project/onecoupon/tmp/oneCoupon任务推送Excel.xlsx', NULL, 50000, '0,3', 23, 0, '2024-08-20 12:00:00', 1, NULL, '2025-01-08 22:46:14', 3430724549, '2025-01-08 22:46:14', 0);
INSERT INTO `t_coupon_task` (`id`, `shop_number`, `batch_id`, `task_name`, `file_address`, `fail_file_address`, `send_num`, `notify_type`, `coupon_template_id`, `send_type`, `send_time`, `status`, `completion_time`, `create_time`, `operator_id`, `update_time`, `del_flag`) VALUES (10, 100001, 1877004052605308928, '发送10000个优惠券推送任务', '/Users/hyj/project/java-project/onecoupon/tmp/oneCoupon任务推送Excel.xlsx', NULL, 50000, '0,3', 23, 0, '2024-08-20 12:00:00', 1, NULL, '2025-01-08 22:46:54', 3430724549, '2025-01-08 22:46:54', 0);
INSERT INTO `t_coupon_task` (`id`, `shop_number`, `batch_id`, `task_name`, `file_address`, `fail_file_address`, `send_num`, `notify_type`, `coupon_template_id`, `send_type`, `send_time`, `status`, `completion_time`, `create_time`, `operator_id`, `update_time`, `del_flag`) VALUES (11, 100001, 1877004549412229120, '发送10000个优惠券推送任务', '/Users/hyj/project/java-project/onecoupon/tmp/oneCoupon任务推送Excel.xlsx', NULL, 50000, '0,3', 23, 0, '2024-08-20 12:00:00', 1, NULL, '2025-01-08 22:48:52', 3430724549, '2025-01-08 22:48:53', 0);
INSERT INTO `t_coupon_task` (`id`, `shop_number`, `batch_id`, `task_name`, `file_address`, `fail_file_address`, `send_num`, `notify_type`, `coupon_template_id`, `send_type`, `send_time`, `status`, `completion_time`, `create_time`, `operator_id`, `update_time`, `del_flag`) VALUES (12, 100001, 1877174826892922880, '发送10000个优惠券推送任务', '/Users/hyj/project/java-project/onecoupon/tmp/oneCoupon任务推送Excel.xlsx', NULL, 50000, '0,3', 23, 0, '2024-08-20 12:00:00', 1, NULL, '2025-01-09 10:05:30', 3430724549, '2025-01-09 10:05:30', 0);
INSERT INTO `t_coupon_task` (`id`, `shop_number`, `batch_id`, `task_name`, `file_address`, `fail_file_address`, `send_num`, `notify_type`, `coupon_template_id`, `send_type`, `send_time`, `status`, `completion_time`, `create_time`, `operator_id`, `update_time`, `del_flag`) VALUES (13, 100001, 1877175145160904704, '发送10000个优惠券推送任务', '/Users/hyj/project/java-project/onecoupon/tmp/oneCoupon任务推送Excel.xlsx', NULL, 50000, '0,3', 23, 0, '2024-08-20 12:00:00', 1, NULL, '2025-01-09 10:06:45', 3430724549, '2025-01-09 10:06:46', 0);
INSERT INTO `t_coupon_task` (`id`, `shop_number`, `batch_id`, `task_name`, `file_address`, `fail_file_address`, `send_num`, `notify_type`, `coupon_template_id`, `send_type`, `send_time`, `status`, `completion_time`, `create_time`, `operator_id`, `update_time`, `del_flag`) VALUES (14, 100001, 1877175690441396224, '发送10000个优惠券推送任务', '/Users/hyj/project/java-project/onecoupon/tmp/oneCoupon任务推送Excel.xlsx', NULL, 50000, '0,3', 23, 0, '2024-08-20 12:00:00', 1, NULL, '2025-01-09 10:08:55', 3430724549, '2025-01-09 10:08:56', 0);
INSERT INTO `t_coupon_task` (`id`, `shop_number`, `batch_id`, `task_name`, `file_address`, `fail_file_address`, `send_num`, `notify_type`, `coupon_template_id`, `send_type`, `send_time`, `status`, `completion_time`, `create_time`, `operator_id`, `update_time`, `del_flag`) VALUES (15, 100001, 1877176419772141568, '发送10000个优惠券推送任务', '/Users/hyj/project/java-project/onecoupon/tmp/oneCoupon任务推送Excel.xlsx', NULL, 50000, '0,3', 23, 0, '2024-08-20 12:00:00', 1, NULL, '2025-01-09 10:11:49', 3430724549, '2025-01-09 10:11:50', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_coupon_template_0
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_template_0`;
CREATE TABLE `t_coupon_template_0` (
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
-- Records of t_coupon_template_0
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_coupon_template_1
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_template_1`;
CREATE TABLE `t_coupon_template_1` (
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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='优惠券模板表';

-- ----------------------------
-- Records of t_coupon_template_1
-- ----------------------------
BEGIN;
INSERT INTO `t_coupon_template_1` (`id`, `name`, `shop_number`, `source`, `target`, `goods`, `type`, `valid_start_time`, `valid_end_time`, `stock`, `receive_rule`, `consume_rule`, `status`, `create_time`, `update_time`, `del_flag`) VALUES (1, '夏季促销满减券', 100001, 1, 0, 'SP001,SP002', 1, '2024-12-20 00:00:00', '2025-01-20 23:59:59', 1000, '{\"limit\": 1, \"condition\": \"用户等级大于3\"}', '{\"reduction\": 20, \"threshold\": 100}', 0, '2024-11-30 17:08:23', '2024-11-30 17:08:23', 0);
INSERT INTO `t_coupon_template_1` (`id`, `name`, `shop_number`, `source`, `target`, `goods`, `type`, `valid_start_time`, `valid_end_time`, `stock`, `receive_rule`, `consume_rule`, `status`, `create_time`, `update_time`, `del_flag`) VALUES (2, '夏季促销满减券', 100001, 1, 0, 'SP001,SP002', 1, '2024-12-20 00:00:00', '2025-01-20 23:59:59', 1000, '{\"limit\": 1, \"condition\": \"用户等级大于3\"}', '{\"reduction\": 20, \"threshold\": 100}', 0, '2024-11-30 17:31:46', '2024-11-30 17:31:46', 0);
INSERT INTO `t_coupon_template_1` (`id`, `name`, `shop_number`, `source`, `target`, `goods`, `type`, `valid_start_time`, `valid_end_time`, `stock`, `receive_rule`, `consume_rule`, `status`, `create_time`, `update_time`, `del_flag`) VALUES (3, '夏季促销满减券', 100001, 1, 0, 'SP001,SP002', 1, '2024-12-20 00:00:00', '2025-01-20 23:59:59', 1000, '{\"limit\": 1, \"condition\": \"用户等级大于3\"}', '{\"reduction\": 20, \"threshold\": 100}', 0, '2024-11-30 17:31:47', '2024-11-30 17:31:47', 0);
INSERT INTO `t_coupon_template_1` (`id`, `name`, `shop_number`, `source`, `target`, `goods`, `type`, `valid_start_time`, `valid_end_time`, `stock`, `receive_rule`, `consume_rule`, `status`, `create_time`, `update_time`, `del_flag`) VALUES (4, '夏季促销满减券', 100001, 1, 0, 'SP001,SP002', 1, '2024-12-20 00:00:00', '2025-01-20 23:59:59', 1000, '{\"limit\": 1, \"condition\": \"用户等级大于3\"}', '{\"reduction\": 20, \"threshold\": 100}', 0, '2024-11-30 17:31:47', '2024-11-30 17:31:47', 0);
INSERT INTO `t_coupon_template_1` (`id`, `name`, `shop_number`, `source`, `target`, `goods`, `type`, `valid_start_time`, `valid_end_time`, `stock`, `receive_rule`, `consume_rule`, `status`, `create_time`, `update_time`, `del_flag`) VALUES (5, '夏季促销满减券', 100001, 1, 0, 'SP001,SP002', 1, '2024-12-20 00:00:00', '2025-01-20 23:59:59', 1077, '{\"limit\": 1, \"condition\": \"用户等级大于3\"}', '{\"reduction\": 20, \"threshold\": 100}', 1, '2024-11-30 17:31:47', '2024-11-30 19:45:23', 0);
INSERT INTO `t_coupon_template_1` (`id`, `name`, `shop_number`, `source`, `target`, `goods`, `type`, `valid_start_time`, `valid_end_time`, `stock`, `receive_rule`, `consume_rule`, `status`, `create_time`, `update_time`, `del_flag`) VALUES (6, '夏季促销满减券', 100001, 1, 0, 'SP001,SP002', 1, '2024-12-20 00:00:00', '2025-01-20 23:59:59', 1000, '{\"limit\": 1, \"condition\": \"用户等级大于3\"}', '{\"reduction\": 20, \"threshold\": 100}', 0, '2024-11-30 17:31:47', '2024-11-30 17:31:47', 0);
INSERT INTO `t_coupon_template_1` (`id`, `name`, `shop_number`, `source`, `target`, `goods`, `type`, `valid_start_time`, `valid_end_time`, `stock`, `receive_rule`, `consume_rule`, `status`, `create_time`, `update_time`, `del_flag`) VALUES (7, '夏季促销满减券', 100001, 1, 0, 'SP001,SP002', 1, '2024-12-20 00:00:00', '2025-01-20 23:59:59', 1000, '{\"limit\": 1, \"condition\": \"用户等级大于3\"}', '{\"reduction\": 20, \"threshold\": 100}', 0, '2024-11-30 17:31:47', '2024-11-30 17:31:47', 0);
INSERT INTO `t_coupon_template_1` (`id`, `name`, `shop_number`, `source`, `target`, `goods`, `type`, `valid_start_time`, `valid_end_time`, `stock`, `receive_rule`, `consume_rule`, `status`, `create_time`, `update_time`, `del_flag`) VALUES (8, '夏季促销满减券', 100001, 1, 0, 'SP001,SP002', 1, '2024-12-20 00:00:00', '2025-01-20 23:59:59', 1000, '{\"limit\": 1, \"condition\": \"用户等级大于3\"}', '{\"reduction\": 20, \"threshold\": 100}', 0, '2024-11-30 17:31:47', '2024-11-30 17:31:47', 0);
INSERT INTO `t_coupon_template_1` (`id`, `name`, `shop_number`, `source`, `target`, `goods`, `type`, `valid_start_time`, `valid_end_time`, `stock`, `receive_rule`, `consume_rule`, `status`, `create_time`, `update_time`, `del_flag`) VALUES (9, '夏季促销满减券', 100001, 1, 0, 'SP001,SP002', 1, '2024-12-20 00:00:00', '2025-01-20 23:59:59', 1000, '{\"limit\": 1, \"condition\": \"用户等级大于3\"}', '{\"reduction\": 20, \"threshold\": 100}', 0, '2024-11-30 17:31:47', '2024-11-30 17:31:47', 0);
INSERT INTO `t_coupon_template_1` (`id`, `name`, `shop_number`, `source`, `target`, `goods`, `type`, `valid_start_time`, `valid_end_time`, `stock`, `receive_rule`, `consume_rule`, `status`, `create_time`, `update_time`, `del_flag`) VALUES (10, '夏季促销满减券', 100001, 1, 0, 'SP001,SP002', 1, '2024-12-20 00:00:00', '2025-01-20 23:59:59', 1000, '{\"limit\": 1, \"condition\": \"用户等级大于3\"}', '{\"reduction\": 20, \"threshold\": 100}', 0, '2024-11-30 17:31:47', '2024-11-30 17:31:47', 0);
INSERT INTO `t_coupon_template_1` (`id`, `name`, `shop_number`, `source`, `target`, `goods`, `type`, `valid_start_time`, `valid_end_time`, `stock`, `receive_rule`, `consume_rule`, `status`, `create_time`, `update_time`, `del_flag`) VALUES (11, '夏季促销满减券', 100001, 1, 0, 'SP001,SP002', 1, '2024-12-20 00:00:00', '2025-01-20 23:59:59', 1000, '{\"limit\": 1, \"condition\": \"用户等级大于3\"}', '{\"reduction\": 20, \"threshold\": 100}', 0, '2024-11-30 17:31:47', '2024-11-30 17:31:47', 0);
INSERT INTO `t_coupon_template_1` (`id`, `name`, `shop_number`, `source`, `target`, `goods`, `type`, `valid_start_time`, `valid_end_time`, `stock`, `receive_rule`, `consume_rule`, `status`, `create_time`, `update_time`, `del_flag`) VALUES (12, '夏季促销满减券', 100001, 1, 0, 'SP001,SP002', 1, '2024-12-20 00:00:00', '2025-01-20 23:59:59', 1000, '{\"limit\": 1, \"condition\": \"用户等级大于3\"}', '{\"reduction\": 20, \"threshold\": 100}', 0, '2024-11-30 17:32:17', '2024-11-30 17:32:17', 0);
INSERT INTO `t_coupon_template_1` (`id`, `name`, `shop_number`, `source`, `target`, `goods`, `type`, `valid_start_time`, `valid_end_time`, `stock`, `receive_rule`, `consume_rule`, `status`, `create_time`, `update_time`, `del_flag`) VALUES (13, '夏季促销满减券', 100001, 1, 0, 'SP001,SP002', 1, '2024-12-20 00:00:00', '2025-01-20 23:59:59', 1000, '{\"limit\": 1, \"condition\": \"用户等级大于3\"}', '{\"reduction\": 20, \"threshold\": 100}', 0, '2024-11-30 17:32:18', '2024-11-30 17:32:18', 0);
INSERT INTO `t_coupon_template_1` (`id`, `name`, `shop_number`, `source`, `target`, `goods`, `type`, `valid_start_time`, `valid_end_time`, `stock`, `receive_rule`, `consume_rule`, `status`, `create_time`, `update_time`, `del_flag`) VALUES (14, '夏季促销满减券', 100001, 1, 0, 'SP001,SP002', 1, '2024-12-20 00:00:00', '2025-01-20 23:59:59', 1000, '{\"limit\": 1, \"condition\": \"用户等级大于3\"}', '{\"reduction\": 20, \"threshold\": 100}', 0, '2024-11-30 17:32:18', '2024-11-30 17:32:18', 0);
INSERT INTO `t_coupon_template_1` (`id`, `name`, `shop_number`, `source`, `target`, `goods`, `type`, `valid_start_time`, `valid_end_time`, `stock`, `receive_rule`, `consume_rule`, `status`, `create_time`, `update_time`, `del_flag`) VALUES (15, '夏季促销满减券', 100001, 1, 0, 'SP001,SP002', 1, '2024-12-20 00:00:00', '2025-01-20 23:59:59', 1000, '{\"limit\": 1, \"condition\": \"用户等级大于3\"}', '{\"reduction\": 20, \"threshold\": 100}', 0, '2024-11-30 17:32:19', '2024-11-30 17:32:19', 0);
INSERT INTO `t_coupon_template_1` (`id`, `name`, `shop_number`, `source`, `target`, `goods`, `type`, `valid_start_time`, `valid_end_time`, `stock`, `receive_rule`, `consume_rule`, `status`, `create_time`, `update_time`, `del_flag`) VALUES (16, '夏季促销满减券', 100001, 1, 0, 'SP001,SP002', 1, '2024-12-20 00:00:00', '2025-01-20 23:59:59', 1000, '{\"limit\": 1, \"condition\": \"用户等级大于3\"}', '{\"reduction\": 20, \"threshold\": 100}', 0, '2024-11-30 17:32:20', '2024-11-30 17:32:20', 0);
INSERT INTO `t_coupon_template_1` (`id`, `name`, `shop_number`, `source`, `target`, `goods`, `type`, `valid_start_time`, `valid_end_time`, `stock`, `receive_rule`, `consume_rule`, `status`, `create_time`, `update_time`, `del_flag`) VALUES (17, '夏季促销满减券', 100001, 1, 0, 'SP001,SP002', 1, '2024-12-20 00:00:00', '2025-01-20 23:59:59', 1000, '{\"limit\": 1, \"condition\": \"用户等级大于3\"}', '{\"reduction\": 20, \"threshold\": 100}', 0, '2024-11-30 17:32:20', '2024-11-30 17:32:20', 0);
INSERT INTO `t_coupon_template_1` (`id`, `name`, `shop_number`, `source`, `target`, `goods`, `type`, `valid_start_time`, `valid_end_time`, `stock`, `receive_rule`, `consume_rule`, `status`, `create_time`, `update_time`, `del_flag`) VALUES (18, '夏季促销满减券', 100001, 1, 0, 'SP001,SP002', 1, '2024-12-20 00:00:00', '2025-01-20 23:59:59', 1000, '{\"limit\": 1, \"condition\": \"用户等级大于3\"}', '{\"reduction\": 20, \"threshold\": 100}', 0, '2024-11-30 17:32:21', '2024-11-30 17:32:21', 0);
INSERT INTO `t_coupon_template_1` (`id`, `name`, `shop_number`, `source`, `target`, `goods`, `type`, `valid_start_time`, `valid_end_time`, `stock`, `receive_rule`, `consume_rule`, `status`, `create_time`, `update_time`, `del_flag`) VALUES (19, '夏季促销满减券', 100001, 1, 0, 'SP001,SP002', 1, '2024-12-20 00:00:00', '2025-01-20 23:59:59', 1000, '{\"limit\": 1, \"condition\": \"用户等级大于3\"}', '{\"reduction\": 20, \"threshold\": 100}', 0, '2024-11-30 17:32:21', '2024-11-30 17:32:21', 0);
INSERT INTO `t_coupon_template_1` (`id`, `name`, `shop_number`, `source`, `target`, `goods`, `type`, `valid_start_time`, `valid_end_time`, `stock`, `receive_rule`, `consume_rule`, `status`, `create_time`, `update_time`, `del_flag`) VALUES (20, '夏季促销满减券', 100001, 1, 0, 'SP001,SP002', 1, '2024-12-20 00:00:00', '2025-01-20 23:59:59', 1000, '{\"limit\": 1, \"condition\": \"用户等级大于3\"}', '{\"reduction\": 20, \"threshold\": 100}', 0, '2024-11-30 17:32:22', '2024-11-30 17:32:22', 0);
INSERT INTO `t_coupon_template_1` (`id`, `name`, `shop_number`, `source`, `target`, `goods`, `type`, `valid_start_time`, `valid_end_time`, `stock`, `receive_rule`, `consume_rule`, `status`, `create_time`, `update_time`, `del_flag`) VALUES (21, '夏季促销满减券', 100001, 1, 0, 'SP001,SP002', 1, '2024-12-20 00:00:00', '2025-01-20 23:59:59', 1000, '{\"limit\": 1, \"condition\": \"用户等级大于3\"}', '{\"reduction\": 20, \"threshold\": 100}', 0, '2024-11-30 17:32:23', '2024-11-30 17:32:23', 0);
INSERT INTO `t_coupon_template_1` (`id`, `name`, `shop_number`, `source`, `target`, `goods`, `type`, `valid_start_time`, `valid_end_time`, `stock`, `receive_rule`, `consume_rule`, `status`, `create_time`, `update_time`, `del_flag`) VALUES (22, '夏季促销满减券', 100001, 1, 0, 'SP001,SP002', 1, '2024-12-20 00:00:00', '2024-11-30 20:05:05', 1000, '{\"limit\": 1, \"condition\": \"用户等级大于3\"}', '{\"reduction\": 20, \"threshold\": 100}', 1, '2024-11-30 20:04:54', '2024-11-30 20:04:54', 0);
INSERT INTO `t_coupon_template_1` (`id`, `name`, `shop_number`, `source`, `target`, `goods`, `type`, `valid_start_time`, `valid_end_time`, `stock`, `receive_rule`, `consume_rule`, `status`, `create_time`, `update_time`, `del_flag`) VALUES (23, '秋季促销满减券', 100001, 1, 0, 'SP001,SP002', 1, '2025-01-10 00:00:00', '2025-01-20 23:59:59', 1066, '{\"limit\": 1, \"condition\": \"用户等级大于3\"}', '{\"reduction\": 20, \"threshold\": 100}', 1, '2025-01-08 22:13:16', '2025-01-08 22:39:48', 0);
INSERT INTO `t_coupon_template_1` (`id`, `name`, `shop_number`, `source`, `target`, `goods`, `type`, `valid_start_time`, `valid_end_time`, `stock`, `receive_rule`, `consume_rule`, `status`, `create_time`, `update_time`, `del_flag`) VALUES (24, '秋季促销满减券', 100001, 1, 0, 'SP001,SP002', 1, '2025-01-08 22:23:00', '2025-01-08 22:24:00', 1000, '{\"limit\": 1, \"condition\": \"用户等级大于3\"}', '{\"reduction\": 20, \"threshold\": 100}', 1, '2025-01-08 22:22:35', '2025-01-08 22:22:35', 0);
INSERT INTO `t_coupon_template_1` (`id`, `name`, `shop_number`, `source`, `target`, `goods`, `type`, `valid_start_time`, `valid_end_time`, `stock`, `receive_rule`, `consume_rule`, `status`, `create_time`, `update_time`, `del_flag`) VALUES (25, '秋季促销满减券', 100001, 1, 0, 'SP001,SP002', 1, '2025-01-09 22:23:00', '2025-01-09 22:24:00', 1066, '{\"limit\": 1, \"condition\": \"用户等级大于3\"}', '{\"reduction\": 20, \"threshold\": 100}', 1, '2025-01-09 10:24:36', '2025-01-09 10:24:36', 0);
INSERT INTO `t_coupon_template_1` (`id`, `name`, `shop_number`, `source`, `target`, `goods`, `type`, `valid_start_time`, `valid_end_time`, `stock`, `receive_rule`, `consume_rule`, `status`, `create_time`, `update_time`, `del_flag`) VALUES (26, '界面创建的优惠券', 100001, 0, 1, '', 0, '2025-01-11 00:00:00', '2025-01-12 00:00:00', 30, '{\"limit\": 1, \"condition\": \"用户等级大于3\"}', '{\"reduction\": 20, \"threshold\": 100}', 0, '2025-01-10 10:59:38', '2025-01-10 10:59:38', 0);
INSERT INTO `t_coupon_template_1` (`id`, `name`, `shop_number`, `source`, `target`, `goods`, `type`, `valid_start_time`, `valid_end_time`, `stock`, `receive_rule`, `consume_rule`, `status`, `create_time`, `update_time`, `del_flag`) VALUES (27, '秋季促销满减券', 100001, 1, 0, 'SP001,SP002', 1, '2025-01-10 22:23:00', '2025-01-11 22:24:00', 1000, '{\"limit\": 1, \"condition\": \"用户等级大于3\"}', '{\"reduction\": 20, \"threshold\": 100}', 0, '2025-01-10 11:00:31', '2025-01-10 11:00:31', 0);
COMMIT;

-- ----------------------------
-- Table structure for t_coupon_template_2
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_template_2`;
CREATE TABLE `t_coupon_template_2` (
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
-- Records of t_coupon_template_2
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_coupon_template_3
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_template_3`;
CREATE TABLE `t_coupon_template_3` (
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
-- Records of t_coupon_template_3
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_coupon_template_4
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_template_4`;
CREATE TABLE `t_coupon_template_4` (
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
-- Records of t_coupon_template_4
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_coupon_template_5
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_template_5`;
CREATE TABLE `t_coupon_template_5` (
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
-- Records of t_coupon_template_5
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_coupon_template_6
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_template_6`;
CREATE TABLE `t_coupon_template_6` (
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
-- Records of t_coupon_template_6
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_coupon_template_7
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_template_7`;
CREATE TABLE `t_coupon_template_7` (
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
-- Records of t_coupon_template_7
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_coupon_template_log_0
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_template_log_0`;
CREATE TABLE `t_coupon_template_log_0` (
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
-- Records of t_coupon_template_log_0
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_coupon_template_log_1
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_template_log_1`;
CREATE TABLE `t_coupon_template_log_1` (
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='优惠券模板操作日志表';

-- ----------------------------
-- Records of t_coupon_template_log_1
-- ----------------------------
BEGIN;
INSERT INTO `t_coupon_template_log_1` (`id`, `shop_number`, `coupon_template_id`, `operator_id`, `operation_log`, `original_data`, `modified_data`, `create_time`) VALUES (1, 100001, 1, 3430724549, '创建优惠券名称：夏季促销满减券， 优惠对象：商品专属优惠， 优惠类型：满减券， 库存数量：1000， 优惠商品编码：SP001,SP002， 有效期开始时间：Fri Dec 20 00:00:00 CST 2024， 有效期结束时间：Mon Jan 20 23:59:59 CST 2025， 领取规则：{\"limit\": 1, \"condition\": \"用户等级大于3\"}， 消耗规则：{\"threshold\": 100, \"reduction\": 20};\n', NULL, '{\"consumeRule\":\"{\\\"threshold\\\": 100, \\\"reduction\\\": 20}\",\"goods\":\"SP001,SP002\",\"name\":\"夏季促销满减券\",\"receiveRule\":\"{\\\"limit\\\": 1, \\\"condition\\\": \\\"用户等级大于3\\\"}\",\"source\":1,\"stock\":1000,\"target\":0,\"type\":1,\"validEndTime\":\"2025-01-20 23:59:59\",\"validStartTime\":\"2024-12-20 00:00:00\"}', '2024-11-30 17:08:23');
INSERT INTO `t_coupon_template_log_1` (`id`, `shop_number`, `coupon_template_id`, `operator_id`, `operation_log`, `original_data`, `modified_data`, `create_time`) VALUES (2, 100001, 1862791625135230976, 3430724549, '增加发行量：66', '{\"consumeRule\":\"{\\\"reduction\\\": 20, \\\"threshold\\\": 100}\",\"couponTemplateId\":1862791625135230976,\"createTime\":\"2024-11-30 17:31:47\",\"delFlag\":0,\"goods\":\"SP001,SP002\",\"id\":5,\"name\":\"夏季促销满减券\",\"receiveRule\":\"{\\\"limit\\\": 1, \\\"condition\\\": \\\"用户等级大于3\\\"}\",\"shopNumber\":100001,\"source\":1,\"status\":0,\"stock\":1011,\"target\":0,\"type\":1,\"updateTime\":\"2024-11-30 17:31:47\",\"validEndTime\":\"2025-01-20 23:59:59\",\"validStartTime\":\"2024-12-20 00:00:00\"}', NULL, '2024-11-30 19:44:14');
INSERT INTO `t_coupon_template_log_1` (`id`, `shop_number`, `coupon_template_id`, `operator_id`, `operation_log`, `original_data`, `modified_data`, `create_time`) VALUES (3, 100001, 1862791625135230976, 3430724549, '结束优惠券', '{\"consumeRule\":\"{\\\"reduction\\\": 20, \\\"threshold\\\": 100}\",\"couponTemplateId\":1862791625135230976,\"createTime\":\"2024-11-30 17:31:47\",\"delFlag\":0,\"goods\":\"SP001,SP002\",\"id\":5,\"name\":\"夏季促销满减券\",\"receiveRule\":\"{\\\"limit\\\": 1, \\\"condition\\\": \\\"用户等级大于3\\\"}\",\"shopNumber\":100001,\"source\":1,\"status\":0,\"stock\":1077,\"target\":0,\"type\":1,\"updateTime\":\"2024-11-30 17:31:47\",\"validEndTime\":\"2025-01-20 23:59:59\",\"validStartTime\":\"2024-12-20 00:00:00\"}', NULL, '2024-11-30 19:45:23');
INSERT INTO `t_coupon_template_log_1` (`id`, `shop_number`, `coupon_template_id`, `operator_id`, `operation_log`, `original_data`, `modified_data`, `create_time`) VALUES (4, 100001, 1862830156301864960, 3430724549, '创建优惠券名称：夏季促销满减券， 优惠对象：商品专属优惠， 优惠类型：满减券， 库存数量：1000， 优惠商品编码：SP001,SP002， 有效期开始时间：Fri Dec 20 00:00:00 CST 2024， 有效期结束时间：Sat Nov 30 20:05:05 CST 2024， 领取规则：{\"limit\": 1, \"condition\": \"用户等级大于3\"}， 消耗规则：{\"threshold\": 100, \"reduction\": 20};\n', NULL, '{\"consumeRule\":\"{\\\"threshold\\\": 100, \\\"reduction\\\": 20}\",\"goods\":\"SP001,SP002\",\"name\":\"夏季促销满减券\",\"receiveRule\":\"{\\\"limit\\\": 1, \\\"condition\\\": \\\"用户等级大于3\\\"}\",\"source\":1,\"stock\":1000,\"target\":0,\"type\":1,\"validEndTime\":\"2024-11-30 20:05:05\",\"validStartTime\":\"2024-12-20 00:00:00\"}', '2024-11-30 20:04:55');
INSERT INTO `t_coupon_template_log_1` (`id`, `shop_number`, `coupon_template_id`, `operator_id`, `operation_log`, `original_data`, `modified_data`, `create_time`) VALUES (5, 100001, 23, 3430724549, '创建优惠券名称：秋季促销满减券， 优惠对象：商品专属优惠， 优惠类型：满减券， 库存数量：1000， 优惠商品编码：SP001,SP002， 有效期开始时间：Fri Jan 10 00:00:00 CST 2025， 有效期结束时间：Mon Jan 20 23:59:59 CST 2025， 领取规则：{\"limit\": 1, \"condition\": \"用户等级大于3\"}， 消耗规则：{\"threshold\": 100, \"reduction\": 20};\n', NULL, '{\"consumeRule\":\"{\\\"threshold\\\": 100, \\\"reduction\\\": 20}\",\"goods\":\"SP001,SP002\",\"name\":\"秋季促销满减券\",\"receiveRule\":\"{\\\"limit\\\": 1, \\\"condition\\\": \\\"用户等级大于3\\\"}\",\"source\":1,\"stock\":1000,\"target\":0,\"type\":1,\"validEndTime\":\"2025-01-20 23:59:59\",\"validStartTime\":\"2025-01-10 00:00:00\"}', '2025-01-08 22:13:17');
INSERT INTO `t_coupon_template_log_1` (`id`, `shop_number`, `coupon_template_id`, `operator_id`, `operation_log`, `original_data`, `modified_data`, `create_time`) VALUES (6, 100001, 24, 3430724549, '创建优惠券名称：秋季促销满减券， 优惠对象：商品专属优惠， 优惠类型：满减券， 库存数量：1000， 优惠商品编码：SP001,SP002， 有效期开始时间：Wed Jan 08 22:23:00 CST 2025， 有效期结束时间：Wed Jan 08 22:24:00 CST 2025， 领取规则：{\"limit\": 1, \"condition\": \"用户等级大于3\"}， 消耗规则：{\"threshold\": 100, \"reduction\": 20};\n', NULL, '{\"consumeRule\":\"{\\\"threshold\\\": 100, \\\"reduction\\\": 20}\",\"goods\":\"SP001,SP002\",\"name\":\"秋季促销满减券\",\"receiveRule\":\"{\\\"limit\\\": 1, \\\"condition\\\": \\\"用户等级大于3\\\"}\",\"source\":1,\"stock\":1000,\"target\":0,\"type\":1,\"validEndTime\":\"2025-01-08 22:24:00\",\"validStartTime\":\"2025-01-08 22:23:00\"}', '2025-01-08 22:22:35');
INSERT INTO `t_coupon_template_log_1` (`id`, `shop_number`, `coupon_template_id`, `operator_id`, `operation_log`, `original_data`, `modified_data`, `create_time`) VALUES (7, 100001, 23, 3430724549, '增加发行量：66', '{\"consumeRule\":\"{\\\"reduction\\\": 20, \\\"threshold\\\": 100}\",\"createTime\":\"2025-01-08 22:13:16\",\"delFlag\":0,\"goods\":\"SP001,SP002\",\"id\":23,\"name\":\"秋季促销满减券\",\"receiveRule\":\"{\\\"limit\\\": 1, \\\"condition\\\": \\\"用户等级大于3\\\"}\",\"shopNumber\":100001,\"source\":1,\"status\":0,\"stock\":1000,\"target\":0,\"type\":1,\"updateTime\":\"2025-01-08 22:13:16\",\"validEndTime\":\"2025-01-20 23:59:59\",\"validStartTime\":\"2025-01-10 00:00:00\"}', NULL, '2025-01-08 22:37:42');
INSERT INTO `t_coupon_template_log_1` (`id`, `shop_number`, `coupon_template_id`, `operator_id`, `operation_log`, `original_data`, `modified_data`, `create_time`) VALUES (8, 100001, 23, 3430724549, '结束优惠券', '{\"consumeRule\":\"{\\\"reduction\\\": 20, \\\"threshold\\\": 100}\",\"createTime\":\"2025-01-08 22:13:16\",\"delFlag\":0,\"goods\":\"SP001,SP002\",\"id\":23,\"name\":\"秋季促销满减券\",\"receiveRule\":\"{\\\"limit\\\": 1, \\\"condition\\\": \\\"用户等级大于3\\\"}\",\"shopNumber\":100001,\"source\":1,\"status\":0,\"stock\":1066,\"target\":0,\"type\":1,\"updateTime\":\"2025-01-08 22:13:16\",\"validEndTime\":\"2025-01-20 23:59:59\",\"validStartTime\":\"2025-01-10 00:00:00\"}', NULL, '2025-01-08 22:39:48');
INSERT INTO `t_coupon_template_log_1` (`id`, `shop_number`, `coupon_template_id`, `operator_id`, `operation_log`, `original_data`, `modified_data`, `create_time`) VALUES (9, 100001, 25, 3430724549, '创建优惠券名称：秋季促销满减券， 优惠对象：商品专属优惠， 优惠类型：满减券， 库存数量：1000， 优惠商品编码：SP001,SP002， 有效期开始时间：Thu Jan 09 22:23:00 CST 2025， 有效期结束时间：Thu Jan 09 22:24:00 CST 2025， 领取规则：{\"limit\": 1, \"condition\": \"用户等级大于3\"}， 消耗规则：{\"threshold\": 100, \"reduction\": 20};\n', NULL, '{\"consumeRule\":\"{\\\"threshold\\\": 100, \\\"reduction\\\": 20}\",\"goods\":\"SP001,SP002\",\"name\":\"秋季促销满减券\",\"receiveRule\":\"{\\\"limit\\\": 1, \\\"condition\\\": \\\"用户等级大于3\\\"}\",\"source\":1,\"stock\":1000,\"target\":0,\"type\":1,\"validEndTime\":\"2025-01-09 22:24:00\",\"validStartTime\":\"2025-01-09 22:23:00\"}', '2025-01-09 10:24:37');
INSERT INTO `t_coupon_template_log_1` (`id`, `shop_number`, `coupon_template_id`, `operator_id`, `operation_log`, `original_data`, `modified_data`, `create_time`) VALUES (10, 100001, 25, 3430724549, '增加发行量：66', '{\"consumeRule\":\"{\\\"reduction\\\": 20, \\\"threshold\\\": 100}\",\"createTime\":\"2025-01-09 10:24:36\",\"delFlag\":0,\"goods\":\"SP001,SP002\",\"id\":25,\"name\":\"秋季促销满减券\",\"receiveRule\":\"{\\\"limit\\\": 1, \\\"condition\\\": \\\"用户等级大于3\\\"}\",\"shopNumber\":100001,\"source\":1,\"status\":0,\"stock\":1000,\"target\":0,\"type\":1,\"updateTime\":\"2025-01-09 10:24:36\",\"validEndTime\":\"2025-01-09 22:24:00\",\"validStartTime\":\"2025-01-09 22:23:00\"}', NULL, '2025-01-09 10:25:28');
INSERT INTO `t_coupon_template_log_1` (`id`, `shop_number`, `coupon_template_id`, `operator_id`, `operation_log`, `original_data`, `modified_data`, `create_time`) VALUES (11, 100001, 26, 3430724549, '创建优惠券名称：界面创建的优惠券， 优惠对象：全店通用优惠， 优惠类型：立减券， 库存数量：30， 优惠商品编码：， 有效期开始时间：Sat Jan 11 00:00:00 CST 2025， 有效期结束时间：Sun Jan 12 00:00:00 CST 2025， 领取规则：{\"limit\": 1, \"condition\": \"用户等级大于3\"}， 消耗规则：{\"threshold\": 100, \"reduction\": 20};\n', NULL, '{\"consumeRule\":\"{\\\"threshold\\\": 100, \\\"reduction\\\": 20}\",\"goods\":\"\",\"name\":\"界面创建的优惠券\",\"receiveRule\":\"{\\\"limit\\\": 1, \\\"condition\\\": \\\"用户等级大于3\\\"}\",\"source\":0,\"stock\":30,\"target\":1,\"type\":0,\"validEndTime\":\"2025-01-12 00:00:00\",\"validStartTime\":\"2025-01-11 00:00:00\"}', '2025-01-10 10:59:38');
INSERT INTO `t_coupon_template_log_1` (`id`, `shop_number`, `coupon_template_id`, `operator_id`, `operation_log`, `original_data`, `modified_data`, `create_time`) VALUES (12, 100001, 27, 3430724549, '创建优惠券名称：秋季促销满减券， 优惠对象：商品专属优惠， 优惠类型：满减券， 库存数量：1000， 优惠商品编码：SP001,SP002， 有效期开始时间：Fri Jan 10 22:23:00 CST 2025， 有效期结束时间：Sat Jan 11 22:24:00 CST 2025， 领取规则：{\"limit\": 1, \"condition\": \"用户等级大于3\"}， 消耗规则：{\"threshold\": 100, \"reduction\": 20};\n', NULL, '{\"consumeRule\":\"{\\\"threshold\\\": 100, \\\"reduction\\\": 20}\",\"goods\":\"SP001,SP002\",\"name\":\"秋季促销满减券\",\"receiveRule\":\"{\\\"limit\\\": 1, \\\"condition\\\": \\\"用户等级大于3\\\"}\",\"source\":1,\"stock\":1000,\"target\":0,\"type\":1,\"validEndTime\":\"2025-01-11 22:24:00\",\"validStartTime\":\"2025-01-10 22:23:00\"}', '2025-01-10 11:00:31');
COMMIT;

-- ----------------------------
-- Table structure for t_coupon_template_log_2
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_template_log_2`;
CREATE TABLE `t_coupon_template_log_2` (
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
-- Records of t_coupon_template_log_2
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_coupon_template_log_3
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_template_log_3`;
CREATE TABLE `t_coupon_template_log_3` (
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
-- Records of t_coupon_template_log_3
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_coupon_template_log_4
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_template_log_4`;
CREATE TABLE `t_coupon_template_log_4` (
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
-- Records of t_coupon_template_log_4
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_coupon_template_log_5
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_template_log_5`;
CREATE TABLE `t_coupon_template_log_5` (
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
-- Records of t_coupon_template_log_5
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_coupon_template_log_6
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_template_log_6`;
CREATE TABLE `t_coupon_template_log_6` (
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
-- Records of t_coupon_template_log_6
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for t_coupon_template_log_7
-- ----------------------------
DROP TABLE IF EXISTS `t_coupon_template_log_7`;
CREATE TABLE `t_coupon_template_log_7` (
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
-- Records of t_coupon_template_log_7
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
  WHILE i <= 7 DO
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
  DECLARE i INT DEFAULT 0;
  WHILE i <= 7 DO
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
