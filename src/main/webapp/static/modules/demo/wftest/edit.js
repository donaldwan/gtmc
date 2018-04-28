$.namespace('demo.wftest.edit');
/**
 * 页面初始化
 */
$.demo.wftest.edit.init = function(){
	$.demo.wftest.edit.container = $('#demo-wftest-edit');
	
	$("#form-edit-demo-wftest",$.demo.wftest.edit.container).validate({
		rules:{
			beginDate:{
				required:true
			},
			endDate:{
				required:true
			},
			reasion:{
				required:true
			}
		}
	});
	
	//取消
	$('#bt-cancel',$.demo.wftest.edit.container).click(function(){
		$('#' + $.demo.wftest.editWinId).dialog('close');
	});
};

/**
 * 提交数据前触发的事件，在此可对表单进行验证。
 * 如果验证不通过，返回false
 * 如果验证通过，返回需要提交的数据(JSON)
 */
$.demo.wftest.edit.beforeSend = function(){
	if($("#form-edit-demo-wftest",$.demo.wftest.edit.container).valid()){
		return $('#form-edit-demo-wftest',$.demo.wftest.edit.container).serializeJSON();
	}
};

/**
 * 数据提交后的回调
 */
$.demo.wftest.edit.success = function(){
	//关闭窗口,刷新请假清单
	$('#' + $.demo.wftest.editWinId).dialog('close');
	$('#' + $.demo.wftest.gridId).trigger('reloadGrid');
};
