/**
 * 开始&结束事件配置
 */
$.namespace('plugins.wf.workflow.event_config');

$.plugins.wf.workflow.event_config.init = function(o){
	loadScript("static/smart/js/plugin/fuelux/wizard/wizard.min.js",function(){
		$('.wizard',$('#id-row-wf-event-config')).wizard();
	});
	
	$.plugins.wf.workflow.user_task.initEvent();
	$.plugins.wf.workflow.user_task.initFormEvent();
	
	$('#id-dv-event-flow-listener').load('plugins/wf/workflow/edit-flow-listener',{pid:o.pid,nodeId:o.taskKey});
};