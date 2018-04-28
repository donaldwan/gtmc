/**
 * 流程实例监控查询
 * 高晓丹
 * gaoxiaodan@intasect.com.cn
 * 2016-06-13
 */

//命名空间，避免js名称冲突
$.namespace('plugins.wf.monitoring.manager');

/**
 * 初始化页面
 */
$.plugins.wf.monitoring.manager.init = function(o){
	$.plugins.wf.monitoring.manager.container = $("#wid-id-plugins-wf-monitoring-manager");
	$.plugins.wf.monitoring.manager.initGrid(o);
};

/**
 * 初始化grid组件
 */
$.plugins.wf.monitoring.manager.initGrid = function(o){
	$.plugins.wf.monitoring.manager.gridId = 
		$.grid({
			container:$('#dv-plugins-wf-monitoring',$.plugins.wf.monitoring.manager.container),
			url:'plugins/wf/monitoring/find-page',
			shrinkToFit:false,
			colNames:['ID','流程定义id','流程定义key','流程实例id','流程名称','业务ID','流程启动人','启动人名称','流程实例状态','流程当前状态','当前操作者','备注原因'],
			colModel : [
				{name:'id',index:'id',hidden:true},
				{name:'actProcdefId',index:'actProcdefId',width:360},
				{name:'actProcdefKey',index:'actProcdefKey',width:150},
				{name:'actInstanceId',index:'actInstanceId',width:260},
				{name:'wfName',index:'wfName',width:150},
				{name:'businessKey',index:'businessKey',width:260},
				{name:'applyUserId',index:'applyUserId',width:150},
				{name:'applyUserName',index:'applyUserName',width:150},
				{name:'status',index:'status',width:150,formatter:function(value,a,row,d){
					switch(value){
					case "RU": return "流程运行中";
					case "EN": return "流程正常结束";
					case "EO": return "流程异常结束";
					case "KI": return "流程被终止";
					case "OT": return "其他";
				}
				return "未知";
				}},
				{name:'wfStatus',index:'wfStatus',width:150},
				{name:'wfOperators',index:'wfOperators',width:150},
				{name:'reason',index:'reason',width:200},
			]
		});
	
};

/**
 * 跟踪弹框
 */
$.plugins.wf.monitoring.manager.openTrack = function(){
	
	var id=$("#"+$.plugins.wf.monitoring.manager.gridId).jqGrid("getGridParam","selrow");
	if(id == null){
		$.toast("请选择一条数据！");
		return;
	}
	rowData = $("#"+$.plugins.wf.monitoring.manager.gridId).jqGrid("getRowData",id);
	
	$.plugins.wf.monitoring.manager.trackWinId = $.dialog({
		url:'plugins/wf/monitoring/track?instanceId=' + rowData.actInstanceId + '&status=' + rowData.status,
		title:'流程跟踪',
		width:$(window).width() * 0.7,
        height:$(window).height() * 0.8,
		modal:true,
		success:function(){
			$.get('plugins/wf/definition/process-diagram',{processDefinitionKey:rowData.actProcdefKey,instanceId:rowData.actInstanceId},function(html){
	    			$("#id-div-wf-track-bottom-pic").append(html);
	    	  });
		}
	});
}

/**
 * 选择流程启动人员
 */
$.plugins.wf.monitoring.manager.chooseUser = function(){
	$.chooseUser({
		callback:function(data){
			$("#id-apply-user-id",$.plugins.wf.monitoring.manager.container).val(data[0].id);
			$("#id-apply-user-name",$.plugins.wf.monitoring.manager.container).val(data[0].name);
			$('#' + $.system.user.choose.winId).dialog('close');
		},
		multiselect:false
	});
}

/**
 * 列表搜索
 */
$.plugins.wf.monitoring.manager.search=function(){
	var postData = $('#' + $.plugins.wf.monitoring.manager.gridId,$.plugins.wf.monitoring.manager.container).jqGrid("getGridParam", "postData");
	
    $.extend(postData, {actProcdefKey:$('#id-act-procdef-key',$.plugins.wf.monitoring.manager.container).val(),
    	actInstanceId:$('#id-act-instance-id',$.plugins.wf.monitoring.manager.container).val(),
    	wfName: $('#id-wf-name',$.plugins.wf.monitoring.manager.container).val(),
    	businessKey: $('#id-business-key',$.plugins.wf.monitoring.manager.container).val(),
    	applyUserId:$('#id-apply-user-id',$.plugins.wf.monitoring.manager.container).val(),
    	applyUserName:$('#id-apply-user-name',$.plugins.wf.monitoring.manager.container).val(),
    	status:$('#id-status',$.plugins.wf.monitoring.manager.container).val(),
    	wfStatus:$('#id-wf-status',$.plugins.wf.monitoring.manager.container).val(),
    	wfOperators:$('#id-wf-operators',$.plugins.wf.monitoring.manager.container).val(),
	});
	$('#' + $.plugins.wf.monitoring.manager.gridId,$.plugins.wf.monitoring.manager.container).jqGrid("setGridParam", { search: true }).trigger("reloadGrid", [{ page: 1}]);
};

/**
 * 重置
 */
$.plugins.wf.monitoring.manager.reset = function(){
	$.formReset('id-form-search',$.plugins.wf.monitoring.manager.container);
	$("#id-apply-user-id",$.plugins.wf.monitoring.manager.container).val("");
}

/**
 * 终止流程实例
 */
$.plugins.wf.monitoring.manager.deleteProcessInstance = function(){
	
	var id=$("#"+$.plugins.wf.monitoring.manager.gridId).jqGrid("getGridParam","selrow");
	if(id == null){
		$.toast("请选择一条数据！");
		return;
	}
	rowData = $("#"+$.plugins.wf.monitoring.manager.gridId).jqGrid("getRowData",id);
	
	$.plugins.wf.monitoring.manager.stopWinId = $.dialog({
		title:'流程终止',
		url:'plugins/wf/monitoring/stop',
		width:500,
        height:300,
		modal:true,
		buttons:[{text:'保存',class:'btn btn-primary btn-sm',click:function(){
			var reason = $("#deleteProcessInstanceReason").val().trim();
	    	  if(reason == ""){
		    	  $.toast("终止原因不能为空");  
		    	  return;
	    	  }
	    	  $.ajax({
	  			url:"plugins/wf/monitoring/delete-process-instance?actProcdefId="+rowData.actProcdefId
		  			+"&actProcdefKey="+rowData.actProcdefKey
		  			+"&actInstanceId="+rowData.actInstanceId
		  			+"&businessKey="+rowData.businessKey
		  			+"&wfStatus="+rowData.wfStatus
		  			+"&reason="+reason,
	  			type: "post",
	  			success:function(data){
	  				$('#' + $.plugins.wf.monitoring.manager.stopWinId).dialog('close');
	  				$("#"+ $.plugins.wf.monitoring.manager.gridId).jqGrid("setGridParam", { search: true }).trigger("reloadGrid", [{ page: 1}]);
	  			},
	  			error:function(er){
	  				//alert(er);
	  			}
	    	  });
		}},
		{text:'取消',class:'btn btn-default btn-sm',click:function(){
			$('#' + $.plugins.wf.monitoring.manager.stopWinId).dialog('close');
		}}],
	});
}

/**
 * 查看明细
 * id:流程数据ID
 * procInstId:流程实例ID(如果是草稿，无此数据)
 */
$.plugins.wf.monitoring.manager.detail = function(){
	
	var id=$("#"+$.plugins.wf.monitoring.manager.gridId).jqGrid("getGridParam","selrow");
	if(id == null){
		$.toast("请选择一条数据！");
		return;
	}
	rowData = $("#"+$.plugins.wf.monitoring.manager.gridId).jqGrid("getRowData",id);
	
	//调用基盘提供的进入明细页面方法
	$.viewWfDetail({
		processDefinitionKey:rowData.actProcdefKey,
		businessKey:rowData.businessKey
	});
};