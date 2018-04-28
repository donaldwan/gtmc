$.namespace("plugins.wf.usergroup.choose.editParam");

$.plugins.wf.usergroup.choose.editParam.init =function(){
	$.plugins.wf.usergroup.choose.editParam.container = $("#win-id-plugin-wf-usergroup-param-choose-edit");
	$.plugins.wf.usergroup.choose.editParam.validateInit();
};

/**
 * 保存参数信息
 */
$.plugins.wf.usergroup.choose.editParam.save = function(){
	var form = $("#id-edit-form-usergroup-param-choose",$.plugins.wf.usergroup.choose.editParam.container);
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
				$('#'+$.plugins.wf.usergroup.manager_choose.editParamWinId).dialog('close');
				var userGroupId = $("#id-userGroupId",$.plugins.wf.usergroup.manager_choose.container).val();
				var postData = $("#"+ $.plugins.wf.usergroup.manager_choose.gridParamId,$.plugins.wf.usergroup.manager_choose.container).jqGrid("getGridParam", "postData");
			    $.extend(postData,{userGroupId:json.object.userGroupId});
				$("#"+ $.plugins.wf.usergroup.manager_choose.gridParamId,$.plugins.wf.usergroup.manager_choose.container).jqGrid("setGridParam", { search: true }).trigger("reloadGrid", [{ page: 1}]);
			}else{
				$.toast("保存失败");
			}
		}
	});
};

$.plugins.wf.usergroup.choose.editParam.validateInit = function(){
	$("#id-edit-form-usergroup-param-choose",$.plugins.wf.usergroup.choose.editParam.container).validate({		
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
							return $("#id-userGroupId",$.plugins.wf.usergroup.choose.editParam.container).val();
						},
						paramName : function() {
							return $("#id-paramName",$.plugins.wf.usergroup.choose.editParam.container).val();
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