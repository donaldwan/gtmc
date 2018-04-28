$.namespace('system.mynotify.add');

/**
 * 页面初始化
 */
$.system.mynotify.add.init = function () {
    //页面顶级容器
    $.system.mynotify.add.container = $('#system-notify-edit');

    $.system.mynotify.add.userIds = $('#message-userIds', $.system.mynotify.add.container);
    $.system.mynotify.add.userList = $('#system-notify-edit-user-list', $.system.mynotify.add.container);

    $(function () {
        $.system.mynotify.add.typeSystem = $($('input[name="msgType"]')[0], $.system.mynotify.add.container);
        $.system.mynotify.add.typeUser = $($('input[name="msgType"]')[1], $.system.mynotify.add.container);

        $.system.mynotify.add.userList.hide();

        $.system.mynotify.add.typeSystem.on('click', function () {
            $.system.mynotify.add.userList.hide();
        });
        $.system.mynotify.add.typeUser.on('click', function () {
            $.chooseUser({callback: $.system.mynotify.add.chooseUserBack});
        });
    });
};

$.system.mynotify.add.userGridId = '';
$.system.mynotify.add.users = [];
$.system.mynotify.add.chooseUserBack = function (dataArr) {
    if (dataArr.length == 0) {
        $.toast("至少选择一种人员");
        return;
    }

    var cbody = $('#system-notify-edit-user-table', $.system.mynotify.add.container);
    if (cbody.html().length == 0) {
        $.system.mynotify.add.userGridId = $.grid({
            container: cbody,
            datatype: "local",
            colNames: ['用户名', '操作', 'ID'],
            colModel: [
                {name: 'name', index: 'name', width: 226},
                {
                    name: 'oper', index: 'id', width: 226, align: 'center', formatter: function (v, a, r, d) {
                    var html = '<button class="btn btn-danger btn-sm" type="button" onclick="';
                    html += '$.system.mynotify.add.deleteRow(\'';
                    html += $(this).attr('id');
                    html += '\',';
                    html += a.rowId;
                    html += ');">删除</button>';
                    return html;
                }
                },
                {name: 'id', index: 'id', hidden: true}
            ],
            height: 200,
            noPager: true,
            rownumbers: false,
            viewrecords: false,
            multiselect: false,
            multiboxonly: false
        });
    }
    var g = $('#' + $.system.mynotify.add.userGridId);
    for (var i = 0; i < dataArr.length; i++) {
        if (!$.system.mynotify.add.users || $.system.mynotify.add.users.length == 0) {
            g.jqGrid('addRowData', i + 1, dataArr[i]);
        } else {
            var h = false;
            for (var j = 0; j < $.system.mynotify.add.users.length; j++) {
                if ($.system.mynotify.add.users[j]['id'] == dataArr[i]['id']) {
                    h = true;
                    break;
                }
            }
            if (!h) {
                g.jqGrid('addRowData', $.system.mynotify.add.users.length + i + 1, dataArr[i]);
            }
        }
    }

    $.system.mynotify.add.users = g.jqGrid('getRowData');

    $.system.mynotify.add.userList.show();
    return true;
};

$.system.mynotify.add.deleteRow = function (gridId, rowId) {
    var g = $('#' + gridId);
    var ad = g.jqGrid('getRowData');
    if (ad.length == 1) {
        $.toast("请至少保留一种人员");
        return false;
    }
    g.jqGrid('delRowData', rowId);
    g.trigger('reloadGrid');
    $.system.mynotify.add.users = ad;
};