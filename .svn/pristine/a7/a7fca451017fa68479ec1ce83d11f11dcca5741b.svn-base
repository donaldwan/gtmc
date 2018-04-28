/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50041
Source Host           : 127.0.0.1:3306
Source Database       : manager_base

Target Server Type    : MYSQL
Target Server Version : 50041
File Encoding         : 65001

Date: 2017-06-29 13:49:12
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
-- Table structure for demo_leave
-- ----------------------------
DROP TABLE IF EXISTS `demo_leave`;
CREATE TABLE `demo_leave` (
  `id` varchar(36) NOT NULL,
  `proc_inst_id` varchar(36) default NULL COMMENT '工作流实例ID，每个工作流业务主表都需要这个字段',
  `wf_status` varchar(256) default NULL COMMENT '工作流状态集合，每个工作流业务主表都需要，此字段由工作流引擎自动更新，业务开发任务不需要维护',
  `status` varchar(16) default NULL COMMENT '业务状态编码，具体含义根据业务由业务设计人员定义，在每个流程节点监听事件中进行更新',
  `begin_date` datetime default NULL,
  `end_date` datetime default NULL,
  `days` int(11) default NULL,
  `reasion` varchar(512) default NULL,
  `created_user_id` varchar(36) default NULL,
  `created_user_name` varchar(36) default NULL,
  `created_time` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作流请假Demo表';

-- ----------------------------
-- Records of demo_leave
-- ----------------------------
INSERT INTO `demo_leave` VALUES ('5c4705e8-0c15-48f9-9e7b-6aaf0b42b7e8', '32e96dd4-7b06-45c3-9d08-926c9501d75e', 'Leader审核', '待Leader审核', '2017-06-21 00:00:00', '2017-06-23 00:00:00', '2', '测试请假', '1', '系统管理员', '2017-06-29 13:40:43');

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
INSERT INTO `u_authentication` VALUES ('1000914428', '2', 'test', 'TEST', null, '2017-06-27 14:13:04', '1', '系统管理员', '2017-06-27 14:13:04', '1', '系统管理员');
INSERT INTO `u_authentication` VALUES ('1854685875', '314097390', '流程终止', 'WORKFLOW_STOP', null, '2017-01-17 11:42:11', '1', '系统管理员', '2017-01-17 11:42:11', '1', '系统管理员');
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
INSERT INTO `u_resource` VALUES ('21', '工作流定义', 'plugins/wf/workflow/manager', 'D', null, null, null, null, null, null, null);
INSERT INTO `u_resource` VALUES ('31', '国际化Demo', 'demo/i18n', 'D', null, null, null, null, null, null, null);
INSERT INTO `u_resource` VALUES ('32', '请假数据', 'demo/leave/manager', 'D', null, null, null, null, null, null, null);
INSERT INTO `u_resource` VALUES ('287730436', '文件导入例子', 'demo/common-demo/import-data', 'D', null, '2017-01-17 14:38:51', '1', '系统管理员', '2017-01-17 14:38:51', '1', '系统管理员');
INSERT INTO `u_resource` VALUES ('287730437', '文件打包下载例子', 'demo/common-demo/packagefiles', 'D', null, '2017-01-17 14:38:51', '1', '系统管理员', '2017-01-17 14:38:51', '1', '系统管理员');
INSERT INTO `u_resource` VALUES ('332440795', '多应用websocket使用', 'demo/websocket/test2', 'D', '', '2017-02-15 18:39:20', '1', '系统管理员', '2017-06-22 11:03:59', '1', '系统管理员');
INSERT INTO `u_resource` VALUES ('580122657', '工作流监控', 'plugins/wf/monitoring/manager', 'D', null, '2017-01-16 16:07:54', '1', '系统管理员', '2017-01-16 16:07:54', '1', '系统管理员');
INSERT INTO `u_resource` VALUES ('674085797', '文件上传例子', 'demo/common-demo/upfile', 'D', null, '2017-01-16 14:32:18', '1', '系统管理员', '2017-01-16 14:32:18', '1', '系统管理员');
INSERT INTO `u_resource` VALUES ('741935854', 'ccc', 's/s/s', 'D', 'fasf', '2017-01-04 18:01:58', '1', '系统管理员', '2017-01-04 18:01:58', '1', '系统管理员');
INSERT INTO `u_resource` VALUES ('860521610', '模版邮件DEMO', 'demo/template-demo/mail', 'D', null, '2017-02-17 14:04:10', '1', '系统管理员', '2017-02-17 14:04:10', '1', '系统管理员');
INSERT INTO `u_resource` VALUES ('920775739', '邮件模版管理', 'system/mailTemplate/manager', 'D', null, '2017-02-15 15:08:09', '1', '系统管理员', '2017-02-15 15:08:09', '1', '系统管理员');
INSERT INTO `u_resource` VALUES ('1202194176', 'druid数据库连接监控', 'druid/index.html', 'I', null, '2017-01-16 11:20:59', '1', '系统管理员', '2017-01-16 11:20:59', '1', '系统管理员');
INSERT INTO `u_resource` VALUES ('1262666016', 'bbb', 'bbb/bbb', 'D', null, '2017-01-05 09:47:28', '1', '系统管理员', '2017-01-05 09:47:28', '1', '系统管理员');
INSERT INTO `u_resource` VALUES ('1483509739', '报表例子', 'demo/common-demo/report', 'D', null, '2017-02-08 10:08:00', '1', '系统管理员', '2017-02-08 10:08:00', '1', '系统管理员');
INSERT INTO `u_resource` VALUES ('1487217462', '数据字典维护', 'system/dictionary/manager', 'D', null, '2017-01-11 17:17:10', '1', '系统管理员', '2017-01-11 17:17:10', '1', '系统管理员');
INSERT INTO `u_resource` VALUES ('1500102778', '菜单管理', 'system/screen/manager', 'D', null, '2016-12-15 15:08:23', '1', '系统管理员', '2016-12-15 15:13:12', '1', '系统管理员');
INSERT INTO `u_resource` VALUES ('1543935193', '工作流代理', 'plugins/wf/proxy/manager', 'D', null, '2017-01-16 16:08:19', '1', '系统管理员', '2017-01-16 16:08:19', '1', '系统管理员');
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
INSERT INTO `u_role_authentication` VALUES ('1956787662', '1', '170174634', null, null, null, null, null, null);
INSERT INTO `u_role_authentication` VALUES ('1956787663', '1', '2026695496', null, null, null, null, null, null);
INSERT INTO `u_role_authentication` VALUES ('1956787664', '1', '1854685875', null, null, null, null, null, null);

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
INSERT INTO `u_role_screen` VALUES ('2080894603', '1', '1', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894604', '1', '2', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894605', '1', '3', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894606', '1', '4', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894607', '1', '5', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894608', '1', '6', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894609', '1', '7', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894610', '1', '655623925', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894611', '1', '1157972098', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894612', '1', '1230411030', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894613', '1', '2025543947', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894614', '1', '20', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894615', '1', '21', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894616', '1', '314097390', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894617', '1', '1512415774', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894618', '1', '30', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894619', '1', '31', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894620', '1', '32', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894621', '1', '33', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894622', '1', '107138898', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894623', '1', '163321081', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894624', '1', '188323484', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894625', '1', '1391094262', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894626', '1', '1628526714', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894627', '1', '2095885237', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894628', '1', '2110080923', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894629', '1', '1', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894630', '1', '2', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894631', '1', '3', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894632', '1', '4', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894633', '1', '5', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894634', '1', '6', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894635', '1', '7', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894636', '1', '655623925', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894637', '1', '1157972098', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894638', '1', '1230411030', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894639', '1', '2025543947', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894640', '1', '20', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894641', '1', '21', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894642', '1', '314097390', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894643', '1', '1138951858', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894644', '1', '1512415774', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894645', '1', '30', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894646', '1', '31', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894647', '1', '32', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894648', '1', '33', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894649', '1', '107138898', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894650', '1', '163321081', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894651', '1', '188323484', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894652', '1', '1391094262', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894653', '1', '1628526714', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894654', '1', '2095885237', null, null, null, null, null, null);
INSERT INTO `u_role_screen` VALUES ('2080894655', '1', '2110080923', null, null, null, null, null, null);

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
INSERT INTO `u_screen` VALUES ('20', null, '工作流配置', null, null, 'D', null, '4', 'A', null, null, null, null, '2017-06-16 17:31:45', '1', '系统管理员');
INSERT INTO `u_screen` VALUES ('21', '20', '工作流定义', null, null, 'D', '21', '1', 'A', null, null, null, null, '2017-01-16 16:06:54', '1', '系统管理员');
INSERT INTO `u_screen` VALUES ('30', null, 'Demo演示', null, null, null, null, null, 'A', null, null, null, null, null, null, null);
INSERT INTO `u_screen` VALUES ('31', '30', '国际化Demo', null, null, 'D', '31', null, 'A', null, null, null, null, null, null, null);
INSERT INTO `u_screen` VALUES ('32', '30', '工作流Demo', null, null, null, null, null, 'A', null, null, null, null, null, null, null);
INSERT INTO `u_screen` VALUES ('33', '32', '请假数据', null, null, 'D', '32', null, 'A', null, null, null, null, null, null, null);
INSERT INTO `u_screen` VALUES ('107138898', '30', '报表例子', null, null, 'D', '1483509739', '0', 'A', null, '2017-02-08 10:08:33', '1', '系统管理员', '2017-02-08 10:08:46', '1', '系统管理员');
INSERT INTO `u_screen` VALUES ('163321081', '30', 'websocket使用Demo', null, null, 'D', '1716014118', '0', 'A', null, '2017-02-13 13:44:20', '1', '系统管理员', '2017-02-13 14:13:14', '1', '系统管理员');
INSERT INTO `u_screen` VALUES ('188323484', '30', '多应用websocket使用', null, null, 'D', '332440795', '0', 'A', null, '2017-02-15 18:35:08', '1', '系统管理员', '2017-02-15 18:39:33', '1', '系统管理员');
INSERT INTO `u_screen` VALUES ('314097390', '20', '工作流监控', null, null, 'D', '580122657', '2', 'A', null, '2017-01-16 16:06:48', '1', '系统管理员', '2017-01-16 16:10:04', '1', '系统管理员');
INSERT INTO `u_screen` VALUES ('655623925', '1', '数据库监控', null, null, 'I', '1202194176', '0', 'A', null, '2017-01-16 11:21:34', '1', '系统管理员', '2017-01-16 11:21:44', '1', '系统管理员');
INSERT INTO `u_screen` VALUES ('1138951858', '20', '用户组管理', null, null, 'D', '2024704264', '4', 'A', null, '2017-06-16 17:31:14', '1', '系统管理员', '2017-06-16 17:38:21', '1', '系统管理员');
INSERT INTO `u_screen` VALUES ('1157972098', '1', '数据字典维护', null, null, null, '1487217462', '0', 'A', null, '2017-01-11 17:17:37', '1', '系统管理员', '2017-01-11 17:26:57', '1', '系统管理员');
INSERT INTO `u_screen` VALUES ('1230411030', '1', '用户属性扩展管理', null, null, 'D', '2024704263', '0', 'A', null, '2017-02-17 10:07:12', '1', '系统管理员', '2017-02-17 10:08:41', '1', '系统管理员');
INSERT INTO `u_screen` VALUES ('1391094262', '30', '文件导入', null, null, null, '287730436', '0', 'A', null, '2017-01-17 14:39:09', '1', '系统管理员', '2017-01-17 14:39:20', '1', '系统管理员');
INSERT INTO `u_screen` VALUES ('1512415774', '20', '工作流代理', null, null, 'D', '1543935193', '3', 'A', null, '2017-01-16 16:07:09', '1', '系统管理员', '2017-01-16 16:09:51', '1', '系统管理员');
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

-- ----------------------------
-- Table structure for wf_element_params
-- ----------------------------
DROP TABLE IF EXISTS `wf_element_params`;
CREATE TABLE `wf_element_params` (
  `id` varchar(36) NOT NULL,
  `param_type` varchar(16) default NULL,
  `param_name` varchar(40) default NULL COMMENT '参数名称',
  `param_value` varchar(200) default NULL COMMENT '参数值',
  `act_procdef_id` varchar(128) default NULL COMMENT '流程定义id(对应表act_re_procdef)',
  `element_type` varchar(32) default NULL,
  `element_id` varchar(64) default NULL COMMENT '节点定义key',
  `element_name` varchar(64) default NULL COMMENT '节点定义名称',
  `condition_expression` varchar(500) default NULL,
  `remark` varchar(200) default NULL COMMENT '备注',
  `created_time` datetime default NULL COMMENT '创建时间',
  `created_user_id` varchar(36) default NULL,
  `created_user_name` varchar(45) default NULL,
  `updated_time` datetime default NULL,
  `updated_user_id` varchar(36) default NULL,
  `updated_user_name` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程元素参数表';

-- ----------------------------
-- Records of wf_element_params
-- ----------------------------
INSERT INTO `wf_element_params` VALUES ('006e011d-9908-4582-a7f3-3183ebe7c949', 'boolean', 'param_1', 'true', 'WF_LEAVE:2:e19d69a0-06b6-4fcb-bc73-b8d606a75e84', 'SequenceFlow', 'sid-ED4EAD65-F831-4623-9615-8BD51BB1BEA6', '提交', '${param_1}', null, '2017-06-29 11:52:47', '1', '系统管理员', '2017-06-29 11:52:47', '1', '系统管理员');
INSERT INTO `wf_element_params` VALUES ('07a8088e-50e7-40ef-a40f-dbb523f15daf', null, null, null, 'WF_LEAVE:2:e19d69a0-06b6-4fcb-bc73-b8d606a75e84', null, 'sid-0C14BC9D-C05C-49F8-AA84-3B6EE375B34A', null, '${true}', null, '2017-06-29 11:54:26', '1', '系统管理员', '2017-06-29 11:54:26', '1', '系统管理员');
INSERT INTO `wf_element_params` VALUES ('1afa91ff-04b6-4140-be0f-5fc5698ebc81', 'boolean', 'param_3', 'true', 'WF_LEAVE:3:a0e6f6f7-142d-443f-bd46-471dbde03878', 'SequenceFlow', 'sid-8C25586A-8A28-4F02-8C44-E66B99F44EF0', '提交人事', '${param_3}', null, '2017-06-29 13:40:15', '1', '系统管理员', '2017-06-29 13:40:15', '1', '系统管理员');
INSERT INTO `wf_element_params` VALUES ('402c17a4-d3e9-40b6-a0ae-8e925145cbe2', 'boolean', 'param_0', 'true', 'WF_LEAVE:2:e19d69a0-06b6-4fcb-bc73-b8d606a75e84', 'SequenceFlow', 'sid-48253CD2-1521-4C5F-992A-346D11B722EE', '审核不通过', '${param_0}', null, '2017-06-29 11:52:47', '1', '系统管理员', '2017-06-29 11:52:47', '1', '系统管理员');
INSERT INTO `wf_element_params` VALUES ('4e4d434f-8756-4779-9718-e5865f635afa', 'boolean', 'param_1', 'true', 'WF_LEAVE:3:a0e6f6f7-142d-443f-bd46-471dbde03878', 'SequenceFlow', 'sid-ED4EAD65-F831-4623-9615-8BD51BB1BEA6', '提交', '${param_1}', null, '2017-06-29 13:40:15', '1', '系统管理员', '2017-06-29 13:40:15', '1', '系统管理员');
INSERT INTO `wf_element_params` VALUES ('4f9de91f-58b0-4511-b722-6d1ee17910bf', null, null, null, 'WF_LEAVE:3:a0e6f6f7-142d-443f-bd46-471dbde03878', null, 'sid-B9E34048-EF1E-46D7-8527-D85B3F39FF13', null, '${false}', null, '2017-06-29 13:40:15', '1', '系统管理员', '2017-06-29 13:40:15', '1', '系统管理员');
INSERT INTO `wf_element_params` VALUES ('6d17aa85-876d-44a1-a609-0709896535f8', 'boolean', 'param_2', 'true', 'WF_LEAVE:3:a0e6f6f7-142d-443f-bd46-471dbde03878', 'SequenceFlow', 'sid-CE07DA53-42F2-4324-8027-29429B37064E', '审核通过', '${param_2}', null, '2017-06-29 13:40:15', '1', '系统管理员', '2017-06-29 13:40:15', '1', '系统管理员');
INSERT INTO `wf_element_params` VALUES ('9401f1de-15d9-4b48-97c7-17327fcc063e', null, null, null, 'WF_LEAVE:2:e19d69a0-06b6-4fcb-bc73-b8d606a75e84', null, 'sid-B9E34048-EF1E-46D7-8527-D85B3F39FF13', null, '${false}', null, '2017-06-29 11:54:26', '1', '系统管理员', '2017-06-29 11:54:26', '1', '系统管理员');
INSERT INTO `wf_element_params` VALUES ('b1bb7a6d-b100-4d72-8e62-2994911e67bb', 'boolean', 'param_2', 'true', 'WF_LEAVE:2:e19d69a0-06b6-4fcb-bc73-b8d606a75e84', 'SequenceFlow', 'sid-CE07DA53-42F2-4324-8027-29429B37064E', '审核通过', '${param_2}', null, '2017-06-29 11:52:47', '1', '系统管理员', '2017-06-29 11:52:47', '1', '系统管理员');
INSERT INTO `wf_element_params` VALUES ('b25903ab-b70e-48c9-b887-e6d43bd0bf4f', null, null, null, 'WF_LEAVE:3:a0e6f6f7-142d-443f-bd46-471dbde03878', null, 'sid-0C14BC9D-C05C-49F8-AA84-3B6EE375B34A', null, '${true}', null, '2017-06-29 13:40:15', '1', '系统管理员', '2017-06-29 13:40:15', '1', '系统管理员');
INSERT INTO `wf_element_params` VALUES ('c9d9a172-5b8e-4e66-b240-3bf5a09444be', 'boolean', 'param_3', 'true', 'WF_LEAVE:2:e19d69a0-06b6-4fcb-bc73-b8d606a75e84', 'SequenceFlow', 'sid-8C25586A-8A28-4F02-8C44-E66B99F44EF0', '提交人事', '${param_3}', null, '2017-06-29 11:52:47', '1', '系统管理员', '2017-06-29 11:52:47', '1', '系统管理员');
INSERT INTO `wf_element_params` VALUES ('f4a5a955-6e6c-45d8-ac6d-8690bbe58a87', 'boolean', 'param_0', 'true', 'WF_LEAVE:3:a0e6f6f7-142d-443f-bd46-471dbde03878', 'SequenceFlow', 'sid-48253CD2-1521-4C5F-992A-346D11B722EE', '审核不通过', '${param_0}', null, '2017-06-29 13:40:15', '1', '系统管理员', '2017-06-29 13:40:15', '1', '系统管理员');

-- ----------------------------
-- Table structure for wf_global_event
-- ----------------------------
DROP TABLE IF EXISTS `wf_global_event`;
CREATE TABLE `wf_global_event` (
  `id` varchar(36) NOT NULL,
  `node_type` varchar(40) default NULL COMMENT '节点类型,针对流程的节点类型',
  `event_type` varchar(2) default NULL COMMENT '事件类型,A:节点后事件,B:节点前事件',
  `process_type` varchar(2) default NULL COMMENT '事件处理类型B:指定bean方式,S:脚本方式',
  `bean_id` varchar(40) default NULL COMMENT '事件处理类',
  `method` varchar(40) default NULL COMMENT '事件处理方法',
  `process_script` varchar(2000) default NULL COMMENT '处理脚本',
  `status` varchar(2) default NULL COMMENT '状态,A:启用,D:禁用',
  `is_system_event` varchar(2) default NULL COMMENT '1:系统事件(不能删除，只能禁用),0:自定义系统事件(可删除维护)',
  `sort_` int(11) default NULL COMMENT '事件顺序',
  `created_time` datetime default NULL COMMENT '创建时间',
  `created_user_id` varchar(36) default NULL,
  `created_user_name` varchar(45) default NULL,
  `updated_time` datetime default NULL,
  `updated_user_id` varchar(36) default NULL,
  `updated_user_name` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作流全局事件表，所有的工作流都会触发的事件定义表';

-- ----------------------------
-- Records of wf_global_event
-- ----------------------------

-- ----------------------------
-- Table structure for wf_monitoring
-- ----------------------------
DROP TABLE IF EXISTS `wf_monitoring`;
CREATE TABLE `wf_monitoring` (
  `id` varchar(36) default NULL,
  `act_procdef_id` varchar(128) default NULL,
  `act_procdef_key` varchar(128) default NULL,
  `act_instance_id` varchar(128) default NULL,
  `wf_name` varchar(128) default NULL,
  `business_key` varchar(128) default NULL,
  `apply_user_id` varchar(128) default NULL,
  `apply_user_name` varchar(128) default NULL,
  `status` varchar(2) default NULL COMMENT 'RU:流程运行中,EN:流程正常结束,EO:流程异常结束,KI:流程被终止,OT:其他',
  `wf_status` varchar(512) default NULL,
  `wf_operators` varchar(512) default NULL,
  `reason` varchar(512) default NULL,
  `created_time` datetime default NULL COMMENT '创建时间',
  `created_user_id` varchar(36) default NULL,
  `created_user_name` varchar(45) default NULL,
  `updated_time` datetime default NULL,
  `updated_user_id` varchar(36) default NULL,
  `updated_user_name` varchar(45) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程监控表';

-- ----------------------------
-- Records of wf_monitoring
-- ----------------------------
INSERT INTO `wf_monitoring` VALUES ('548b528b-5bfa-425d-b269-6f6ae5e2cefe', 'WF_LEAVE:3:a0e6f6f7-142d-443f-bd46-471dbde03878', 'WF_LEAVE', '32e96dd4-7b06-45c3-9d08-926c9501d75e', '请假流程', '5c4705e8-0c15-48f9-9e7b-6aaf0b42b7e8', '1', '系统管理员', 'RU', 'Leader审核', '系统管理员', null, '2017-06-29 13:40:45', '1', '系统管理员', '2017-06-29 13:40:45', '1', '系统管理员');

-- ----------------------------
-- Table structure for wf_node_event
-- ----------------------------
DROP TABLE IF EXISTS `wf_node_event`;
CREATE TABLE `wf_node_event` (
  `id` varchar(36) NOT NULL,
  `act_procdef_id` varchar(128) default NULL COMMENT '流程定义id(对应表act_re_procdef)',
  `task_def_key` varchar(64) default NULL COMMENT '节点定义key',
  `task_def_name` varchar(64) default NULL COMMENT '节点定义名称',
  `event_type` varchar(2) default NULL COMMENT '事件类型,A:节点后事件,B:节点前事件',
  `process_type` varchar(2) default NULL COMMENT '事件处理类型B:指定bean方式,S:脚本方式',
  `bean_id` varchar(40) default NULL COMMENT '事件处理类',
  `method` varchar(40) default NULL COMMENT '事件处理方法',
  `process_script` varchar(2000) default NULL COMMENT '处理脚本',
  `sort_` int(11) default NULL,
  `created_time` datetime default NULL COMMENT '创建时间',
  `created_user_id` varchar(36) default NULL,
  `created_user_name` varchar(45) default NULL,
  `updated_time` datetime default NULL,
  `updated_user_id` varchar(36) default NULL,
  `updated_user_name` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节点事件处理表';

-- ----------------------------
-- Records of wf_node_event
-- ----------------------------
INSERT INTO `wf_node_event` VALUES ('066582c0-870b-4f86-8944-6e5411b4cd7d', 'WF_LEAVE:2:e19d69a0-06b6-4fcb-bc73-b8d606a75e84', 'sid-0C14BC9D-C05C-49F8-AA84-3B6EE375B34A', '通过', 'B', 'S', '', null, 'dao.execute(\"update demo_leave set status = \'待部门经理审核\'  where id = \'\" + bpmnModel.id + \"\'\")', '0', '2017-06-29 11:54:45', '1', '系统管理员', '2017-06-29 11:54:45', '1', '系统管理员');
INSERT INTO `wf_node_event` VALUES ('8dea31f0-8863-46c0-a734-0eb4ac04bb80', 'WF_LEAVE:3:a0e6f6f7-142d-443f-bd46-471dbde03878', 'sid-8C25586A-8A28-4F02-8C44-E66B99F44EF0', '提交人事', 'B', 'S', '', null, 'dao.execute(\"update demo_leave set status = \'待人事归档\'  where id = \'\" + bpmnModel.id + \"\'\")', '0', '2017-06-29 13:40:15', '1', '系统管理员', '2017-06-29 13:40:15', '1', '系统管理员');
INSERT INTO `wf_node_event` VALUES ('bdbcf575-4bbd-4ed3-ac0f-3d17edca01d8', 'WF_LEAVE:2:e19d69a0-06b6-4fcb-bc73-b8d606a75e84', 'sid-9BC67F9D-8A5D-429F-A644-870C1585B8DA', '提交申请', 'B', 'S', '', null, 'dao.execute(\"update demo_leave set status = \'待Leader审核\'  where id = \'\" + bpmnModel.id + \"\'\")', '0', '2017-06-29 11:53:26', '1', '系统管理员', '2017-06-29 11:53:26', '1', '系统管理员');
INSERT INTO `wf_node_event` VALUES ('d0ec4568-5e91-49bd-811d-99dd74b51eaf', 'WF_LEAVE:2:e19d69a0-06b6-4fcb-bc73-b8d606a75e84', 'sid-8C25586A-8A28-4F02-8C44-E66B99F44EF0', '提交人事', 'B', 'S', '', null, 'dao.execute(\"update demo_leave set status = \'待人事归档\'  where id = \'\" + bpmnModel.id + \"\'\")', '0', '2017-06-29 11:54:09', '1', '系统管理员', '2017-06-29 11:54:09', '1', '系统管理员');
INSERT INTO `wf_node_event` VALUES ('da865573-1c9a-4f60-902b-a603ce99d1d1', 'WF_LEAVE:2:e19d69a0-06b6-4fcb-bc73-b8d606a75e84', 'sid-B9E34048-EF1E-46D7-8527-D85B3F39FF13', '不通过', 'B', 'S', '', null, 'dao.execute(\"update demo_leave set status = \'待重新申请\'  where id = \'\" + bpmnModel.id + \"\'\")', '0', '2017-06-29 11:54:44', '1', '系统管理员', '2017-06-29 11:54:44', '1', '系统管理员');
INSERT INTO `wf_node_event` VALUES ('e5a1bf8b-86ad-4f07-9b8a-3b40737dba04', 'WF_LEAVE:3:a0e6f6f7-142d-443f-bd46-471dbde03878', 'sid-B9E34048-EF1E-46D7-8527-D85B3F39FF13', '不通过', 'B', 'S', '', null, 'dao.execute(\"update demo_leave set status = \'待重新申请\'  where id = \'\" + bpmnModel.id + \"\'\")', '0', '2017-06-29 13:40:15', '1', '系统管理员', '2017-06-29 13:40:15', '1', '系统管理员');
INSERT INTO `wf_node_event` VALUES ('efc37023-58e1-40a6-b7d9-fef1029133a2', 'WF_LEAVE:3:a0e6f6f7-142d-443f-bd46-471dbde03878', 'sid-9BC67F9D-8A5D-429F-A644-870C1585B8DA', '提交申请', 'B', 'S', '', null, 'dao.execute(\"update demo_leave set status = \'待Leader审核\'  where id = \'\" + bpmnModel.id + \"\'\")', '0', '2017-06-29 13:40:15', '1', '系统管理员', '2017-06-29 13:40:15', '1', '系统管理员');
INSERT INTO `wf_node_event` VALUES ('fcb16fc9-b039-463a-9a00-73dd4cd20af9', 'WF_LEAVE:3:a0e6f6f7-142d-443f-bd46-471dbde03878', 'sid-0C14BC9D-C05C-49F8-AA84-3B6EE375B34A', '通过', 'B', 'S', '', null, 'dao.execute(\"update demo_leave set status = \'待部门经理审核\'  where id = \'\" + bpmnModel.id + \"\'\")', '0', '2017-06-29 13:40:15', '1', '系统管理员', '2017-06-29 13:40:15', '1', '系统管理员');

-- ----------------------------
-- Table structure for wf_node_ext
-- ----------------------------
DROP TABLE IF EXISTS `wf_node_ext`;
CREATE TABLE `wf_node_ext` (
  `id` varchar(36) NOT NULL,
  `act_procdef_id` varchar(128) default NULL COMMENT '流程定义id(对应表act_re_procdef)',
  `task_def_key` varchar(64) default NULL COMMENT '节点定义key',
  `task_def_name` varchar(64) default NULL COMMENT '节点定义名称',
  `form` varchar(100) default NULL COMMENT '可默认为流程定义的form',
  `complete_url` varchar(100) default NULL COMMENT '表单id,对应kb_module_list的id',
  `can_back` varchar(1) default NULL COMMENT '是否可回退 1:是,0:否，将流程结束，退回给发起人',
  `due_days` int(11) default NULL COMMENT '处理时限制(以天为单位),如果是0表示没有时限',
  `notice_email` int(11) default NULL COMMENT '邮件提醒',
  `write_remark` varchar(2) default NULL COMMENT '1:是,0:否(默认)',
  `default_out` varchar(64) default NULL,
  `default_out_name` varchar(64) default NULL,
  `pass_expression` varchar(500) default NULL COMMENT '如果此表达式的结果为真，表示此节点免审，直接到下一个节点',
  `is_countersign` varchar(2) default NULL COMMENT '1:是,0:否，默认0',
  `is_sequential` varchar(2) default NULL COMMENT '1:顺序会签,0:并行会签',
  `completion_condition` varchar(500) default NULL COMMENT '会签结束表达式',
  `remark` varchar(500) default NULL COMMENT '备注',
  `ext_json` varchar(500) default NULL COMMENT '扩展属性，json格式，方便扩展',
  `created_time` datetime default NULL COMMENT '创建时间',
  `created_user_id` varchar(36) default NULL,
  `created_user_name` varchar(45) default NULL,
  `updated_time` datetime default NULL,
  `updated_user_id` varchar(36) default NULL,
  `updated_user_name` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程节点扩展表';

-- ----------------------------
-- Records of wf_node_ext
-- ----------------------------

-- ----------------------------
-- Table structure for wf_node_processer
-- ----------------------------
DROP TABLE IF EXISTS `wf_node_processer`;
CREATE TABLE `wf_node_processer` (
  `id` varchar(36) NOT NULL,
  `act_procdef_id` varchar(128) default NULL COMMENT '流程定义id(对应表act_re_procdef)',
  `task_def_key` varchar(64) default NULL COMMENT '节点定义key',
  `task_def_name` varchar(64) default NULL COMMENT '节点定义名称',
  `processer_category` varchar(16) default NULL COMMENT 'USER(特定用户),WF_USER(流程参与人员),\r\n            FORM(表单内成员),METHOD(自定义方法),\r\n            G_ROLE/G_DEPT(可扩展自定义组)',
  `prefix` varchar(4) default NULL,
  `processer_type` varchar(16) default NULL COMMENT 'USER(用户),GROUP(组)',
  `processer_id` varchar(64) default NULL COMMENT '处理人员类型id',
  `processer_name` varchar(64) default NULL COMMENT '处理对象名称',
  `remark` varchar(500) default NULL COMMENT '备注',
  `created_time` datetime default NULL COMMENT '创建时间',
  `created_user_id` varchar(36) default NULL,
  `created_user_name` varchar(45) default NULL,
  `updated_time` datetime default NULL,
  `updated_user_id` varchar(36) default NULL,
  `updated_user_name` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='节点处理人员';

-- ----------------------------
-- Records of wf_node_processer
-- ----------------------------
INSERT INTO `wf_node_processer` VALUES ('0cccd4f3-cb8a-48c5-b4bf-5ed54efec0ec', 'WF_LEAVE:2:e19d69a0-06b6-4fcb-bc73-b8d606a75e84', 'sid-79B6A778-56C7-480F-A783-A1912B609CE3', null, 'USER', null, 'USER', '1', '系统管理员', null, '2017-06-29 13:39:47', '1', '系统管理员', '2017-06-29 13:39:47', '1', '系统管理员');
INSERT INTO `wf_node_processer` VALUES ('39c65ff2-5fc9-46f8-81f0-bf619e821c56', 'WF_LEAVE:2:e19d69a0-06b6-4fcb-bc73-b8d606a75e84', 'sid-39E4019D-898A-4F5E-BAA6-48F9EAD348C4', null, 'USER', null, 'USER', '1', '系统管理员', null, '2017-06-29 11:53:57', '1', '系统管理员', '2017-06-29 11:53:57', '1', '系统管理员');
INSERT INTO `wf_node_processer` VALUES ('41d5ffce-077b-49d9-8697-f81ba7e3431c', 'WF_LEAVE:3:a0e6f6f7-142d-443f-bd46-471dbde03878', 'sid-79B6A778-56C7-480F-A783-A1912B609CE3', null, 'USER', null, 'USER', '1', '系统管理员', null, '2017-06-29 13:40:15', '1', '系统管理员', '2017-06-29 13:40:15', '1', '系统管理员');
INSERT INTO `wf_node_processer` VALUES ('47a92a0d-f22e-405e-862d-1a7600835d86', 'WF_LEAVE:2:e19d69a0-06b6-4fcb-bc73-b8d606a75e84', 'sid-2E7311E2-8D7B-468A-806C-24C4417FF843', null, 'USER', null, 'USER', '1', '系统管理员', null, '2017-06-29 11:56:00', '1', '系统管理员', '2017-06-29 11:56:00', '1', '系统管理员');
INSERT INTO `wf_node_processer` VALUES ('4acde526-9063-4212-8f91-b93c9b342fcb', 'WF_LEAVE:3:a0e6f6f7-142d-443f-bd46-471dbde03878', 'sid-AD43FCD0-A7E9-42B2-B61E-C5A78C9A96CC', null, 'USER', null, 'USER', '1', '系统管理员', null, '2017-06-29 13:40:15', '1', '系统管理员', '2017-06-29 13:40:15', '1', '系统管理员');
INSERT INTO `wf_node_processer` VALUES ('5bfeff10-b1a4-4000-9bc5-b5440d55fcd9', 'WF_LEAVE:3:a0e6f6f7-142d-443f-bd46-471dbde03878', 'sid-39E4019D-898A-4F5E-BAA6-48F9EAD348C4', null, 'USER', null, 'USER', '1', '系统管理员', null, '2017-06-29 13:40:15', '1', '系统管理员', '2017-06-29 13:40:15', '1', '系统管理员');
INSERT INTO `wf_node_processer` VALUES ('791f35a0-d9fd-4478-bc93-579af0cf2687', 'WF_LEAVE:2:e19d69a0-06b6-4fcb-bc73-b8d606a75e84', 'sid-AD43FCD0-A7E9-42B2-B61E-C5A78C9A96CC', null, 'USER', null, 'USER', '1', '系统管理员', null, '2017-06-29 13:38:42', '1', '系统管理员', '2017-06-29 13:38:42', '1', '系统管理员');
INSERT INTO `wf_node_processer` VALUES ('82006627-07e0-42a1-81c3-f7dc7520fe1d', 'WF_LEAVE:3:a0e6f6f7-142d-443f-bd46-471dbde03878', 'sid-E1FEB050-8E87-4D48-88C5-31FE69324DB0', null, 'USER', null, 'USER', '1', '系统管理员', null, '2017-06-29 13:40:15', '1', '系统管理员', '2017-06-29 13:40:15', '1', '系统管理员');
INSERT INTO `wf_node_processer` VALUES ('b2e771cf-1188-4294-b620-e48d18182c85', 'WF_LEAVE:3:a0e6f6f7-142d-443f-bd46-471dbde03878', 'sid-2E7311E2-8D7B-468A-806C-24C4417FF843', null, 'USER', null, 'USER', '1', '系统管理员', null, '2017-06-29 13:40:15', '1', '系统管理员', '2017-06-29 13:40:15', '1', '系统管理员');
INSERT INTO `wf_node_processer` VALUES ('c0a212b4-7e23-4d70-a014-04bdd5ffefa9', 'WF_LEAVE:2:e19d69a0-06b6-4fcb-bc73-b8d606a75e84', 'sid-E1FEB050-8E87-4D48-88C5-31FE69324DB0', null, 'USER', null, 'USER', '1', '系统管理员', null, '2017-06-29 11:55:36', '1', '系统管理员', '2017-06-29 11:55:36', '1', '系统管理员');

-- ----------------------------
-- Table structure for wf_operate_record
-- ----------------------------
DROP TABLE IF EXISTS `wf_operate_record`;
CREATE TABLE `wf_operate_record` (
  `id` varchar(36) NOT NULL,
  `act_procdef_id` varchar(128) default NULL,
  `act_procdef_key` varchar(128) default NULL,
  `instance_id` varchar(128) default NULL,
  `task_def_key` varchar(128) default NULL,
  `task_def_name` varchar(128) default NULL,
  `transition_id` varchar(128) default NULL,
  `transition_name` varchar(128) default NULL,
  `remark` varchar(1000) default NULL COMMENT '备注',
  `created_time` datetime default NULL COMMENT '创建时间',
  `created_user_id` varchar(36) default NULL,
  `created_user_name` varchar(45) default NULL,
  `business_key` varchar(36) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程履历操作记录表';

-- ----------------------------
-- Records of wf_operate_record
-- ----------------------------
INSERT INTO `wf_operate_record` VALUES ('157f90db-db48-4f5f-b34f-8861d7a4bab6', 'WF_LEAVE:3:a0e6f6f7-142d-443f-bd46-471dbde03878', 'WF_LEAVE', '32e96dd4-7b06-45c3-9d08-926c9501d75e', 'start', '流程起点', 'sid-9BC67F9D-8A5D-429F-A644-870C1585B8DA', '提交申请', '', '2017-06-29 13:40:45', '1', '系统管理员', '5c4705e8-0c15-48f9-9e7b-6aaf0b42b7e8');

-- ----------------------------
-- Table structure for wf_task_attachment
-- ----------------------------
DROP TABLE IF EXISTS `wf_task_attachment`;
CREATE TABLE `wf_task_attachment` (
  `id` varchar(36) NOT NULL,
  `wf_id` int(11) default NULL,
  `proc_def_id` varchar(64) default NULL COMMENT '流程定义id',
  `task_def_id` varchar(64) default NULL COMMENT '任务节点id',
  `proc_inst_id` varchar(64) default NULL COMMENT '流程实例id',
  `attachment_id` int(11) default NULL COMMENT '上传时间',
  `created_time` datetime default NULL COMMENT '创建时间',
  `created_user_id` varchar(36) default NULL,
  `created_user_name` varchar(45) default NULL,
  `updated_time` datetime default NULL,
  `updated_user_id` varchar(36) default NULL,
  `updated_user_name` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='流程任务附件表，存放各种任务节点中上传的各种附件';

-- ----------------------------
-- Records of wf_task_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for wf_user_common_remark
-- ----------------------------
DROP TABLE IF EXISTS `wf_user_common_remark`;
CREATE TABLE `wf_user_common_remark` (
  `id` varchar(36) default NULL,
  `act_procdef_key` varchar(128) default NULL,
  `task_def_key` varchar(128) default NULL,
  `task_def_name` varchar(128) default NULL,
  `remark` varchar(1000) default NULL COMMENT '备注',
  `created_time` datetime default NULL COMMENT '创建时间',
  `created_user_id` varchar(36) default NULL,
  `created_user_name` varchar(45) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户常用备注表';

-- ----------------------------
-- Records of wf_user_common_remark
-- ----------------------------

-- ----------------------------
-- Table structure for wf_user_group
-- ----------------------------
DROP TABLE IF EXISTS `wf_user_group`;
CREATE TABLE `wf_user_group` (
  `ID` int(11) NOT NULL auto_increment,
  `GROUP_NAME` varchar(45) default NULL COMMENT '用户组名称',
  `EXPRESSION` mediumtext COMMENT '表达式',
  `EXPRESSION_TEXT` mediumtext,
  `CREATED_TIME` datetime default NULL COMMENT '创建时间',
  `CREATED_USER_ID` int(11) default NULL COMMENT '创建人ID',
  `CREATED_USER_NAME` varchar(45) default NULL,
  `UPDATED_TIME` datetime default NULL,
  `UPDATED_USER_ID` int(11) default NULL,
  `UPDATED_USER_NAME` varchar(45) default NULL,
  `STATUS` varbinary(2) default NULL COMMENT '状态    A 有效  D无效',
  `REMARK` char(10) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='用户组定义表';

-- ----------------------------
-- Records of wf_user_group
-- ----------------------------

-- ----------------------------
-- Table structure for wf_user_group_param
-- ----------------------------
DROP TABLE IF EXISTS `wf_user_group_param`;
CREATE TABLE `wf_user_group_param` (
  `ID` int(11) NOT NULL auto_increment,
  `PARAM_NAME` varchar(45) default NULL COMMENT '参数名称',
  `PARAM_TYPE` varchar(40) default NULL COMMENT 'bp代表上下文     from代表表单    re代表返回',
  `PARAM_VALUE` varchar(255) default NULL COMMENT '参数值',
  `USER_GROUP_ID` int(11) default NULL COMMENT '用户组ID  ',
  `CREATED_TIME` datetime default NULL COMMENT '创建时间',
  `CREATED_USER_ID` int(11) default NULL,
  `CREATED_USER_NAME` varchar(45) default NULL,
  `UPDATED_TIME` datetime default NULL,
  `UPDATED_USER_ID` int(11) default NULL,
  `UPDATED_USER_NAME` varchar(45) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='用户组定义参数表';

-- ----------------------------
-- Records of wf_user_group_param
-- ----------------------------

-- ----------------------------
-- Table structure for wf_user_proxy
-- ----------------------------
DROP TABLE IF EXISTS `wf_user_proxy`;
CREATE TABLE `wf_user_proxy` (
  `id` varchar(36) NOT NULL,
  `user_id` varchar(36) default NULL,
  `user_name` varchar(128) default NULL,
  `proxy_user_id` varchar(36) default NULL COMMENT '代理用户id',
  `proxy_user_name` varchar(128) default NULL,
  `act_procdef_key` varchar(128) default NULL,
  `wf_name` varchar(128) default NULL,
  `start_date` datetime default NULL COMMENT '开始日期',
  `end_date` datetime default NULL COMMENT '结束日期',
  `status` varchar(2) default NULL COMMENT '状态:A:有效,D:无效',
  `remark` varchar(500) default NULL,
  `created_time` datetime default NULL COMMENT '创建时间',
  `created_user_id` varchar(36) default NULL,
  `created_user_name` varchar(45) default NULL,
  `updated_time` datetime default NULL,
  `updated_user_id` varchar(36) default NULL,
  `updated_user_name` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作流代理表';

-- ----------------------------
-- Records of wf_user_proxy
-- ----------------------------

-- ----------------------------
-- Table structure for wf_user_proxy_history
-- ----------------------------
DROP TABLE IF EXISTS `wf_user_proxy_history`;
CREATE TABLE `wf_user_proxy_history` (
  `id` varchar(36) NOT NULL,
  `user_id` varchar(36) default NULL,
  `user_name` varchar(128) default NULL,
  `proxy_user_id` varchar(36) default NULL COMMENT '代理用户id',
  `proxy_user_name` varchar(128) default NULL,
  `act_procdef_key` varchar(128) default NULL,
  `wf_name` varchar(128) default NULL,
  `start_date` datetime default NULL COMMENT '开始日期',
  `end_date` datetime default NULL COMMENT '结束日期',
  `status` varchar(2) default NULL COMMENT '状态:A:有效,D:无效',
  `remark` varchar(500) default NULL,
  `created_time` datetime default NULL COMMENT '创建时间',
  `created_user_id` varchar(36) default NULL,
  `created_user_name` varchar(45) default NULL,
  `updated_time` datetime default NULL,
  `updated_user_id` varchar(36) default NULL,
  `updated_user_name` varchar(45) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仅仅记录代理生效后被删除的数据';

-- ----------------------------
-- Records of wf_user_proxy_history
-- ----------------------------

-- ----------------------------
-- Table structure for wf_workflow
-- ----------------------------
DROP TABLE IF EXISTS `wf_workflow`;
CREATE TABLE `wf_workflow` (
  `id` varchar(36) NOT NULL,
  `wf_name` varchar(40) default NULL COMMENT '工作流名称',
  `act_procdef_key` varchar(128) default NULL COMMENT '工作流编码，此值需要与activiti引擎中的流程id对应',
  `act_procdef_id` varchar(128) default NULL,
  `act_model_id` varchar(128) default NULL COMMENT '对应的模型ID，如果不为空，表示修改过模型，且为发布',
  `status` varchar(2) default NULL COMMENT '状态:A:有效,D:无效',
  `is_new_version` varchar(2) default NULL COMMENT '是否最新版本:1:是,0:否',
  `current_version` int(11) default NULL,
  `start_form` varchar(100) default NULL COMMENT '起始表单',
  `start_url` varchar(100) default NULL COMMENT '起始表单id,对应kb_module_list表的ID',
  `created_time` datetime default NULL COMMENT '创建时间',
  `created_user_id` varchar(36) default NULL,
  `created_user_name` varchar(45) default NULL,
  `updated_time` datetime default NULL,
  `updated_user_id` varchar(36) default NULL,
  `updated_user_name` varchar(45) default NULL,
  `detail_url` varchar(100) default NULL COMMENT '通用表单',
  `back_url` varchar(100) default NULL COMMENT '通用表单id,对应kb_module_list的ID',
  `business_table` varchar(200) default NULL COMMENT '业务处理表(主表)',
  `common_form` varchar(100) default NULL COMMENT '通用表单',
  `common_url` varchar(100) default NULL COMMENT '通用提交URL',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作流定义';

-- ----------------------------
-- Records of wf_workflow
-- ----------------------------
INSERT INTO `wf_workflow` VALUES ('3046526d-0eaf-4878-8ab5-1c0dc2951a44', '请假流程', 'WF_LEAVE', 'WF_LEAVE:3:a0e6f6f7-142d-443f-bd46-471dbde03878', '91d5d8ea-9729-4164-8152-2f94ca3e74cd', 'A', null, '3', 'demo/leave/apply', 'demo/leave/apply', '2017-06-29 11:45:54', '1', '系统管理员', '2017-06-29 11:45:54', '1', '系统管理员', 'demo/leave/detail', 'demo/leave/return-back', 'DEMO_LEAVE', 'demo/leave/claim', 'demo/leave/complete');
