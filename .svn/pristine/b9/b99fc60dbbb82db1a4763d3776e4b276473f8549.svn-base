/**
 * 工作流相关js接口API
 */
$.namespace('plugin.wf.api');

/**
 * 显示流程图,以下参数不能同时为空
 * o.pdk:流程定义key
 * o.iid:流程实例ID
 * o.tid:流程任务ID
 */
$.plugin.wf.api.diagram = function(o){
	var url = 'plugins/wf/definition/process-diagram?1=1';
	if(o.processDefinitionKey)url += '&processDefinitionKey=' + o.processDefinitionKey;
	if(o.processInstanceId)url += '&instanceId=' + o.processInstanceId;
	if(o.taskId)url += '&taskId=' + o.taskId;
	console.log(url);
	$.plugin.wf.api.diagramWinId = 
		$.dialog({
				url:url,
				title:'流程图',
				width:$(window).width() * 0.8,
				height:$(window).height * 0.8,
				modal:true,
				buttons:[
					{text:'关闭',class:'btn btn-default btn-sm',click:function(){
						$('#' + $.plugin.wf.api.diagramWinId).dialog('close');
					 }}
				]
			});
};

/**
 * o.width:弹窗宽度(默认为浏览器窗口80%)
 * o.height:弹窗高度(默认为浏览器窗口80%)
 * o.loaded:任务处理窗口打开后的回调
 * o.taskId:任务ID
 * o.processDefinitionKey:流程定义key
 * o.businessKey:业务ID
 */
$.plugin.wf.api.claim = function(o){
	var params = {};
	if(!o.businessKey){
		$.alert('提示','请传递参数:businessKey');
		return;
	}
	params['businessKey'] = o.businessKey;
	if(o.taskId)params['taskId'] = o.o.taskId;
	if(o.processDefinitionKey)params['processDefinitionKey'] = o.processDefinitionKey;
	
	$.getJSON('plugins/wf/task/claim-task',params,function(json){
		if(json.resultCode != 1){
			$.alert('提示',json.message);
			return;
		}
		var claimUrl = json.object['form'];
		$.plugin.wf.api.claimWinId = $.dialog({
			url:claimUrl + '?id=' + o.businessKey,
			title:'流程任务处理',
			width:o.width?o.width:$(window).width() * 0.8,
			height:o.height?o.height:$(window).height() * 0.8,
			modal:true,
			success:function(){
				//数据加载完成后，触发用户事件
				if($.isFunction(o.loaded)){
					o.loaded();
				}
			}
		});
	});
},

/**
 * 工作流启动提交
 */
$.plugin.wf.api.start = function(bt){
	console.log(bt);
	var completeUrl = $(bt).attr('completeUrl');
	var onBeforeSend = $(bt).attr('onBeforeSend');
	var onSuccess = $.trim($(bt).attr('onSuccess'));
	var transitionId = $(bt).attr('transitionId');
	var draft = $(bt).attr('draft');
	
	var data = eval(onBeforeSend + '()');
	if(data){
		$.extend(data,{transitionId:transitionId,isDraft:draft});
		
		console.log(data);
		$.ajax({
			sync:true,
			url:completeUrl,
			type:'post',
			dataType:'json',
			data:data,
			success:function(json){
				if(json.resultCode != 1){
					$.alert('提示',json.message);
					return;
				}
				if(onSuccess != ''){
					eval(onSuccess + '()');
				}
			}
		});
	}
	
};

/**
 * 完成任务
 */
$.plugin.wf.api.complete = function(bt){
	console.log(bt);
	var completeUrl = $(bt).attr('completeUrl');
	var onBeforeSend = $(bt).attr('onBeforeSend');
	var onSuccess = $.trim($(bt).attr('onSuccess'));
	var transitionId = $(bt).attr('transitionId');
	var draft = $(bt).attr('draft');
	var taskId = $(bt).attr('taskId');
	
	var data = eval(onBeforeSend + '()');
	if(data){
		$.extend(data,{transitionId:transitionId,isDraft:draft,taskId:taskId});
		alert('OK');
		console.log(data);
		$.ajax({
			sync:true,
			url:completeUrl,
			type:'post',
			dataType:'json',
			data:data,
			success:function(json){
				if(json.resultCode != 1){
					$.alert('提示',json.message);
					return;
				}
				if(onSuccess != ''){
					eval(onSuccess + '()');
				}
				$('#' + $.plugin.wf.api.claimWinId).dialog('close');
			}
		});
	}
	
};

/**
 * 关闭当前任务处理窗口
 */
$.plugin.wf.api.cancel = function(){
	$('#' + $.plugin.wf.api.claimWinId).dialog('close');
};

/**
 * 流程日志查看
 * taskId:任务ID
 * processInstanceId:流程实例ID
 * processDefinitionKey:流程定义key
 * businessKey:业务ID
 * width:弹框宽度
 * height:弹框高度
 */
$.plugin.wf.api.viewLog = function(o){
	var buttons = [
	   {text:'关闭',class:'btn btn-default btn-sm',click:function(){
		   $('#' + $.plugin.wf.api.viewWfLogWinId).dialog('close');
	   }}];
	
	$.plugin.wf.api.viewWfLogWinId = $.dialog({
		url:'plugins/wf/task/view-operate-logs',
		title:'流程日志查看',
		width:o.width?o.width:$(window).width() * 0.8,
		height:o.height?o.height:$(window).height() * 0.8,
		data:o,
		modal:true,
		buttons:buttons
	});
};

/**
 * 流程表单明细查看
 * processDefinitionKey:流程定义key
 * businessKey:业务ID
 * width:弹框宽度
 * height:弹框高度
 */
$.plugin.wf.api.viewDetail = function(o){
	if(!o.processDefinitionKey)throw "未传递流程定义key";
	if(!o.businessKey)throw "未传递业务ID值";
	$.getJSON('plugins/wf/workflow/find-by-key',{key:o.processDefinitionKey},function(json){
		
		var detailUrl = json['detailUrl'];
		if(detailUrl == '' || detailUrl == 'null' || detailUrl == null){
			throw '未配置流程明细查看URL';
		}
		
		var buttons = [
		   {text:'关闭',class:'btn btn-default btn-sm',click:function(){
			   $('#' + $.plugin.wf.api.viewDetailWinId).dialog('close');
		   }}];
		
		var data = {id:o.businessKey};
		if(o.params){
			$.extend(data,o.params);
		}
		
		$.plugin.wf.api.viewDetailWinId = $.dialog({
			url:detailUrl,
			title:'明细表单查看',
			width:o.width?o.width:$(window).width() * 0.8,
			height:o.height?o.height:$(window).height() * 0.8,
			modal:true,
			data:data,
			buttons:buttons
		});
	});
};