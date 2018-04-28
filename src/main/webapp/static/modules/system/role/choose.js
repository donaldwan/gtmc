/**
 * 角色选择
 */
$.namespace("system.role.choose");

$.system.role.choose.init=function(o){
	
 	var buttons = [{text:'确定',class:'btn btn-primary btn-sm',click:function(){
 		var ids=$("#"+$.system.role.choose.gridId,$('#system-choose-role')).jqGrid('getGridParam','selarrrow');
 		var roleList = new Array();
 		for (var key in ids) {
 			  var obj = ids[key];
 			  var rowData = $("#"+$.system.role.choose.gridId,$('#system-choose-role')).jqGrid('getRowData',obj);
 			  if(""!=rowData){
 				  roleList.push(rowData);
 			  }
 		}
 		
 		if(roleList.length == 0){
 			$.toast("未选择角色！");
 			return;
 		}
 		
	     if(o.callback(roleList)){
	    	 $('#' + $.system.role.choose.winId).dialog('close'); 
	     }
   }},
   {text:'取消',class:'btn btn-default btn-sm',click:function(){
	   $('#' + $.system.role.choose.winId).dialog('close');
   }}];
 	
 	$.system.role.choose.winId = $.dialog({
		url:'system/role/choose',
		title:'角色选择',
		width:$(window).width() * 0.6,
		height:$(window).height() * 0.7,
		modal:true,
		buttons:buttons,
		success:function(){
			$.system.role.choose.initGridRole();
		}
	});
};

$.system.role.choose.initGridRole = function(){
	$.system.role.choose.gridId = $.grid({
		container:$('#grid-pager-system-role-choose'),
		url: 'system/role/find-page',  
		datatype: 'json',  
		colNames:['ID','角色名称','备注'],
		colModel:[
			{name:'id',index:'id',  sorttype:"int",hidden:true},
			{name:'roleName',index:'roleName',align:'left'},
			{name:'remark',index:'remark', align:'left'}
		]
	});
	
	$("#id-choose-role-name",$('#system-choose-role')).bind("keydown",function(e){
		e=window.event||e;
		switch(e.keyCode){
		case 13:
			$.system.role.choose.search();
			return false;
		}
	});
}

//刷新jqgrid
$.system.role.choose.search=function(){
	 var postData = $("#"+$.system.role.choose.gridId,$('#system-choose-role')).jqGrid("getGridParam", "postData");
	 $.extend(postData, { roleName: $("#id-choose-role-name",$('#system-choose-role')).val()});
	 $("#"+$.system.role.choose.gridId,$('#system-choose-role')).jqGrid("setGridParam", { search: true }).trigger("reloadGrid", [{ page: 1}]);
}
