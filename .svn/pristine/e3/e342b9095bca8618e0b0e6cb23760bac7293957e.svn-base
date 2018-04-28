$.namespace("plugins.wf.usergroup.editParamSys_choose");

$.plugins.wf.usergroup.editParamSys_choose.init =function(){
	$.plugins.wf.usergroup.editParamSys_choose.container = $("#win-id-plugin-wf-usergroup-Param-Sys-edit-choose");	
};

/**
 * 参数类型事件
 */
$.plugins.wf.usergroup.editParamSys_choose.changeParamType = function(obj){
	if(obj.value =='bp'){
		$("#id-paramType-bp").show();
		$("#id-paramType-sys").hide();
	}
	if(obj.value =='sys'){
		$("#id-paramType-bp").hide();
		$("#id-paramType-sys").show();
	}
	$("#paramName",$.plugins.wf.usergroup.editParamSys_choose.container).val("");
	$("#paramValue",$.plugins.wf.usergroup.editParamSys_choose.container).val("");
};

/**
 * 选择特定上下文参数赋值
 */
$.plugins.wf.usergroup.editParamSys_choose.changeParamInfoBp = function(){
	var text=$("#paramInfoBp",$.plugins.wf.usergroup.editParamSys_choose.container).find("option:selected").text();  //获取Select选择的Text
	var value=$("#paramInfoBp",$.plugins.wf.usergroup.editParamSys_choose.container).val();  //获取Select选择的Value
	if(value == ""){
		$("#paramName",$.plugins.wf.usergroup.editParamSys_choose.container).val("");
		$("#paramValue",$.plugins.wf.usergroup.editParamSys_choose.container).val("");
	}else{
		$("#paramName",$.plugins.wf.usergroup.editParamSys_choose.container).val(text);
		$("#paramValue",$.plugins.wf.usergroup.editParamSys_choose.container).val(value);
	}
};

/**
 * 选择不同系统信息
 */
$.plugins.wf.usergroup.editParamSys_choose.selectSysInfo = function(){
	var paramInfoSys = $("#paramInfoSys",$.plugins.wf.usergroup.editParamSys_choose.container).val();
	if(paramInfoSys =='role'){
		$.chooseRole({
			callback:$.plugins.wf.usergroup.editParamSys_choose.chooseRoleBack
		});
	}
	if(paramInfoSys =='dept'){
		$.chooseDept({
			callback:$.plugins.wf.usergroup.editParamSys_choose.chooseDeptBack
		});
	}	
};

/**
 * 选择角色回调
 */
$.plugins.wf.usergroup.editParamSys_choose.chooseRoleBack = function(json){	
	if(json.length > 1){
		$.toast("一次只能选择一个角色");
		return false;
	}
	$("#paramName",$.plugins.wf.usergroup.editParamSys_choose.container).val("角色");
	$("#paramValue",$.plugins.wf.usergroup.editParamSys_choose.container).val("roleId");
	$("#sysParamType",$.plugins.wf.usergroup.editParamSys_choose.container).val(json[0].roleName);
	$("#sysParamValue",$.plugins.wf.usergroup.editParamSys_choose.container).val(json[0].id);
	$('#' + $.system.role.choose.winId).dialog('close'); 
};

/**
 * 选择部门回调
 */
$.plugins.wf.usergroup.editParamSys_choose.chooseDeptBack = function(json){	
	if(json.length > 1){
		$.toast("一次只能选择一个部门");
		return false;
	}
	$("#paramName",$.plugins.wf.usergroup.editParamSys_choose.container).val("部门");
	$("#paramValue",$.plugins.wf.usergroup.editParamSys_choose.container).val("deptId");
	$("#sysParamType",$.plugins.wf.usergroup.editParamSys_choose.container).val(json[0].deptName);
	$("#sysParamValue",$.plugins.wf.usergroup.editParamSys_choose.container).val(json[0].id);
	$('#' + $.system.dept.choose.winId).dialog('close');
};

/**
 * 保存参数信息
 */
$.plugins.wf.usergroup.editParamSys_choose.save = function(){
	var data = {};
	data.userGroupId = $("#id-userGroupId",$.plugins.wf.usergroup.editParamSys_choose.container).val();
	data.paramType = $("#paramType",$.plugins.wf.usergroup.editParamSys_choose.container).val();
	data.paramName = $("#paramName",$.plugins.wf.usergroup.editParamSys_choose.container).val();
	data.paramValue = $("#paramValue",$.plugins.wf.usergroup.editParamSys_choose.container).val();
	data.sysParamType = $("#sysParamType",$.plugins.wf.usergroup.editParamSys_choose.container).val();
	data.sysParamValue = $("#sysParamValue",$.plugins.wf.usergroup.editParamSys_choose.container).val();
	$.ajax({
		type:'post',
		dataType:'json',
		url:'plugins/wf/usergroupParam/save',
		data:data,
		success:function(json){
			if(json.resultCode == 1){
				$.toast("保存成功");
				$('#'+$.plugins.wf.usergroup.manager_choose.editParamSysWinId).dialog('close');
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
