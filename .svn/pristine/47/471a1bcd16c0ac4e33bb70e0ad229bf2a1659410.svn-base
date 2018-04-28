/**
 * 工作流Flow事件监听设置
 * 陈万东
 * chenwandong@intasect.com.cn
 * 2016-12-27
 */
$.namespace('plugins.wf.workflow.editflowlistener');

/**
 * 初始化
 */
$.plugins.wf.workflow.editflowlistener.init = function(o){
	$.plugins.wf.workflow.editflowlistener.form = $('#user-task-flow-listener');
	
	$('[id^=select-type-]',$.plugins.wf.workflow.editflowlistener.form).change(function(){
		var flowid = $(this).attr('flowid');
		if($(this).val() == 'B'){
			$('#dv-bean-' + flowid,$.plugins.wf.workflow.editflowlistener.form).show();
			$('#dv-script-' + flowid,$.plugins.wf.workflow.editflowlistener.form).hide();
		}else{
			$('#dv-bean-' + flowid,$.plugins.wf.workflow.editflowlistener.form).hide();
			$('#dv-script-' + flowid,$.plugins.wf.workflow.editflowlistener.form).show();
		}
	});
	
	$('[id^=select-type-]',$.plugins.wf.workflow.editflowlistener.form).change();
	
	$('[id^=bt-save-]',$.plugins.wf.workflow.editflowlistener.form).click(function(){
		$.plugins.wf.workflow.editflowlistener.save($(this).attr('flowid'),$(this).attr('flowName'));
	});
};

/**
 * 保存(一条走线一个保存)
 */
$.plugins.wf.workflow.editflowlistener.save = function(flowid,flowName){
	var type = $('#select-type-' + flowid,$.plugins.wf.workflow.editflowlistener.form).val();
	var beanId = $.trim($('#beanId-' + flowid,$.plugins.wf.workflow.editflowlistener.form).val());
	var script = $.trim($('#text-script-' + flowid,$.plugins.wf.workflow.editflowlistener.form).val());
	if(type == 'B' && beanId == ''){
		$.toast('请填写BeanId！');
		return false;
	}else if(type == 'S' && script == ''){
		$.toast('请填写脚本！');
		return false;
	}
	
	var pid = $('#id-pid',$.plugins.wf.workflow.editflowlistener.form).val();
	
	$.ajax({
		sync:true,
		url:'plugins/wf/workflow/save-node-event',
		type:'post',
		dataType:'json',
		data:{taskDefKey:flowid,processType:type,beanId:beanId,processScript:script,actProcdefId:pid,taskDefName:flowName,eventType:'B'},
		success:function(json){
			if(json.resultCode == 1){
				$.toast('保存成功');
			}else{
				layer.alert('保存失败',{icon: 2});
			}
		}
	});
};