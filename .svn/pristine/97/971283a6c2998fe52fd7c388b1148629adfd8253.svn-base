//@ sourceURL=edit.js
/**
 * 菜单编辑
 */
$.namespace("system.screen.edit");
	$.system.screen.edit.init=function(o){
		//页面顶级容器
		$.system.screen.edit.container = $('#id-edit-form-screen');
		
		var validator = $("#id-edit-form-screen",$.system.screen.edit.container).validate({
			rules : {
				screenName : {
					required : true
				}
			},
			submitHandler:function(form){
				//$.plugins.wf.workflow.user_task.saveFormEvent();
			}
		});
		
		var screenId=$("#id-edit-screenId",$.system.screen.edit.container).val();
		if(''==screenId){
			$("#id-screen-head-edit",$.system.screen.edit.container).addClass("hide");
		}else{
			$("#id-screen-head-add",$.system.screen.edit.container).addClass("hide");
		}
	};
	//新增或保存方法
	$.system.screen.edit.screenSave=function(){
		var form = $("#id-edit-form-screen");
		if(!form.valid()){
			return false;
		}
		$.ajax({
			url:"system/screen/save",
			type: "post",
			data:$('#id-edit-form-screen').serialize(),
			success:function(data){
				$.toast("保存成功"); 
				$('#' + $.system.screen.screenWinId).dialog('close');
				$.system.screen.screenFresh();
			},
			error:function(er){
				layer.alert("保存失败",{icon:2});
			}
		});
	};
