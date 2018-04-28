
//@ sourceURL=userpropertyedit.js
$.namespace("system.user.property.edit");

$.system.user.property.edit.userPropertyEdit= function(){
	var form = $("#id-edit-form-user-property",$.system.user.property.edit.container);
	if(!form.valid()){
		return false;
	}
	$.ajax({
		type:'post',
		dataType:'json',
		url:'system/user/property/save',
		data:$('#id-edit-form-user-property').serialize(),
		success:function(json){
			if(json.resultCode == 1){
				$.toast("保存成功");
				$('#' +$.system.user.property.manager.winId).dialog('close');
				$("#"+$.system.user.property.manager.gridId).jqGrid("setGridParam", {search: true }).trigger("reloadGrid");
			}else{
				$.toast("保存失败");
			}
		}
	});
	
};

//用户属性编码验证
$.validator.addMethod("checkPropertyCode", function(value, element) {
	return this.optional(element) || /^[a-zA-Z]+$/.test(value);
}, "属性编码由大小写英文字母组成");

$.system.user.property.edit.init=function(){
	$.system.user.property.edit.container = $("#wid-id-system-user-property-edit");
	
	$("#id-edit-form-user-property",$.system.user.property.edit.container).validate({
		rules : {
			propertyCode : {
				required : true,
				maxlength : 60,
				checkPropertyCode : true,
				remote : {
					type : "post",
					dateType : 'json',
					url : "system/user/property/isExistPropertyCode",
					data : {
						id : function() {
							return $("#id-edit-user-property",$.system.user.property.edit.container).val();
						},
						propertyCode : function() {
							return $("#id-user-propertyCode",$.system.user.property.edit.container).val();
						}
					}
				}
			},
			propertyName : {
				required : true,
				maxlength:60
			},
			regular:{
				maxlength:300
			},
			remark : {
				maxlength : 100
			}
		},
		messages : {
			propertyCode : {
				remote : "该属性已存在！"
			}
		}
	});
};