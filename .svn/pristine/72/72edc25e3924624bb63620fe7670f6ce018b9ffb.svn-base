$.namespace('demo.wftest.mytask');
/**
 * 页面初始化
 */
$.demo.wftest.mytask.init = function(){
	//页面顶级容器
	$.demo.wftest.mytask.container = $('#demo-wftest-my-task');
	
	//初始化清单列表
	$.demo.wftest.mytask.initGrid();
	
	//对任务进行处理
	$('#bt-complete',$.demo.wftest.mytask.container).click(function(){
		var ids = $("#" + $.demo.wftest.mytask.gridId).jqGrid('getGridParam','selarrrow');
		if(ids.length !=1){
			$.toast('请选择一行数据!');
			return;
		}
		//
		var row = $('#' + $.demo.wftest.mytask.gridId).jqGrid('getRowData',ids[0]);
		
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
			width:750,
			height:400,
			businessKey:ids[0],			
			processDefinitionKey:$.demo.wftest.pdk,
			loaded:function(){
				$.toast('表单处理页面加载完成...');
			}
		});
		
	});
};

/**
 * 初始化grid
 */
$.demo.wftest.mytask.initGrid = function(){
	
	$.demo.wftest.mytask.gridId = 
		$.grid({
			container:$('#grid-my-task-wftest-demo',$.demo.wftest.mytask.container),
			url : "demo/wftest/find-page-for-task",
			colNames : ['ID','流程状态','业务状态','参数一','参数二','备注','流程实例ID','任务ID'],
			height : 300,
			colModel : [
					{name : 'id', index : 'id',width:100,hidden:true},
					{name : 'wfStatus', index : 'wfStatus',width:50,align:'center'},
					{name : 'status', index : 'status',width:50,align:'center'},
					{name : 'paramA', index : 'paramA',width:50,align:'center'}, 
					{name : 'paramB', index : 'paramB',width:50,align:'center'},
					{name : 'reasion', index : 'reasion',width:200,align:'center'},
					{name : 'procInstId', index : 'procInstId',hidden:true},
					{name : 'taskId', index : 'taskId',hidden:true},
			]
		});
};

