
--prompt Creating WF_ELEMENT_PARAMS...
create table WF_ELEMENT_PARAMS
(
  id                   VARCHAR2(36) not null,
  param_type           VARCHAR2(16),
  param_name           VARCHAR2(40),
  param_value          VARCHAR2(200),
  act_procdef_id       VARCHAR2(128),
  element_type         VARCHAR2(32),
  element_id           VARCHAR2(64),
  element_name         VARCHAR2(64),
  remark               VARCHAR2(200),
  created_time         DATE,
  created_user_id      VARCHAR2(36),
  created_user_name    VARCHAR2(45),
  updated_time         DATE,
  updated_user_id      VARCHAR2(36),
  updated_user_name    VARCHAR2(45),
  condition_expression VARCHAR2(500)
)
;
comment on table WF_ELEMENT_PARAMS
  is '流程元素参数表';
comment on column WF_ELEMENT_PARAMS.id
  is 'id';
comment on column WF_ELEMENT_PARAMS.param_type
  is '参数类型';
comment on column WF_ELEMENT_PARAMS.param_name
  is '参数名称';
comment on column WF_ELEMENT_PARAMS.param_value
  is '参数值';
comment on column WF_ELEMENT_PARAMS.act_procdef_id
  is '流程定义id(对应表act_re_procdef)';
comment on column WF_ELEMENT_PARAMS.element_type
  is '元素类型';
comment on column WF_ELEMENT_PARAMS.element_id
  is '节点定义key';
comment on column WF_ELEMENT_PARAMS.element_name
  is '节点定义名称';
comment on column WF_ELEMENT_PARAMS.remark
  is '备注';
comment on column WF_ELEMENT_PARAMS.created_time
  is '创建时间';
comment on column WF_ELEMENT_PARAMS.created_user_id
  is '创建人ID';
comment on column WF_ELEMENT_PARAMS.created_user_name
  is '创建人名称';
comment on column WF_ELEMENT_PARAMS.updated_time
  is '修改时间';
comment on column WF_ELEMENT_PARAMS.updated_user_id
  is '修改人ID';
comment on column WF_ELEMENT_PARAMS.updated_user_name
  is '修改人名称';
alter table WF_ELEMENT_PARAMS
  add constraint PK_WF_ELEMENT_PARAMS primary key (ID);

--prompt Creating WF_GLOBAL_EVENT...
create table WF_GLOBAL_EVENT
(
  id                VARCHAR2(36) not null,
  node_type         VARCHAR2(40),
  event_type        VARCHAR2(2),
  process_type      VARCHAR2(2),
  bean_id           VARCHAR2(40),
  process_script    VARCHAR2(2000),
  status            VARCHAR2(2),
  is_system_event   VARCHAR2(2),
  sort_             INTEGER,
  created_time      DATE,
  created_user_id   VARCHAR2(36),
  created_user_name VARCHAR2(45),
  updated_time      DATE,
  updated_user_id   VARCHAR2(36),
  updated_user_name VARCHAR2(45)
)
;
comment on table WF_GLOBAL_EVENT
  is '工作流全局事件表，所有的工作流都会触发的事件定义表';
comment on column WF_GLOBAL_EVENT.id
  is 'id';
comment on column WF_GLOBAL_EVENT.node_type
  is '节点类型,针对流程的节点类型';
comment on column WF_GLOBAL_EVENT.event_type
  is '事件类型,A:节点后事件,B:节点前事件';
comment on column WF_GLOBAL_EVENT.process_type
  is '事件处理类型B:指定bean方式,S:脚本方式';
comment on column WF_GLOBAL_EVENT.bean_id
  is '事件处理类';
comment on column WF_GLOBAL_EVENT.process_script
  is '处理脚本';
comment on column WF_GLOBAL_EVENT.status
  is '状态,A:启用,D:禁用';
comment on column WF_GLOBAL_EVENT.is_system_event
  is '1:系统事件(不能删除，只能禁用),0:自定义系统事件(可删除维护)';
comment on column WF_GLOBAL_EVENT.sort_
  is '事件顺序';
comment on column WF_GLOBAL_EVENT.created_time
  is '创建时间';
comment on column WF_GLOBAL_EVENT.created_user_id
  is '创建人ID';
comment on column WF_GLOBAL_EVENT.created_user_name
  is '创建人名称';
comment on column WF_GLOBAL_EVENT.updated_time
  is '修改时间';
comment on column WF_GLOBAL_EVENT.updated_user_id
  is '修改人ID';
comment on column WF_GLOBAL_EVENT.updated_user_name
  is '修改人名称';
alter table WF_GLOBAL_EVENT
  add constraint PK_WF_GLOBAL_EVENT primary key (ID);

--prompt Creating WF_MONITORING...
create table WF_MONITORING
(
  id                VARCHAR2(36),
  act_procdef_id    VARCHAR2(128),
  act_procdef_key   VARCHAR2(128),
  act_instance_id   VARCHAR2(128),
  wf_name           VARCHAR2(128),
  business_key      VARCHAR2(128),
  apply_user_id     VARCHAR2(128),
  apply_user_name   VARCHAR2(128),
  status            VARCHAR2(2),
  wf_status         VARCHAR2(512),
  wf_operators      VARCHAR2(512),
  reason            VARCHAR2(512),
  created_time      DATE,
  created_user_id   VARCHAR2(36),
  created_user_name VARCHAR2(45),
  updated_time      DATE,
  updated_user_id   VARCHAR2(36),
  updated_user_name VARCHAR2(45)
)
;
comment on table WF_MONITORING
  is '流程监控表';
comment on column WF_MONITORING.id
  is 'id';
comment on column WF_MONITORING.act_procdef_id
  is '流程定义id';
comment on column WF_MONITORING.act_procdef_key
  is '流程定义key';
comment on column WF_MONITORING.act_instance_id
  is '流程实例id';
comment on column WF_MONITORING.wf_name
  is '流程名称';
comment on column WF_MONITORING.business_key
  is '业务ID';
comment on column WF_MONITORING.apply_user_id
  is '流程启动人';
comment on column WF_MONITORING.apply_user_name
  is '启动人名称';
comment on column WF_MONITORING.status
  is 'RU:流程运行中,EN:流程正常结束,EO:流程异常结束,KI:流程被终止,OT:其他';
comment on column WF_MONITORING.wf_status
  is '流程状态集合';
comment on column WF_MONITORING.wf_operators
  is '当前操作人集合';
comment on column WF_MONITORING.reason
  is '备注原因';
comment on column WF_MONITORING.created_time
  is '创建时间';
comment on column WF_MONITORING.created_user_id
  is '创建人ID';
comment on column WF_MONITORING.created_user_name
  is '创建人名称';
comment on column WF_MONITORING.updated_time
  is '修改时间';
comment on column WF_MONITORING.updated_user_id
  is '修改人ID';
comment on column WF_MONITORING.updated_user_name
  is '修改人名称';

--prompt Creating WF_NODE_EVENT...
create table WF_NODE_EVENT
(
  id                VARCHAR2(36) not null,
  act_procdef_id    VARCHAR2(128),
  task_def_key      VARCHAR2(64),
  task_def_name     VARCHAR2(64),
  event_type        VARCHAR2(2),
  process_type      VARCHAR2(2),
  bean_id           VARCHAR2(40),
  process_script    VARCHAR2(2000),
  status            VARCHAR2(2),
  sort_             INTEGER,
  created_time      DATE,
  created_user_id   VARCHAR2(36),
  created_user_name VARCHAR2(45),
  updated_time      DATE,
  updated_user_id   VARCHAR2(36),
  updated_user_name VARCHAR2(45)
)
;
comment on table WF_NODE_EVENT
  is '节点事件处理表';
comment on column WF_NODE_EVENT.id
  is 'id';
comment on column WF_NODE_EVENT.act_procdef_id
  is '流程定义id(对应表act_re_procdef)';
comment on column WF_NODE_EVENT.task_def_key
  is '节点定义key';
comment on column WF_NODE_EVENT.task_def_name
  is '节点定义名称';
comment on column WF_NODE_EVENT.event_type
  is '事件类型,A:节点后事件,B:节点前事件';
comment on column WF_NODE_EVENT.process_type
  is '事件处理类型B:指定bean方式,S:脚本方式';
comment on column WF_NODE_EVENT.bean_id
  is '事件处理类';
comment on column WF_NODE_EVENT.process_script
  is '处理脚本';
comment on column WF_NODE_EVENT.status
  is '状态';
comment on column WF_NODE_EVENT.sort_
  is '事件顺序';
comment on column WF_NODE_EVENT.created_time
  is '创建时间';
comment on column WF_NODE_EVENT.created_user_id
  is '创建人ID';
comment on column WF_NODE_EVENT.created_user_name
  is '创建人名称';
comment on column WF_NODE_EVENT.updated_time
  is '修改时间';
comment on column WF_NODE_EVENT.updated_user_id
  is '修改人ID';
comment on column WF_NODE_EVENT.updated_user_name
  is '修改人名称';
alter table WF_NODE_EVENT
  add constraint PK_WF_NODE_EVENT primary key (ID);

--prompt Creating WF_NODE_EXT...
create table WF_NODE_EXT
(
  id                   VARCHAR2(36) not null,
  act_procdef_id       VARCHAR2(128),
  task_def_key         VARCHAR2(64),
  task_def_name        VARCHAR2(64),
  form                 VARCHAR2(100),
  complete_url         VARCHAR2(64),
  can_back             VARCHAR2(1),
  due_days             INTEGER,
  notice_email         INTEGER,
  remark               VARCHAR2(500),
  ext_json             VARCHAR2(500),
  created_time         DATE,
  created_user_id      VARCHAR2(36),
  created_user_name    VARCHAR2(45),
  updated_time         DATE,
  updated_user_id      VARCHAR2(36),
  updated_user_name    VARCHAR2(45),
  write_remark         VARCHAR2(2),
  default_out          VARCHAR2(64),
  default_out_name     VARCHAR2(64),
  pass_expression      VARCHAR2(500),
  is_countersign       VARCHAR2(2) default 0,
  is_sequential        VARCHAR2(2) default 0,
  completion_condition VARCHAR2(500)
)
;
comment on table WF_NODE_EXT
  is '流程节点扩展表';
comment on column WF_NODE_EXT.id
  is 'id';
comment on column WF_NODE_EXT.act_procdef_id
  is '流程定义id(对应表act_re_procdef)';
comment on column WF_NODE_EXT.task_def_key
  is '节点定义key';
comment on column WF_NODE_EXT.task_def_name
  is '节点定义名称';
comment on column WF_NODE_EXT.form
  is '可默认为流程定义的form';
comment on column WF_NODE_EXT.complete_url
  is '表单id,对应kb_module_list的id';
comment on column WF_NODE_EXT.can_back
  is '是否可回退 1:是,0:否，将流程结束，退回给发起人';
comment on column WF_NODE_EXT.due_days
  is '处理时限制(以天为单位),如果是0表示没有时限';
comment on column WF_NODE_EXT.notice_email
  is '邮件提醒';
comment on column WF_NODE_EXT.remark
  is '备注';
comment on column WF_NODE_EXT.ext_json
  is '扩展属性，json格式，方便扩展';
comment on column WF_NODE_EXT.created_time
  is '创建时间';
comment on column WF_NODE_EXT.created_user_id
  is '创建人ID';
comment on column WF_NODE_EXT.created_user_name
  is '创建人名称';
comment on column WF_NODE_EXT.updated_time
  is '修改时间';
comment on column WF_NODE_EXT.updated_user_id
  is '修改人ID';
comment on column WF_NODE_EXT.updated_user_name
  is '修改人名称';
comment on column WF_NODE_EXT.write_remark
  is '是否需要填写备注信息';
comment on column WF_NODE_EXT.pass_expression
  is '如果此表达式的结果为真，表示此节点免审，直接到下一个节点';
comment on column WF_NODE_EXT.is_countersign
  is '是否会签节点,1:是,0:否,默认0';
comment on column WF_NODE_EXT.is_sequential
  is '是否顺序会签,1:是,0:否,默认0';
comment on column WF_NODE_EXT.completion_condition
  is '会签通过表达式';
alter table WF_NODE_EXT
  add constraint PK_WF_NODE_EXT primary key (ID);

--prompt Creating WF_NODE_PROCESSER...
create table WF_NODE_PROCESSER
(
  id                 VARCHAR2(36) not null,
  act_procdef_id     VARCHAR2(128),
  task_def_key       VARCHAR2(64),
  task_def_name      VARCHAR2(64),
  processer_type     VARCHAR2(16),
  processer_id       VARCHAR2(64),
  processer_name     VARCHAR2(64),
  remark             VARCHAR2(500),
  created_time       DATE,
  created_user_id    VARCHAR2(36),
  created_user_name  VARCHAR2(45),
  updated_time       DATE,
  updated_user_id    VARCHAR2(36),
  updated_user_name  VARCHAR2(45),
  processer_category VARCHAR2(16),
  prefix             VARCHAR2(4)
)
;
comment on table WF_NODE_PROCESSER
  is '节点处理人员';
comment on column WF_NODE_PROCESSER.id
  is 'id';
comment on column WF_NODE_PROCESSER.act_procdef_id
  is '流程定义id(对应表act_re_procdef)';
comment on column WF_NODE_PROCESSER.task_def_key
  is '节点定义key';
comment on column WF_NODE_PROCESSER.task_def_name
  is '节点定义名称';
comment on column WF_NODE_PROCESSER.processer_type
  is 'U:特定用户(用户id),R:角色,其他可根据需要进行扩展，在扩展时，此值为将用户同步到act_id_group表的id前缀保持一致,CU:表示自定义类型';
comment on column WF_NODE_PROCESSER.processer_id
  is '处理人员类型id';
comment on column WF_NODE_PROCESSER.processer_name
  is '处理对象名称';
comment on column WF_NODE_PROCESSER.remark
  is '备注';
comment on column WF_NODE_PROCESSER.created_time
  is '创建时间';
comment on column WF_NODE_PROCESSER.created_user_id
  is '创建人ID';
comment on column WF_NODE_PROCESSER.created_user_name
  is '创建人名称';
comment on column WF_NODE_PROCESSER.updated_time
  is '修改时间';
comment on column WF_NODE_PROCESSER.updated_user_id
  is '修改人ID';
comment on column WF_NODE_PROCESSER.updated_user_name
  is '修改人名称';
alter table WF_NODE_PROCESSER
  add constraint PK_WF_NODE_PROCESSER primary key (ID);

--prompt Creating WF_OPERATE_RECORD...
create table WF_OPERATE_RECORD
(
  id                VARCHAR2(36) not null,
  act_procdef_id    VARCHAR2(128),
  act_procdef_key   VARCHAR2(128),
  instance_id       VARCHAR2(128),
  task_def_key      VARCHAR2(128),
  task_def_name     VARCHAR2(128),
  transition_id     VARCHAR2(128),
  transition_name   VARCHAR2(128),
  remark            VARCHAR2(1000),
  created_time      DATE,
  created_user_id   VARCHAR2(36),
  created_user_name VARCHAR2(45),
  business_key      VARCHAR2(36)
)
;
comment on table WF_OPERATE_RECORD
  is '流程履历操作记录表';
comment on column WF_OPERATE_RECORD.id
  is 'id';
comment on column WF_OPERATE_RECORD.act_procdef_id
  is '流程定义id';
comment on column WF_OPERATE_RECORD.act_procdef_key
  is '流程定义key';
comment on column WF_OPERATE_RECORD.instance_id
  is '流程实例id';
comment on column WF_OPERATE_RECORD.task_def_key
  is '流程节点key';
comment on column WF_OPERATE_RECORD.task_def_name
  is '流程节点名称';
comment on column WF_OPERATE_RECORD.transition_id
  is '流程动作id(流程走线)';
comment on column WF_OPERATE_RECORD.transition_name
  is '流程动作名称';
comment on column WF_OPERATE_RECORD.remark
  is '备注';
comment on column WF_OPERATE_RECORD.created_time
  is '创建时间';
comment on column WF_OPERATE_RECORD.created_user_id
  is '创建人ID';
comment on column WF_OPERATE_RECORD.created_user_name
  is '创建人名称';
comment on column WF_OPERATE_RECORD.business_key
  is '业务ID值';
alter table WF_OPERATE_RECORD
  add constraint PK_WF_OPERATE_RECORD primary key (ID);

--prompt Creating WF_USER_COMMON_REMARK...
create table WF_USER_COMMON_REMARK
(
  id                VARCHAR2(36),
  act_procdef_key   VARCHAR2(128),
  task_def_key      VARCHAR2(128),
  task_def_name     VARCHAR2(128),
  remark            VARCHAR2(1000),
  created_time      DATE,
  created_user_id   VARCHAR2(36),
  created_user_name VARCHAR2(45)
)
;
comment on table WF_USER_COMMON_REMARK
  is '用户常用备注表';
comment on column WF_USER_COMMON_REMARK.id
  is 'id';
comment on column WF_USER_COMMON_REMARK.act_procdef_key
  is '流程定义Key';
comment on column WF_USER_COMMON_REMARK.task_def_key
  is '流程节点key';
comment on column WF_USER_COMMON_REMARK.task_def_name
  is '流程节点名称';
comment on column WF_USER_COMMON_REMARK.remark
  is '备注';
comment on column WF_USER_COMMON_REMARK.created_time
  is '创建时间';
comment on column WF_USER_COMMON_REMARK.created_user_id
  is '创建人ID';
comment on column WF_USER_COMMON_REMARK.created_user_name
  is '创建人名称';

--prompt Creating WF_USER_PROXY...
create table WF_USER_PROXY
(
  id                VARCHAR2(36) not null,
  user_id           VARCHAR2(36),
  proxy_user_id     VARCHAR2(36),
  act_procdef_key   VARCHAR2(128),
  wf_name           VARCHAR2(128),
  start_date        DATE,
  end_date          DATE,
  status            VARCHAR2(2),
  remark            VARCHAR2(500),
  created_time      DATE,
  created_user_id   VARCHAR2(36),
  created_user_name VARCHAR2(45),
  updated_time      DATE,
  updated_user_id   VARCHAR2(36),
  updated_user_name VARCHAR2(45),
  user_name         VARCHAR2(128),
  proxy_user_name   VARCHAR2(128)
)
;
comment on table WF_USER_PROXY
  is '工作流代理表';
comment on column WF_USER_PROXY.id
  is 'id';
comment on column WF_USER_PROXY.user_id
  is '委托人ID';
comment on column WF_USER_PROXY.proxy_user_id
  is '代理用户id';
comment on column WF_USER_PROXY.act_procdef_key
  is '被代理工作流定义key';
comment on column WF_USER_PROXY.wf_name
  is '被代理工作流名称(冗余)';
comment on column WF_USER_PROXY.start_date
  is '开始日期';
comment on column WF_USER_PROXY.end_date
  is '结束日期';
comment on column WF_USER_PROXY.status
  is '状态:A:有效,D:无效';
comment on column WF_USER_PROXY.remark
  is '备注';
comment on column WF_USER_PROXY.created_time
  is '创建时间';
comment on column WF_USER_PROXY.created_user_id
  is '创建人ID';
comment on column WF_USER_PROXY.created_user_name
  is '创建人名称';
comment on column WF_USER_PROXY.updated_time
  is '修改时间';
comment on column WF_USER_PROXY.updated_user_id
  is '修改人ID';
comment on column WF_USER_PROXY.updated_user_name
  is '修改人名称';
comment on column WF_USER_PROXY.user_name
  is '委托人名称(冗余)';
comment on column WF_USER_PROXY.proxy_user_name
  is '代理人名称(冗余)';
alter table WF_USER_PROXY
  add constraint PK_WF_USER_PROXY primary key (ID);

--prompt Creating WF_USER_PROXY_HISTORY...
create table WF_USER_PROXY_HISTORY
(
  id                VARCHAR2(36) not null,
  user_id           VARCHAR2(36),
  user_name         VARCHAR2(128),
  proxy_user_id     VARCHAR2(36),
  proxy_user_name   VARCHAR2(128),
  act_procdef_key   VARCHAR2(128),
  wf_name           VARCHAR2(128),
  start_date        DATE,
  end_date          DATE,
  status            VARCHAR2(2),
  remark            VARCHAR2(500),
  created_time      DATE,
  created_user_id   VARCHAR2(36),
  created_user_name VARCHAR2(45),
  updated_time      DATE,
  updated_user_id   VARCHAR2(36),
  updated_user_name VARCHAR2(45)
)
;
comment on table WF_USER_PROXY_HISTORY
  is '仅仅记录代理生效后被删除的数据';
comment on column WF_USER_PROXY_HISTORY.id
  is 'id';
comment on column WF_USER_PROXY_HISTORY.user_id
  is '委托人ID';
comment on column WF_USER_PROXY_HISTORY.user_name
  is '委托人名称(冗余)';
comment on column WF_USER_PROXY_HISTORY.proxy_user_id
  is '代理用户id';
comment on column WF_USER_PROXY_HISTORY.proxy_user_name
  is '代理人名称(冗余)';
comment on column WF_USER_PROXY_HISTORY.act_procdef_key
  is '被代理工作流定义key';
comment on column WF_USER_PROXY_HISTORY.wf_name
  is '被代理工作流名称(冗余)';
comment on column WF_USER_PROXY_HISTORY.start_date
  is '开始日期';
comment on column WF_USER_PROXY_HISTORY.end_date
  is '结束日期';
comment on column WF_USER_PROXY_HISTORY.status
  is '状态:A:有效,D:无效';
comment on column WF_USER_PROXY_HISTORY.remark
  is '备注';
comment on column WF_USER_PROXY_HISTORY.created_time
  is '创建时间';
comment on column WF_USER_PROXY_HISTORY.created_user_id
  is '创建人ID';
comment on column WF_USER_PROXY_HISTORY.created_user_name
  is '创建人名称';
comment on column WF_USER_PROXY_HISTORY.updated_time
  is '修改时间';
comment on column WF_USER_PROXY_HISTORY.updated_user_id
  is '修改人ID';
comment on column WF_USER_PROXY_HISTORY.updated_user_name
  is '修改人名称';
alter table WF_USER_PROXY_HISTORY
  add constraint PK_WF_USER_PROXY_HISTORY primary key (ID);

--prompt Creating WF_WORKFLOW...
create table WF_WORKFLOW
(
  id                VARCHAR2(36) not null,
  wf_name           VARCHAR2(40),
  act_procdef_key   VARCHAR2(128),
  act_procdef_id    VARCHAR2(128),
  act_model_id      VARCHAR2(128),
  status            VARCHAR2(2),
  is_new_version    VARCHAR2(2),
  current_version   INTEGER,
  start_form        VARCHAR2(100),
  start_url         VARCHAR2(64),
  created_time      DATE,
  created_user_id   VARCHAR2(36),
  created_user_name VARCHAR2(45),
  updated_time      DATE,
  updated_user_id   VARCHAR2(36),
  updated_user_name VARCHAR2(45),
  detail_url        VARCHAR2(100),
  back_url          VARCHAR2(100),
  business_table    VARCHAR2(200),
  common_form       VARCHAR2(100),
  common_url        VARCHAR2(100)
)
;
comment on table WF_WORKFLOW
  is '工作流定义';
comment on column WF_WORKFLOW.id
  is 'id';
comment on column WF_WORKFLOW.wf_name
  is '工作流名称';
comment on column WF_WORKFLOW.act_procdef_key
  is '工作流编码，此值需要与activiti引擎中的流程id对应';
comment on column WF_WORKFLOW.act_procdef_id
  is 'ACT流程定义id';
comment on column WF_WORKFLOW.act_model_id
  is '对应的模型ID，如果不为空，表示修改过模型，且为发布';
comment on column WF_WORKFLOW.status
  is '状态:A:有效,D:无效';
comment on column WF_WORKFLOW.is_new_version
  is '是否最新版本:1:是,0:否';
comment on column WF_WORKFLOW.current_version
  is '当前版本';
comment on column WF_WORKFLOW.start_form
  is '起始表单';
comment on column WF_WORKFLOW.start_url
  is '起始提交URL';
comment on column WF_WORKFLOW.created_time
  is '创建时间';
comment on column WF_WORKFLOW.created_user_id
  is '创建人ID';
comment on column WF_WORKFLOW.created_user_name
  is '创建人名称';
comment on column WF_WORKFLOW.updated_time
  is '修改时间';
comment on column WF_WORKFLOW.updated_user_id
  is '修改人ID';
comment on column WF_WORKFLOW.updated_user_name
  is '修改人名称';
comment on column WF_WORKFLOW.detail_url
  is '通用明细表单';
comment on column WF_WORKFLOW.back_url
  is '通用提交URL';
comment on column WF_WORKFLOW.business_table
  is '业务处理表(主表)';
comment on column WF_WORKFLOW.common_form
  is '通用表单';
comment on column WF_WORKFLOW.common_url
  is '通用提交URL';
alter table WF_WORKFLOW
  add constraint PK_WF_WORKFLOW primary key (ID);

--prompt Loading WF_ELEMENT_PARAMS...
--prompt Table is empty
--prompt Loading WF_GLOBAL_EVENT...
--prompt Table is empty
--prompt Loading WF_MONITORING...
--prompt Table is empty
--prompt Loading WF_NODE_EVENT...
--prompt Table is empty
--prompt Loading WF_NODE_EXT...
--prompt Table is empty
--prompt Loading WF_NODE_PROCESSER...
--prompt Table is empty
--prompt Loading WF_OPERATE_RECORD...
--prompt Table is empty
--prompt Loading WF_USER_COMMON_REMARK...
--prompt Table is empty
--prompt Loading WF_USER_PROXY...
--prompt Table is empty
--prompt Loading WF_USER_PROXY_HISTORY...
--prompt Table is empty
--prompt Loading WF_WORKFLOW...
--prompt Table is empty

