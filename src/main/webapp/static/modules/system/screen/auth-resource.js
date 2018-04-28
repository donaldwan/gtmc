/**
 * 按钮资源配置
 */
$.namespace("system.screen.auth.resource");
	$.system.screen.auth.resource.init=function(){
		
		$.system.screen.auth.resource.container = $("#id-auth-resource-section");
		
		var authId=$("#id-screen-auth-id",$.system.screen.auth.resource.container).val();
		var screenId=$("#id-screen-id",$.system.screen.auth.resource.container).val();
		var tempSuffix;
		if(""!=authId){
			tempSuffix=authId;
		}else{
			tempSuffix=screenId;
		}
		$('#id-div-system-auth-resource-all-table',$.system.screen.auth.resource.container).attr("id","id-div-system-auth-resource-all-table-"+tempSuffix);
		$.system.screen.auth.resource.allJqgrid = '#id-div-system-auth-resource-all-table-'+tempSuffix;
		
		$.system.screen.auth.resource.allId=
	 	$.grid({
			  container:$($.system.screen.auth.resource.allJqgrid,$.system.screen.auth.resource.container),
			  url:"system/resource/find-page",
			  colNames:['ID','资源名称','URI'],
			  colModel:[
					{name:'id',index:'id',  sorttype:"int",hidden:true},
					{name:'resourceName',index:'resourceName',align:'left'},
					{name:'uri',index:'uri', align:'left'}
				],
				multiselect : true,
			    loadComplete:function(){
			    	//勾选已选资源 
			    	$.system.screen.auth.resource.selectedResource();
			    }
		  });
		
	};
	
	//资源搜索按钮
	$.system.screen.auth.resource.searchAll=function(){
		var resourceName=$("#id-auth-all-resource-name",$.system.screen.auth.resource.container).val();
		var postData = $("#"+ $.system.screen.auth.resource.allId,$.system.screen.auth.resource.container).jqGrid("getGridParam", "postData");
	    $.extend(postData,{resourceName:resourceName});
		$("#"+ $.system.screen.auth.resource.allId,$.system.screen.auth.resource.container).jqGrid("setGridParam", { search: true }).trigger("reloadGrid", [{ page: 1}]);
	};
	
	//选中资源
	$.system.screen.auth.resource.selectedResource = function(){
		var authId=$("#id-screen-auth-id",$.system.screen.auth.resource.container).val();
		var screenId=$("#id-screen-id",$.system.screen.auth.resource.container).val();
		var authScreenFlag=$('#id-screen-auth-screen-flag',$.system.screen.auth.resource.container).val();
		if("true"==authScreenFlag){
			//按钮资源
			$.ajax({
				url:'system/resource/find-by-auth?authId='+authId,
				datatype: "json",
				mtype:'POST',
				success:function(data){
					for(var i = 0;i < data.length; i++){
						$("#"+$.system.screen.auth.resource.allId).jqGrid('setSelection',data[i].id);
					}
				}
			});
		}else{
			//菜单资源
			var screenId=$('#id-screen-id',$.system.screen.auth.resource.container).val();
			$.ajax({
				url:"system/resource/find-resource-by-screenid?screenId="+screenId,
				datatype: "json",
				mtype:'POST',
				success:function(data){
					if(data.length > 0){
						$("#"+$.system.screen.auth.resource.allId).jqGrid('setSelection',data[0].id);
					}
				}
			});
		}
	}
	
	//保存资源
	$.system.screen.auth.resource.addResource=function(){
		//alert($.system.screen.auth.resource.allId);
		var authScreenFlag=$('#id-screen-auth-screen-flag',$.system.screen.auth.resource.container).val();
		var resourceIds=$("#"+$.system.screen.auth.resource.allId).jqGrid('getGridParam','selarrrow');
		if("true"==authScreenFlag){//保存权限资源
			var authId=$("#id-screen-auth-id",$.system.screen.auth.resource.container).val();
			if(''==resourceIds){
				$.toast("请选择资源!");
				return;
			}
			$.ajax({
				url:"system/authentication/add-auth-resource?authId="+authId+"&resourceIds="+resourceIds,
				type: "post",
				success:function(data){
					$.toast('保存成功');
					$('#' + $.system.screen.authResourceWinId).dialog('close');
				},
				error:function(er){
					$.toast('保存失败');
				}
			});
		}else{//保存菜单资源
			var screenId=$("#id-screen-id",$.system.screen.auth.resource.container).val();
			var ids=resourceIds.join(',')
			var array = ids.split(',');
			if(""==resourceIds){
				$.toast("请选择添加的资源");
				return;
			}else if(array.length> 1)	{
				$.toast("请选择一个资源");
				return;
			}
			$.ajax({
				url:"system/screen/update-resource?screenId="+screenId+"&resourceId="+resourceIds,
				type: "post",
				success:function(data){
					$.toast('保存成功');
					$.system.screen.screenFresh();
					$('#' + $.system.screen.screenResourceWinId).dialog('close');
				},
				error:function(er){
					$.toast('保存失败');
				}
			});
		}
	};