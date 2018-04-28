/**
 * 
 */
//@ sourceURL=managerdictionary.js
$.namespace("system.dictionary.manager");
$.system.dictionary.manager.init = function(){
	$.system.dictionary.manager.container = $("#wid-id-system-dictionary-manager");
	
	//初始化数据
	$.system.dictionary.manager.gridId=
	$.grid({
		container:$("#id-div-grid-table-dictionary",$.system.dictionary.manager.container),
		url:'system/dictionary/find-page',
		colNames:['ID','字典类型编码','字典类型名称','字典编码','字典值','排序','状态','备注'],
		colModel:[
			{name:'id',hidden:true,width:20},
			{name:'typeCode',edit:true,width:50},
			{name:'dictionaryName',edit:true,width:50},
			{name:'dictionaryCode',edit:true,width:50},
			{name:'dictionaryValue',edit:true,width:50},
			{name:'sortNum',edit:true,width:50},
			{name:'status',width:30,editable:true,align:'left',formatter:function(value,a,row,d){
				switch(value){
				case "A": return "有效";
				case "D": return "无效";
				}
				return "未知";
			}},
			{name:'remark',width:50,editable:true},
		]
	}); 
	
	
	//绑定enter事件
	$('#id-dictionaryName',$.system.dictionary.manager.container).bind("keydown",function(e){ 
		e=window.event||e; 
		switch(e.keyCode){
		case 13:
			$.system.dictionary.manager.search();
			return false;
		}
	});
	
}


//物理删除字典
$.system.dictionary.manager.del = function(){
	var ids=$("#"+$.system.dictionary.manager.gridId,$.system.dictionary.manager.container).jqGrid('getGridParam','selarrrow');
	if(ids.length == 0){
		$.toast('请选择至少一个数据字典!');
		return;
	}
	$.confirm('提示','确认删除吗？',function(b){
		if(b){
			$.ajax({
				sync:true,
				type: "POST",
				url: "system/dictionary/delet/"+ids,
				dataType:"json",
				success: function(json){
					if(json.resultCode==1){
						$.toast("删除成功！");
						$("#"+$.system.dictionary.manager.gridId,$.system.dictionary.manager.container).jqGrid("setGridParam", {search: true }).trigger("reloadGrid");
					}
				}
			});
		}
	});
};
//新增或编辑字典
$.system.dictionary.manager.edit = function(flag){
	var title_name = '';
	var url;
	if("A"==flag){
		title_name='新增';
		url='system/dictionary/edit';
	}else if("E"==flag){
		var ids=$("#"+$.system.dictionary.manager.gridId,$.system.dictionary.manager.container).jqGrid('getGridParam','selarrrow');
		if(ids.length != 1){
			$.toast('请选择一个数据字典!');
			return;
		}
		title_name='编辑';
		url='system/dictionary/edit/' + ids[0];
	}
	
	var buttons = [{text:'保存',class:'btn btn-primary btn-sm',click:function(){
		$.system.dictionary.edit.dictionaryEdit();
    }},
    {text:'取消',class:'btn btn-default btn-sm',click:function(){
	   $('#' +$.system.dictionary.manager.winId).dialog('close');
    }}];
	$.system.dictionary.manager.winId = $.dialog({
		url:url,
		title:title_name,
		width:700,
		height:600,
		modal:true,
		buttons:buttons
	});
}
//搜索按钮
$.system.dictionary.manager.search = function(){
	var postData = $("#"+$.system.dictionary.manager.gridId,$.system.dictionary.manager.container).jqGrid("getGridParam", "postData");
    $.extend(postData, { dictionaryName: $.trim($('#id-dictionaryName',$.system.dictionary.manager.container).val())});
	$("#"+$.system.dictionary.manager.gridId,$.system.dictionary.manager.container).jqGrid("setGridParam", { search: true }).trigger("reloadGrid", [{ page: 1}]);
}
