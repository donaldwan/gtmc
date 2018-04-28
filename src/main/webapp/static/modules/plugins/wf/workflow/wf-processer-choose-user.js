
$.namespace("plugins.wf.workflow.wf_processer_choose");
/**
 * 流程特定人员选择（流程启动人员，上一个节点处理人）
 */
$.plugins.wf.workflow.wf_processer_choose.init=function(o){
	$.plugins.wf.workflow.wf_processer_choose.winId = $.dialog({
		url:'plugins/wf/workflow/wf-processer-choose',
		title:'流程特定人员选择',
		width:320,
		height:300,
		modal:true,
		buttons:[
           {text:'确定',class:'btn btn-primary btn-sm',click:function(){
        	   var dataArr = [];
		    	$("[lang='process_type']").each(function(){
		    		var formData = {};
		    		if($(this)[0].checked == true){
		    			formData['processerId'] = $(this).attr("name");
		    			formData['processerName'] = $(this).val();
		    			dataArr.push(formData);
		    		}
		    	});
		        o.callback(dataArr);
        	   $('#' + $.plugins.wf.workflow.wf_processer_choose.winId).dialog('close');
		   }},
		   {text:'取消',class:'btn btn-default btn-sm',click:function(){
			   $('#' + $.plugins.wf.workflow.wf_processer_choose.winId).dialog('close');
		   }}
		]
	});
};