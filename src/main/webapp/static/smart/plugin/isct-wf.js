/**
 * 工作流相关的共通方法
 */
$.extend({
	/**
	 * 显示流程图,以下参数不能同时为空
	 * o.pdk:流程定义key
	 * o.iid:流程实例ID
	 * o.tid:流程任务ID
	 */
	wfDiagram:function(bt){
		var processInstanceId = $(bt).attr('processInstanceId');
		var processDefinitionKey = $(bt).attr('processdefinitionkey');
		var taskId = $(bt).attr('taskId');
		var o = {processDefinitionKey:processDefinitionKey,processInstanceId:processInstanceId,taskId:taskId};
		console.log(o);
		loadScript("static/modules/plugins/wf/api/api.js",function(){
			$.plugin.wf.api.diagram(o);
		});
	},
	
	/**
	 * 启动工作流
	 */
	wfStart:function(bt){
		loadScript("static/modules/plugins/wf/api/api.js",function(){
			$.plugin.wf.api.start(bt);
		});
	},
	
	/**
	 * 打开任务工作流窗口
	 * o.width:弹窗宽度(默认为浏览器窗口80%)
	 * o.height:弹窗高度(默认为浏览器窗口80%)
	 * o.loaded:任务处理窗口打开后的回调
	 * o.taskId:任务ID
	 * o.processDefinitionKey:流程定义key
	 * o.businessKey:业务ID
	 */
	wfClaim:function(o){
		console.log(o);
		loadScript("static/modules/plugins/wf/api/api.js",function(){
			$.plugin.wf.api.claim(o);
		});
	},
	/**
	 * 工作流任务完成提交
	 * me：complete按钮
	 */
	wfComplete:function(bt){
		loadScript("static/modules/plugins/wf/api/api.js",function(){
			$.plugin.wf.api.complete(bt);
		});
	},
	/**
	 * 关闭当前任务的处理窗口
	 */
	wfCancel:function(){
		loadScript("static/modules/plugins/wf/api/api.js",function(){
			$.plugin.wf.api.cancel();
		});
	},
	
	/**
	 * 流程日志查看
	 */
	wfLog:function(bt){
		var processInstanceId = $(bt).attr('processInstanceId');
		var processDefinitionKey = $(bt).attr('processDefinitionKey');
		var businessKey = $(bt).attr('businessKey');
		var taskId = $(bt).attr('taskId');
		
		loadScript("static/modules/plugins/wf/api/api.js",function(){
			$.plugin.wf.api.viewLog({
				taskId:taskId,
				processInstanceId:processInstanceId,
				processDefinitionKey:processDefinitionKey,
				businessKey:businessKey
			});
		});
	},
	
	/**
	 * 表单明细查看
	 * processDefinitionKey：流程定义key，必须
	 * businessKey:业务ID值，当传递给业务接口时，参数为：id
	 * params:额外的参数
	 * width:弹框宽度
	 * height:弹框高度
	 */
	viewWfDetail:function(o){
		loadScript("static/modules/plugins/wf/api/api.js",function(){
			$.plugin.wf.api.viewDetail(o);
		});
	}
});
