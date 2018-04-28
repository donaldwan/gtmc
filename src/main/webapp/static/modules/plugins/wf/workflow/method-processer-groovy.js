$.namespace("plugins.wf.workflow.method_processer_groovy");
/**
 * 表单内成员（用户，用户组）
 */
$.plugins.wf.workflow.method_processer_groovy.init=function(o){
	//初始化表单内成员选择
	$.plugins.wf.workflow.method_processer_groovy.winId = $.dialog({
		url:'plugins/wf/usergroup/manager-choose',
		title:'用户组脚本',
		width: $(window).width() * 0.8,
        height: $(window).height() * 0.8,
		modal:true,
		buttons:[
           {text:'确定',class:'btn btn-primary btn-sm',click:function(){
        	   var rowIds = $("#"+$.plugins.wf.usergroup.manager_choose.gridId,$.plugins.wf.usergroup.manager_choose.container).jqGrid('getGridParam','selarrrow');
        	   if(rowIds.length < 1){
	       			$.toast('请选择至少一个用户组!');
	       		    return;
	       	   }
        	   var dataArr = [];
        	   for(var i = 0;i < rowIds.length;i++){
        		   var rowData =$("#"+$.plugins.wf.usergroup.manager_choose.gridId,$.plugins.wf.usergroup.manager_choose.container).jqGrid("getRowData",rowIds[i]);
        		   dataArr.push(rowData);
        	   }
        	   o.callback(dataArr);
        	   $('#' + $.plugins.wf.workflow.method_processer_groovy.winId).dialog('close');
		   }},
		   {text:'取消',class:'btn btn-default btn-sm',click:function(){
			   $('#' + $.plugins.wf.workflow.method_processer_groovy.winId).dialog('close');
		   }}
		]
	});
};