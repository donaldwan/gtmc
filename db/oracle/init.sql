select * from u_dept;

--u_detp;
INSERT INTO u_dept(id,parent_id,dept_name,dept_code,STATUS)VALUES(1,NULL,'音泰思','ISCT','A');

--u_user秘密为admin;
INSERT INTO u_user(id,dept_id,dept_name,login_name,login_pass,emp_code,NAME,STATUS,sex,email)
       VALUES(1,1,'音泰思','admin','21232F297A57A5A743894A0E4A801FC3','001','系统管理员','A','M','aaa@aaa.com');

--u_user_dept
INSERT INTO u_dept_user(id,dept_id,user_id)VALUES(1,1,1);

--u_role
INSERT INTO u_role(id,role_name,role_code,STATUS)VALUES(1,'系统管理员','ROLE_ADMIN','A');

--u_user_role
INSERT INTO u_user_role(id,user_id,role_id)VALUES(1,1,1);

---------------------------------------------以下为菜单数据-------------------------------------------------
--u_resource
INSERT INTO u_resource(id,resource_name,uri,resource_type)VALUES(1,'用户列表','system/user/manager','D');
INSERT INTO u_resource(id,resource_name,uri,resource_type)VALUES(2,'角色管理','system/role/manager','D');
INSERT INTO u_resource(id,resource_name,uri,resource_type)VALUES(3,'资源管理','system/resource/manager','D');
INSERT INTO u_resource(id,resource_name,uri,resource_type)VALUES(4,'菜单管理','system/screen/manager','D');
INSERT INTO u_resource(id,resource_name,uri,resource_type)VALUES(5,'Job管理','plugins/schedule-job/manager','D');
INSERT INTO u_resource(id,resource_name,uri,resource_type)VALUES(21,'工作流定义','plugins/wf/workflow','D');

INSERT INTO u_resource(id,resource_name,uri,resource_type)VALUES(31,'国际化Demo','demo/i18n','D');

INSERT INTO u_resource(id,resource_name,uri,resource_type)VALUES(32,'请假数据','demo/leave/manager','D');

--u_screen
INSERT INTO u_screen(id,parent_id,screen_name,open_type,resource_id)VALUES(1,NULL,'系统管理',NULL,NULL);
INSERT INTO u_screen(id,parent_id,screen_name,open_type,resource_id)VALUES(2,1,'用户管理','D',1);
INSERT INTO u_screen(id,parent_id,screen_name,open_type,resource_id)VALUES(3,1,'角色管理','D',2);
INSERT INTO u_screen(id,parent_id,screen_name,open_type,resource_id)VALUES(4,1,'资源管理','D',3);
INSERT INTO u_screen(id,parent_id,screen_name,open_type,resource_id)VALUES(5,1,'菜单管理','D',4);
INSERT INTO u_screen(id,parent_id,screen_name,open_type,resource_id)VALUES(6,1,'Job管理','D',5);

INSERT INTO u_screen(id,parent_id,screen_name,open_type,resource_id)VALUES(20,null,'工作流配置',null,null);
INSERT INTO u_screen(id,parent_id,screen_name,open_type,resource_id)VALUES(21,20,'工作流定义','D',21);

INSERT INTO u_screen(id,parent_id,screen_name,open_type,resource_id)VALUES(30,null,'Demo演示',null,null);
INSERT INTO u_screen(id,parent_id,screen_name,open_type,resource_id)VALUES(31,30,'国际化Demo','D',31);
INSERT INTO u_screen(id,parent_id,screen_name,open_type,resource_id)VALUES(32,30,'工作流Demo',null,null);
INSERT INTO u_screen(id,parent_id,screen_name,open_type,resource_id)VALUES(33,32,'请假数据','D',32);


--u_role_screen
INSERT INTO u_role_screen(id,role_id,screen_id)VALUES(1,1,1);
INSERT INTO u_role_screen(id,role_id,screen_id)VALUES(2,1,2);
INSERT INTO u_role_screen(id,role_id,screen_id)VALUES(3,1,3);
INSERT INTO u_role_screen(id,role_id,screen_id)VALUES(4,1,4);
INSERT INTO u_role_screen(id,role_id,screen_id)VALUES(5,1,5);
INSERT INTO u_role_screen(id,role_id,screen_id)VALUES(6,1,20);
INSERT INTO u_role_screen(id,role_id,screen_id)VALUES(7,1,21);
INSERT INTO u_role_screen(id,role_id,screen_id)VALUES(8,1,6);
INSERT INTO u_role_screen(id,role_id,screen_id)VALUES(9,1,30);
INSERT INTO u_role_screen(id,role_id,screen_id)VALUES(10,1,31);
INSERT INTO u_role_screen(id,role_id,screen_id)VALUES(11,1,32);
INSERT INTO u_role_screen(id,role_id,screen_id)VALUES(12,1,33);

--数据字典表
insert into COM_DICTIONARY(id,type_code,dictionary_name,dictionary_code,dictionary_value,status)values(1,'ATTACHMENT_FOLDER','附件上传目录','Default','/home/chenwandong/upfile','A');

