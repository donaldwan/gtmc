$.namespace('system.dept.choose');

$.system.dept.choose.init = function(o){
	
	var buttons = [{text:'确定',class:'btn btn-primary btn-sm',click:function(){
			var checkedLen = $('input[id^=choose_dept_]:checked',$('#' + $.system.dept.choose.chooseGridDeptId)).length;
			if(checkedLen == 0){
				$.toast('未选择部门！');
		    	return;
			}
			var depts = new Array();
			$.each($('input[id^=choose_dept_]:checked',$('#' + $.system.dept.choose.chooseGridDeptId)),function(i,n){
				depts.push({id:$(n).attr('deptId'),deptName:$(n).attr('deptName')});
			});
			
			if(o.callback(depts)){
				$('#' + $.system.dept.choose.winId).dialog('close');
			}
	   }},
	   {text:'取消',class:'btn btn-default btn-sm',click:function(){
		   $('#' + $.system.dept.choose.winId).dialog('close');
	   }}];
	
	$.system.dept.choose.winId = $.dialog({
		url:'system/dept/choose',
		title:'部门选择',
		width:600,
		height:500,
		modal:true,
		buttons:buttons,
		success:function(){
			$.system.dept.choose.initGridDept();
		}
	});
};

$.system.dept.choose.initGridDept = function(){
	$.system.dept.choose.chooseGridDeptId = $.grid({
		container:$('#grid-system-dept-choose'),
		treeGrid: true,  
		treeGridModel: 'adjacency',  
		ExpandColumn: 'deptName', 
		url: 'system/dept/find-all',
		datatype: 'json',  
		colNames: ['部门名称','部门编码'],  
	    colModel: [
	        {name:'deptName', index: 'deptName',width:70,formatter:function(v,a,r,d){
	        	return '<input type="checkbox" value="' + r.id + '" id="choose_dept_' + r.id + '" ' 
	        		+ ' parentId="' + (r.parentId?r.parentId:'') + '" deptId="' + r.id + '" deptName="' + v + '">'
	        		+ '<label>' + v + '</label>';
	        }},
	        {name:'deptCode',index:'deptCode',width:50}
	    ],  
	    onSelectRow: function(id){  
	    	//选择行选中复选框
	    	var deptNameEle = $("#"+ $.system.dept.choose.chooseGridDeptId).jqGrid('getRowData',id).deptName;
	    	$("#"+$($(deptNameEle)[0]).attr("id"))[0].checked = !$("#"+$($(deptNameEle)[0]).attr("id"))[0].checked;
	    	$(deptNameEle).get(0).checked = !$(deptNameEle).find("checkbox").is(":checked");
	    }, 
	    pager: "false",
	    rownumbers:false,
	    viewrecords: true,
	    treeReader : {
	        level_field: "level",
	        parent_id_field: "parentId",
	        leaf_field: "leaf",
	        expanded_field: "expanded"
	    },
	    height:240
	});
};