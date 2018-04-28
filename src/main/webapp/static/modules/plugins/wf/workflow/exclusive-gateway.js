/**
 * 工作流网关节点配置
 * chenwandong@intasect.com.cn
 * 2016-05-10
 */
$.namespace('plugins.wf.workflow.exclusive_gateway');
/**
 * 初始化页面
 */
$.plugins.wf.workflow.exclusive_gateway.init = function(o){
	$.plugins.wf.workflow.exclusive_gateway.container = $('#plugin-wf-workflow-node-exclusive-gateway');
	
	loadScript("static/smart/js/plugin/fuelux/wizard/wizard.min.js",function(){
		$('.wizard',$.plugins.wf.workflow.exclusive_gateway.container).wizard();
	});
	
	$.each($(':input[tid]',$.plugins.wf.workflow.exclusive_gateway.container),function(i,n){
		$(n).val($.trim($(n).val()));
	});
	
	$('#id-dv-gateway-flow-listener').load('plugins/wf/workflow/edit-flow-listener',{pid:o.pid,nodeId:o.taskKey});
};

/**
 * 保存
 */
$.plugins.wf.workflow.exclusive_gateway.save = function(){
	var container = $.plugins.wf.workflow.exclusive_gateway.container;
	var pid = $('#id-pid',container).val();
	var list = [];
	$.each($(':input[tid]',container),function(i,n){
		list.push({elementId:$(n).attr('tid'),conditionExpression:$(n).val(),actProcdefId:pid});
	});
	console.log(JSON.stringify(list));
	
	$.post('plugins/wf/workflow/save-exclusive-gateway',{pid:pid,json:JSON.stringify(list)},function(result){
		if(result.resultCode == 1){
			//layer.alert('保存成功',{icon: 1});
			$.toast('保存成功');
		}else{
			layer.alert('保存失败',{icon: 2});
		}
	});
};