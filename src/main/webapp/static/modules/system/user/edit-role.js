$.namespace('system.role.set');

/**
 * 页面初始化
 */
$.system.role.set.init = function(){
	//页面顶级容器
	$.system.role.set.container = $('#system-role-set-manager');
	
	//初始化清单列表
	$.system.role.set.initGrid();
	
	//搜索
	$('#bt-search',$.system.role.set.container).click(function(){
		$.system.role.set.search();
	});
	
	//重置
	$('#bt-reset',$.system.role.set.container).click(function(){
		$('#form-search-system-role-set')[0].reset();
	});
};

/**
 * 初始化grid
 */
$.system.role.set.initGrid = function(){
	
	$.system.role.set.gridId = 
		$.grid({
			container:$('#grid-system-role-set',$.system.role.set.container),
			url : "system/role/find-page",
			multiselect:true,
			colNames:['id','status','角色名称','角色编号','状态','备注'],
			colModel:[
					{name : 'id', index : 'id',hidden:true}, 
					{name : 'status', index : 'status',hidden:true},
					{name : 'roleName', index : 'roleName'}, 
					{name : 'roleCode', index : 'roleCode'},
					{name : 'statusDesc', index : 'status',formatter:function(v,a,r,d){
						return r.status == 'A'?'有效':'禁用';
					},hidden:true},
					{name : 'remark', index : 'remark'}
			],
			loadComplete:function(){
				$.system.user.showUserRole($("#system-role-set-user-id",$.system.role.set.container).val());
			}
		});
};

/**
 * 列表搜索
 */
$.system.role.set.search = function(){
	$.search($("#form-search-system-role-set"),$.system.role.set.gridId);
	
//	var postData = $("#" + $.system.role.set.gridId).jqGrid("getGridParam", "postData");
//    $.extend(postData, $("#form-search-system-role-set").serializeJson());
//    $("#"+ $.system.role.set.gridId).jqGrid("setGridParam", { search: true }).trigger("reloadGrid", [{page: 1}]);
};