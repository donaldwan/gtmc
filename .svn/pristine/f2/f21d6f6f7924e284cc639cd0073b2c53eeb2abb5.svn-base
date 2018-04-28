/**
 * 用户任务节点设置
 */
$.namespace('plugins.wf.workflow.user_task');

/**
 * 页面初始化
 */
$.plugins.wf.workflow.user_task.init = function(o){
	$.plugins.wf.workflow.user_task.container = $('#plugin-wf-workflow-node-user-task');	
	loadScript("static/smart/js/plugin/fuelux/wizard/wizard.min.js",function(){
		$('.wizard',$.plugins.wf.workflow.user_task.container).wizard();
	});
	
	$.plugins.wf.workflow.user_task.initFormNormal();
	
	$.plugins.wf.workflow.user_task.initUserGrid(o);
	
	$.plugins.wf.workflow.user_task.initEvent();
	$.plugins.wf.workflow.user_task.initFormEvent();
	
	$.plugins.wf.workflow.user_task.initFlowListener(o.pid,o.taskKey,'id-dv-flow-listener');
};

/**
 * 初始化常规设置表单验证
 */
$.plugins.wf.workflow.user_task.initFormNormal = function(){
	var validator = $("#user-task-form-normal",$.plugins.wf.workflow.user_task.container).validate({
		rules : {
			form : {
				required : true,
				minlength : 2,
				maxlength : 100
			},
			completeUrl : {
				required : true,
				minlength : 2,
				maxlength : 100
			},
			dueDays : {
				required : false,
				digits:true,
				range:[1,100]
			},
			passExpression : {
				required : false,
				minlength : 2,
				maxlength : 400
			}
		},
		submitHandler:function(form){
			$.plugins.wf.workflow.user_task.saveFormNormal();
		}
	});
	
	//将保存按钮与form表单绑定
	$('#bt-user-task-form-normal',$.plugins.wf.workflow.user_task.container).click(function(){
		$.plugins.wf.workflow.user_task.saveFormNormal();
	});
};

/**
* 常规设置保存
*/
$.plugins.wf.workflow.user_task.saveFormNormal = function(){
	var form = $("#user-task-form-normal",$.plugins.wf.workflow.user_task.container);
	if(form.valid()){
		console.log(form.serialize());
		$.post('plugins/wf/workflow/save-nodeext',form.serialize(),function(json){
			console.log(json);
			if(json.resultCode == 1){
				$.toast("保存成功");
			}else{
				$.toast('保存失败');
			}
		},'json');
	}
};

/**
* 初始化用户设置列表
*/
$.plugins.wf.workflow.user_task.initUserGrid = function(o){
	$.plugins.wf.workflow.user_task.userGridId = 
		$.grid({
			noPager:true,
			rowNum : 100000000,
			height : 220,
			scroll_y:true,
			shrinkToFit:true,
			container:$('#dv-plugins-wf-workflow-user-task-users',$.plugins.wf.workflow.user_task.container),
			url:'plugins/wf/workflow/find-node-processer?pid=' + o.pid + '&taskKey=' + o.taskKey,
			colNames:['ID','流程人员类别','流程人员类型','处理人员名称','处理对象ID','操作'],
			colModel : [
				{name:'id',index:'id',hidden:true},
				{name:'processerCategory',index:'processerCategory',sortable:false,align:'center',
					formatter:function(v,a,r,d){
						switch(v){
							case 'USER':return '特定用户';
							case 'WF_USER':return '流程特定人员';
							case 'FORM':return '表单内成员';
							case 'METHOD':return '自定义方法';
							case 'R_':return '特定角色';
							case 'D_':return '特定部门';
							case 'G_':return '用户组脚本';
						}
						return '';
					}
				},
				{name:'processerType',index:'processerType',sortable:false,align:'center',
					formatter:function(v,a,r,d){
						return v == 'USER'?'用户':'用户组'
					}
				},
				{name:'processerName',index:'processerName',sortable:false,align:'center'},
				{name:'processerId',index:'processerId',sortable:false,align:'center'},
				{name:'aaa',index:'',fixed:true, sortable:false, resize:false,align:'center',
					formatter:function(value,a,row,d){
						return '&nbsp;<a href="javascript:$.plugins.wf.workflow.user_task.delUser(\'' + row.id + '\');">删除</a>';
					}
				}
			]
		});
};

/**
* 删除流程用户
*/
$.plugins.wf.workflow.user_task.delUser = function(id){
	$.post('plugins/wf/workflow/del-processer-by-id',{id:id},function(json){
			console.log(json);
			if(json.resultCode == 1){
				$.toast('刪除成功！');
				$('#' + $.plugins.wf.workflow.user_task.userGridId).trigger("reloadGrid");  ;
			}else{
				$.toast('删除失败');
			}
		},'json');
};

/**
 * 打开对应的用户选择窗口
 */
$.plugins.wf.workflow.user_task.openProcesserWin = function(){
	var option = $("#id-sel-task-user-category",$.plugins.wf.workflow.user_task.container).find("option:selected");
	var category = $(option).attr('category');
	var processerType = $(option).attr('processerType');
	var url = $(option).attr('url');
	switch(category){
		case 'USER'://特定人员
			$.chooseUser({
				callback:$.plugins.wf.workflow.user_task.chooseUserBack
			});
			break;
		case 'WF_USER'://流程特定人员（流程启动人员，流程上个节点处理人）
			loadScript("static/modules/plugins/wf/workflow/wf-processer-choose-user.js",function(){
				$.plugins.wf.workflow.wf_processer_choose.init({
					callback:$.plugins.wf.workflow.user_task.wfProcesserChooseUserBack
				});
			});
			break;
		case 'FORM'://表单内成员（用户，用户组）
			loadScript("static/modules/plugins/wf/workflow/form-processer-choose-user.js",function(){
				$.plugins.wf.workflow.form_processer_choose.init({
					callback:$.plugins.wf.workflow.user_task.formProcesserChooseUserBack
				});
			});
			break;
		case 'METHOD'://自定义方法
			loadScript("static/modules/plugins/wf/workflow/method-processer-choose.js",function(){
				$.plugins.wf.workflow.method_processer_choose.init({
					callback:$.plugins.wf.workflow.user_task.customMethodBack
				});
			});
			break;
		case 'R_'://特定角色
			$.chooseRole({
				callback:$.plugins.wf.workflow.user_task.chooseRoleBack
			});
			break;
		case 'D_'://特定部门
			$.chooseDept({
				callback:$.plugins.wf.workflow.user_task.chooseDeptBack
			});
			break;
		case 'GROOVY': //用户组脚本
			loadScript("static/modules/plugins/wf/workflow/method-processer-groovy.js",function(){
				$.plugins.wf.workflow.method_processer_groovy.init({
					callback : $.plugins.wf.workflow.user_task.chooseGroovyMethodBack
				});
			});
			break;
		default:
			alert('此类别暂不支持');
			return;
	}
};

/**
 * 选择用户组脚本信息
 */
$.plugins.wf.workflow.user_task.chooseGroovyMethodBack = function(json){
//	$.toast("回调测试成功！");
//	console.log(json);
//	console.log(json[0].id+"--"+json[0].groupName);
	var form = $('#user-task-form-users',$.plugins.wf.workflow.user_task.container);
	var dataArr = [];
	for(var i = 0;i<json.length;i++){
		var formData = {};
		formData['actProcdefId'] = $('[name="actProcdefId"]',form).val();
		formData['taskDefKey'] = $('[name="taskDefKey"]',form).val();
		formData['processerId'] = json[i].id;
		formData['processerName'] = json[i].groupName;
		formData['processerType'] = 'GROOVY';
		formData['processerCategory'] = 'G_';
		formData['prefix'] = 'G_';
		dataArr.push(formData);
	}
	$.ajax({
		  sync:true,
		  url:"plugins/wf/workflow/save-node-processer-batch",
		  type:"POST",
		  data:JSON.stringify(dataArr),
		  contentType:"application/json; charset=utf-8",
		  dataType:"json",
		  success: function(json){
			  if(json.resultCode == 1){
				    $('#' + $.plugins.wf.workflow.method_processer_groovy.winId).dialog('close');
					$.toast('保存成功');
					$('#' + $.plugins.wf.workflow.user_task.userGridId).trigger("reloadGrid");
				}else{
					$.toast('保存失败');
				}
		  }
	});
};

/**
 * 选择用户（特定部门）
 */
$.plugins.wf.workflow.user_task.chooseDeptBack=function(json){
	var form = $('#user-task-form-users',$.plugins.wf.workflow.user_task.container);
	var dataArr = [];
	for(var i = 0;i<json.length;i++){
		var formData = {};
		formData['actProcdefId'] = $('[name="actProcdefId"]',form).val();
		formData['taskDefKey'] = $('[name="taskDefKey"]',form).val();
		formData['processerId'] = json[i].id;
		formData['processerName'] = json[i].deptName;
		formData['processerType'] = 'GROUP';
		formData['processerCategory'] = 'D_';
		formData['prefix'] = 'D_';
		dataArr.push(formData);
	}
	
	$.ajax({
		  sync:true,
		  url:"plugins/wf/workflow/save-node-processer-batch",
		  type:"POST",
		  data:JSON.stringify(dataArr),
		  contentType:"application/json; charset=utf-8",
		  dataType:"json",
		  success: function(json){
			  if(json.resultCode == 1){
				    $('#' + $.system.dept.choose.winId).dialog('close');
					$.toast('保存成功');
					$('#' + $.plugins.wf.workflow.user_task.userGridId).trigger("reloadGrid");
				}else{
					$.toast('保存失败');
				}
		  }
	});
};

/**
 * 选择用户后的回调（特定角色）
 */
$.plugins.wf.workflow.user_task.chooseRoleBack = function(json){
	var form = $('#user-task-form-users',$.plugins.wf.workflow.user_task.container);
	var dataArr = [];
	for(var i = 0;i<json.length;i++){
		var formData = {};
		formData['actProcdefId'] = $('[name="actProcdefId"]',form).val();
		formData['taskDefKey'] = $('[name="taskDefKey"]',form).val();
		formData['processerId'] = json[i].id;
		formData['processerName'] = json[i].roleName;
		formData['processerType'] = 'GROUP';
		formData['processerCategory'] = 'R_';
		formData['prefix'] = 'R_';
		dataArr.push(formData);
	}
	
	$.ajax({
		  url:"plugins/wf/workflow/save-node-processer-batch",
		  type:"POST",
		  data:JSON.stringify(dataArr),
		  contentType:"application/json; charset=utf-8",
		  dataType:"json",
		  success: function(json){
			  if(json.resultCode == 1){
					$.toast('保存成功');
					$('#' + $.system.role.choose.winId).dialog('close'); 
					$('#' + $.plugins.wf.workflow.user_task.userGridId).trigger("reloadGrid");
				}else{
					$.toast('保存失败');
				}
		  }
	});
};

/**
* 选择用户后的回调（自定义方法）
*/
$.plugins.wf.workflow.user_task.customMethodBack = function(formElements){
	var form = $('#user-task-form-users',$.plugins.wf.workflow.user_task.container);
	formElements = formElements + "&actProcdefId=" + $('[name="actProcdefId"]',form).val();
	formElements = formElements + "&taskDefKey=" + $('[name="taskDefKey"]',form).val();
	formElements = formElements + "&processerCategory=METHOD";
	$.post('plugins/wf/workflow/save-node-processer',formElements,function(json){
		if(json.resultCode == 1){
			$.toast('保存成功');
			$('#' + $.plugins.wf.workflow.user_task.userGridId).trigger("reloadGrid");
		}else{
			$.toast('保存失败');
		}
	},'json');
};


/**
 * 选择用户后的回调（表单内成员）
 */
$.plugins.wf.workflow.user_task.formProcesserChooseUserBack = function(formElements){
	var form = $('#user-task-form-users',$.plugins.wf.workflow.user_task.container);
	formElements = formElements + "&actProcdefId=" + $('[name="actProcdefId"]',form).val();
	formElements = formElements + "&taskDefKey=" + $('[name="taskDefKey"]',form).val();
	formElements = formElements + "&processerCategory=FORM";
	$.post('plugins/wf/workflow/save-node-processer',formElements,function(json){
		if(json.resultCode == 1){
			$.toast('保存成功');
			$('#' + $.plugins.wf.workflow.user_task.userGridId).trigger("reloadGrid");
		}else{
			$.toast('保存失败');
		}
	},'json');
};

/**
 * 选择用户后的回调（流程特定人员）
 */
$.plugins.wf.workflow.user_task.wfProcesserChooseUserBack = function(dataArr){
	if(dataArr.length == 0){
		$.toast("至少选择一种人员");
		return;
	}
	
	for(var formData in dataArr){
		var form = $('#user-task-form-users',$.plugins.wf.workflow.user_task.container);
		dataArr[formData]['actProcdefId'] = $('[name="actProcdefId"]',form).val();
		dataArr[formData]['taskDefKey'] = $('[name="taskDefKey"]',form).val();
		dataArr[formData]['processerCategory'] = 'WF_USER';
		dataArr[formData]['processerType'] = 'USER';
	}
	
	$.ajax({
		  url:"plugins/wf/workflow/save-node-processer-batch",
		  type:"POST",
		  data:JSON.stringify(dataArr),
		  contentType:"application/json; charset=utf-8",
		  dataType:"json",
		  success: function(json){
			  if(json.resultCode == 1){
					$.toast('保存成功');
					$('#' + $.plugins.wf.workflow.user_task.userGridId).trigger("reloadGrid");
				}else{
					$.toast('保存失败');
				}
		  }
	});
};

/**
 * 选择用户后的回调（特定人员）
 */
$.plugins.wf.workflow.user_task.chooseUserBack = function(dataArr){
	for(var formData in dataArr){
		var user = dataArr[formData];
		var form = $('#user-task-form-users',$.plugins.wf.workflow.user_task.container);
		dataArr[formData].actProcdefId = $('[name="actProcdefId"]',form).val();
		dataArr[formData].taskDefKey = $('[name="taskDefKey"]',form).val();
		dataArr[formData].processerId = user['id'];
		dataArr[formData].processerName = user['name'];
		dataArr[formData].processerType = 'USER';
		dataArr[formData].processerCategory = 'USER';
		dataArr[formData].id = '';
	}
	$.ajax({
		  sync:true,
		  url:"plugins/wf/workflow/save-node-processer-batch",
		  type:"POST",
		  data:JSON.stringify(dataArr),
		  contentType:"application/json; charset=utf-8",
		  dataType:"json",
		  success: function(json){
			  if(json.resultCode == 1){
					$.toast('保存成功!');
					$('#' + $.plugins.wf.workflow.user_task.userGridId).trigger("reloadGrid");
				}else{
					$.toast('保存失败');
				}
		  }
	});
	return true;	
};


/**
 * 初始化脚本任务
 */
$.plugins.wf.workflow.user_task.initEvent = function(){
	var processType = $('#idProcessType',$.plugins.wf.workflow.user_task.container).val();
	if(processType == 'B'){
		$('#id-sec-process-script',$.plugins.wf.workflow.user_task.container).hide();
	}else{
		$('#id-sec-process-bean',$.plugins.wf.workflow.user_task.container).hide();
	}
	
	$('#idProcessType',$.plugins.wf.workflow.user_task.container).change(function(){
		if($(this).val() == 'B'){
			$('#id-sec-process-script',$.plugins.wf.workflow.user_task.container).hide();
			$('#id-sec-process-bean',$.plugins.wf.workflow.user_task.container).show();
		}else{
			$('#id-sec-process-script',$.plugins.wf.workflow.user_task.container).show();
			$('#id-sec-process-bean',$.plugins.wf.workflow.user_task.container).hide();
		}
	});
};

/**
 * 初始化事件编辑表单
 */
$.plugins.wf.workflow.user_task.initFormEvent = function(){
	var validator = $("#user-task-form-event",$.plugins.wf.workflow.user_task.container).validate({
		rules : {
			idProcessType : {
				required : true
			}
		},
		submitHandler:function(form){
			$.plugins.wf.workflow.user_task.saveFormEvent();
		}
	});
	
	//将保存按钮与form表单绑定
	$('#bt-user-task-form-event',$.plugins.wf.workflow.user_task.container).click(function(){
		$.plugins.wf.workflow.user_task.saveFormEvent();
	});
};

/**
 * 事件编辑保存
 */
$.plugins.wf.workflow.user_task.saveFormEvent = function(){
	var form = $("#user-task-form-event",$.plugins.wf.workflow.user_task.container);
	if(form.valid()){
		console.log(form.serialize());
		$.post('plugins/wf/workflow/save-node-event',form.serialize(),function(json){
			console.log(json);
			if(json.resultCode == 1){
				$.toast('保存成功');
			}else{
				$.toast('保存失败');
			}
		},'json');
	}
};

/**
 * 初始化流程走向画面
 */
$.plugins.wf.workflow.user_task.initFlowListener = function(pid,nodeId,containerId){
	$('#' + containerId).load('plugins/wf/workflow/edit-flow-listener',{pid:pid,nodeId:nodeId});
};
