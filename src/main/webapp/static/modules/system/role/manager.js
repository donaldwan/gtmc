$.namespace('system.role');

/**
 * 页面初始化
 */
$.system.role.init = function () {
    //页面顶级容器
    $.system.role.container = $('#system-role-manager');

    //初始化清单列表
    $.system.role.initGrid();

    //打开新增窗口
    $('#bt-add', $.system.role.container).click(function () {
        $.system.role.openEditWindow('', false);
    });

    //编辑
    $('#bt-edit', $.system.role.container).click(function () {
        var ids = $("#" + $.system.role.gridId).jqGrid('getGridParam', 'selarrrow');
        if (ids.length != 1) {
            $.toast('请选择一行数据!');
            return;
        }
        $.system.role.openEditWindow(ids[0], false);
    });

    //查看明细
    $('#bt-detail', $.system.role.container).click(function () {
        var ids = $("#" + $.system.role.gridId).jqGrid('getGridParam', 'selarrrow');
        if (ids.length != 1) {
            $.toast('请选择一行数据!');
            return;
        }
        $.system.role.openEditWindow(ids[0], true);
    });

    //搜索
    $('#bt-search', $.system.role.container).click(function () {
        $.system.role.search();
    });

    //重置
    $('#bt-reset', $.system.role.container).click(function () {
        $('#form-search-system-role')[0].reset();
    });

    //删除
    $('#bt-delete', $.system.role.container).click(function () {
        var ids = $("#" + $.system.role.gridId).jqGrid('getGridParam', 'selarrrow');
        if (ids.length != 1) {
            $.toast('请选择一行数据!');
            return;
        }
        $.confirm('提示', '确定要删除吗?', function (b) {
            if (b) {
                $.ajax({
                    url: 'system/role/delete',
                    sync: true,
                    data: {id: ids[0]},
                    dataType: 'json',
                    success: function (json) {
                        $.toast('删除成功!');
                        $('#' + $.system.role.gridId).trigger('reloadGrid');
                    }
                });
            }
        });
    });

    //权限配置
    $('#bt-auth', $.system.role.container).click(function () {
        var ids = $("#" + $.system.role.gridId).jqGrid('getGridParam', 'selarrrow');
        if (ids.length != 1) {
            $.toast('请选择一行数据!');
            return;
        }
        $.system.role.openAuthWindow(ids[0]);
    });


};

/**
 * 初始化grid
 */
$.system.role.initGrid = function () {

    $.system.role.gridId =
        $.grid({
            container: $('#grid-system-role', $.system.role.container),
            url: "system/role/find-page",
            colNames: ['id', 'status', '角色名称', '角色编号', '状态', '备注'],
            colModel: [
                {name: 'id', index: 'id', hidden: true},
                {name: 'status', index: 'status', hidden: true},
                {name: 'roleName', index: 'roleName', width: 150},
                {name: 'roleCode', index: 'roleCode', width: 100},
                {name: 'statusDesc', index: 'status', hidden: true},
                {name: 'remark', index: 'remark', width: 400}
            ]
        });
};

/**
 * 打开编辑窗口
 */
$.system.role.openEditWindow = function (id, isDetail) {
    var title = id == '' ? '角色新增' : '角色编辑';

    var buttons = [{
        text: '保存', class: 'btn btn-primary btn-sm', click: function () {
            $.system.role.save();
        }
    },
        {
            text: '取消', class: 'btn btn-default btn-sm', click: function () {
            $('#' + $.system.role.editWinId).dialog('close');
        }
        }];

    if (isDetail) {
        var buttons = [
            {
                text: '关闭', class: 'btn btn-default btn-sm', click: function () {
                $('#' + $.system.role.editWinId).dialog('close');
            }
            }];

        title = '角色明细';
    }

    //角色编码验证
    $.validator.addMethod("checkRoleCode", function (value, element) {
        var telephone = /^[A-Z_]+$/;
        return this.optional(element) || telephone.test(value);
    }, "角色编码由大写字母和下划线组成");

    $.system.role.editWinId =
        $.dialog({
            url: 'system/role/edit?id=' + id + '&isDetail=' + isDetail,
            title: title,
            width: 600,
            height: 380,
            modal: true,
            buttons: buttons,
            success: function () {
                $("#form-edit-system-role").validate({
                    rules: {
                        roleName: {
                            required: true,
                            maxlength: 15,
                        },
                        roleCode: {
                            maxlength: 45,
                            checkRoleCode: true
                        },
                        remark: {
                            maxlength: 60
                        }
                    }
                });
            }
        });
};

/**
 * 保存编辑结果
 */
$.system.role.save = function () {
    if ($("#form-edit-system-role").valid()) {
        $.ajax({
            sync: true,
            url: 'system/role/save',
            type: 'post',
            dateType: 'json',
            data: $("#form-edit-system-role").serialize(),
            success: function (json) {
                if (json.resultCode == 1) {
                    $.toast('保存成功!');
                    $('#' + $.system.role.editWinId).dialog('close');
                    $('#' + $.system.role.gridId).trigger('reloadGrid');
                } else {
                    $.toast(json['message']);
                }
            }
        });
    }
};

/**
 * 列表搜索
 */
$.system.role.search = function () {
    $.search($("#form-search-system-role"), $.system.role.gridId);

//	var postData = $("#" + $.system.role.gridId).jqGrid("getGridParam", "postData");
//    $.extend(postData, $("#form-search-system-role").serializeJson());
//    $("#"+ $.system.role.gridId).jqGrid("setGridParam", { search: true }).trigger("reloadGrid", [{page: 1}]);
};

/**
 * 打开角色权限配置窗口
 */
$.system.role.openAuthWindow = function (id) {
    var buttons = [{
        text: '保存', class: 'btn btn-primary btn-sm', click: function () {
            $.system.role.saveRoleAuth(id);
        }
    },
        {
            text: '取消', class: 'btn btn-default btn-sm', click: function () {
            $('#' + $.system.role.authWinId).dialog('close');
        }
        }];
    $.system.role.authWinId =
        $.dialog({
            url: 'system/role/role-auth?id=' + id,
            title: '角色权限编辑',
            width: $(window).width() * 0.8,
            height: $(window).height() * 0.8,
            modal: true,
            buttons: buttons,
            success: function () {
                $.system.role.initAuthGrid(id);
            }
        });
};

/**
 * 保存角色对应的权限
 */
$.system.role.saveRoleAuth = function (id) {
    var screenIds = new Array();
    $.each($('input[id^=screen_]:checked'), function (i, n) {
        screenIds.push($(n).val());
    });

    var auths = new Array();
    $.each($('input[id^=auth_]:checked'), function (i, n) {
        auths.push($(n).val());
    });
    $.ajax({
        url: 'system/role/save-auth',
        type: 'post',
        dataType: 'json',
        sync: true,
        data: {id: id, screenIds: screenIds.join(','), auths: auths.join(',')},
        success: function (json) {
            $('#' + $.system.role.authWinId).dialog('close');
            $.toast('保存成功');
        }
    });
};

/**
 * 初始化角色权限grid
 */
$.system.role.initAuthGrid = function (roleId) {
    $.system.role.authGridId = $.grid({
        container: $('#grid-system-role-auth'),
        treeGrid: true,
        treeGridModel: 'adjacency',
        ExpandColumn: 'screenName',
        url: 'system/screen/find-all',
        datatype: 'json',
        colNames: ['菜单名称', '权限名称【按钮名称】'],
        colModel: [
            {
                name: 'screenName', index: 'screenName', width: 30, formatter: function (v, a, r, d) {
                return '<input type="checkbox" value="' + r.id + '" id="screen_' + r.id + '" parentId="' + r.parentId + '" screenId="' + r.id + '" onclick="$.system.role.screenClick(this)">'
                    + '<label for="screen_' + r.id + '">' + v + '</label>';
            }
            },
            {
                name: 'auth', index: 'auth', width: 70, formatter: function (v, a, r, d) {
                if (r.auths.length == 0)return '';
                var array = new Array();
                for (var i = 0; i < r.auths.length; i++) {
                    var auth = r.auths[i];
                    array.push('<input type="checkbox" id="auth_' + auth['id'] + '" value="' + auth.id + '">'
                        + '<label for="auth_' + auth['id'] + '">' + auth['authName'] + '</label>');
                }
                return array.join('&nbsp;&nbsp;');
            }
            }

        ],
        pager: "false",
        rownumbers: false,
        viewrecords: true,
        treeReader: {
            level_field: "level",
            parent_id_field: "parentId",
            leaf_field: "leaf",
            expanded_field: "expanded"
        },
        height: $(window).height() * 0.5,
        gridComplete: function () {
            $.system.role.initRoleAuth(roleId);
        }
    });

    /**
     * 初始化角色对应的权限选择状态
     */
    $.system.role.initRoleAuth = function (roleId) {
        $.wait();
        $.ajax({
            url: 'system/screen/find-by-role?id=' + roleId,
            dataType: 'json',
            success: function (data) {
                $.each(data, function (i, screen) {
                    $('input[id="screen_' + screen.id + '"]').attr('checked', true);
                    $.each(screen.auths, function (n, auth) {
                        $('input[id="auth_' + auth.id + '"]').attr('checked', true);
                    });
                });
                $.stopWait();
            }
        });
    },

        $.system.role.screenClick = function (box) {
            $.system.role.setCheckedForChildren(box);
            $.system.role.setCheckedForParent(box);
        };

    $.system.role.setCheckedForChildren = function (box) {
        $.each($('input[parentId="' + $(box).attr('screenId') + '"]'), function (i, n) {
            $(n).prop('checked', box.checked);
            $.system.role.setCheckedForChildren(n);
        });
    };

    $.system.role.setCheckedForParent = function (box) {
        var parentId = $(box).attr('parentId');
        if (parentId == null || parentId == 'null')return;
        var allLength = $('input[parentId="' + parentId + '"]').length;
        var checkedLength = $('input[parentId="' + parentId + '"]:checked').length;
        var parent = $('#screen_' + parentId);
        if (parent.length > 0) {
            if (checkedLength == 0) {
                $(parent).prop('checked', false);
            } else {
                $(parent).prop('checked', true);
            }
            $.system.role.setCheckedForParent(parent);
        }
    };
}