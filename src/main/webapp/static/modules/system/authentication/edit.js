/**
 * 按钮权限编辑
 */
$.namespace("system.authentication.edit");
	$.system.authentication.edit.init=function(o){
		$.system.authentication.edit.container = $("#wid-id-plugins-system-auth-screen-edit");
		
		$.validator.addMethod("checkAuthCode", function(value, element) {
			return this.optional(element) || /^[A-Z_]+$/.test(value);
		}, "权限编码由大写字母和下划线组成");
		var validator = $("#id-form-auth",$.system.authentication.edit.container).validate({
			rules : {
				authName : {
					required : true
				},
				authCode : {
					required : true,
					checkAuthCode : true
				}
			},
			message:{
				authCode:{
					checkAuthCode : "权限编码由大写字母和下划线组成"
				}
			},
			submitHandler:function(form){
				//$.plugins.wf.workflow.user_task.saveFormEvent();
			}
		});
		
		var authId=$("#id-auth-id",$.system.authentication.edit.container).val();
		if(''==authId){
			$("#id-auth-head-edit",$.system.authentication.edit.container).addClass("hide");
		}else{
			$("#id-auth-head-add",$.system.authentication.edit.container).addClass("hide");
		}
	};
	//新增或保存方法
	 $.system.authentication.edit.authSave=function(){
		 var form = $("#id-form-auth",$.system.authentication.edit.container);
			if(!form.valid()){
				return false;
			}
		$.ajax({
			url:"system/authentication/save",
			type: "post",
			data:$("#id-form-auth",$.system.authentication.edit.container).serialize(),
			success:function(data){
				$.toast("保存成功"); 
				$('#' + $.system.screen.authWinId).dialog('close');
				$.system.screen.authFresh();
				$.system.screen.screenFresh();
			},
			error:function(er){
				$.toast("保存失败",{icon:2});
			}
		});
	};
