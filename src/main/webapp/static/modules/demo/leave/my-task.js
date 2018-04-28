$.namespace('demo.leave.mytask');
/**
 * 页面初始化
 */
$.demo.leave.mytask.init = function(){
	//页面顶级容器
	$.demo.leave.mytask.container = $('#demo-leave-my-task');
	
	//初始化清单列表
	$.demo.leave.mytask.initGrid();
	
	//搜索
	$('#bt-search',$.demo.leave.mytask.container).click(function(){
		$.toast('未开发...');
		//$.demo.leave.search();
		//$.search($("#form-search-system-resource"),$.demo.leave.gridId);
	});
	
	//重置
	$('#bt-reset',$.demo.leave.mytask.container).click(function(){
		$.toast('未开发...');
		//$('#form-search-system-resource')[0].reset();
	});
	
	//对任务进行处理
	$('#bt-complete',$.demo.leave.mytask.container).click(function(){
		var ids = $("#" + $.demo.leave.mytask.gridId).jqGrid('getGridParam','selarrrow');
		if(ids.length !=1){
			$.toast('请选择一行数据!');
			return;
		}
		//
		var row = $('#' + $.demo.leave.mytask.gridId).jqGrid('getRowData',ids[0]);
		
		/**
		 * o.width:弹窗宽度(默认为浏览器窗口80%)
		 * o.height:弹窗高度(默认为浏览器窗口80%)
		 * o.loaded:任务处理窗口打开后的回调
		 * o.taskId:任务ID
		 * o.processDefinitionKey:流程定义key
		 * o.businessKey:业务ID
		 */
		
		//$.wfClaim({tid:row.taskId});
		$.wfClaim({
			businessKey:ids[0],
			processDefinitionKey:$.demo.leave.pdk,
			loaded:function(){
				$.toast('表单处理页面加载完成...');
			}
		});
		
	});
};

/**
 * 初始化grid
 */
$.demo.leave.mytask.initGrid = function(){
	
	$.demo.leave.mytask.gridId = 
		$.grid({
			container:$('#grid-my-task-leave-demo',$.demo.leave.mytask.container),
			url : "demo/leave/find-page-for-task",
			colNames:['ID','流程状态','业务状态','请假人','请假开始日期','请假结束日期','请假原因','流程实例ID','任务ID'],
			colModel:[
					{name : 'id', index : 'id',width:100,hidden:true},
					{name : 'wfStatus', index : 'wfStatus',width:50,align:'center'},
					{name : 'status', index : 'status',width:50,align:'center'},
					{name : 'createdUserName', index : 'createdUserName',width:50,align:'center'},
					{name : 'beginDate', index : 'beginDate',width:50,align:'center'}, 
					{name : 'endDate', index : 'endDate',width:50,align:'center'},
					{name : 'reasion', index : 'reasion',width:200},
					{name : 'procInstId', index : 'procInstId',hidden:true},
					{name : 'taskId', index : 'taskId',hidden:true},
			]
		});
};

