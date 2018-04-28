$.namespace('system.resource');

/**
 * 页面初始化
 */
$.system.resource.init = function () {
    //页面顶级容器
    $.system.resource.container = $('#system-resource-manager');

    //初始化清单列表
    $.system.resource.initGrid();

    //打开新增窗口
    $('#bt-add', $.system.resource.container).click(function () {
        $.system.resource.openEditWindow('', false);
    });

    //编辑
    $('#bt-edit', $.system.resource.container).click(function () {
        var ids = $("#" + $.system.resource.gridId).jqGrid('getGridParam', 'selarrrow');
        if (ids.length != 1) {
            $.toast('请选择一行数据!');
            return;
        }
        $.system.resource.openEditWindow(ids[0], false);
    });


    //搜索
    $('#bt-search', $.system.resource.container).click(function () {
        //$.system.resource.search();
        $.search($("#form-search-system-resource"), $.system.resource.gridId);
    });

    //重置
    $('#bt-reset', $.system.resource.container).click(function () {
        $('#form-search-system-resource')[0].reset();
    });

    //删除
    $('#bt-delete', $.system.resource.container).click(function () {
        var ids = $("#" + $.system.resource.gridId).jqGrid('getGridParam', 'selarrrow');
        if (ids.length == 0) {
            $.toast('请选择至少一条数据!');
            return;
        }
        $.confirm('提示', '确定要删除吗?', function (b) {
            if (b) {
                $.ajax({
                    url: 'system/resource/delete',
                    sync: true,
                    data: {ids: ids},
                    dataType: 'json',
                    success: function (json) {
                        $.toast('删除成功!');
                        $('#' + $.system.resource.gridId).trigger('reloadGrid');
                    }
                });
            }
        });
    });
};

/**
 * 初始化grid
 */
$.system.resource.initGrid = function () {

    $.system.resource.gridId =
        $.grid({
            container: $('#grid-system-resource', $.system.resource.container),
            url: "system/resource/find-page",
            colNames: ['ID', '资源名称', '资源类型', 'uri', '备注'],
            colModel: [
                {name: 'id', index: 'id', width: 80},
                {name: 'resourceName', index: 'resourceName', width: 100},
                {name: 'resourceType', index: 'resourceType', width: 50},
                {name: 'uri', index: 'uri', width: 300},
                {name: 'remark', index: 'remark', width: 200}
            ]
        });
};

/**
 * 打开编辑窗口
 */
$.system.resource.openEditWindow = function(id,isDetail){
	var title = '新增资源';
    if (id != '') {
        title = '编辑资源'
    }
	
	var buttons = [{text:'保存',class:'btn btn-primary btn-sm',click:function(){
		   $.system.resource.save();
	   }},
	   {text:'取消',class:'btn btn-default btn-sm',click:function(){
		   $('#' + $.system.resource.editWinId).dialog('close');
	   }}];
	
	if(isDetail){
		var buttons = [
		   {text:'关闭',class:'btn btn-default btn-sm',click:function(){
			   $('#' + $.system.resource.editWinId).dialog('close');
		   }}];
		title = '资源明细';
	}
	
	$.system.resource.editWinId = 
		$.dialog({
				url:'system/resource/edit?id=' + id + '&isDetail=' + isDetail,
				title:title,
				width:600,
				height:450,
				modal:true,
				buttons:buttons,
				success:function(){
					$("#form-edit-system-resource").validate({
						rules:{
							resourceName:{
								required:true,
								maxlength:15
							},
							uri:{
								required:true,
								maxlength:66
							},
							remark:{
								maxlength:66
							}
						}
					});
				}
			});
};

/**
 * 保存编辑结果
 */
$.system.resource.save = function () {
    if ($("#form-edit-system-resource").valid()) {
        $.ajax({
            sync: true,
            url: 'system/resource/save',
            type: 'post',
            dateType: 'json',
            data: $("#form-edit-system-resource").serialize(),
            success: function (json) {
                if (json.resultCode == 1) {
                    $.toast('保存成功!');
                    $('#' + $.system.resource.editWinId).dialog('close');
                    $('#' + $.system.resource.gridId).trigger('reloadGrid');
                } else {
                    $.toast(json['message']);
                }
            }
        });
    }
};