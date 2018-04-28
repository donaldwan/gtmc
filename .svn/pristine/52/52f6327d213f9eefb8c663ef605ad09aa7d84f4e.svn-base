/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50041
Source Host           : 127.0.0.1:3306
Source Database       : manager_base

Target Server Type    : MYSQL
Target Server Version : 50041
File Encoding         : 65001

Date: 2017-06-29 11:03:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for com_attachment
-- ----------------------------
DROP TABLE IF EXISTS `com_attachment`;
CREATE TABLE `com_attachment` (
  `id` int(11) NOT NULL auto_increment,
  `key_code` varchar(16) default NULL COMMENT '默认值N',
  `file_name` varchar(500) default NULL,
  `file_path` varchar(500) default NULL,
  `file_type` varchar(16) default NULL COMMENT '文件类型(文件后缀小写)',
  `file_size` decimal(10,0) default NULL COMMENT '文件大小',
  `del_flag` varchar(2) default NULL COMMENT '文件是否删除:1:是,0:否,默认0',
  `ext_params` varchar(500) default NULL COMMENT '扩展参数，如果有值，保存为json格式',
  `created_time` datetime default NULL COMMENT '创建时间',
  `created_user_id` int(11) default NULL,
  `created_user_name` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='上传文件附件表';

-- ----------------------------
-- Records of com_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for com_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `com_dictionary`;
CREATE TABLE `com_dictionary` (
  `id` int(11) NOT NULL auto_increment,
  `type_code` varchar(128) default NULL,
  `dictionary_name` varchar(128) default NULL,
  `dictionary_code` varchar(128) default NULL,
  `dictionary_value` varchar(128) default NULL,
  `status` varchar(2) default NULL COMMENT '状态:A:有效,D:无效',
  `sort_num` int(11) default NULL,
  `remark` varchar(200) default NULL,
  `created_time` datetime default NULL COMMENT '创建时间',
  `created_user_id` int(11) default NULL,
  `created_user_name` varchar(45) default NULL,
  `updated_time` datetime default NULL,
  `updated_user_id` int(11) default NULL,
  `updated_user_name` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统字典表';

-- ----------------------------
-- Records of com_dictionary
-- ----------------------------
INSERT INTO `com_dictionary` VALUES ('1', 'COMP_PROCESS_METHOD', '部品处理措施1', '废弃', '废弃', 'A', null, '', null, null, null, '2017-06-20 17:03:40', '1', '系统管理员');
INSERT INTO `com_dictionary` VALUES ('2', 'COMP_PROCESS_METHOD', '部品处理措施', '返厂调查', '返厂调查', 'A', null, '备注备注备注', null, null, null, '2017-06-27 15:35:08', '1', '系统管理员');
INSERT INTO `com_dictionary` VALUES ('4', 'PROBLEM_IMPORTANT_LEVEL', '重要度', 'A', 'A', 'A', null, null, null, null, null, null, null, null);
INSERT INTO `com_dictionary` VALUES ('5', 'PROBLEM_IMPORTANT_LEVEL', '重要度', 'B', 'B', 'A', null, null, null, null, null, null, null, null);
INSERT INTO `com_dictionary` VALUES ('6', 'PROBLEM_HANPPEN_CONDITION', '发生情况', '初发', '初发', 'A', null, '', null, null, null, '2017-06-28 15:16:04', '1', '系统管理员');
INSERT INTO `com_dictionary` VALUES ('7', 'PROBLEM_HANPPEN_CONDITION', '发生情况', '再发', '再发', 'A', null, '', null, null, null, '2017-06-28 17:21:37', '1', '系统管理员');
INSERT INTO `com_dictionary` VALUES ('8', 'PROBLEM_HANPPEN_CONDITION', '发生情况', '连发', '连发', 'A', null, null, null, null, null, null, null, null);
INSERT INTO `com_dictionary` VALUES ('9', 'PROBLEM_BAD_PROJECT', '不良项目', '外观', '外观', 'A', null, null, null, null, null, null, null, null);
INSERT INTO `com_dictionary` VALUES ('10', 'PROBLEM_BAD_PROJECT', '不良项目', '尺寸', '尺寸', 'A', null, null, null, null, null, null, null, null);
INSERT INTO `com_dictionary` VALUES ('11', 'ATTACHMENT_FOLDER', '附件上传存放目录', 'Default', 'D:\\TEST', 'A', null, null, null, null, null, '2017-02-16 10:56:31', '1', '系统管理员');
INSERT INTO `com_dictionary` VALUES ('81', 'TEMPLATE_FOLDER', '模版存放目录', 'Default', 'D:\\TEST', 'A', null, null, '2017-02-16 10:38:01', '1', '系统管理员', '2017-02-16 10:56:14', '1', '系统管理员');
INSERT INTO `com_dictionary` VALUES ('82', 'USER_TYPE', '用户类型', '用户类型一', '用户类型一', 'A', '1', null, '2017-02-16 16:14:52', '1', '系统管理员', null, null, null);
INSERT INTO `com_dictionary` VALUES ('83', 'USER_TYPE', '用户类型', '用户类型二', '用户类型二', 'A', '2', null, '2017-02-16 16:15:32', '1', '系统管理员', null, null, null);
INSERT INTO `com_dictionary` VALUES ('84', 'RESOURCE_TYPE', '资源类型', 'D', '默认方式', 'A', '1', '', '2017-06-16 17:09:53', '1', '系统管理员', null, null, null);
INSERT INTO `com_dictionary` VALUES ('85', 'RESOURCE_TYPE', '资源类型', 'I', 'IFrame', 'A', '2', '', '2017-06-16 17:10:36', '1', '系统管理员', null, null, null);

-- ----------------------------
-- Table structure for com_mail_template
-- ----------------------------
DROP TABLE IF EXISTS `com_mail_template`;
CREATE TABLE `com_mail_template` (
  `id` int(11) NOT NULL auto_increment,
  `status` varchar(2) default NULL COMMENT '状态:A:有效,D:无效',
  `remark` varchar(200) default NULL,
  `created_time` datetime default NULL COMMENT '创建时间',
  `created_user_id` int(11) default NULL,
  `created_user_name` varchar(45) default NULL,
  `updated_time` datetime default NULL,
  `updated_user_id` int(11) default NULL,
  `updated_user_name` varchar(45) default NULL,
  `template_name` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='邮件模版表';

-- ----------------------------
-- Records of com_mail_template
-- ----------------------------
INSERT INTO `com_mail_template` VALUES ('1121646108', 'A', 'tests', '2017-06-16 16:38:48', '1', '系统管理员', '2017-06-28 15:25:58', '1', '系统管理员', '1497602328194.vm');
INSERT INTO `com_mail_template` VALUES ('1121646109', 'A', 'Heyhey', '2017-06-27 15:47:03', '1', '系统管理员', '2017-06-27 15:47:03', '1', '系统管理员', '1498549622974.vm');

-- ----------------------------
-- Table structure for com_schedule_job
-- ----------------------------
DROP TABLE IF EXISTS `com_schedule_job`;
CREATE TABLE `com_schedule_job` (
  `id` varchar(36) NOT NULL,
  `job_group` varchar(36) default NULL,
  `job_name` varchar(128) default NULL,
  `job_type` varchar(2) default NULL COMMENT '任务类型:J:java对象,S:shell脚本',
  `job_object` varchar(256) default NULL COMMENT '根据任务类型，如果是java对象，为class名称，shell脚本，为shell文件的路径',
  `shell_path` varchar(256) default NULL,
  `cron_expression` varchar(128) default NULL,
  `status` varchar(2) default NULL COMMENT 'A:启用,D:禁用',
  `run_status` varchar(2) default NULL COMMENT '任务当前状态,A:常态,R:正在运行,P:暂停',
  `last_run_start_time` datetime default NULL,
  `last_run_end_time` datetime default NULL,
  `run_result` varchar(2) default NULL COMMENT '运行结果:1:正常结束,0:有异常',
  `run_message` varchar(4000) default NULL,
  `created_time` datetime default NULL COMMENT '创建时间',
  `created_user_id` varchar(36) default NULL,
  `created_user_name` varchar(45) default NULL,
  `updated_time` datetime default NULL,
  `updated_user_id` varchar(36) default NULL,
  `updated_user_name` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务表';

-- ----------------------------
-- Records of com_schedule_job
-- ----------------------------
INSERT INTO `com_schedule_job` VALUES ('1', 'DefaultGroup', 'test', 'J', 'cn.com.gtmc.glaf2.plugins.job.test.TestJavaJob', '', '0/10 * * * * ? ', 'D', 'A', '2017-06-29 09:48:20', '2017-06-29 09:48:50', '1', null, '2017-01-03 17:36:50', '1', '系统管理员', '2017-06-29 09:48:27', '1', '系统管理员');
INSERT INTO `com_schedule_job` VALUES ('3816f609-b00a-412d-8f8a-24ae2707109e', 'DefaultGroup', '627', 'J', 'cn.com.gtmc.glaf2.plugins.job.test.TestJavaJob', null, '* * * * * ?', 'D', 'A', '2017-06-29 09:48:22', '2017-06-29 09:48:52', '1', null, '2017-06-27 14:44:46', '1', '系统管理员', '2017-06-29 09:48:23', '1', '系统管理员');
INSERT INTO `com_schedule_job` VALUES ('98f9b1b9-1548-4f6c-b47b-8ef92c88dd35', 'DefaultGroup', '62701', 'J', 'cn.com.gtmc.glaf2.plugins.job.test.TestJavaJob', null, '* * * * * ?', 'D', 'A', '2017-06-28 15:42:20', '2017-06-28 15:42:50', '1', null, '2017-06-27 14:45:44', '1', '系统管理员', '2017-06-28 15:42:20', '1', '系统管理员');
INSERT INTO `com_schedule_job` VALUES ('d5670dbd-00b4-414d-b7af-5b79b2d79e0b', 'DefaultGroup', 'test', 'J', 'cn.com.gtmc.glaf2.plugins.job.test.TestJavaJob', null, '0/10 * * * * ? ', 'D', 'A', '2017-06-27 14:44:00', '2017-06-27 14:44:30', '1', null, '2017-01-03 17:36:50', '1', '系统管理员', '2017-06-27 14:44:01', '1', '系统管理员');

-- ----------------------------
-- Table structure for com_work_calendar
-- ----------------------------
DROP TABLE IF EXISTS `com_work_calendar`;
CREATE TABLE `com_work_calendar` (
  `id` varchar(36) NOT NULL,
  `day` datetime default NULL,
  `work_type` varchar(2) default NULL COMMENT 'W:工作日,N:非工作日',
  `created_time` datetime default NULL COMMENT '创建时间',
  `created_user_id` varchar(36) default NULL,
  `created_user_name` varchar(45) default NULL,
  `updated_time` datetime default NULL,
  `updated_user_id` varchar(36) default NULL,
  `updated_user_name` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作日历表';

-- ----------------------------
-- Records of com_work_calendar
-- ----------------------------

-- ----------------------------
-- Table structure for his_schedule_job_run
-- ----------------------------
DROP TABLE IF EXISTS `his_schedule_job_run`;
CREATE TABLE `his_schedule_job_run` (
  `id` varchar(36) NOT NULL,
  `job_id` varchar(36) default NULL,
  `job_type` varchar(2) default NULL,
  `job_object` varchar(256) default NULL,
  `shell_path` varchar(256) default NULL,
  `cron_expression` varchar(128) default NULL,
  `run_start_time` datetime default NULL,
  `run_end_time` datetime default NULL,
  `run_result` varchar(2) default NULL,
  `run_message` varchar(4000) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_reference_02` (`job_id`),
  CONSTRAINT `fk_reference_02` FOREIGN KEY (`job_id`) REFERENCES `com_schedule_job` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务运行日志表';

-- ----------------------------
-- Records of his_schedule_job_run
-- ----------------------------

-- ----------------------------
-- Table structure for log_import_data
-- ----------------------------
DROP TABLE IF EXISTS `log_import_data`;
CREATE TABLE `log_import_data` (
  `id` int(11) NOT NULL auto_increment,
  `executor` varchar(128) NOT NULL,
  `data_file` varchar(256) NOT NULL,
  `result` varchar(2) default NULL COMMENT '1:导入成功,0:导入失败',
  `error_file` varchar(256) default NULL,
  `created_time` datetime default NULL COMMENT '创建时间',
  `created_user_id` int(11) default NULL,
  `created_user_name` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通用导入日志表';

-- ----------------------------
-- Records of log_import_data
-- ----------------------------

-- ----------------------------
-- Table structure for log_login
-- ----------------------------
DROP TABLE IF EXISTS `log_login`;
CREATE TABLE `log_login` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `login_name` varchar(45) NOT NULL,
  `login_ip` varchar(45) NOT NULL,
  `client_platform` varchar(45) default NULL,
  `client_device_id` varchar(45) default NULL,
  `created_time` datetime default NULL,
  `quit_time` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_reference_03` (`user_id`),
  CONSTRAINT `fk_reference_03` FOREIGN KEY (`user_id`) REFERENCES `u_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='登录日志表';

-- ----------------------------
-- Records of log_login
-- ----------------------------
INSERT INTO `log_login` VALUES ('2136571627', '1', '系统管理员', '0:0:0:0:0:0:0:1', null, null, '2017-06-29 11:00:52', null);

-- ----------------------------
-- Table structure for u_authentication
-- ----------------------------
DROP TABLE IF EXISTS `u_authentication`;
CREATE TABLE `u_authentication` (
  `id` int(11) NOT NULL auto_increment,
  `screen_id` int(11) NOT NULL,
  `auth_name` varchar(45) NOT NULL,
  `auth_code` varchar(45) NOT NULL,
  `remark` varchar(200) default NULL,
  `created_time` datetime default NULL COMMENT '创建时间',
  `created_user_id` int(11) default NULL,
  `created_user_name` varchar(45) default NULL,
  `updated_time` datetime default NULL,
  `updated_user_id` int(11) default NULL,
  `updated_user_name` varchar(45) default NULL,
  PRIMARY KEY  (`id`),
  KEY `ak_key_2` (`auth_code`),
  KEY `fk_reference_04` (`screen_id`),
  CONSTRAINT `fk_reference_04` FOREIGN KEY (`screen_id`) REFERENCES `u_screen` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限集合表';

-- ----------------------------
-- Records of u_authentication
-- ----------------------------
INSERT INTO `u_authentication` VALUES ('1', '1', '权限测试', 'TEST_CODE', null, '2017-01-05 13:46:41', '1', '系统管理员', '2017-01-05 13:46:41', '1', '系统管理员');
INSERT INTO `u_authentication` VALUES ('170174634', '2', '新增同级', 'INSERT_T', null, '2017-01-05 13:46:41', '1', '系统管理员', '2017-01-05 13:46:41', '1', '系统管理员');
INSERT INTO `u_authentication` VALUES ('2026695496', '2', '部门编辑', 'CODE_DEPT_EDIT', null, '2017-02-04 14:55:05', '1', '系统管理员', '2017-02-04 14:55:05', '1', '系统管理员');

-- ----------------------------
-- Table structure for u_authentication_resource
-- ----------------------------
DROP TABLE IF EXISTS `u_authentication_resource`;
CREATE TABLE `u_authentication_resource` (
  `id` int(11) NOT NULL auto_increment,
  `authentication_id` int(11) NOT NULL,
  `resource_id` int(11) NOT NULL,
  `created_time` datetime default NULL COMMENT '创建时间',
  `created_user_id` int(11) default NULL,
  `created_user_name` varchar(45) default NULL,
  `updated_time` datetime default NULL,
  `updated_user_id` int(11) default NULL,
  `updated_user_name` varchar(45) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_reference_05` (`resource_id`),
  KEY `fk_reference_06` (`authentication_id`),
  CONSTRAINT `fk_reference_05` FOREIGN KEY (`resource_id`) REFERENCES `u_resource` (`id`),
  CONSTRAINT `fk_reference_06` FOREIGN KEY (`authentication_id`) REFERENCES `u_authentication` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限资源关系表';

-- ----------------------------
-- Records of u_authentication_resource
-- ----------------------------

-- ----------------------------
-- Table structure for u_dept
-- ----------------------------
DROP TABLE IF EXISTS `u_dept`;
CREATE TABLE `u_dept` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) default NULL,
  `dept_name` varchar(200) default NULL,
  `dept_code` varchar(50) default NULL,
  `status` varchar(2) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_reference_07` (`parent_id`),
  CONSTRAINT `fk_reference_07` FOREIGN KEY (`parent_id`) REFERENCES `u_dept` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of u_dept
-- ----------------------------
INSERT INTO `u_dept` VALUES ('1', null, '音泰思', 'ISCT', 'A');
INSERT INTO `u_dept` VALUES ('2073320650', '1', '第一部门', '', 'A');

-- ----------------------------
-- Table structure for u_dept_user
-- ----------------------------
DROP TABLE IF EXISTS `u_dept_user`;
CREATE TABLE `u_dept_user` (
  `id` int(11) NOT NULL auto_increment,
  `dept_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_reference_08` (`dept_id`),
  KEY `fk_reference_09` (`user_id`),
  CONSTRAINT `fk_reference_08` FOREIGN KEY (`dept_id`) REFERENCES `u_dept` (`id`),
  CONSTRAINT `fk_reference_09` FOREIGN KEY (`user_id`) REFERENCES `u_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门用户表';

-- ----------------------------
-- Records of u_dept_user
-- ----------------------------
INSERT INTO `u_dept_user` VALUES ('1', '1', '1');

-- ----------------------------
-- Table structure for u_feedback
-- ----------------------------
DROP TABLE IF EXISTS `u_feedback`;
CREATE TABLE `u_feedback` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `content` varchar(2000) default NULL,
  `created_time` datetime default NULL COMMENT '创建时间',
  `created_user_id` varchar(36) default NULL,
  `created_user_name` varchar(45) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_reference_10` (`user_id`),
  CONSTRAINT `fk_reference_10` FOREIGN KEY (`user_id`) REFERENCES `u_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='意见反馈表';

-- ----------------------------
-- Records of u_feedback
-- ----------------------------

-- ----------------------------
-- Table structure for u_message
-- ----------------------------
DROP TABLE IF EXISTS `u_message`;
CREATE TABLE `u_message` (
  `id` int(11) NOT NULL auto_increment,
  `title` varchar(100) default NULL,
  `release_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `release_user_id` int(11) default NULL,
  `release_user_name` varchar(45) default NULL,
  `content` varchar(1000) default NULL,
  `msg_type` varchar(2) default NULL,
  `status` varchar(2) default NULL COMMENT '状态:A:有效,D:无效',
  `created_time` datetime default NULL COMMENT '创建时间',
  `created_user_id` int(11) default NULL,
  `created_user_name` varchar(45) default NULL,
  `updated_time` datetime default NULL,
  `updated_user_id` int(11) default NULL,
  `updated_user_name` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站内信息表';

-- ----------------------------
-- Records of u_message
-- ----------------------------
INSERT INTO `u_message` VALUES ('1', '测试用消息', '2017-01-24 16:50:11', '1', '系统管理员', '测试系统消息成功了', '01', 'D', null, null, null, null, null, null);
INSERT INTO `u_message` VALUES ('66011146', '123', '2017-01-03 13:42:33', '1', '系统管理员', '123', '02', 'D', null, null, null, null, null, null);
INSERT INTO `u_message` VALUES ('92285384', '打包下载提醒', '2017-06-29 11:01:40', '1', '系统管理员', '打包下载文件如下：1486692858808.zip', '02', 'D', null, null, null, null, null, null);
INSERT INTO `u_message` VALUES ('232223928', '111', '2017-01-03 13:47:25', '1', '系统管理员', '2333333', '01', 'D', null, null, null, null, null, null);
INSERT INTO `u_message` VALUES ('506292716', '123', '2017-06-29 11:01:25', '1', '系统管理员', '12345678', '02', 'D', null, null, null, null, null, null);
INSERT INTO `u_message` VALUES ('585970196', '1111111', '2017-06-29 11:01:32', '1', '系统管理员', '111111111', '02', 'D', null, null, null, null, null, null);
INSERT INTO `u_message` VALUES ('669547986', '打包下载提醒', '2017-06-29 11:01:46', '1', '系统管理员', '打包下载文件如下：1486706565057.zip', '02', 'D', null, null, null, null, null, null);
INSERT INTO `u_message` VALUES ('804928130', '打包下载提醒', '2017-06-29 11:01:42', '1', '系统管理员', '打包下载文件如下：1486696780188.zip', '02', 'D', null, null, null, null, null, null);
INSERT INTO `u_message` VALUES ('911757148', '1231', '2017-01-03 13:44:46', '1', '系统管理员', '23123123', '02', 'D', null, null, null, null, null, null);
INSERT INTO `u_message` VALUES ('955426227', '打包下载提醒', '2017-06-29 11:01:44', '1', '系统管理员', '打包下载文件如下：1486697034270.zip', '02', 'D', null, null, null, null, null, null);
INSERT INTO `u_message` VALUES ('1092951564', '1231', '2017-06-29 11:01:27', '1', '系统管理员', '1231', '02', 'D', null, null, null, null, null, null);
INSERT INTO `u_message` VALUES ('1341113388', '测试系统消息', '2017-01-24 16:50:11', '1', '系统管理员', '测试系统消息成功了', '01', 'D', null, null, null, null, null, null);
INSERT INTO `u_message` VALUES ('1429302839', '123123', '2017-06-29 11:01:29', '1', '系统管理员', '123123', '02', 'D', null, null, null, null, null, null);
INSERT INTO `u_message` VALUES ('1493450185', 'bbb', '2017-06-29 11:01:22', '1', '系统管理员', 'bbb', '01', 'D', null, null, null, null, null, null);
INSERT INTO `u_message` VALUES ('1715774489', '打包下载提醒', '2017-06-29 11:01:34', '1', '系统管理员', '打包下载文件如下：1486633393782.zip', '02', 'D', null, null, null, null, null, null);
INSERT INTO `u_message` VALUES ('1734759633', '123', '2017-01-03 10:56:18', '1', '系统管理员', '123', '01', 'D', null, null, null, null, null, null);
INSERT INTO `u_message` VALUES ('1947905199', '1231231', '2017-01-03 13:47:18', '1', '系统管理员', '123123123', '02', 'D', null, null, null, null, null, null);
INSERT INTO `u_message` VALUES ('1955939496', '很长的类容测试很长的类容测试很长的类容测试很长的类容测试', '2017-06-29 11:01:38', '1', '系统管理员', '一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十一二三四五六七八九十', '02', 'D', null, null, null, null, null, null);
INSERT INTO `u_message` VALUES ('1955939497', '打包下载提醒', '2017-06-29 11:01:49', '1', '系统管理员', '打包下载文件如下：1497949198022.zip', '02', 'D', null, null, null, null, null, null);
INSERT INTO `u_message` VALUES ('1955939498', '测试内容', '2017-06-27 13:48:15', '1', '系统管理员', '阿斯顿发生发生', '01', 'A', null, null, null, null, null, null);
INSERT INTO `u_message` VALUES ('1955939499', '消息标题', '2017-06-27 15:14:57', '1', '系统管理员', '消息内容', '02', 'D', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for u_message_notify_user
-- ----------------------------
DROP TABLE IF EXISTS `u_message_notify_user`;
CREATE TABLE `u_message_notify_user` (
  `id` int(11) NOT NULL auto_increment,
  `message_id` int(11) default NULL,
  `message_read_id` int(11) default NULL,
  `user_id` int(11) default NULL,
  `notify_time` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `created_time` datetime default NULL COMMENT '创建时间',
  `created_user_id` int(11) default NULL,
  `created_user_name` varchar(45) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_reference_11` (`message_id`),
  KEY `fk_reference_12` (`user_id`),
  CONSTRAINT `fk_reference_11` FOREIGN KEY (`message_id`) REFERENCES `u_message` (`id`),
  CONSTRAINT `fk_reference_12` FOREIGN KEY (`user_id`) REFERENCES `u_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户通知表';

-- ----------------------------
-- Records of u_message_notify_user
-- ----------------------------

-- ----------------------------
-- Table structure for u_message_read
-- ----------------------------
DROP TABLE IF EXISTS `u_message_read`;
CREATE TABLE `u_message_read` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `message_id` int(11) default NULL,
  `msg_type` varchar(2) default NULL,
  `status` varchar(2) default NULL,
  `created_time` datetime default NULL COMMENT '创建时间',
  `created_user_id` int(11) default NULL,
  `created_user_name` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='信息读取表';

-- ----------------------------
-- Records of u_message_read
-- ----------------------------

-- ----------------------------
-- Table structure for u_resource
-- ----------------------------
DROP TABLE IF EXISTS `u_resource`;
CREATE TABLE `u_resource` (
  `id` int(11) NOT NULL auto_increment,
  `resource_name` varchar(45) NOT NULL,
  `uri` varchar(200) NOT NULL,
  `resource_type` varchar(2) default NULL,
  `remark` varchar(200) default NULL,
  `created_time` datetime default NULL COMMENT '创建时间',
  `created_user_id` int(11) default NULL,
  `created_user_name` varchar(45) default NULL,
  `updated_time` datetime default NULL,
  `updated_user_id` int(11) default NULL,
  `updated_user_name` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of u_resource
-- ----------------------------
INSERT INTO `u_resource` VALUES ('1', '用户列表', 'system/user/manager', 'D', null, null, null, null, null, null, null);
INSERT INTO `u_resource` VALUES ('2', '角色管理', 'system/role/manager', 'D', null, null, null, null, null, null, null);
INSERT INTO `u_resource` VALUES ('3', '资源管理', 'system/resource/manager', 'D', '', null, null, null, '2017-06-28 15:12:54', '1', '系统管理员');
INSERT INTO `u_resource` VALUES ('4', '菜单管理', 'system/screen/manager', 'D', null, null, null, null, null, null, null);
INSERT INTO `u_resource` VALUES ('5', 'Job管理', 'plugins/schedule-job/manager', 'D', null, null, null, null, null, null, null);
INSERT INTO `u_resource` VALUES ('6', '站内信息管理', 'system/notify/manager', 'D', null, null, null, null, null, null, null);
INSERT INTO `u_resource` VALUES ('31', '国际化Demo', 'demo/i18n', 'D', null, null, null, null, null, null, null);
INSERT INTO `u_resource` VALUES ('32', '请假数据', 'demo/leave/manager', 'D', null, null, null, null, null, null, null);
INSERT INTO `u_resource` VALUES ('287730436', '文件导入例子', 'demo/common-demo/import-data', 'D', null, '2017-01-17 14:38:51', '1', '系统管理员', '2017-01-17 14:38:51', '1', '系统管理员');
INSERT INTO `u_resource` VALUES ('287730437', '文件打包下载例子', 'demo/common-demo/packagefiles', 'D', null, '2017-01-17 14:38:51', '1', '系统管理员', '2017-01-17 14:38:51', '1', '系统管理员');
INSERT INTO `u_resource` VALUES ('332440795', '多应用websocket使用', 'demo/websocket/test2', 'D', '', '2017-02-15 18:39:20', '1', '系统管理员', '2017-06-22 11:03:59', '1', '系统管理员');
INSERT INTO `u_resource` VALUES ('674085797', '文件上传例子', 'demo/common-demo/upfile', 'D', null, '2017-01-16 14:32:18', '1', '系统管理员', '2017-01-16 14:32:18', '1', '系统管理员');
INSERT INTO `u_resource` VALUES ('860521610', '模版邮件DEMO', 'demo/template-demo/mail', 'D', null, '2017-02-17 14:04:10', '1', '系统管理员', '2017-02-17 14:04:10', '1', '系统管理员');
INSERT INTO `u_resource` VALUES ('920775739', '邮件模版管理', 'system/mailTemplate/manager', 'D', null, '2017-02-15 15:08:09', '1', '系统管理员', '2017-02-15 15:08:09', '1', '系统管理员');
INSERT INTO `u_resource` VALUES ('1202194176', 'druid数据库连接监控', 'druid/index.html', 'I', null, '2017-01-16 11:20:59', '1', '系统管理员', '2017-01-16 11:20:59', '1', '系统管理员');
INSERT INTO `u_resource` VALUES ('1483509739', '报表例子', 'demo/common-demo/report', 'D', null, '2017-02-08 10:08:00', '1', '系统管理员', '2017-02-08 10:08:00', '1', '系统管理员');
INSERT INTO `u_resource` VALUES ('1487217462', '数据字典维护', 'system/dictionary/manager', 'D', null, '2017-01-11 17:17:10', '1', '系统管理员', '2017-01-11 17:17:10', '1', '系统管理员');
INSERT INTO `u_resource` VALUES ('1500102778', '菜单管理', 'system/screen/manager', 'D', null, '2016-12-15 15:08:23', '1', '系统管理员', '2016-12-15 15:13:12', '1', '系统管理员');
INSERT INTO `u_resource` VALUES ('1716014118', 'websocket使用Demo', 'demo/websocket/test1', 'D', null, '2017-02-13 14:12:48', '1', '系统管理员', '2017-02-16 14:13:47', '1', '系统管理员');
INSERT INTO `u_resource` VALUES ('2024704263', '用户属性扩展维护', 'system/user/property/manager', 'D', null, '2017-02-17 10:08:33', '1', '系统管理员', '2017-02-17 10:08:33', '1', '系统管理员');
INSERT INTO `u_resource` VALUES ('2024704264', '用户组管理', 'plugins/wf/usergroup/manager', 'D', '', '2017-06-16 17:33:52', '1', '系统管理员', '2017-06-16 17:33:52', '1', '系统管理员');

-- ----------------------------
-- Table structure for u_role
-- ----------------------------
DROP TABLE IF EXISTS `u_role`;
CREATE TABLE `u_role` (
  `id` int(11) NOT NULL auto_increment,
  `role_name` varchar(45) NOT NULL,
  `role_code` varchar(45) default NULL,
  `remark` varchar(200) default NULL,
  `status` varchar(2) NOT NULL COMMENT 'A:有效,D:无效',
  `created_time` datetime default NULL COMMENT '创建时间',
  `created_user_id` int(11) default NULL,
  `created_user_name` varchar(45) default NULL,
  `updated_time` datetime default NULL,
  `updated_user_id` int(11) default NULL,
  `updated_user_name` varchar(45) default NULL,
  PRIMARY KEY  (`id`),
  KEY `ak_key_2` (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of u_role
-- ----------------------------
INSERT INTO `u_role` VALUES ('1', '系统管理员', 'ROLE_ADMIN', '备注信息', 'A', null, null, null, '2017-06-27 14:00:51', '1', '系统管理员');

-- ----------------------------
-- Table structure for u_role_authentication
-- ----------------------------
DROP TABLE IF EXISTS `u_role_authentication`;
CREATE TABLE `u_role_authentication` (
  `id` int(11) NOT NULL auto_increment,
  `role_id` int(11) NOT NULL,
  `authentication_id` int(11) NOT NULL,
  `created_time` datetime default NULL COMMENT '创建时间',
  `created_user_id` int(11) default NULL,
  `created_user_name` varchar(45) default NULL,
  `updated_time` datetime default NULL,
  `updated_user_id` int(11) default NULL,
  `updated_user_name` varchar(45) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_reference_13` (`role_id`),
  KEY `fk_reference_14` (`authentication_id`),
  CONSTRAINT `fk_reference_13` FOREIGN KEY (`role_id`) REFERENCES `u_role` (`id`),
  CONSTRAINT `fk_reference_14` FOREIGN KEY (`authentication_id`) REFERENCES `u_authentication` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色权限关系表';

-- ----------------------------
-- Records of u_role_authentication
-- ----------------------------
INSERT INTO `u_role_authentication` VALUES ('1956787681', '1', '170174634', null, null, null, null, null, null);
INSERT INTO `u_role_authentication` VALUES ('1956787682', '1', '2026695496', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for u_role_screen
-- ----------------------------
DROP TABLE IF EXISTS `u_role_screen`;
CREATE TABLE `u_role_screen` (
  `id` int(11) NOT NULL auto_increment,
  `role_id` int(11) NOT NULL,
  `screen_id` int(11) NOT NULL,
  `created_time` datetime default NULL COMMENT '创建时间',
  `created_user_id` int(11) default NULL,
  `created_user_name` varchar(45) default NULL,
  `updated_time` datetime default NULL,
  `updated_user_id` int(11) default NULL,
  `updated_user_name` varchar(45) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_reference_15` (`role_id`),
  KEY `fk_reference_16` (`screen_id`),
  CONSTRAINT `fk_reference_15` FOREIGN KEY (`role_id`) REFERENCES `u_role` (`id`),
  CONSTRAINT `fk_reference_16` FOREIGN KEY (`screen_id`) REFERENCES `u_screen` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色菜单画面关系表';

-- ----------------------------
-- Records of u_role_screen
-- ----------------------------
INSERT INTO `u_role_screen` VALUES ('2080894795', '1', '1', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894796', '1', '2', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894797', '1', '3', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894798', '1', '4', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894799', '1', '5', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894800', '1', '6', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894801', '1', '7', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894802', '1', '655623925', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894803', '1', '1157972098', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894804', '1', '1230411030', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894805', '1', '2025543947', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894806', '1', '30', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894807', '1', '31', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894808', '1', '107138898', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894809', '1', '163321081', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894810', '1', '188323484', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894811', '1', '1391094262', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894812', '1', '1628526714', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894813', '1', '2095885237', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894814', '1', '2110080923', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for u_screen
-- ----------------------------
DROP TABLE IF EXISTS `u_screen`;
CREATE TABLE `u_screen` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) default NULL,
  `screen_name` varchar(45) NOT NULL,
  `normal_css` varchar(45) default NULL,
  `hot_key_css` varchar(45) default NULL,
  `open_type` varchar(2) default NULL COMMENT '打开方式:D(默认方式),I(iframe方式),N(新开窗口)',
  `resource_id` int(11) default NULL COMMENT '此资源ID只能在画面对应的权限集合中进行选择(直接对应的画面，不是子画面)',
  `sort_num` int(11) default NULL,
  `status` varchar(2) default NULL COMMENT '状态,A:有效,D:禁用',
  `remark` varchar(200) default NULL,
  `created_time` datetime default NULL COMMENT '创建时间',
  `created_user_id` int(11) default NULL,
  `created_user_name` varchar(45) default NULL,
  `updated_time` datetime default NULL,
  `updated_user_id` int(11) default NULL,
  `updated_user_name` varchar(45) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_reference_17` (`parent_id`),
  CONSTRAINT `fk_reference_17` FOREIGN KEY (`parent_id`) REFERENCES `u_screen` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统菜单画面表';

-- ----------------------------
-- Records of u_screen
-- ----------------------------
INSERT INTO `u_screen` VALUES ('1', null, '系统管理', null, null, null, null, null, 'A', null, null, null, null, null, null, null);
INSERT INTO `u_screen` VALUES ('2', '1', '用户管理', null, null, 'D', '1', null, 'A', null, null, null, null, '2017-06-27 14:22:59', '1', '系统管理员');
INSERT INTO `u_screen` VALUES ('3', '1', '角色管理', null, null, 'D', '2', null, 'A', null, null, null, null, null, null, null);
INSERT INTO `u_screen` VALUES ('4', '1', '资源管理', null, null, 'D', '3', '0', 'A', null, null, null, null, '2017-06-27 14:17:16', '1', '系统管理员');
INSERT INTO `u_screen` VALUES ('5', '1', '菜单管理', null, null, 'D', '4', null, 'A', null, null, null, null, null, null, null);
INSERT INTO `u_screen` VALUES ('6', '1', 'Job管理', null, null, 'D', '5', null, 'A', null, null, null, null, null, null, null);
INSERT INTO `u_screen` VALUES ('7', '1', '站内消息管理', null, null, 'D', '6', null, 'A', null, null, null, null, null, null, null);
INSERT INTO `u_screen` VALUES ('30', null, 'Demo演示', null, null, null, null, null, 'A', null, null, null, null, null, null, null);
INSERT INTO `u_screen` VALUES ('31', '30', '国际化Demo', null, null, 'D', '31', null, 'A', null, null, null, null, null, null, null);
INSERT INTO `u_screen` VALUES ('107138898', '30', '报表例子', null, null, 'D', '1483509739', '0', 'A', null, '2017-02-08 10:08:33', '1', '系统管理员', '2017-02-08 10:08:46', '1', '系统管理员');
INSERT INTO `u_screen` VALUES ('163321081', '30', 'websocket使用Demo', null, null, 'D', '1716014118', '0', 'A', null, '2017-02-13 13:44:20', '1', '系统管理员', '2017-02-13 14:13:14', '1', '系统管理员');
INSERT INTO `u_screen` VALUES ('188323484', '30', '多应用websocket使用', null, null, 'D', '332440795', '0', 'A', null, '2017-02-15 18:35:08', '1', '系统管理员', '2017-02-15 18:39:33', '1', '系统管理员');
INSERT INTO `u_screen` VALUES ('655623925', '1', '数据库监控', null, null, 'I', '1202194176', '0', 'A', null, '2017-01-16 11:21:34', '1', '系统管理员', '2017-01-16 11:21:44', '1', '系统管理员');
INSERT INTO `u_screen` VALUES ('1157972098', '1', '数据字典维护', null, null, null, '1487217462', '0', 'A', null, '2017-01-11 17:17:37', '1', '系统管理员', '2017-01-11 17:26:57', '1', '系统管理员');
INSERT INTO `u_screen` VALUES ('1230411030', '1', '用户属性扩展管理', null, null, 'D', '2024704263', '0', 'A', null, '2017-02-17 10:07:12', '1', '系统管理员', '2017-02-17 10:08:41', '1', '系统管理员');
INSERT INTO `u_screen` VALUES ('1391094262', '30', '文件导入', null, null, null, '287730436', '0', 'A', null, '2017-01-17 14:39:09', '1', '系统管理员', '2017-01-17 14:39:20', '1', '系统管理员');
INSERT INTO `u_screen` VALUES ('1628526714', '30', '模版邮件DEMO', null, null, 'D', '860521610', '0', 'A', null, '2017-02-17 14:03:17', '1', '系统管理员', '2017-02-17 14:04:48', '1', '系统管理员');
INSERT INTO `u_screen` VALUES ('2025543947', '1', '邮件模版管理', null, null, 'D', '920775739', '0', 'A', null, '2017-02-15 15:08:46', '1', '系统管理员', '2017-02-15 15:08:58', '1', '系统管理员');
INSERT INTO `u_screen` VALUES ('2095885237', '30', '文件打包下载', null, null, 'D', '287730437', '0', 'A', null, '2017-02-10 13:37:39', '1', '系统管理员', '2017-02-10 13:40:30', '1', '系统管理员');
INSERT INTO `u_screen` VALUES ('2110080923', '30', '文件上传', null, null, null, '674085797', '0', 'A', null, '2017-01-16 14:32:34', '1', '系统管理员', '2017-01-16 14:32:40', '1', '系统管理员');

-- ----------------------------
-- Table structure for u_user
-- ----------------------------
DROP TABLE IF EXISTS `u_user`;
CREATE TABLE `u_user` (
  `id` int(11) NOT NULL auto_increment,
  `dept_id` int(11) default NULL,
  `dept_name` varchar(45) default NULL,
  `login_name` varchar(45) NOT NULL,
  `login_pass` varchar(45) NOT NULL,
  `emp_code` varchar(45) default NULL,
  `name` varchar(45) NOT NULL,
  `sex` varchar(2) NOT NULL COMMENT 'M:男,W:女',
  `telephone` varchar(15) default NULL,
  `mobile` varchar(15) default NULL,
  `email` varchar(45) NOT NULL,
  `native_place` varchar(10) default NULL COMMENT 'JP:日本,CN:中国',
  `status` varchar(2) NOT NULL COMMENT '状态:A:有效,D:无效',
  `del_flag` varchar(2) default NULL,
  `remark` varchar(200) default NULL,
  `created_time` datetime default NULL COMMENT '创建时间',
  `created_user_id` int(11) default NULL,
  `created_user_name` varchar(45) default NULL,
  `updated_time` datetime default NULL,
  `updated_user_id` int(11) default NULL,
  `updated_user_name` varchar(45) default NULL,
  `pwd_change_time` datetime default NULL,
  `user_type` varchar(200) default NULL,
  PRIMARY KEY  (`id`),
  KEY `ak_key_2` (`login_name`),
  KEY `fk_reference_18` (`dept_id`),
  CONSTRAINT `fk_reference_18` FOREIGN KEY (`dept_id`) REFERENCES `u_dept` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统用户表';

-- ----------------------------
-- Records of u_user
-- ----------------------------
INSERT INTO `u_user` VALUES ('1', '1', '音泰思', 'admin', '21232F297A57A5A743894A0E4A801FC3', '000', '系统管理员', 'M', '', null, 'aaa2@aaa.com', null, 'A', null, null, null, null, null, null, null, null, '2017-01-18 00:00:00', '用户类型二');
INSERT INTO `u_user` VALUES ('2107405726', '2073320650', '第一部门', '123456', 'E10ADC3949BA59ABBE56E057F20F883E', '123456', 'test', 'M', '12312431414', null, 'sdafasdf@qq.com', null, 'A', null, null, null, null, null, null, null, null, null, '用户类型一');

-- ----------------------------
-- Table structure for u_user_property
-- ----------------------------
DROP TABLE IF EXISTS `u_user_property`;
CREATE TABLE `u_user_property` (
  `id` int(11) NOT NULL auto_increment,
  `property_code` varchar(200) default NULL,
  `property_name` varchar(200) default NULL,
  `regular` varchar(900) default NULL,
  `remark` varchar(300) default NULL,
  `status` varchar(2) default NULL,
  `created_time` datetime default NULL COMMENT '创建时间',
  `created_user_id` int(11) default NULL,
  `created_user_name` varchar(45) default NULL,
  `updated_time` datetime default NULL,
  `updated_user_id` int(11) default NULL,
  `updated_user_name` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户扩展属性表';

-- ----------------------------
-- Records of u_user_property
-- ----------------------------
INSERT INTO `u_user_property` VALUES ('1440055764', 'userAge', '年龄', '/^([0-9]|[0-9]{2}|100)$/', '备注', 'A', '2017-02-17 15:45:26', '1', '系统管理员', '2017-06-27 15:45:43', '1', '系统管理员');
INSERT INTO `u_user_property` VALUES ('1440055765', 'test', 'test', '54546464\"?jgh', '', 'D', '2017-06-27 15:39:21', '1', '系统管理员', '2017-06-27 15:39:50', '1', '系统管理员');
INSERT INTO `u_user_property` VALUES ('1440055766', 'tset', 'tset', '', '111', 'D', '2017-06-27 15:39:35', '1', '系统管理员', '2017-06-28 15:16:24', '1', '系统管理员');

-- ----------------------------
-- Table structure for u_user_property_value
-- ----------------------------
DROP TABLE IF EXISTS `u_user_property_value`;
CREATE TABLE `u_user_property_value` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `property_id` int(11) default NULL,
  `property_value` varchar(1000) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户扩展属性值表';

-- ----------------------------
-- Records of u_user_property_value
-- ----------------------------
INSERT INTO `u_user_property_value` VALUES ('49290282', '1667223415', '1440055764', '56435');
INSERT INTO `u_user_property_value` VALUES ('1250028760', '1207070294', '1440055764', '23');
INSERT INTO `u_user_property_value` VALUES ('1250028763', '2107405724', '1440055764', '12');
INSERT INTO `u_user_property_value` VALUES ('1250028764', '2107405720', '1440055764', '12');
INSERT INTO `u_user_property_value` VALUES ('1250028767', '2107405726', '1440055764', '12');
INSERT INTO `u_user_property_value` VALUES ('1250028770', '1', '1440055764', '34');

-- ----------------------------
-- Table structure for u_user_role
-- ----------------------------
DROP TABLE IF EXISTS `u_user_role`;
CREATE TABLE `u_user_role` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_time` datetime default NULL COMMENT '创建时间',
  `created_user_id` int(11) default NULL,
  `created_user_name` varchar(45) default NULL,
  `updated_time` datetime default NULL,
  `updated_user_id` int(11) default NULL,
  `updated_user_name` varchar(45) default NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_reference_19` (`user_id`),
  KEY `fk_reference_20` (`role_id`),
  CONSTRAINT `fk_reference_19` FOREIGN KEY (`user_id`) REFERENCES `u_user` (`id`),
  CONSTRAINT `fk_reference_20` FOREIGN KEY (`role_id`) REFERENCES `u_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色关系表';

-- ----------------------------
-- Records of u_user_role
-- ----------------------------
INSERT INTO `u_user_role` VALUES ('1', '1', '1', null, null, null, null, null, null);
INSERT INTO `u_user_role` VALUES ('2104174428', '2107405726', '1', '2017-06-27 17:00:43', '1', '系统管理员', null, null, null);

-- ----------------------------
-- Table structure for u_user_screen_shortcut
-- ----------------------------
DROP TABLE IF EXISTS `u_user_screen_shortcut`;
CREATE TABLE `u_user_screen_shortcut` (
  `id` varchar(36) NOT NULL,
  `screen_id` varchar(36) default NULL,
  `user_id` varchar(36) default NULL,
  `created_time` datetime default NULL COMMENT '创建时间',
  `created_user_id` varchar(36) default NULL,
  `created_user_name` varchar(45) default NULL,
  `updated_time` datetime default NULL,
  `updated_user_id` varchar(36) default NULL,
  `updated_user_name` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户常用快捷功能';

-- ----------------------------
-- Records of u_user_screen_shortcut
-- ----------------------------
