/**
 * 工作流代理设定列表查询
 * 高晓丹
 * gaoxiaodan@intasect.com.cn
 * 2017-01-16
 */

//命名空间，避免js名称冲突
$.namespace('plugins.wf.proxy.manager');

/**
 * 初始化页面
 */
$.plugins.wf.proxy.manager.init = function(){
	$.plugins.wf.proxy.manager.container = $("#div-id-plugins-wf-proxy");
	
	$.plugins.wf.proxy.manager.initGrid();
	$.plugins.wf.proxy.manager.dataArr = [];
	$.plugins.wf.proxy.manager.preDataArr = [];
	
	$("#id-form-search2",$.plugins.wf.proxy.manager.container).validate({
		errorClass : 'help-block',
		rules: {
			proxyUserName: {
				required:true
			},
			startDate:{
				required:true,
				compareDate:'#id-end-date',
				compareNowDate:true
			},
			endDate:{
				required:true,
				compareNowDate:true
			}
		},
		messages: {
			startDate:{
				compareDate:'开始日期必须小于等于结束日期',
				compareNowDate:'开始日期必须大于当前日期'
			},
			endDate:{
				compareNowDate:'结束日期必须大于当前日期'
			}
		}
	});
};

/**
 * 初始化grid组件
 */
$.plugins.wf.proxy.manager.initGrid = function(){
	$.plugins.wf.proxy.manager.gridId = 
		$.grid({
		    minHeight:455,
			container:$('#dv-plugins-wf-proxy',$.plugins.wf.proxy.manager.container),
			url:'plugins/wf/workflow/find-page',
			multiselect : false,
			colNames:['ID','工作流名称','工作流编码','状态'],
//			autowidth:true,
			colModel : [
				{name:'id',index:'id',hidden:true},
				{name:'wfName',index:'wfName',width:100},
				{name:'actProcdefKey',index:'actProcdefKey'},
				{name:'status',index:'status',width:50,formatter:function(value,a,row,d){
					switch(value){
						case "A": return "有效";
						case "D": return "无效";
					}
					return "未知";
				}}
			],
			onSelectRow : function(id) {
				rowData = $("#"+$.plugins.wf.proxy.manager.gridId).jqGrid("getRowData",id);
				if(rowData!=null){
					var postData = $("#"+$.plugins.wf.proxy.manager.gridId2).jqGrid("getGridParam", "postData");
					$.extend(postData, { actProcdefKey: rowData.actProcdefKey});
					$("#"+$.plugins.wf.proxy.manager.gridId2).jqGrid("setGridParam", { search: true }).trigger("reloadGrid", [{ page: 1}]);
				}
			}
		});
	$.plugins.wf.proxy.manager.gridId2 = 
		$.grid({
			noPager:true,
			rowNum : 100000000,
			scroll_y : true,
			container:$('#dv-plugins-wf-add',$.plugins.wf.proxy.manager.container),
			url:'plugins/wf/proxy/find-custom-page',
			postData:{actProcdefKey:'0'},
			multiselect : false,
			colNames:['ID','流程编码','代理人Id','代理人','开始时间','结束时间'],
			colModel : [
			            {name:'id',index:'id',hidden:true},
			            {name:'actProcdefKey',index:'actProcdefKey',hidden:true},
			            {name:'proxyUserId',index:'proxyUserId',hidden:true},
			            {name:'proxyUserName',index:'proxyUserName',width:150},
			            {name:'startDate',index:'startDate',width:150},
			            {name:'endDate',index:'endDate',width:150}]
		});
};

/**
 * 列表搜索
 */
$.plugins.wf.proxy.manager.search=function(){
	var postData = $('#' + $.plugins.wf.proxy.manager.gridId,$.plugins.wf.proxy.manager.container).jqGrid("getGridParam", "postData");
    $.extend(postData, { wfName: $('#id-wf-name').val(),actProcdefKey: $('#id-wf-code').val()});
	$('#' + $.plugins.wf.proxy.manager.gridId,$.plugins.wf.proxy.manager.container).jqGrid("setGridParam", { search: true }).trigger("reloadGrid", [{ page: 1}]);
};

/**
 * 打开用户选择窗口
 */
$.plugins.wf.proxy.manager.openProcesserWin = function(){
	$.chooseUser({
		callback:$.plugins.wf.proxy.manager.chooseUserBack
	});
}

/**
 * 选择用户后的回调
 */
$.plugins.wf.proxy.manager.chooseUserBack = function(dataArr){
	if(dataArr.length == 0){
		$.toast("至少选择一种人员");
		return false;
	}
	
	$.plugins.wf.proxy.manager.preDataArr = dataArr;
	
	var userName = "";
	for(var formData in dataArr){
		var user = dataArr[formData];
		userName = userName + user['name'] + ",";
	}
	if(userName != ""){
		$("#id-user-name",$.plugins.wf.proxy.manager.container).val(userName.substring(0,userName.length-1));
	}
	
	return true;
};

/**
 * 添加代理人
 */
$.plugins.wf.proxy.manager.saveProxy = function(){
	var form = $('#id-form-search2',$.plugins.wf.proxy.manager.container);
	if(!form.valid()){
		return false;
	}
	//流程相关
	var id=$("#"+$.plugins.wf.proxy.manager.gridId).jqGrid("getGridParam","selrow");
	if(!id){
		$.toast("请选择代理的流程！");
		return;
	}
	
	$.plugins.wf.proxy.manager.dataArr = [];
	var preDataArr = $.plugins.wf.proxy.manager.preDataArr;
	
	for(var formData in preDataArr){
		var dataArrObj = {};
		var user = preDataArr[formData];

		dataArrObj.proxyUserId = user['id'];
		dataArrObj.proxyUserName = user['name'];
		dataArrObj.startDate = $('[name="startDate"]',form).val();
		dataArrObj.endDate = $('[name="endDate"]',form).val();
		//流程相关
		var id=$("#"+$.plugins.wf.proxy.manager.gridId).jqGrid("getGridParam","selrow");
		rowData = $("#"+$.plugins.wf.proxy.manager.gridId).jqGrid("getRowData",id);
		dataArrObj.actProcdefKey = rowData.actProcdefKey;
		dataArrObj.wfName = rowData.wfName;
		
		$.plugins.wf.proxy.manager.dataArr.push(dataArrObj);
	}
	
	$.ajax({
	  url:"plugins/wf/proxy/save-proxy-batch",
	  type:"POST",
	  data:JSON.stringify($.plugins.wf.proxy.manager.dataArr),
	  contentType:"application/json; charset=utf-8",
	  dataType:"json",
	  success: function(json){
		  if(json.resultCode == 1){
				$.toast('保存成功');
				//清空数据
				$.plugins.wf.proxy.manager.dataArr = [];
	            $.plugins.wf.proxy.manager.preDataArr = [];
	            $.formReset('id-form-search2',$.plugins.wf.proxy.manager.container);
	
				//刷新代理人列表
	            $.plugins.wf.proxy.manager.refresh();
			}else{
				if(json.message == '不能选择本人作为代理人'){
					$.toast(json.message);
				}else{
					$.toast(json.message);
				}
			}
	  }
	});
}

/**
 * 刷新流程代理信息列表
 */
$.plugins.wf.proxy.manager.refresh = function(){
	var id=$("#"+$.plugins.wf.proxy.manager.gridId).jqGrid("getGridParam","selrow");
	rowData = $("#"+$.plugins.wf.proxy.manager.gridId).jqGrid("getRowData",id);
	if(rowData!=null){
		var postData = $("#"+$.plugins.wf.proxy.manager.gridId2).jqGrid("getGridParam", "postData");
		$.extend(postData, { actProcdefKey: rowData.actProcdefKey});
		$("#"+$.plugins.wf.proxy.manager.gridId2).jqGrid("setGridParam", { search: true }).trigger("reloadGrid", [{ page: 1}]);
	}
}

/**
 * 删除代理人
 */
$.plugins.wf.proxy.manager.del = function(){
	var id=$("#"+$.plugins.wf.proxy.manager.gridId2).jqGrid("getGridParam","selrow");
	if(id == null){
		$.toast("请选择要删除的代理信息！");
		return;
	}
	var rowData = $("#"+$.plugins.wf.proxy.manager.gridId2).jqGrid("getRowData",id);
	
	$.confirm('提示','确认删除吗？',function(b){
		if(b){
			$.ajax({
				sync:true,
				type: "POST",
				url: "plugins/wf/proxy/delete-proxy",
				data : {actProcdefKey:rowData.actProcdefKey,proxyUserId:rowData.proxyUserId},
				dataType:"json",
				success: function(json){
					if(json.resultCode == 1){
						$.toast('删除成功');
						$.plugins.wf.proxy.manager.refresh();
					}else{
						$.toast('删除失败');
					}
				}
			});
		}
	});
}
