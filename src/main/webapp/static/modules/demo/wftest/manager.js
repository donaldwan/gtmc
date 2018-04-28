$.namespace('demo.wftest');
$.demo.wftest.pdk = 'WF_GROOVY';//流程定义key
/**
 * 页面初始化
 */
$.demo.wftest.init = function(){
	//页面顶级容器
	$.demo.wftest.container = $('#demo-wftest-manager');
	$.demo.wftest.initGrid();
	//新增业务按钮
	$("#bt-add",$.demo.wftest.container).click(function(){
		$.demo.wftest.openEditWindow('');
	});
	//编辑流程
	$("#bt-edit",$.demo.wftest.container).click(function(){
		var ids = $("#" + $.demo.wftest.gridId).jqGrid('getGridParam','selarrrow');
		if(ids.length !=1){
			$.toast('请选择一行数据!');
			return;
		}
		//通常对数据的编辑,只有数据的创建人才能进行修改编辑(Demo中未进行限制)
		var row = $('#' + $.demo.wftest.gridId).jqGrid('getRowData',ids[0]);
		if(!(row.procInstId == null || row.procInstId == '')){
			$.toast('只能对草稿状态的数据进行编辑!');
			return;
		}
		$.demo.wftest.openEditWindow(ids[0]);
	});
	//我的任务
	$("#bt-mytask",$.demo.wftest.container).click(function(){
		$.demo.wftest.openMytaskWin();
	});
	//流程明细
	$("#bt-detail",$.demo.wftest.container).click(function(){
		$.toast("未开发.......");
	});
	//删除
	$("#bt-delete",$.demo.wftest.container).click(function(){
		$.toast("未开发.......");
	});
};

/**
 * 分页
 */
$.demo.wftest.initGrid = function(){
	$.demo.wftest.gridId = 
		$.grid({
			container:$('#grid-demo-wftest',$.demo.wftest.container),
			url : "demo/wftest/find-page",
			colNames:['ID','是否草稿','流程状态','业务状态','参数一','参数二','备注','流程实例ID'],
			colModel:[
					{name : 'id', index : 'id',width:100,hidden:true},
					{name : 'draft', index : 'draft',width:30,align:'center',sortable:false,formatter:function(v,a,r,d){
						return r.procInstId == null || r.procInstId == ''?'Y':'N';
					}},
					{name : 'wfStatus', index : 'wfStatus',width:50,align:'center'},
					{name : 'status', index : 'status',width:50,align:'center'},
					{name : 'paramA', index : 'paramA',width:50,align:'center'}, 
					{name : 'paramB', index : 'paramB',width:50,align:'center'},
					{name : 'reasion', index : 'reasion',width:200,align:'center'},
					{name : 'procInstId', index : 'procInstId',hidden:true}
			]
		});
};

/**
 * 打开编辑窗口
 */
$.demo.wftest.openEditWindow = function(id){	
	$.demo.wftest.editWinId = 
		$.dialog({
				url:'demo/wftest/edit?id=' + id,
				title:'测试流程申请编辑',
				width:600,
				height:400,
				modal:true
		});
};

/**
 * 打开我的任务窗口
 */
$.demo.wftest.openMytaskWin = function(){
	$.demo.wftest.mytaskWinId = 
		$.dialog({
				url:'demo/wftest/my-task',
				title:'我的任务',
				width:$(window).width() * 0.6,
				height:$(window).height() * 0.6,
				modal:true
		});
};
