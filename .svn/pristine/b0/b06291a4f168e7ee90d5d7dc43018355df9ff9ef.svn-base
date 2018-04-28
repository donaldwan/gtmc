$.namespace('plugins.wf.usergroup.manager_choose');

/**
 * 初始化页面
 */
$.plugins.wf.usergroup.manager_choose.init = function(){
	$.plugins.wf.usergroup.manager_choose.container = $("#win-id-plugin-wf-usergroup-manager-choose");
	$.plugins.wf.usergroup.manager_choose.initGrid();
};

/**
 * 初始化用户组grid 
 */
$.plugins.wf.usergroup.manager_choose.initGrid = function(){	
	//初始化数据
	$.plugins.wf.usergroup.manager_choose.gridId = $.grid({
		container:$("#grid-plugin-wf-usergroup-choose",$.plugins.wf.usergroup.manager_choose.container),
		url:'plugins/wf/usergroup/find-page',
		colNames:['id','用户组名称','脚本','状态','创建人'],
		postData:{'status':'A'},
		height:365,
		colModel:[
			{name:'id',hidden:true,width:20},
			{name:'groupName',edit:true,width:50,align:'center'},
			{name:'expression',edit:true,width:50,align:'center',hidden:true},
			{name:'status',edit:true,align:'center',width:50,formatter:function(value,a,row,d){
				switch(value){
				case "A": return "有效";
				case "D": return "无效";
				}
				return "未知";
			}},
			{name:'createdUserName',align:'center',edit:true,width:50}
		],
	    onSelectRow:function(rowid,status,e){	    	
	    	var postData = $("#"+ $.plugins.wf.usergroup.manager_choose.gridParamId,$.plugins.wf.usergroup.manager_choose.container).jqGrid("getGridParam", "postData");
		    $.extend(postData,{userGroupId:rowid});
			$("#"+ $.plugins.wf.usergroup.manager_choose.gridParamId,$.plugins.wf.usergroup.manager_choose.container).jqGrid("setGridParam", { search: true }).trigger("reloadGrid", [{ page: 1}]);
			$("#userGroupId",$.plugins.wf.usergroup.manager_choose.container).val(rowid);
	    }
	}); 
	$.plugins.wf.usergroup.manager_choose.initParamGrid();
};

/**
 * 初始化用户组参数grid
 */
$.plugins.wf.usergroup.manager_choose.initParamGrid = function(){
	$.plugins.wf.usergroup.manager_choose.gridParamId = 
		$.grid({
			noPager:true,
			rowNum : 100000000,
			scroll_y : true,
			height:390,
			rownumbers : false,
			container:$('#id-plugin-wf-usergroup-param-table-choose',$.plugins.wf.usergroup.manager_choose.container),
			url:'plugins/wf/usergroupParam/find-page',			
			colNames:['ID','userGroupId','paramType','参数类型','参数名称','参数值'],
			colModel : [
		            {name:'id',index:'id',hidden:true},
		            {name:'userGroupId',index:'userGroupId',hidden:true},
		            {name:'paramTypeCode',hidden:true,formatter:function(value,a,row,d){
						return row.paramType;
					}},
		            {name:'paramType',edit:true,align:'center',width:50,formatter:function(value,a,row,d){
						switch(value){
							case "bp": return "上下文参数";
							case "re": return "返回值参数";
							case "from": return "表单参数";
							case "sys": return "系统参数";
						}
						return "未知";
					}},
		            {name:'paramName',index:'paramName',width:50,align:'center',formatter:function(value,a,row,d){
		            	var str = "";
		            	if(row.paramType=="sys"){
		            		str = value +"-->"+ row.sysParamType;
		            	}else{
		            		str = value;
		            	}
		            	return str;
					}},
		            {name:'paramValue',index:'paramValue',width:50,align:'center'}
		    ]
		});
};

$.plugins.wf.usergroup.manager_choose.statusChange = function(id,status){
	$.confirm('提示','确认修改状态吗？',function(b){
		if(b){
			$.ajax({
				sync:true,
				type: "POST",
				url: "plugins/wf/usergroup/update/"+id+"/"+status,
				dataType:"json",
				success: function(json){
					if(json.resultCode==1){
						$.toast("操作成功！");
						$("#"+$.plugins.wf.usergroup.manager_choose.gridId,$.plugins.wf.usergroup.manager_choose.container).jqGrid("setGridParam", {search: true }).trigger("reloadGrid");
					}else{
						$.toast("操作失败！");
					}
				}
			});
		}
	});
};

/**
 * 编辑用户组
 */
$.plugins.wf.usergroup.manager_choose.editUserGroup = function(flag){
	var title_name = '用户组-';
	var url="plugins/wf/usergroup/editChoose";
	if("A"==flag){
		title_name+='新增';
	}else if("E"==flag){
		var ids=$("#"+$.plugins.wf.usergroup.manager_choose.gridId,$.plugins.wf.usergroup.manager_choose.container).jqGrid('getGridParam','selarrrow');
		if(ids.length != 1){
			$.toast('请选择一个用户组!');
		    return;
		}
		title_name+='编辑';
		url=url+'/' + ids[0];
	}
	var buttons = [{text:'保存',class:'btn btn-primary btn-sm',click:function(){
		$.plugins.wf.usergroup.choose.edit.userGroupEdit();
    }},
    {text:'取消',class:'btn btn-default btn-sm',click:function(){       
	    $('#' +$.plugins.wf.usergroup.manager_choose.editWinId).dialog('close');
    }}];
	$.plugins.wf.usergroup.manager_choose.editWinId = $.dialog({
		url:url,
		title:title_name,
		width:860,
		height:690,
		modal:true,
		buttons:buttons,
		close :function(){
			if($.plugins.wf.usergroup.choose.edit.expressionEditor){
				$.plugins.wf.usergroup.choose.edit.expressionEditor.destroy();
			}
		}
	});
};

/**
 * 选择参数信息
 */
$.plugins.wf.usergroup.manager_choose.editUserGroupParamSys = function(){
	var title_name = '用户组参数-选择';
	var userGroupId = $("#userGroupId",$.plugins.wf.usergroup.manager_choose.container).val();
	if(userGroupId == null || userGroupId ==""){
		$.toast('请选择一个用户组!');
		return;
	}
	var url='plugins/wf/usergroup/edit-param-sys-choose/'+userGroupId;
	var buttons = [{text:'保存',class:'btn btn-primary btn-sm',click:function(){
		$.plugins.wf.usergroup.editParamSys_choose.save();		
    }},
    {text:'取消',class:'btn btn-default btn-sm',click:function(){       
	   $('#' +$.plugins.wf.usergroup.manager_choose.editParamSysWinId).dialog('close');
    }}];
	$.plugins.wf.usergroup.manager_choose.editParamSysWinId = $.dialog({
		url:url,
		title:title_name,
		width:460,
		height:320,
		modal:true,
		buttons:buttons
	});
};

/**
 * 编辑用户组参数信息
 */
$.plugins.wf.usergroup.manager_choose.editUserGroupParam = function(flag){
	var title_name = '用户组参数-';
	var url = "plugins/wf/usergroup/edit-param-choose/";
	var userGroupId = $("#userGroupId",$.plugins.wf.usergroup.manager_choose.container).val();
	if(userGroupId == null || userGroupId ==""){
		$.toast('请选择一个用户组!');
		return;
	}
	if("A"==flag){
		title_name+='新增';
		url=url+userGroupId+'/'+flag;
	}else if("E"==flag){
		title_name+='编辑';
		var ids=$("#"+$.plugins.wf.usergroup.manager_choose.gridParamId,$.plugins.wf.usergroup.manager_choose.container).jqGrid('getGridParam','selarrrow');
		if(ids.length != 1){
			$.toast('请选择一个用户租参数!');
		    return;
		}
		var rowId=$("#"+$.plugins.wf.usergroup.manager_choose.gridParamId,$.plugins.wf.usergroup.manager_choose.container).jqGrid("getGridParam","selrow");
		var rowData = $("#"+$.plugins.wf.usergroup.manager_choose.gridParamId,$.plugins.wf.usergroup.manager_choose.container).jqGrid("getRowData",rowId);
		if(rowData.paramTypeCode =='sys'){
			$.toast("系统参数不能进行编辑！");
			return false;
		}
		url=url+ids[0]+'/'+flag;
	}
	var buttons = [{text:'保存',class:'btn btn-primary btn-sm',click:function(){
		$.plugins.wf.usergroup.choose.editParam.save();
    }},
    {text:'取消',class:'btn btn-default btn-sm',click:function(){       
	   $('#' +$.plugins.wf.usergroup.manager_choose.editParamWinId).dialog('close');
    }}];
	$.plugins.wf.usergroup.manager_choose.editParamWinId = $.dialog({
		url:url,
		title:title_name,
		width:460,
		height:320,
		modal:true,
		buttons:buttons
	});
};

/**
 * 删除用户组信息
 */
$.plugins.wf.usergroup.manager_choose.deleteUserGroup =function(){
	var ids=$("#"+$.plugins.wf.usergroup.manager_choose.gridId,$.plugins.wf.usergroup.manager_choose.container).jqGrid('getGridParam','selarrrow');
	if(ids.length == 0){
		$.toast('请选择至少一个数据用户组!');
	    return;
	}
	$.confirm('提示','确认删除吗？',function(b){
		if(b){
			$.ajax({
				sync:true,
				type: "POST",
				url: "plugins/wf/usergroup/delet/"+ids,
				dataType:"json",
				success: function(json){
					if(json.resultCode==1){
						$.toast("删除成功！");
						$("#"+$.plugins.wf.usergroup.manager_choose.gridId,$.plugins.wf.usergroup.manager_choose.container).jqGrid("setGridParam", {search: true }).trigger("reloadGrid");
						$("#"+$.plugins.wf.usergroup.manager_choose.gridParamId,$.plugins.wf.usergroup.manager_choose.container).jqGrid("setGridParam", { search: true }).trigger("reloadGrid", [{ page: 1}]);
					}
				}
			});
		}
	});
};

/**
 * 删除用户组参数信息
 */
$.plugins.wf.usergroup.manager_choose.deleteUserGroupParam = function(){
	var ids=$("#"+$.plugins.wf.usergroup.manager_choose.gridParamId,$.plugins.wf.usergroup.manager_choose.container).jqGrid('getGridParam','selarrrow');
	if(ids.length ==0){
		$.toast('请选择至少一个用户租参数!');
	    return;
	}
	
	$.confirm('提示','确认删除吗？',function(b){
		if(b){
			$.ajax({
				sync:true,
				type: "POST",
				url: "plugins/wf/usergroupParam/delet/"+ids,
				dataType:"json",
				success: function(json){
					if(json.resultCode==1){
						$.toast("删除成功！");
						$("#"+$.plugins.wf.usergroup.manager_choose.gridParamId,$.plugins.wf.usergroup.manager_choose.container).jqGrid("setGridParam", { search: true }).trigger("reloadGrid", [{ page: 1}]);
					}
				}
			});
		}
	});
};