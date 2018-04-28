/**
 * 
 */
//@ sourceURL=userpropertymanager.js
$.namespace("system.user.property.manager");
$.system.user.property.manager.init = function(){
	$.system.user.property.manager.container = $("#wid-id-system-user-property-manager");
	
	//初始化数据
	$.system.user.property.manager.gridId=
	$.grid({
		container:$("#id-div-grid-table-user-property",$.system.user.property.manager.container),
		url:'system/user/property/find-page',
		autowidth:true,
		colNames:['ID','属性编码','属性名称','属性值正则','备注','状态'],
		colModel:[
			{name:'id',index:'id',hidden:true,width:20},
			{name:'propertyCode',index:'propertyCode',edit:true,width:50},
			{name:'propertyName',index:'propertyName',edit:true,width:50},
			{name:'regular',index:'regular',edit:true,width:120},
			{name:'remark',index:'remark',edit:true,width:100},
			{name:'status',index:'status',width:30,editable:true,align:'left',formatter:function(value,a,row,d){
				switch(value){
				case "A": return "有效";
				case "D": return "无效";
				}
				return "未知";
			}}
		]
	}); 
	
	
	//绑定enter事件
	$('#id-user-propertyName,#id-user-propertyCode',$.system.user.property.manager.container).bind("keydown",function(e){ 
		e=window.event||e; 
		switch(e.keyCode){
		case 13:
			$.system.user.property.manager.search();
			return false;
		}
	});
	
}

//用户属性状态调整
$('#bt-change-user-property-status',$.system.user.property.container).click(function(){
	var ids = $("#" + $.system.user.property.manager.gridId).jqGrid('getGridParam','selarrrow');
	if(ids.length !=1){
		$.toast('请选择一行数据!');
		return;
	}
	$.confirm('提示','确认调整吗？',function(b){
		if(b){
			$.ajax({
				sync:true,
				type: "POST",
				url: "system/user/property/change-status?id="+ids[0],
				dataType:"json",
				success: function(json){
					if(json.resultCode == 1){
						$('#' + $.system.user.property.manager.gridId).trigger('reloadGrid');
						$.toast("操作成功！");
					}
				}
			});
		}
	});
});

//新增或编辑用户属性
$.system.user.property.manager.edit = function(flag){
	var title_name = '';
	var url;
	if("A"==flag){
		title_name='新增';
		url='system/user/property/edit';
	}else if("E"==flag){
		var ids=$("#"+$.system.user.property.manager.gridId,$.system.user.property.manager.container).jqGrid('getGridParam','selarrrow');
		if(ids.length != 1){
			$.toast('请选择一条数据!');
			return;
		}
		title_name='编辑';
		url='system/user/property/edit/' + ids[0];
	}
	
	var buttons = [{text:'保存',class:'btn btn-primary btn-sm',click:function(){
		$.system.user.property.edit.userPropertyEdit();
    }},
    {text:'取消',class:'btn btn-default btn-sm',click:function(){
	   $('#' +$.system.user.property.manager.winId).dialog('close');
    }}];
	$.system.user.property.manager.winId = $.dialog({
		url:url,
		title:title_name,
		width:700,
		height:450,
		modal:true,
		buttons:buttons
	});
}
//搜索按钮
$.system.user.property.manager.search = function(){
	var postData = $("#"+$.system.user.property.manager.gridId,$.system.user.property.manager.container).jqGrid("getGridParam", "postData");
    $.extend(postData, { propertyName: $.trim($('#id-user-propertyName',$.system.user.property.manager.container).val()),
    	propertyCode: $.trim($('#id-user-propertyCode',$.system.user.property.manager.container).val()),
    	status: $.trim($('#id-status',$.system.user.property.manager.container).val())});
	$("#"+$.system.user.property.manager.gridId,$.system.user.property.manager.container).jqGrid("setGridParam", { search: true }).trigger("reloadGrid", [{ page: 1}]);
}
