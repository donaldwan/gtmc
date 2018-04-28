$.namespace("common.document.referDeptUser");

/**
 * 页面初始化
 */
$.common.document.referDeptUser.init = function(){
	//页面顶级容器
	$.common.document.referDeptUser.container = $('#common-document-management-referDeptUser');
	
	//初始化清单列表
	$.common.document.referDeptUser.initGrid();
	
	//搜索
	$('#bt-search',$.common.document.referDeptUser.container).click(function(){
		$.search($("#form-search-common-document"),$.common.document.referDeptUser.gridId);
	});
	
	//重置
	$('#bt-reset',$.common.document.referDeptUser.container).click(function(){
		$('#form-search-common-document')[0].reset();
	});
	
	
	//打开新增窗口
	$('#bt-add',$.common.document.referDeptUser.container).click(function(){
		console.log('添加');
		$.common.document.referDeptUser.openEditWindow('',false);
	});
	
	//
	$('#business-one-fileUpload',$.common.document.referDeptUser.container).click(function(){
		$.common.document.referDeptUser.uploadBusiness();
	});
	
	
	
	//新增
	
	//编辑
	
	//刷新
	
	//
	
	
};

/**
 * 
 */
$.common.document.referDeptUser.initGrid = function(){
	$.common.document.referDeptUser.gridId = $.grid({
		container:$('#grid-document-referDeptUser',$.common.document.referDeptUser.container),
		url : "common/document/find-page",
		colNames:['文件名称','文件路径','部门','角色','指定人','操作'],
		cache: false,
		colModel:[
				/*{name : 'id', index : 'id',width:80}, */
				{name : 'fileName', index : 'fileName',width:100},
				{name : 'filePath', index : 'filePath',width:50}, 
				{name : 'permissionDept', index : 'permissionDept',width:100},
				{name : 'permissionRole', index : 'permissionRole',width:100},
				{name : 'permissionUser', index : 'permissionUser',width:100},
				{name : 'oper',index : 'oper',align:'center',width:100,formatter:function(v,a,r,d){
					 var html = '<a style="cursor:pointer;"	target="_blank" href = "common/document/fileView?path='+ r.filePath + '/' + r.fileName + '">在线预览</a>';
					if(r.permissionDown == 1){
						html += '&nbsp;<a style="cursor:pointer;" href = "common/document/download/'+r.id+'">下载</a>';
					}
					return html;
				}}
		]
	});
};


/**
 * 打开编辑窗口
 */
$.common.document.referDeptUser.openEditWindow = function(id,isDetail){
	var buttons = [{text:'保存',class:'btn btn-primary btn-sm',click:function(){
		   //$.common.document.referDeptUser.uploadBusiness();
	   }},
	   {text:'取消',class:'btn btn-default btn-sm',click:function(){
		   $('#' + $.common.document.referDeptUser.editWinId).dialog('close');
	   }}];
	/*
	//是否删除
	if(isDetail){
		var buttons = [
		   {text:'关闭',class:'btn btn-default btn-sm',click:function(){
			   $('#' + $.common.document.referDeptUser.editWinId).dialog('close');
		   }}];
	}*/
	
	
	//编辑
	$.common.document.referDeptUser.editWinId = 
		$.dialog({
				url:'common/document/edit?id='+1233,
				title:'文档管理--关联业务表编辑',
				width:600,
				type : 'post', 
				height:400,
				modal:true,
				buttons:buttons,
				success:function(){
					$("#form-edit-common-document-referDeptUser").validate({
						rules:{
							fileName:{
								required:true
							}
						}
					});
				},
				
			});
};


/**
 * 添加
 */
$.common.document.referDeptUser.uploadBusiness = function(){
		var formData = new FormData();
		var filePath = $("#filePath").val();
		var permissionDept = $("#permissionDept").val();
		var permissionRole = $("#permissionRole").val();
		var permissionUser = $("#permissionUser").val();
		var permissionDown = $("#permissionDown").val();

		formData.append("file",$("#uploadFile")[0].files[0]);
		formData.append("filePath",filePath);
		formData.append("permissionDept",permissionDept);
		formData.append("permissionRole",permissionRole);
		formData.append("permissionUser",permissionUser);
		formData.append("permissionDown",permissionDown);
		
		$.common.document.referDeptUser.upload(formData);
};

/**
 * 文件上传
 */
$.common.document.referDeptUser.upload = function (formData){
	$.ajax({ 
		url : "common/document/upload", 
		type : 'POST', 
		data : formData, 
		processData : false, 
		// 告诉jQuery不要去设置Content-Type请求头
		contentType : false,
		beforeSend:function(){
			console.log("正在进行，请稍候");
		},
		success : function(responseStr) {
			console.log(responseStr);
			if(responseStr.resultCode==1){
				$.toast("上传成功");
			}else{
				$.toast("上传失败");
			}
		}, 
		error : function(responseStr) { 
			$.toast("上传异常！" + responseStr.message);
		}
	});
};


