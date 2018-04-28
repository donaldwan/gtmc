$.namespace("plugins.wf.usergroup.editParam");

$.plugins.wf.usergroup.editParam.init =function(){
	$.plugins.wf.usergroup.editParam.container = $("#win-id-plugin-wf-usergroup-Param-edit");
	$.plugins.wf.usergroup.editParam.validateInit();
};

/**
 * 保存参数信息
 */
$.plugins.wf.usergroup.editParam.save = function(){
	var form = $("#id-edit-form-usergroup-param",$.plugins.wf.usergroup.editParam.container);
	if(!form.valid()){
		return false;
	}
	$.ajax({
		type:'post',
		dataType:'json',
		url:'plugins/wf/usergroupParam/save',
		data:form.serialize(),
		success:function(json){
			if(json.resultCode == 1){
				$.toast("保存成功");
				$('#'+$.plugins.wf.usergroup.manager.editParamWinId).dialog('close');
				var userGroupId = $("#id-userGroupId",$.plugins.wf.usergroup.editParam.container).val();
				var postData = $("#"+ $.plugins.wf.usergroup.manager.gridParamId,$.plugins.wf.usergroup.manager.container).jqGrid("getGridParam", "postData");
			    $.extend(postData,{userGroupId:json.object.userGroupId});
				$("#"+ $.plugins.wf.usergroup.manager.gridParamId,$.plugins.wf.usergroup.manager.container).jqGrid("setGridParam", { search: true }).trigger("reloadGrid", [{ page: 1}]);
			}else{
				$.toast("保存失败");
			}
		}
	});
};

$.plugins.wf.usergroup.editParam.validateInit = function(){
	$("#id-edit-form-usergroup-param",$.plugins.wf.usergroup.editParam.container).validate({		
		rules : {
			paramValue : {
				required : true,
				maxlength : 40
			},
			paramName : {
				required : true,
				maxlength : 40,
				remote : {
					type : "post",
					dateType : 'json',
					url : "plugins/wf/usergroupParam/checkParamName",
					data : {
						userGroupId : function(){
							return $("#id-userGroupId",$.plugins.wf.usergroup.editParam.container).val();
						},
						paramName : function() {
							return $("#id-paramName",$.plugins.wf.usergroup.editParam.container).val();
						}
					}
				}
			}
		},
		messages : {
			paramName : {
				remote : "该参数已存在！"
			}
		}
	});
};