$.namespace("plugins.wf.usergroup.edit");

$.plugins.wf.usergroup.edit.init =function(){
	$.plugins.wf.usergroup.edit.container = $("#win-id-plugin-wf-usergroup-edit");
	$.plugins.wf.usergroup.edit.validateInit();
};
/**
 * 保存信息
 */
$.plugins.wf.usergroup.edit.userGroupEdit = function(){
	var form = $("#id-edit-form-usergroup",$.plugins.wf.usergroup.edit.container);
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
				$('#'+$.plugins.wf.usergroup.manager.editWinId).dialog('close');
				$("#"+$.plugins.wf.usergroup.manager.gridId,$.plugins.wf.usergroup.manager.container).jqGrid("setGridParam", {search: true }).trigger("reloadGrid");
			}else{
				$.toast("保存失败");
			}
		}
	});
	
};

$.plugins.wf.usergroup.edit.validateInit = function(){
	var ex = UM.getEditor('expressionEditor', {
        toolbar: [
            'undo redo | bold italic underline strikethrough | superscript subscript | forecolor backcolor | removeformat selectall cleardoc |',
            'insertorderedlist insertunorderedlist | fontfamily fontsize paragraph',
            '| justifyleft justifycenter justifyright justifyjustify'
        ]
    });
	$.plugins.wf.usergroup.edit.expressionEditor = ex;

    var tc = $("#id-expression", $.plugins.wf.usergroup.edit.container);
    var exTxt = $("#id-expressionText",$.plugins.wf.usergroup.edit.container);
    ex.setContent(tc.val());
    ex.addListener('contentchange',function(){
    	//console.log(ex.getContentTxt());
    	exTxt.val(ex.getContentTxt());
        tc.val(ex.getContent());
    });
    //BUG FIX
    ex.addListener('keydown',function(type, event){
        if(event.keyCode == 8){
            event.stopPropagation();
        }
    });
	
	
	$("#id-edit-form-usergroup",$.plugins.wf.usergroup.edit.container).validate({		
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
							return $("#id-groupName",$.plugins.wf.usergroup.edit.container).val();
						},
						id : function(){
							return $("#id-groupId",$.plugins.wf.usergroup.edit.container).val();
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
