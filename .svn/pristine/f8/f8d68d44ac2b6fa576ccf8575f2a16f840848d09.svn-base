$.namespace('system.mynotify');

/**
 * 页面初始化
 */
$.system.mynotify.init = function () {
    //页面顶级容器
    $.system.mynotify.container = $('#system-notify-manager');

    //初始化清单列表
    $.system.mynotify.initGrid();

    //打开新增窗口
    $('#bt-add', $.system.mynotify.container).click(function () {
        $.system.mynotify.openEditWindow('', false);
    });

    //搜索
    $('#bt-search', $.system.mynotify.container).click(function () {
        $.search($("#form-search-system-notify"), $.system.mynotify.gridId);
    });

    //重置
    $('#bt-reset', $.system.mynotify.container).click(function () {
        $('#form-search-system-notify')[0].reset();
    });

    //删除
    $('#bt-delete', $.system.mynotify.container).click(function () {
        var ids = $("#" + $.system.mynotify.gridId).jqGrid('getGridParam', 'selarrrow');
        if (ids.length != 1) {
            $.toast('请选择一行数据!');
            return;
        }
        $.confirm('提示', '确定要删除吗?', function (b) {
            if (b) {
                $.ajax({
                    url: 'system/notify/delete',
                    sync: true,
                    data: {id: ids[0]},
                    dataType: 'json',
                    success: function (json) {
                        $.toast('删除成功!');
                        $('#' + $.system.mynotify.gridId).trigger('reloadGrid');
                    }
                });
            }
        });
    });
};

/**
 * 初始化grid
 */
$.system.mynotify.initGrid = function () {

    $.system.mynotify.gridId =
        $.grid({
            container: $('#grid-system-notify', $.system.mynotify.container),
            url: "system/notify/find-page",
            colNames: ['ID', '消息类型', '消息标题', '消息内容', '发布人', '发布时间', 'RELEASEUSERID'],
            colModel: [
                {name: 'id', index: 'id', width: 80},
                {
                    name: 'msgType', index: 'msgType', formatter: function (value, a, row, d) {
                    switch (value) {
                        case "01":
                            return "系统通知";
                        case "02":
                            return "用户消息";
                        default:
                            return "未知";
                    }
                }, width: 80
                },
                {name: 'title', index: 'title', width: 200},
                {name: 'content', index: 'content', width: 400},
                {name: 'releaseUserName', index: 'releaseUserName', width: 100},
                {name: 'releaseTime', index: 'releaseTime', align: "center", width: 180},
                {name: 'releaseUserId', index: 'releaseUserId', hidden: true}
            ],
            sortable: true,
            sortname: 'releaseTime',
            sortorder: 'asc'
        });
};

/**
 * 打开编辑窗口
 */
$.system.mynotify.openEditWindow = function (id, isDetail) {

    var buttons = [{
        text: '保存', class: 'btn btn-primary btn-sm', click: function () {
            $.system.mynotify.save();
        }
    },
        {
            text: '取消', class: 'btn btn-default btn-sm', click: function () {
            $('#' + $.system.mynotify.editWinId).dialog('close');
        }
        }];

    $.system.mynotify.editWinId =
        $.dialog({
            url: 'system/notify/edit?id=' + id + '&isDetail=' + isDetail,
            title: '新增站内消息',
            width: 640,
            height: 500,
            modal: true,
            buttons: buttons,
            success: function () {
                $("#form-edit-system-notify").validate({
                    rules: {
                        title: {
                            required: true,
                            maxlength: 100
                        },
                        content: {
                            required: true,
                            maxlength: 1000
                        }
                    }
                });
            }
        });
};

/**
 * 保存编辑结果
 */
$.system.mynotify.save = function () {
    if ($("#form-edit-system-notify").valid()) {
        if ($.system.mynotify.add.typeUser.get(0).checked) {
            if ($.system.mynotify.add.users.length != 0) {
                var userId = "";
                for (var formData in $.system.mynotify.add.users) {
                    var user = $.system.mynotify.add.users[formData];
                    userId = userId + user['id'] + ",";
                }
                if (userId.length != 0) {
                    $.system.mynotify.add.userIds.val(userId.substring(0, userId.length - 1));
                }
            } else {
                $.toast("请至少保留一种人员");
                return;
            }
        }

        $.ajax({
            sync: true,
            url: 'system/notify/save',
            type: 'post',
            dateType: 'json',
            data: $("#form-edit-system-notify").serialize(),
            success: function (json) {
                if (json.resultCode == 1) {
                    $.toast('保存成功!');
                    $('#' + $.system.mynotify.editWinId).dialog('close');
                    $('#' + $.system.mynotify.gridId).trigger('reloadGrid');
                } else {
                    $.toast(json['message']);
                }
            }
        });
    }
};