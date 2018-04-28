$.namespace("plugins.wf.usergroup.choose.edit");

$.plugins.wf.usergroup.choose.edit.init =function(){
	$.plugins.wf.usergroup.choose.edit.container = $("#win-id-plugin-wf-usergroup-edit-choose");
	$.plugins.wf.usergroup.choose.edit.validateInit();
};
/**
 * 保存信息
 */
$.plugins.wf.usergroup.choose.edit.userGroupEdit = function(){
	var form = $("#id-edit-form-usergroup-choose",$.plugins.wf.usergroup.choose.edit.container);
	if(!form.valid()){
		return false;
	}
	$.ajax({
		type:'post',
		dataType:'json',
		url:'plugins/wf/usergroup/save',
		data:form.serialize(),
		success:function(json){
			if(json.resultCode == 1){
				$.toast("保存成功");
				$('#'+$.plugins.wf.usergroup.manager_choose.editWinId).dialog('close');
				$("#"+$.plugins.wf.usergroup.manager_choose.gridId,$.plugins.wf.usergroup.manager_choose.container).jqGrid("setGridParam", {search: true }).trigger("reloadGrid");
			}else{
				$.toast("保存失败");
			}
		}
	});
	
};

$.plugins.wf.usergroup.choose.edit.validateInit = function(){
	var ex = UM.getEditor('expressionEditor', {
        toolbar: [
            'undo redo | bold italic underline strikethrough | superscript subscript | forecolor backcolor | removeformat selectall cleardoc |',
            'insertorderedlist insertunorderedlist | fontfamily fontsize paragraph',
            '| justifyleft justifycenter justifyright justifyjustify'
        ]
    });
	$.plugins.wf.usergroup.choose.edit.expressionEditor = ex;
	
    var tc = $("#id-expression", $.plugins.wf.usergroup.choose.edit.container);
    var tx = $("#id-expressionText",$.plugins.wf.usergroup.choose.edit.container);
    ex.setContent(tc.val());
    ex.addListener('contentchange',function(){
        tc.val(ex.getContent());
        tx.val(ex.getContentTxt());
    });
    //BUG FIX
    ex.addListener('keydown',function(type, event){
        if(event.keyCode == 8){
            event.stopPropagation();
        }
    });
	
	
	$("#id-edit-form-usergroup",$.plugins.wf.usergroup.choose.edit.container).validate({		
		rules : {
			groupName : {
				required : true,
				maxlength : 40,				
				remote : {
					type : "post",
					dateType : 'json',
					url : "plugins/wf/usergroup/find-by-name-code",
					data : {
						groupName : function() {
							return $("#id-groupName",$.plugins.wf.usergroup.choose.edit.container).val();
						},
						id : function(){
							return $("#id-groupId",$.plugins.wf.usergroup.choose.edit.container).val();
						}
					}
				}
			},
			expression : {
				required : true
			}
		},
		messages : {
			groupName : {
				remote : "用户组重复...."
			}
		}
	});
};
