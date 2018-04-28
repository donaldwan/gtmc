$.namespace("system.mailTemplate.manager");
//初始化
$.system.mailTemplate.manager.init = function () {
    $.system.mailTemplate.manager.container = $("#wid-id-system-mailTemplate-manager");
    $.system.mailTemplate.manager.gridId =
        $.grid({
            container: $("#id-div-grid-table-mailTemplate", $.system.mailTemplate.manager.container),
            url: 'system/mailTemplate/find-page',
            colNames: ['ID', '邮件模版描述', '模版文件名', '状态'],
            colModel: [
                {name: 'id', index: 'id', hidden: true, width: 20},
                {name: 'remark', index: 'remark', width: 50, editable: true},
                {name: 'templateName', index: 'templateName', edit: true, width: 50},
                {
                    name: 'status',
                    index: 'status',
                    width: 30,
                    align: 'left',
                    formatter: function (value) {
                        switch (value) {
                            case "A":
                                return "有效";
                            case "D":
                                return "无效";
                            default:
                                return "未知";
                        }
                    }
                }
            ]
        });
    //绑定enter事件
    $('#id-mailTemplateRemark', $.system.mailTemplate.manager.container).bind("keydown", function (e) {
        e = window.event || e;
        if (e.keyCode === 13) {
            $.system.mailTemplate.manager.search();
            return false;
        }
    });
};
//物理删除
$.system.mailTemplate.manager.del = function () {
    var ids = $("#" + $.system.mailTemplate.manager.gridId, $.system.mailTemplate.manager.container).jqGrid('getGridParam', 'selarrrow');
    if (ids.length == 0) {
        $.toast('请选择至少一个邮件模版!');
        return;
    }
    $.confirm('提示', '确认删除吗？', function (b) {
        if (b) {
            $.ajax({
                sync: true,
                type: "POST",
                url: "system/mailTemplate/delete/" + ids,
                dataType: "json",
                success: function (json) {
                    if (json.resultCode == 1) {
                        $.toast("删除成功！");
                        $("#" + $.system.mailTemplate.manager.gridId, $.system.mailTemplate.manager.container).jqGrid("setGridParam", {search: true}).trigger("reloadGrid");
                    }
                }
            });
        }
    });
};
//新增OR编辑
$.system.mailTemplate.manager.edit = function (flag) {
    var title_name = '';
    var url;
    if ("A" == flag) {
        title_name = '新增邮件模版';
        url = 'system/mailTemplate/edit';
    } else if ("E" == flag) {
        var ids = $("#" + $.system.mailTemplate.manager.gridId, $.system.mailTemplate.manager.container).jqGrid('getGridParam', 'selarrrow');
        if (ids.length != 1) {
            $.toast('请选择一个邮件模版!');
            return;
        }
        title_name = '编辑邮件模版';
        url = 'system/mailTemplate/edit/' + ids[0];
    }

    var buttons = [{
        text: '保存', class: 'btn btn-primary btn-sm', click: function () {
            $.system.mailTemplate.edit.mailTemplateEdit();
        }
    },
        {
            text: '取消', class: 'btn btn-default btn-sm', click: function () {
            $('#' + $.system.mailTemplate.manager.winId).dialog('close');
            //$.system.mailTemplate.edit.templateEditor.destroy();
        }
        }];
    $.system.mailTemplate.manager.winId = $.dialog({
        url: url,
        title: title_name,
        width: 780,
        height: 600,
        modal: true,
        buttons: buttons,
        close: function () {
        	if($.system.mailTemplate.edit.templateEditor){
        		$.system.mailTemplate.edit.templateEditor.destroy();
        	}
        }
    });
};
//搜索按钮
$.system.mailTemplate.manager.search = function () {
    var postData = $("#" + $.system.mailTemplate.manager.gridId, $.system.mailTemplate.manager.container).jqGrid("getGridParam", "postData");
    $.extend(postData, {remark: $.trim($('#id-mailTemplateRemark', $.system.mailTemplate.manager.container).val())});
    $("#" + $.system.mailTemplate.manager.gridId, $.system.mailTemplate.manager.container).jqGrid("setGridParam", {search: true}).trigger("reloadGrid", [{page: 1}]);
};
