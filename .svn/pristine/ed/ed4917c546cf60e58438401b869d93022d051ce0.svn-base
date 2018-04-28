$.namespace('demo.leave.claim');
/**
 * 页面初始化
 */
$.demo.leave.claim.init = function(){
	$.demo.leave.claim.container = $('#demo-leave-task-claim');
};

/**
 * 提交数据前触发的事件，在此可对表单进行验证。
 * 如果验证不通过，返回false
 * 如果验证通过，返回需要提交的数据(JSON)
 */
$.demo.leave.claim.beforeSend = function(){
	return $('#form-edit-demo-cliam',$.demo.leave.claim.container).serializeJSON();
};

/**
 * 数据提交后的回调
 */
$.demo.leave.claim.success = function(){
	//刷新我的任务列表
	$('#' + $.demo.leave.mytask.gridId).trigger('reloadGrid');
};
