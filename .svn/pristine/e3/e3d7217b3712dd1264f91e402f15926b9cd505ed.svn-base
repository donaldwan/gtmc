$.namespace('demo.wftest.claim');
/**
 * 页面初始化
 */
$.demo.wftest.claim.init = function(){
	$.demo.wftest.claim.container = $('#demo-wftest-task-claim');
};

/**
 * 提交数据前触发的事件，在此可对表单进行验证。
 * 如果验证不通过，返回false
 * 如果验证通过，返回需要提交的数据(JSON)
 */
$.demo.wftest.claim.beforeSend = function(){
	return $('#form-edit-demo-cliam',$.demo.wftest.claim.container).serializeJSON();
};

/**
 * 数据提交后的回调
 */
$.demo.wftest.claim.success = function(){
	//刷新我的任务列表
	$('#' + $.demo.wftest.mytask.gridId).trigger('reloadGrid');
};
