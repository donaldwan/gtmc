$.namespace('demo.leave.edit');
/**
 * 页面初始化
 */
$.demo.leave.edit.init = function(){
	$.demo.leave.edit.container = $('#demo-leave-edit');
	
	$("#form-edit-demo-leave",$.demo.leave.edit.container).validate({
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
	$('#bt-cancel',$.demo.leave.edit.container).click(function(){
		$('#' + $.demo.leave.editWinId).dialog('close');
	});
};

/**
 * 提交数据前触发的事件，在此可对表单进行验证。
 * 如果验证不通过，返回false
 * 如果验证通过，返回需要提交的数据(JSON)
 */
$.demo.leave.edit.beforeSend = function(){
	if($("#form-edit-demo-leave",$.demo.leave.edit.container).valid()){
		return $('#form-edit-demo-leave',$.demo.leave.edit.container).serializeJSON();
	}
};

/**
 * 数据提交后的回调
 */
$.demo.leave.edit.success = function(){
	//关闭窗口,刷新请假清单
	$('#' + $.demo.leave.editWinId).dialog('close');
	$('#' + $.demo.leave.gridId).trigger('reloadGrid');
};
