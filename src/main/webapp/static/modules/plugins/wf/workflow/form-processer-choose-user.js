
$.namespace("plugins.wf.workflow.form_processer_choose");
/**
 * 表单内成员（用户，用户组）
 */
$.plugins.wf.workflow.form_processer_choose.init=function(o){
	//初始化表单内成员选择
	$.plugins.wf.workflow.form_processer_choose.winId = $.dialog({
		url:'plugins/wf/workflow/form-processer-choose',
		title:'表单内成员',
		width:700,
		height:350,
		modal:true,
		buttons:[
           {text:'确定',class:'btn btn-primary btn-sm',click:function(){
        	   o.callback($("#id-form-processer-choose-user").serialize());
        	   $('#' + $.plugins.wf.workflow.form_processer_choose.winId).dialog('close');
		   }},
		   {text:'取消',class:'btn btn-default btn-sm',click:function(){
			   $('#' + $.plugins.wf.workflow.form_processer_choose.winId).dialog('close');
		   }}
		]
	});
};