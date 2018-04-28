$.namespace('demo.leave');
$.demo.leave.pdk = 'WF_LEAVE';//流程定义key
/**
 * 页面初始化
 */
$.demo.leave.init = function(){
	//页面顶级容器
	$.demo.leave.container = $('#demo-leave-manager');
	
	//初始化清单列表
	$.demo.leave.initGrid();
	
	//搜索
	$('#bt-search',$.demo.leave.container).click(function(){
		$.toast('未开发...');
		//$.demo.leave.search();
		//$.search($("#form-search-system-resource"),$.demo.leave.gridId);
	});
	
	//重置
	$('#bt-reset',$.demo.leave.container).click(function(){
		$.toast('未开发...');
		//$('#form-search-system-resource')[0].reset();
	});
	
	//打开新增窗口
	$('#bt-add',$.demo.leave.container).click(function(){
		$.demo.leave.openEditWindow('');
	});
	
	//编辑
	$('#bt-edit',$.demo.leave.container).click(function(){
		var ids = $("#" + $.demo.leave.gridId).jqGrid('getGridParam','selarrrow');
		if(ids.length !=1){
			$.toast('请选择一行数据!');
			return;
		}
		
		//通常对数据的编辑,只有数据的创建人才能进行修改编辑(Demo中未进行限制)
		var row = $('#' + $.demo.leave.gridId).jqGrid('getRowData',ids[0]);
		if(!(row.procInstId == null || row.procInstId == '')){
			$.toast('只能对草稿状态的数据进行编辑!');
			return;
		}
		
		$.demo.leave.openEditWindow(ids[0]);
	});
	
	//我的任务
	$('#bt-mytask',$.demo.leave.container).click(function(){
		$.demo.leave.openMytaskWin();
	});
	
	//删除
	$('#bt-delete',$.demo.leave.container).click(function(){
		var ids = $("#" + $.demo.leave.gridId).jqGrid('getGridParam','selarrrow');
		if(ids.length !=1){
			$.toast('请选择一行数据!');
			return;
		}
		$.confirm('提示','确定要删除吗?',function(b){
			if(b){
				$.ajax({
					url:'system/resource/delete',
					sync:true,
					data:{id:ids[0]},
					dataType:'json',
					success:function(json){
						$.toast('删除成功!');
						$('#' + $.demo.leave.gridId).trigger('reloadGrid');
					}
				});
			}
		});
	});
	
	//明细查看
	$('#bt-detail',$.demo.leave.container).click(function(){
		var ids = $("#" + $.demo.leave.gridId).jqGrid('getGridParam','selarrrow');
		if(ids.length !=1){
			$.toast('请选择一行数据!');
			return;
		}
		$.viewWfDetail({
			processDefinitionKey:$.demo.leave.pdk,
			businessKey:ids[0]
		});
	});
};

/**
 * 初始化grid
 */
$.demo.leave.initGrid = function(){
	
	$.demo.leave.gridId = 
		$.grid({
			container:$('#grid-demo-leave',$.demo.leave.container),
			url : "demo/leave/find-page",
			colNames:['ID','是否草稿','流程状态','业务状态','请假人','请假开始日期','请假结束日期','请假原因','流程实例ID'],
			colModel:[
					{name : 'id', index : 'id',width:100,hidden:true},
					{name : 'draft', index : 'draft',width:30,align:'center',sortable:false,formatter:function(v,a,r,d){
						return r.procInstId == null || r.procInstId == ''?'Y':'N';
					}},
					{name : 'wfStatus', index : 'wfStatus',width:50,align:'center'},
					{name : 'status', index : 'status',width:50,align:'center'},
					{name : 'createdUserName', index : 'createdUserName',width:50,align:'center'},
					{name : 'beginDate', index : 'beginDate',width:50,align:'center'}, 
					{name : 'endDate', index : 'endDate',width:50,align:'center'},
					{name : 'reasion', index : 'reasion',width:200},
					{name : 'procInstId', index : 'procInstId',hidden:true}
			]
		});
};

/**
 * 打开编辑窗口
 */
$.demo.leave.openEditWindow = function(id){
	
	$.demo.leave.editWinId = 
		$.dialog({
				url:'demo/leave/edit?id=' + id,
				title:'请假申请编辑',
				width:600,
				height:400,
				modal:true
			});
};

/**
 * 打开我的任务窗口
 */
$.demo.leave.openMytaskWin = function(){
	$.demo.leave.mytaskWinId = 
		$.dialog({
				url:'demo/leave/my-task',
				title:'我的任务',
				width:$(window).width() * 0.9,
				height:$(window).height() * 0.9,
				modal:true
		});
};