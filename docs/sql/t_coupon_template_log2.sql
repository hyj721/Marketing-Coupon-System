CREATE TABLE `t_coupon_template_log_8`
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
CREATE TABLE `t_coupon_template_log_9`
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
CREATE TABLE `t_coupon_template_log_10`
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
CREATE TABLE `t_coupon_template_log_11`
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
CREATE TABLE `t_coupon_template_log_12`
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
CREATE TABLE `t_coupon_template_log_13`
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
CREATE TABLE `t_coupon_template_log_14`
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
CREATE TABLE `t_coupon_template_log_15`
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
