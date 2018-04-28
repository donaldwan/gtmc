$.namespace("common.document.referBusiness");

/**
 * 页面初始化
 */
$.common.document.referBusiness.init = function(){
	//页面顶级容器
	$.common.document.referBusiness.container = $('#common-document-management');
	
	//初始化清单列表
	$.common.document.referBusiness.initGrid();
	
	//搜索
	$('#bt-search',$.common.document.referBusiness.container).click(function(){
		$.search($("#form-search-common-document"),$.common.document.referBusiness.gridId);
	});
	
	//重置
	$('#bt-reset',$.common.document.referBusiness.container).click(function(){
		$('#form-search-common-document')[0].reset();
	});
	
	
	//打开新增窗口
	$('#bt-add',$.common.document.referBusiness.container).click(function(){
		console.log('添加');
		$.common.document.referBusiness.openEditWindow('',false);
	});
	
	//
	$('#business-one-fileUpload',$.common.document.referBusiness.container).click(function(){
		$.common.document.referBusiness.uploadBusiness();
	});
	
	
	
	//新增
	
	//编辑
	
	//刷新
	
	//
	
	
};

/**
 * grid
 */
$.common.document.referBusiness.initGrid = function(){
	$.common.document.referBusiness.gridId = $.grid({
		container:$('#grid-document-business',$.common.document.referBusiness.container),
		url : "common/document/find-page",
		colNames:['文件名称','文件路径','关联类型','关联主键','操作'],
		cache: false,
		colModel:[
				{name : 'fileName', index : 'fileName',width:100},
				{name : 'path', index : 'path',width:50}, 
				{name : 'referType', index : 'referType',width:100},
				{name : 'referKey', index : 'referKey',width:100},
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
$.common.document.referBusiness.openEditWindow = function(id,isDetail){
	var buttons = [{text:'保存',class:'btn btn-primary btn-sm',click:function(){
		   //$.common.document.referBusiness.uploadBusiness();
	   }},
	   {text:'取消',class:'btn btn-default btn-sm',click:function(){
		   $('#' + $.common.document.referBusiness.editWinId).dialog('close');
	   }}];
	/*
	//是否删除
	if(isDetail){
		var buttons = [
		   {text:'关闭',class:'btn btn-default btn-sm',click:function(){
			   $('#' + $.common.document.referBusiness.editWinId).dialog('close');
		   }}];
	}*/
	
	
	//编辑
	$.common.document.referBusiness.editWinId = 
		$.dialog({
				url:'common/document/edit?id='+1233,
				title:'文档管理--关联业务表编辑',
				width:600,
				type : 'post', 
				height:400,
				modal:true,
				buttons:buttons,
				success:function(){
					$("#form-edit-common-document-referBusiness").validate({
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
 * 添加(文件上传)
 */
$.common.document.referBusiness.uploadBusiness = function(){
		//var formData1 = new FormData($("#form-upload-document-business")[0]);
		var formData = new FormData();
		var filePath = $("#upload_filePath").val();
		if(!filePath){
			$.toast("保存路径不能为空");
			return;
		}
		
		var referType = $("#upload_referType").val();
		var referKey = $("#upload_referKey").val();
		var permissionDown = $("#upload_permissionDown").val();
		//console.log($("#upload_file").val());
		formData.append("file",$("#upload_file")[0].files[0]);
		formData.append("referType",referType);
		formData.append("referKey",referKey);
		console.log(filePath);
		formData.append("filePath",filePath);
		formData.append("permissionDown",permissionDown);
		//$.common.document.referBusiness.upload(formData);
		
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

/**
 * 文件上传
 */
$.common.document.referBusiness.upload = function (formData){
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


