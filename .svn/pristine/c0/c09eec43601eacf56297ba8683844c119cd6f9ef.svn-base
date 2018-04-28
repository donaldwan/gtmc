$.namespace('system.screen');

/**
 * 页面初始化
 */
$.system.screen.init = function(){
	//页面顶级容器
	$.system.screen.container = $('#system-screen-manager');
	
	//初始化清单列表
	$.system.screen.initGrid();
};

/**
 * 初始化grid
 */
$.system.screen.initGrid = function(){
	$.system.screen.gridId = $.grid({
		container:$('#grid-system-screen',$.system.screen.container),
		treeGrid: true,  
	    treeGridModel: 'adjacency',  
	    ExpandColumn: 'screenName', 
	    url: 'system/screen/find-all',  
	    datatype: 'json',  
	    colNames: ['菜单名称','菜单uri','权限名称【按钮名称】','打开方式','排序数字'],  
	    colModel: [  
	        {name:'screenName', index: 'screenName',width:30,formatter:function(v,a,r,d){
	        	return '<input type="checkbox" value="' + r.id + '" id="screen_' + r.id + '" parentId="' + r.parentId + '" screenId="' + r.id + '" >'
	        			+ '<label for="screen_' + r.id + '">' + v + '</label>';
	        }},
	        {name:'uri',index:'uri',editable:true,width:40},
	        {name:'auth',index:'auth',width:60,formatter:function(v,a,r,d){
	        	if(r.auths.length == 0)return '';
	        	var array = new Array();
	        	for(var i=0;i<r.auths.length;i++){
	        		var auth = r.auths[i];
	        		array.push('<label for="auth_' + auth['id'] + '">' + auth['authName'] + '</label>');
	        	}
	        	return array.join('&nbsp;&nbsp;');
	        }},
	        {name:'openType',index:'openType',editable:true,width:40,formatter:function(v,a,r,d){
	        	switch(v){
	        	case "D": return "默认方式";
	        	case "I": return "IFrame";
	        	}
	        	return "";
	        }},
	        {name:'sortNum',index:'sortNum',editable:true,width:15}
	        
	    ],  
	    pager: "false",
	    rownumbers:false,
	    viewrecords: true,
	    treeReader : {
	        level_field: "level",
	        parent_id_field: "parentId",
	        leaf_field: "leaf",
	        expanded_field: "expanded"
	    },
	    onSelectRow:function(rowid,status,e){
	    	var postData = $("#"+ $.system.screen.gridIdScreenAuth,$.system.screen.container).jqGrid("getGridParam", "postData");
		    $.extend(postData,{screenId:rowid});
			$("#"+ $.system.screen.gridIdScreenAuth,$.system.screen.container).jqGrid("setGridParam", { search: true }).trigger("reloadGrid", [{ page: 1}]);
			$('#id-screen-parentId',$.system.screen.container).val(rowid);
			var rowData = $('#'+$.system.screen.gridId,$.system.screen.container).jqGrid('getRowData',rowid);
			$('#id-screen-parentName',$.system.screen.container).val($(rowData.screenName).val());
	    },
	    loadComplete:function(){
	    	$('#grid-system-screen',$.system.screen.container).find("input[type='checkbox']").hide();
	    },
	    treeIcons:{
	    	minus:'fa fa-folder-open',
	    	leaf:'fa fa-folder-o'
	    }
	});
	
	//权限表格
	$.system.screen.gridIdScreenAuth=
		$.grid({
			container:$('#id-screen-auth-table',$.system.screen.container),
			url:'system/authentication/find-by-screen',
			datatype: "json",
			mtype:'POST',
			multiselect:true,
			multiboxonly:true,
			colNames:['ID','权限名称','权限编码'],
			colModel:[
				{name:'id',index:'id', sorttype:"String",hidden:true},
				{name:'authName',index:'authName',edit:true,width:100},
				{name:'authCode',index:'authCode',edit:true,width:150}
			]
		});
};


//新增或打开菜单编辑框
$.system.screen.editScreen = function(flag){
	var screenId=$("#id-screen-parentId",$.system.screen.container).val();
	var url;
	var title;
	var id;
	if('A' == flag){
		url='system/screen/edit-screen?parentScreenId='+screenId+'&screenId=';
		title='新增菜单';
	}else if('E' == flag){
		id = $('#id-screen-parentId',$.system.screen.container).val();
		if(id == '' || id == null || id == undefined){
			$.toast("请选择要编辑的菜单！");
			return;
		}
		url='system/screen/edit-screen?parentScreenId=&screenId='+id;
		title='编辑菜单';
	}
	
	$.system.screen.screenWinId = $.dialog({
		url:url,
		title:title,
		width:600,
        height:350,
		modal:true,
		buttons:[{text:'保存',class:'btn btn-primary btn-sm',click:function(){
			$.system.screen.edit.screenSave();
		}},
		{text:'取消',class:'btn btn-default btn-sm',click:function(){
			$('#' + $.system.screen.screenWinId).dialog('close');
		}}]
	});
};

//配置菜单资源
$.system.screen.authScreenResoure=function(){
	var screenAuthParentName=$('#id-screen-parentName',$.system.screen.container).val();
	var screenAuthParentId=$('#id-screen-parentId',$.system.screen.container).val();
	
	var rowid = $('#id-screen-parentId',$.system.screen.container).val();
	var rowData = $('#'+$.system.screen.gridId,$.system.screen.container).jqGrid('getRowData',rowid);
	
	var isleaf = rowData.leaf;
	if("false"==isleaf){
		$.toast("请选择根节点菜单！");
		return;
	}
	if(''==screenAuthParentName){
		//如果只选择了菜单
		$.toast("请先选择菜单！");
		return;
	}
	
	$.system.screen.screenResourceWinId = $.dialog({
		url:'system/screen/auth-screen-resource?screenId='+screenAuthParentId+"&screenName="+screenAuthParentName,
		title:'菜单资源权限管理',
		width:900,
        height:700,
		modal:true,
		buttons:[{text:'保存',class:'btn btn-primary btn-sm',click:function(){
			$.system.screen.auth.resource.addResource();
		}},
		{text:'取消',class:'btn btn-default btn-sm',click:function(){
			$('#' + $.system.screen.screenResourceWinId).dialog('close');
		}}]
	});
};

//删除菜单
$.system.screen.delScreen = function(){
	var id = $('#id-screen-parentId',$.system.screen.container).val();
	if(id == '' || id == null || id == undefined){
		$.toast("请选择要删除的菜单！");
		return;
	}
	
	$.confirm('提示','是否删除本菜单？删除后，其子菜单也将被删除，并且不可恢复',function(b,dialog){
		if(b){
			$.ajax({
				type:'post',
				dataType:'json',
				url:'system/screen/del-screen?id='+id,
				success:function(json){
					if(json.resultCode == 1){
						$.system.screen.screenFresh();
						
						$('#id-screen-parentId',$.system.screen.container).val("");
						$('#id-screen-parentName',$.system.screen.container).val("");
					}else{
						$.toast('删除失败！');
					}
				}
			});
		}
	});
};

//权限新增或修改,flag:true新增，false,修改
$.system.screen.editAuth = function(flag){
	var screenId=$("#id-screen-parentId",$.system.screen.container).val();
	if("true"==flag){
		if(screenId == null || !screenId){
			$.toast('请先选择菜单');
			return false;
		}
		
		 $.system.screen.authWinId = $.dialog({
			url:'system/authentication/edit-auth-screen?screenId='+screenId,
			title:'新增权限',
			width:500,
	        height:250,
			modal:true,
			buttons:[{text:'保存',class:'btn btn-primary btn-sm',click:function(){
				$.system.authentication.edit.authSave();
			}},
			{text:'取消',class:'btn btn-default btn-sm',click:function(){
				$('#' + $.system.screen.authWinId).dialog('close');
			}}]
		});
	}else{
		var authIds=$("#"+$.system.screen.gridIdScreenAuth,$.system.screen.container).jqGrid('getGridParam','selarrrow');
		if(authIds.length == 0){
			$.toast('请先选择需要修改的权限');
			return;
		}
		if(authIds.length > 1){
			$.toast('请先选择一条数据进行编辑');
			return;
		}
		
		$.system.screen.authWinId = $.dialog({
			url:'system/authentication/edit-auth-screen?screenId='+screenId+"&authId="+authIds[0],
			title:'修改权限',
			width:500,
	        height:250,
			modal:true,
			buttons:[{text:'保存',class:'btn btn-primary btn-sm',click:function(){
				$.system.authentication.edit.authSave();
			}},
			{text:'取消',class:'btn btn-default btn-sm',click:function(){
				$('#' + $.system.screen.authWinId).dialog('close');
			}}]
		});
	}
};

//权限保存
$.system.screen.saveAuth = function(){
	$.ajax({
		type:'post',
		dataType:'json',
		url:'system/authentication/save',
		data:$('#id-form-auth-edit').serialize(),
		success:function(json){
			if(json.resultCode == 1){
				 $($.system.screen.authEditWindow ).dialog('close');
				 $('#id-screen-auth-table').jqGrid("setGridParam", {search: true }).trigger("reloadGrid");
			}else{
				 $.toast('保存失败');
			}
		}
	});
};

//配置权限资源
$.system.screen.authResource=function(){
	var screenAuthParentName=$('#id-screen-parentName',$.system.screen.container).val();
	var screenAuthParentId=$('#id-screen-parentId',$.system.screen.container).val();
	var url;
	
	var authIds=$("#"+$.system.screen.gridIdScreenAuth,$.system.screen.container).jqGrid('getGridParam','selarrrow');
	if(authIds.length == 0){
		$.toast('请先选择需要配置的权限');
		return;
	}
	if(authIds.length > 1){
		$.toast('请先选择一条数据进行资源配置');
		return;
	}
	var screenAuthName = $("#"+$.system.screen.gridIdScreenAuth,$.system.screen.container).jqGrid('getRowData',authIds[0]).authName;
	$.system.screen.authResourceWinId = $.dialog({
		url:'system/screen/auth-resource?authId='+authIds[0]+"&authName="+screenAuthName+"&authParentName="+screenAuthParentName,
		title:'按钮资源权限管理',
		width:$(window).width() * 0.6,
		height:$(window).height() * 0.7,
		modal:true,
		buttons:[{text:'保存',class:'btn btn-primary btn-sm',click:function(){
			$.system.screen.auth.resource.addResource();
		}},
		{text:'取消',class:'btn btn-default btn-sm',click:function(){
			$('#' + $.system.screen.authResourceWinId).dialog('close');
		}}]
	});
};

//删除权限
$.system.screen.delAuth = function(){
	var authIds=$("#"+$.system.screen.gridIdScreenAuth).jqGrid('getGridParam','selarrrow');
	if(""!=authIds){
		
		$.confirm('提示','是否删除本权限？删除后，已经配置该权限的角色，将会撤销该权限，并且数据不可恢复',function(b,dialog){
			if(b){
				$.ajax({
					type:'post',
					dataType:'json',
					url:'system/authentication/del-auths?authIds='+authIds,
					success:function(json){
						if(json.resultCode == 1){
							$.system.screen.screenFresh();
							$.system.screen.authFresh();
						}else{
							$.toast('删除失败！');
						}
					}
				});
			}
		});
		
	}else{
		$.toast("请选择要删除的权限。");
	}
};


//刷新菜单管理
$.system.screen.screenFresh = function(){
	$('#'+$.system.screen.gridId,$.system.screen.container).jqGrid("setGridParam", { search: true }).trigger("reloadGrid", [{ page: 1}]);
}

//刷新权限管理
$.system.screen.authFresh = function(){
	$("#"+ $.system.screen.gridIdScreenAuth).jqGrid("setGridParam", { search: true }).trigger("reloadGrid", [{ page: 1}]);
};