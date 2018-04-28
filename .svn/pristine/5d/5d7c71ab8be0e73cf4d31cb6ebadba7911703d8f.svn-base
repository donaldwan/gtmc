$.namespace('system.user.choose');

$.system.user.choose.init = function(o){
	
	  var buttons = [{text:'确定',class:'btn btn-primary btn-sm',click:function(){
		    var ids = $('#' + $.system.user.choose.gridUserId).jqGrid('getGridParam','selarrrow');
		    if(ids.length == 0){
		    	$.toast('未选择用户！');
		    	return;
		    }
		    if(o.multiselect!=undefined && !o.multiselect && ids.length > 1){
		    	$.toast('只能选择一个用户！');
		    	return;
		    }
		     var users = new Array();
		     for(var i=0;i<ids.length;i++){
		    	 users.push($('#' + $.system.user.choose.gridUserId).jqGrid('getRowData',ids[i]));
		     }
		     if(o.callback(users)){
		    	 $('#' + $.system.user.choose.winId).dialog('close'); 
		     }
	   }},
	   {text:'取消',class:'btn btn-default btn-sm',click:function(){
		   $('#' + $.system.user.choose.winId).dialog('close');
	   }}];
	
	$.system.user.choose.winId = $.dialog({
		url:'system/user/choose',
		title:'用户选择',
		width:1110,
		height:610,
		modal:true,
		buttons:buttons,
		success:function(){
			$.system.user.choose.initGridDept();
			$.system.user.choose.initGridUser();
		}
	});
};

$.system.user.choose.initGridDept = function(){
	$.system.user.choose.gridDeptId = $.grid({
		container:$('#grid-system-user-choose-dept'),
		treeGrid: true,  
		treeGridModel: 'adjacency',  
		ExpandColumn: 'deptName', 
		url: 'system/dept/find-all',
		datatype: 'json',  
		colNames: ['部门名称'],  
	   colModel: [
	        {name:'deptName', index: 'deptName',width:70}
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
	   height:298,
	   onSelectRow:function(rowid,status,e){
	    	var postData = $("#"+ $.system.user.choose.gridUserId,$.system.user.choose.container).jqGrid("getGridParam", "postData");
	    	delete postData.name;
	    	delete postData.empCode;
		    $.extend(postData,{deptId:rowid});
			$("#"+ $.system.user.choose.gridUserId,$.system.user.choose.container).jqGrid("setGridParam", { search: true }).trigger("reloadGrid", [{ page: 1}]);
	    }
	});
};

$.system.user.choose.initGridUser = function(){
	$.system.user.choose.gridUserId = $.grid({
		container:$('#grid-system-user-choose'),
		url: 'system/user/find-page',  
		datatype: 'json',  
		colNames: ['ID','姓名','员工编号','性别','电话','Email','部门'],
	    colModel: [
			{name: 'id', index: 'id', hidden:true},
	        {name:'name',index:'name',width:50},
	        {name:'empCode',index:'empCode',width:50},
	        {name:'sex',index:'sex',width:50,formatter:function(value,a,row,d){
					switch(value){
					case "W": return "女";
					case "M": return "男";
				}
				return "未知";
			}},
	        {name:'telephone',index:'telephone',width:50},
	        {name:'email',index:'email',width:50},
	        {name:'deptName',index:'deptName',width:50}
	    ],  
	    rownumbers:false,
	    viewrecords: true,
	    height:240
	});
};

/**
 * 搜索按钮
 */
$.system.user.choose.search=function(){
	var postData = $("#"+$.system.user.choose.gridUserId,$.system.user.choose.container).jqGrid("getGridParam", "postData");
	delete postData.deptId;
	$.extend(postData, { name: $("#id-choose-name",$.system.user.choose.container).val(),empCode: $("#id-choose-empCode",$.system.user.container).val()});
	$("#"+ $.system.user.choose.gridUserId,$.system.user.choose.container).jqGrid("setGridParam", { search: true }).trigger("reloadGrid", [{ page: 1}]);
};