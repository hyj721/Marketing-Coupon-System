CREATE TABLE `t_coupon_template_log_0`
(
    `id`                      bigint(20)   NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `coupon_template_log_id`  bigint(20)   NOT NULL COMMENT '日志ID',
    `shop_number`             bigint(20)   DEFAULT NULL COMMENT '店铺编号',
    `coupon_template_id`      bigint(20)   DEFAULT NULL COMMENT '优惠券模板ID',
    `operator_id`             bigint(20)   DEFAULT NULL COMMENT '操作人',
    `operation_log`           text COMMENT '操作日志',
    `original_data`           varchar(1024) DEFAULT NULL COMMENT '原始数据',
    `modified_data`           varchar(1024) DEFAULT NULL COMMENT '修改后数据',
    `create_time`             datetime      DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_coupon_template_log_id` (`coupon_template_log_id`),
    KEY                       `idx_shop_number` (`shop_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='优惠券模板操作日志表';
CREATE TABLE `t_coupon_template_log_1`
(
    `id`                      bigint(20)   NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `coupon_template_log_id`  bigint(20)   NOT NULL COMMENT '日志ID',
    `shop_number`             bigint(20)   DEFAULT NULL COMMENT '店铺编号',
    `coupon_template_id`      bigint(20)   DEFAULT NULL COMMENT '优惠券模板ID',
    `operator_id`             bigint(20)   DEFAULT NULL COMMENT '操作人',
    `operation_log`           text COMMENT '操作日志',
    `original_data`           varchar(1024) DEFAULT NULL COMMENT '原始数据',
    `modified_data`           varchar(1024) DEFAULT NULL COMMENT '修改后数据',
    `create_time`             datetime      DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_coupon_template_log_id` (`coupon_template_log_id`),
    KEY                       `idx_shop_number` (`shop_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='优惠券模板操作日志表';
CREATE TABLE `t_coupon_template_log_2`
(
    `id`                      bigint(20)   NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `coupon_template_log_id`  bigint(20)   NOT NULL COMMENT '日志ID',
    `shop_number`             bigint(20)   DEFAULT NULL COMMENT '店铺编号',
    `coupon_template_id`      bigint(20)   DEFAULT NULL COMMENT '优惠券模板ID',
    `operator_id`             bigint(20)   DEFAULT NULL COMMENT '操作人',
    `operation_log`           text COMMENT '操作日志',
    `original_data`           varchar(1024) DEFAULT NULL COMMENT '原始数据',
    `modified_data`           varchar(1024) DEFAULT NULL COMMENT '修改后数据',
    `create_time`             datetime      DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_coupon_template_log_id` (`coupon_template_log_id`),
    KEY                       `idx_shop_number` (`shop_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='优惠券模板操作日志表';
CREATE TABLE `t_coupon_template_log_3`
(
    `id`                      bigint(20)   NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `coupon_template_log_id`  bigint(20)   NOT NULL COMMENT '日志ID',
    `shop_number`             bigint(20)   DEFAULT NULL COMMENT '店铺编号',
    `coupon_template_id`      bigint(20)   DEFAULT NULL COMMENT '优惠券模板ID',
    `operator_id`             bigint(20)   DEFAULT NULL COMMENT '操作人',
    `operation_log`           text COMMENT '操作日志',
    `original_data`           varchar(1024) DEFAULT NULL COMMENT '原始数据',
    `modified_data`           varchar(1024) DEFAULT NULL COMMENT '修改后数据',
    `create_time`             datetime      DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_coupon_template_log_id` (`coupon_template_log_id`),
    KEY                       `idx_shop_number` (`shop_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='优惠券模板操作日志表';
CREATE TABLE `t_coupon_template_log_4`
(
    `id`                      bigint(20)   NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `coupon_template_log_id`  bigint(20)   NOT NULL COMMENT '日志ID',
    `shop_number`             bigint(20)   DEFAULT NULL COMMENT '店铺编号',
    `coupon_template_id`      bigint(20)   DEFAULT NULL COMMENT '优惠券模板ID',
    `operator_id`             bigint(20)   DEFAULT NULL COMMENT '操作人',
    `operation_log`           text COMMENT '操作日志',
    `original_data`           varchar(1024) DEFAULT NULL COMMENT '原始数据',
    `modified_data`           varchar(1024) DEFAULT NULL COMMENT '修改后数据',
    `create_time`             datetime      DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_coupon_template_log_id` (`coupon_template_log_id`),
    KEY                       `idx_shop_number` (`shop_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='优惠券模板操作日志表';
CREATE TABLE `t_coupon_template_log_5`
(
    `id`                      bigint(20)   NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `coupon_template_log_id`  bigint(20)   NOT NULL COMMENT '日志ID',
    `shop_number`             bigint(20)   DEFAULT NULL COMMENT '店铺编号',
    `coupon_template_id`      bigint(20)   DEFAULT NULL COMMENT '优惠券模板ID',
    `operator_id`             bigint(20)   DEFAULT NULL COMMENT '操作人',
    `operation_log`           text COMMENT '操作日志',
    `original_data`           varchar(1024) DEFAULT NULL COMMENT '原始数据',
    `modified_data`           varchar(1024) DEFAULT NULL COMMENT '修改后数据',
    `create_time`             datetime      DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_coupon_template_log_id` (`coupon_template_log_id`),
    KEY                       `idx_shop_number` (`shop_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='优惠券模板操作日志表';
CREATE TABLE `t_coupon_template_log_6`
(
    `id`                      bigint(20)   NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `coupon_template_log_id`  bigint(20)   NOT NULL COMMENT '日志ID',
    `shop_number`             bigint(20)   DEFAULT NULL COMMENT '店铺编号',
    `coupon_template_id`      bigint(20)   DEFAULT NULL COMMENT '优惠券模板ID',
    `operator_id`             bigint(20)   DEFAULT NULL COMMENT '操作人',
    `operation_log`           text COMMENT '操作日志',
    `original_data`           varchar(1024) DEFAULT NULL COMMENT '原始数据',
    `modified_data`           varchar(1024) DEFAULT NULL COMMENT '修改后数据',
    `create_time`             datetime      DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_coupon_template_log_id` (`coupon_template_log_id`),
    KEY                       `idx_shop_number` (`shop_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='优惠券模板操作日志表';
CREATE TABLE `t_coupon_template_log_7`
(
    `id`                      bigint(20)   NOT NULL AUTO_INCREMENT COMMENT 'ID',
    `coupon_template_log_id`  bigint(20)   NOT NULL COMMENT '日志ID',
    `shop_number`             bigint(20)   DEFAULT NULL COMMENT '店铺编号',
    `coupon_template_id`      bigint(20)   DEFAULT NULL COMMENT '优惠券模板ID',
    `operator_id`             bigint(20)   DEFAULT NULL COMMENT '操作人',
    `operation_log`           text COMMENT '操作日志',
    `original_data`           varchar(1024) DEFAULT NULL COMMENT '原始数据',
    `modified_data`           varchar(1024) DEFAULT NULL COMMENT '修改后数据',
    `create_time`             datetime      DEFAULT NULL COMMENT '创建时间',
    PRIMARY KEY (`id`),
    UNIQUE KEY `uk_coupon_template_log_id` (`coupon_template_log_id`),
    KEY                       `idx_shop_number` (`shop_number`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COMMENT='优惠券模板操作日志表';
