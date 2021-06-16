CREATE
DATABASE `URManagement` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

-- URManagement.sys_group definition

CREATE TABLE `sys_group`
(
    `id`          int(24) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `groupname`   varchar(32) NOT NULL COMMENT '组名',
    `description` varchar(255) DEFAULT NULL COMMENT '组说明',
    `state`       tinyint(255) NOT NULL DEFAULT '0' COMMENT '状态',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='小组信息';

INSERT INTO URManagement.sys_group (groupname, description, state)
VALUES ('公共营销二组', NULL, 0);

-- URManagement.sys_role definition

CREATE TABLE `sys_role`
(
    `id`       int(24) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `rolename` varchar(32) NOT NULL,
    `state`    tinyint(255) NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

INSERT INTO URManagement.sys_role (rolename, state)
VALUES ('超级管理员', 1);

-- URManagement.sys_user definition

CREATE TABLE `sys_user`
(
    `id`       int(24) NOT NULL AUTO_INCREMENT COMMENT '主键',
    `userid`   varchar(16)  NOT NULL COMMENT '用户编码',
    `username` varchar(32)  NOT NULL COMMENT '用户名称',
    `password` varchar(255) NOT NULL COMMENT '密码',
    `email`    varchar(255) NOT NULL COMMENT '邮箱',
    `role`     int(24) NOT NULL COMMENT '权限编码',
    `groupid`  int(24) NOT NULL COMMENT '组编码',
    `state`    tinyint(255) NOT NULL DEFAULT '0' COMMENT '用户状态',
    PRIMARY KEY (`id`),
    KEY        `sys_user_FK` (`role`),
    KEY        `sys_user_FK_group` (`groupid`),
    CONSTRAINT `sys_user_FK` FOREIGN KEY (`role`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT `sys_user_FK_group` FOREIGN KEY (`groupid`) REFERENCES `sys_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='用户表';

INSERT INTO URManagement.sys_user (userid, username, password, email, `role`, groupid, state)
VALUES ('cWX467306', '超级牛皮', 'Abc1234%', 'chaijunchen@huawei.com', 1, 1, 1);