$.namespace('system.user');

/**
 * 页面初始化
 */
$.system.user.init = function(){
	//页面顶级容器
	$.system.user.container = $('#system-user-manager');
	
	//初始化清单列表
	$.system.user.initGridDept();
	
	//初始化用户清单
	$.system.user.initGridUser();
	
	//新增同级部门
	$('#bt-add-same',$.system.user.container).click(function(){
		var id = $("#"+ $.system.user.gridDeptId,$.system.user.container).jqGrid('getGridParam','selrow');
		if(id == null){
			$.toast('请选择一个部门!');
			return;
		}
		var parentId = $("#"+ $.system.user.gridDeptId,$.system.user.container).jqGrid('getRowData',id).parentId;
		$.system.user.openDeptWin('',parentId);
	});
	
	//新增下级
	$('#bt-add-sub',$.system.user.container).click(function(){
		var id = $("#"+ $.system.user.gridDeptId,$.system.user.container).jqGrid('getGridParam','selrow');
		if(id == null){
			$.toast('请选择一个部门!');
			return;
		}
		var deptId = $("#"+ $.system.user.gridDeptId,$.system.user.container).jqGrid('getRowData',id).id;
		$.system.user.openDeptWin('',deptId);
	});
	
	//编辑部门
	$('#bt-edit-dept',$.system.user.container).click(function(){
		var id = $("#"+ $.system.user.gridDeptId,$.system.user.container).jqGrid('getGridParam','selrow');
		if(id == null){
			$.toast('请选择一个部门!');
			return;
		}
		var deptId = $("#"+ $.system.user.gridDeptId,$.system.user.container).jqGrid('getRowData',id).id;
		$.system.user.openDeptWin(deptId,'');
	});
	
	//删除部门
	$('#bt-delete-dept',$.system.user.container).click(function(){
		var id = $("#"+ $.system.user.gridDeptId,$.system.user.container).jqGrid('getGridParam','selrow');
		if(id == null){
			$.toast('请选择一个部门!');
			return;
		}
		var deptId = $("#"+ $.system.user.gridDeptId,$.system.user.container).jqGrid('getRowData',id).id;
		$.confirm('提示','确认删除吗？',function(b){
			if(b){
				$.ajax({
					sync:true,
					type: "POST",
					url: "system/dept/update-status?id="+deptId,
					dataType:"json",
					success: function(json){
						if(json.resultCode == 1){
							$('#' + $.system.user.gridDeptId).jqGrid('delRowData',deptId);
							$('#' + $.system.user.gridDeptId).trigger('reloadGrid');
							
							$.toast("删除成功！");
						}
					}
				});
			}
		});
	});
	
	//用户新增
	$('#bt-add',$.system.user.container).click(function(){
		$.system.user.openUserWin('');
	});
	
	//修改用户
	$('#bt-edit',$.system.user.container).click(function(){
		var ids = $("#" + $.system.user.gridUserId).jqGrid('getGridParam','selarrrow');
		if(ids.length !=1){
			$.toast('请选择一行数据!');
			return;
		}
		$.system.user.openUserWin(ids[0]);
	});
	
	//用户状态调整
	$('#bt-change-status',$.system.user.container).click(function(){
		var ids = $("#" + $.system.user.gridUserId).jqGrid('getGridParam','selarrrow');
		if(ids.length !=1){
			$.toast('请选择一行数据!');
			return;
		}
		$.confirm('提示','确认调整吗？',function(b){
			if(b){
				$.ajax({
					sync:true,
					type: "POST",
					url: "system/user/change-status?id="+ids[0],
					dataType:"json",
					success: function(json){
						if(json.resultCode == 1){
							$('#' + $.system.user.gridUserId).trigger('reloadGrid');
							$.toast("操作成功！");
						}
					}
				});
			}
		});
	});
	
	//用户角色配置
	$('#bt-role-set',$.system.user.container).click(function(){
		var ids = $("#" + $.system.user.gridUserId).jqGrid('getGridParam','selarrrow');
		if(ids.length !=1){
			$.toast('请选择一行数据!');
			return;
		}
		
		$.system.user.openRoleWindow(ids[0]);
		
//		loadURL({
//			url:'system/user/edit-role/'+ids[0],
//			title:'角色配置'
//		});
		
	});
};

/**
 * 打开用户角色配置窗口
 */
$.system.user.openRoleWindow = function(id){
	$.system.user.roleSetWinId = $.dialog({
		url:'system/user/edit-role/' + id,
		title:'角色配置',
		width:$(window).width() * 0.8,
        height:$(window).height() * 0.8,
		modal:true,
		buttons:[{text:'保存',class:'btn btn-primary btn-sm',click:function(){
			$.system.user.saveUserRole(id);
		}},
		{text:'取消',class:'btn btn-default btn-sm',click:function(){
			$('#' + $.system.user.roleSetWinId).dialog('close');
		}}]
	});
};

/**
 * 显示用户角色
 */
$.system.user.showUserRole = function(id){
	$.ajax({
		sync:true,
		type: "POST",
		url: "system/user/find-user-role?id="+id,
		dataType:"json",
		success: function(json){
			for(var i = 0; i < json.length; i++){
				$("#"+$.system.role.set.gridId).jqGrid('setSelection',json[i].roleId);
			}
		}
	});
};

/**
 * 保存用户角色
 */
$.system.user.saveUserRole = function(userId){
	var roleIds = $("#" + $.system.role.set.gridId).jqGrid('getGridParam','selarrrow');
	if(roleIds.length < 1){
		$.toast('请选择至少一种角色!');
		return;
	}
	var userRoleList = [];
	for(var i = 0; i < roleIds.length; i++){
		var userRole = {};
		userRole.userId = userId;
		userRole.roleId = roleIds[i];
		userRoleList.push(userRole);
	}
	$.ajax({
		sync:true,
		type: "POST",
		url: "system/user/save-user-role",
		data:JSON.stringify(userRoleList),
		contentType:"application/json; charset=utf-8",
		dataType:"json",
		success: function(json){
			if(json.resultCode == 1){
				$('#' + $.system.user.roleSetWinId).dialog('close');
				$.toast("保存成功！");
			}
		}
	});
};

/**
 * 初始化部门数据
 */
$.system.user.initGridDept = function(){
	$.system.user.gridDeptId = $.grid({
        minHeight:407,
		container:$('#grid-system-dept',$.system.user.container),
		treeGrid: true,  
		treeGridModel: 'adjacency',  
		ExpandColumn: 'deptName', 
		url: 'system/dept/find-all',  
		datatype: 'json',  
		colNames: ['部门ID','上级部门ID','部门名称','部门编码'],  
	    colModel: [
	        {name:'id',index:'id',hidden:true,width:50},
	        {name:'parentId',index:'parentId',hidden:true,width:50},
	        {name:'deptName', index: 'deptName',width:70},
	        {name:'deptCode',index:'deptCode',width:50}
	    ],  
	    pager: "false",
	    rownumbers:false,
	    viewrecords: true,
	    treeReader : {
	        level_field: "level",
	        parent_id_field: "parentId",
	        leaf_field: "leaf",
	        expanded_field: "expanded"
	    },
	    onSelectRow:function(rowid,status,e){
	    	var postData = $("#"+ $.system.user.gridUserId,$.system.user.container).jqGrid("getGridParam", "postData");
	    	delete postData.name;
	    	delete postData.empCode;
		    $.extend(postData,{deptId:rowid});
			$("#"+ $.system.user.gridUserId,$.system.user.container).jqGrid("setGridParam", { search: true }).trigger("reloadGrid", [{ page: 1}]);
	    },
	    treeIcons:{
	    	minus:'fa fa-folder-open',
	    	leaf:'fa fa-folder-o'
	    }
	});
};

/**
 * 打开部门编辑窗口
 */
$.system.user.openDeptWin = function(id,parentId){
	var buttons = [{text:'保存',class:'btn btn-primary btn-sm',click:function(){
		   $.system.user.saveDept();
	   }},
	   {text:'取消',class:'btn btn-default btn-sm',click:function(){
		   $('#' + $.system.user.deptWinId).dialog('close');
	   }}];
	
	//验证部门编码
	$.validator.addMethod("checkDeptCode", function (value, element) {
	    return this.optional(element) || /^[A-Z_]+$/.test(value);
	}, "部门编码由大写字母和下划线组成");
	
	$.system.user.deptWinId = $.dialog({
		url:'system/dept/edit?id=' + id + '&parentId=' + parentId,
		title:'部门编辑',
		width:600,
		height:380,
		modal:true,
		buttons:buttons,
		success:function(){
			$("#form-edit-system-dept").validate({
				rules:{
					deptName:{
						required:true,
						maxlength:66
					},
					deptCode:{
						maxlength:50,
						remote: {
                            type: "post",
                            dateType: 'json',
                            url: "system/dept/isExistDeptCode",
                            data: {
                                deptCode: function () {
                                    return $("#deptCode",$("#system-dept-edit")).val()
                                }
                            }
                        },
                        checkDeptCode:true
					}
				},
				messages: {
                    deptCode: {
                        remote: '部门编码已存在！'
                    }
                }
			});
		}
	});
};

/**
 * 保存部门
 */
$.system.user.saveDept = function(){
	if($("#form-edit-system-dept").valid()){
		$.ajax({
			sync:true,
			url:'system/dept/save',
			type:'post',
			dateType:'json',
			data:$("#form-edit-system-dept").serialize(),
			success:function(json){
				if(json.resultCode == 1){
					$.toast('保存成功!');
					$('#' + $.system.user.deptWinId).dialog('close');
					$('#' + $.system.user.gridDeptId).trigger('reloadGrid');
				}else{
					$.toast(json['message']);
				}
			}
		});
	}
};

/**
 * 初始化用户清单
 */
$.system.user.initGridUser = function(){
	var result = $.system.user.dynamicColumn();
	$.system.user.gridUserId = $.grid({
		container:$('#grid-system-user',$.system.user.container),
		url: 'system/user/find-custom-page2',  
		shrinkToFit:result.len>0?false:true,
		datatype: 'json',  
//		ajaxGridOptions: { contentType: 'application/json; charset=utf-8' },
		colNames: result.colNames,
	    colModel: result.colModel,  
	    rownumbers:false,
	    viewrecords: true
	});
};


$.system.user.dynamicColumn = function(){
	var result = {};
	$.ajax({
		async:false,
		url:'system/user/property/find-all',
		type:'post',
		dateType:'json',
		success:function(json){
			
			result.len = json.length!=undefined?json.length:0;
			result.colNames = ['姓名','工号','性别','电话','Email','部门','用户类型','状态'];
			result.colModel = [
					        {name:'name',index:'name',width:150},
					        {name:'empCode',index:'empCode',width:150},
					        {name:'sex',index:'sex',width:100,formatter:function(value,a,row,d){
									switch(value){
									case "W": return "女";
									case "M": return "男";
								}
								return "未知";
							}},
					        {name:'telephone',index:'telephone',width:150},
					        {name:'email',index:'email',width:150},
					        {name:'deptName',index:'deptName',width:150},
					        {name:'userType',index:'userType',width:150},
					        {name:'status',index:'status',width:100,formatter:function(value,a,row,d){
									switch(value){
									case "A": return "有效";
									case "D": return "无效";
								}
								return "未知";
							}}
					    ]
			
			for(var i = 0; i < json.length; i++){
				var model = {name:json[i].propertyCode,index:json[i].propertyCode,width:150};
				result.colNames.push(json[i].propertyName);
				result.colModel.push(model);
			}
		}
	})
	
	return result;
}

/**
 * 打开用户编辑窗口
 */
$.system.user.openUserWin = function(id){
	var buttons = [{text:'保存',class:'btn btn-primary btn-sm',click:function(){
		   $.system.user.saveUser();
	   }},
	   {text:'取消',class:'btn btn-default btn-sm',click:function(){
		   $('#' +$.system.user.userWinId).dialog('close');
	   }}];
	$.system.user.userWinId = $.dialog({
		url:'system/user/edit?id=' + id,
		title:'用户编辑',
		width:$(window).width()*0.4,
		height:$(window).height()*0.8,
		modal:true,
		buttons:buttons,
		success:function(){
			
			$('#deptName,#deptChoose',$('#system-user-edit')).click(function(){
				$.chooseDept({
					callback:function(ds){
						console.log(ds);
						if(ds.length != 1){
							$.toast('只能选择一个部门');
							return false;
						}
						$('#deptName',$('#system-user-edit')).val(ds[0].deptName);
						$('#deptId',$('#system-user-edit')).val(ds[0].id);
						return true;
					}
				});
			});
			
			
			$("#form-edit-system-user").validate({
				rules:{
					name:{
						required:true,
						maxlength:15
					},
					empCode:{
						required:true,
						maxlength:15
					},
					deptName:{
						required:true,
						maxlength:66
					},
					telephone:{
						maxlength:15,
						checkTelepone:true
					},
					email:{
						required:true,
						checkEmail:true
					}
				}
			});
			
			$(".userProperty",$("#system-user-edit")).each(function(){
				$(this).rules("add", {maxlength:300, checkRegular: true, messages: { checkRegular: "输入格式不正确！"} });
			});
			
		}
	});
}

/**
 * 用户保存
 */
$.system.user.saveUser = function(){
	if($("#form-edit-system-user").valid()){
		
		var data = {};
		data.id = $("#id",$("#system-user-edit")).val();
		data.name = $("#name",$("#system-user-edit")).val();
		data.empCode = $("#empCode",$("#system-user-edit")).val();
		data.deptId = $("#deptId",$("#system-user-edit")).val();
		data.deptName = $("#deptName",$("#system-user-edit")).val();
		data.telephone = $("#telephone",$("#system-user-edit")).val();
		data.email = $("#email",$("#system-user-edit")).val();
		data.sex = $("[name='sex']",$("#system-user-edit")).val();
		data.userType = $("#id-user-type",$("#system-user-edit")).val();
		
		data.userPropertyValueList = [];
		$(".userProperty",$("#system-user-edit")).each(function(){
			if($(this).val()!='' && $(this).val() != null){
				var userPropertyValue = {};
				userPropertyValue.propertyId = $(this).attr("propertyId");
				userPropertyValue.propertyValue = $(this).val();
				data.userPropertyValueList.push(userPropertyValue);
			}
		});
		
		console.log(JSON.stringify(data));
		
		$.ajax({
			sync:true,
			url:'system/user/save',
			type:'post',
			contentType : 'application/json;charset=utf-8', //设置请求头信息
            dataType:"json",
			data:JSON.stringify(data),
			success:function(json){
				console.log(json);
				if(json.resultCode == 1){
					$.toast('保存成功!');
					$('#' + $.system.user.userWinId).dialog('close');
					$('#' + $.system.user.gridUserId).trigger('reloadGrid');
				}else{
					$.toast('保存失败!');
				}
			}
		});
	}
};


$.system.user.searchFlag = true;
/**
 * 用户搜索按钮
 */
$.system.user.search=function(){
	if($.system.user.searchFlag){
		$.system.user.searchFlag = false;
		postData = $("#"+$.system.user.gridUserId,$.system.user.container).jqGrid("getGridParam", "postData");
		$.jgrid.gridUnload("#"+$.system.user.gridUserId,$.system.user.container);
		var result =  $.system.user.dynamicColumn();
		$.system.user.gridUserId = $.grid({
			container:$('#grid-system-user',$.system.user.container),
			url: 'system/user/find-custom-page2',  
			shrinkToFit:result.len>0?false:true,
			datatype: 'json',  
			colNames: result.colNames,
			colModel: result.colModel,  
			rownumbers:false,
			viewrecords: true,
			height:$(window).height() * 0.5,
			beforeRequest:function(){
				postData = $("#"+$.system.user.gridUserId,$.system.user.container).jqGrid("getGridParam", "postData");
				$.extend(postData, { name: $("#id-name",$.system.user.container).val(),empCode: $("#id-empCode",$.system.user.container).val()});
			},
			loadComplete:function(){
				$.system.user.searchFlag = true;
			}
		});
	}
};

