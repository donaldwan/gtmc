
$.namespace("plugins.wf.workflow.method_processer_choose");
/**
 * 自定义方法
 */
$.plugins.wf.workflow.method_processer_choose.init=function(o){
	$.plugins.wf.workflow.method_processer_choose.winId = $.dialog({
		url:'plugins/wf/workflow/method-processer-choose',
		title:'自定义方法',
		width:700,
		height:350,
		modal:true,
		buttons:[
           {text:'确定',class:'btn btn-primary btn-sm',click:function(){
        	   o.callback($("#id-method-processer-choose").serialize());
        	   $('#' + $.plugins.wf.workflow.method_processer_choose.winId).dialog('close');
		   }},
		   {text:'取消',class:'btn btn-default btn-sm',click:function(){
			   $('#' + $.plugins.wf.workflow.method_processer_choose.winId).dialog('close');
		   }}
		]
	});
};