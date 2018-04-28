$.namespace('plugins.wf.usergroup.manager');

/**
 * 初始化页面
 */
$.plugins.wf.usergroup.manager.init = function(){
	$.plugins.wf.usergroup.manager.container = $("#win-id-plugin-wf-usergroup-manager");
	$.plugins.wf.usergroup.manager.initGrid();
};

/**
 * 初始化用户组grid 
 */
$.plugins.wf.usergroup.manager.initGrid = function(){	
	//初始化数据
	$.plugins.wf.usergroup.manager.gridId = $.grid({
		container:$("#grid-plugin-wf-usergroup",$.plugins.wf.usergroup.manager.container),
		url:'plugins/wf/usergroup/find-page',
		colNames:['id','用户组名称','脚本','状态','创建人','操作'],
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
			{name:'createdUserName',align:'center',edit:true,width:50},
			{name:'oper',index:'oper',align:'center',edit:true,width:50,formatter:function(value,a,row,d){
				var html = '';
				if(row.status == "A"){
					html = '<button class="btn btn-warning btn-xs" type="button" onclick="$.plugins.wf.usergroup.manager.statusChange(\''+row.id+'\',\''+row.status+'\')">禁用</button>';
				}else{
					html = '<button class="btn btn-success btn-xs" type="button" onclick="$.plugins.wf.usergroup.manager.statusChange(\''+row.id+'\',\''+row.status+'\')">启用</button>';
				}
				return html;
			}}
		],
	    onSelectRow:function(rowid,status,e){	    	
	    	var postData = $("#"+ $.plugins.wf.usergroup.manager.gridParamId,$.plugins.wf.usergroup.manager.container).jqGrid("getGridParam", "postData");
		    $.extend(postData,{userGroupId:rowid});
			$("#"+ $.plugins.wf.usergroup.manager.gridParamId,$.plugins.wf.usergroup.manager.container).jqGrid("setGridParam", { search: true }).trigger("reloadGrid", [{ page: 1}]);
			$("#userGroupId",$.plugins.wf.usergroup.manager.container).val(rowid);
	    }
	}); 
	$.plugins.wf.usergroup.manager.initParamGrid();
};

/**
 * 初始化用户组参数grid
 */
$.plugins.wf.usergroup.manager.initParamGrid = function(){
	$.plugins.wf.usergroup.manager.gridParamId = 
		$.grid({
			noPager:true,
			rowNum : 100000000,
			scroll_y : true,
			container:$('#id-plugin-wf-usergroup-param-table',$.plugins.wf.usergroup.manager.container),
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

$.plugins.wf.usergroup.manager.statusChange = function(id,status){
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
						$("#"+$.plugins.wf.usergroup.manager.gridId,$.plugins.wf.usergroup.manager.container).jqGrid("setGridParam", {search: true }).trigger("reloadGrid");
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
$.plugins.wf.usergroup.manager.editUserGroup = function(flag){
	var title_name = '用户组-';
	var url;
	if("A"==flag){
		title_name+='新增';
		url='plugins/wf/usergroup/edit';
	}else if("E"==flag){
		var ids=$("#"+$.plugins.wf.usergroup.manager.gridId,$.plugins.wf.usergroup.manager.container).jqGrid('getGridParam','selarrrow');
		if(ids.length != 1){
			$.toast('请选择一个用户组!');
		    return;
		}
		title_name+='编辑';
		url='plugins/wf/usergroup/edit/' + ids[0];
	}
	var buttons = [{text:'保存',class:'btn btn-primary btn-sm',click:function(){
		$.plugins.wf.usergroup.edit.userGroupEdit();
    }},
    {text:'取消',class:'btn btn-default btn-sm',click:function(){       
	    $('#' +$.plugins.wf.usergroup.manager.editWinId).dialog('close');
    }}];
	$.plugins.wf.usergroup.manager.editWinId = $.dialog({
		url:url,
		title:title_name,
		widthX:0.7,
		heightY:0.7,
		modal:true,
		buttons:buttons,
		close :function(){
			if($.plugins.wf.usergroup.edit.expressionEditor){
				$.plugins.wf.usergroup.edit.expressionEditor.destroy();
			}
		}
	});
};

/**
 * 选择参数信息
 */
$.plugins.wf.usergroup.manager.editUserGroupParamSys = function(){
	var title_name = '用户组参数-选择';
	var userGroupId = $("#userGroupId",$.plugins.wf.usergroup.manager.container).val();
	if(userGroupId == null || userGroupId ==""){
		$.toast('请选择一个用户组!');
		return;
	}
	var url='plugins/wf/usergroup/edit-param-sys/'+userGroupId;
	var buttons = [{text:'保存',class:'btn btn-primary btn-sm',click:function(){
		$.plugins.wf.usergroup.editParamSys.save();
		//$.toast("保存信息");
    }},
    {text:'取消',class:'btn btn-default btn-sm',click:function(){       
	   $('#' +$.plugins.wf.usergroup.manager.editParamSysWinId).dialog('close');
    }}];
	$.plugins.wf.usergroup.manager.editParamSysWinId = $.dialog({
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
$.plugins.wf.usergroup.manager.editUserGroupParam = function(flag){
	var title_name = '用户组参数-';
	var url;
	var userGroupId = $("#userGroupId",$.plugins.wf.usergroup.manager.container).val();
	if(userGroupId == null || userGroupId ==""){
		$.toast('请选择一个用户组!');
		return;
	}
	if("A"==flag){
		title_name+='新增';
		url='plugins/wf/usergroup/edit-param/'+userGroupId+'/'+flag;
	}else if("E"==flag){
		title_name+='编辑';
		var ids=$("#"+$.plugins.wf.usergroup.manager.gridParamId,$.plugins.wf.usergroup.manager.container).jqGrid('getGridParam','selarrrow');
		if(ids.length != 1){
			$.toast('请选择一个用户租参数!');
		    return;
		}
		var rowId=$("#"+$.plugins.wf.usergroup.manager.gridParamId,$.plugins.wf.usergroup.manager.container).jqGrid("getGridParam","selrow");
		var rowData = $("#"+$.plugins.wf.usergroup.manager.gridParamId,$.plugins.wf.usergroup.manager.container).jqGrid("getRowData",rowId);
		if(rowData.paramTypeCode =='sys'){
			$.toast("系统参数不能进行编辑！");
			return false;
		}
		url='plugins/wf/usergroup/edit-param/'+ids[0]+'/'+flag;
	}
	var buttons = [{text:'保存',class:'btn btn-primary btn-sm',click:function(){
		$.plugins.wf.usergroup.editParam.save();
    }},
    {text:'取消',class:'btn btn-default btn-sm',click:function(){       
	   $('#' +$.plugins.wf.usergroup.manager.editParamWinId).dialog('close');
    }}];
	$.plugins.wf.usergroup.manager.editParamWinId = $.dialog({
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
$.plugins.wf.usergroup.manager.deleteUserGroup =function(){
	var ids=$("#"+$.plugins.wf.usergroup.manager.gridId,$.plugins.wf.usergroup.manager.container).jqGrid('getGridParam','selarrrow');
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
						$("#"+$.plugins.wf.usergroup.manager.gridId,$.plugins.wf.usergroup.manager.container).jqGrid("setGridParam", {search: true }).trigger("reloadGrid");
						$("#"+$.plugins.wf.usergroup.manager.gridParamId,$.plugins.wf.usergroup.manager.container).jqGrid("setGridParam", { search: true }).trigger("reloadGrid", [{ page: 1}]);
					}
				}
			});
		}
	});
};

/**
 * 删除用户组参数信息
 */
$.plugins.wf.usergroup.manager.deleteUserGroupParam = function(){
	var ids=$("#"+$.plugins.wf.usergroup.manager.gridParamId,$.plugins.wf.usergroup.manager.container).jqGrid('getGridParam','selarrrow');
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
						$("#"+$.plugins.wf.usergroup.manager.gridParamId,$.plugins.wf.usergroup.manager.container).jqGrid("setGridParam", { search: true }).trigger("reloadGrid", [{ page: 1}]);
					}
				}
			});
		}
	});
};


/**
 * 弹窗测试
 */
$.plugins.wf.usergroup.manager.dilogTest = function(){
	$.plugins.wf.usergroup.manager.method_processer_groovy_winId = $.dialog({
		url:'plugins/wf/usergroup/manager-choose',
		title:'用户组脚本',
		width:996,
		height:700,
		modal:true,
		buttons:[
           {text:'确定',class:'btn btn-primary btn-sm',click:function(){
        	   $.toast("确定");
		   }},
		   {text:'取消',class:'btn btn-default btn-sm',click:function(){
			   $('#' + $.plugins.wf.usergroup.manager.method_processer_groovy_winId).dialog('close');
		   }}
		]
	});
};