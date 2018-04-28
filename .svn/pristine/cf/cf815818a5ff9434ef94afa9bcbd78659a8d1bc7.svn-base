$.extend({
    //命名空间扩展,使用语法:$.namespace('system.main');
    namespace: function () {
        if (arguments.length == 0)return null;
        var as = arguments[0].split('.');
        var ns = $;
        for (var i = 0; i < as.length; i++) {
            var k = as[i];
            if (!ns[k]) {
                ns[k] = {};
            }
            ns = ns[k];
        }
        return ns;
    },

    /**
     * 对jqgrid进一步封装，主要是将常用的参数设定默认值
     */
    grid: function (option) {
        //console.log(option);
        var containerId = option.container.attr('id');
        option.container.addClass('grid-width-fix');

        var jqgridId = 'table_' + $.md5(containerId);
        var pjgridId = 'pager_' + $.md5(containerId);

        $(option.container).append('<table id="' + jqgridId + '" width="100%"/>'
            + '<div id="' + pjgridId + '"></div>');

        var settings = {};
        $.extend(settings, option);

        if (!option['noPager']) {
            settings['pager'] = '#' + pjgridId;
        }

        if (!settings['rowList']) settings['rowList'] = [10, 30, 50, 100];
        if (!settings['datatype']) settings['datatype'] = 'json';
        if (!settings['mtype']) settings['mtype'] = 'POST';
        settings['rownumbers'] = settings['rownumbers'] != undefined ? settings['rownumbers'] : true;
        settings['multiselect'] = settings['multiselect'] != undefined ? settings['multiselect'] : true;
        settings['multiboxonly'] = settings['multiboxonly'] != undefined ? settings['multiboxonly'] : true;
        settings['viewrecords'] = settings['viewrecords'] != undefined ? settings['viewrecords'] : true;
        settings['shrinkToFit'] = settings['shrinkToFit'] != undefined ? settings['shrinkToFit'] : true;
        settings['autowidth'] = settings['autowidth'] != undefined ? settings['autowidth'] : true;

        settings['rowNum'] = settings['rowNum'] != undefined ? settings['rowNum'] : 10;
        settings['rownumWidth'] = settings['rownumWidth'] != undefined ? settings['rowNum'] : 45;

        if (settings['loadComplete'] != undefined) {
            settings['loadCompleteTemp'] = settings['loadComplete'];
        }

        settings['loadComplete'] = function (x) {
            //默认设置jqgrid宽度，避免空白滚动条区域
            $("#" + jqgridId, option.container).jqGrid('setGridWidth', $(option.container).width());

            //jqgrid表格显示不出来
            $('.ui-jqgrid', option.container).css("width", "100%");
            $('.ui-jqgrid-view', option.container).css("width", "100%");
            $('.ui-jqgrid-hdiv', option.container).css("width", "100%");
            $('.ui-jqgrid-bdiv', option.container).css("width", "100%");
            // $('.ui-jqgrid-hbox', option.container).css("padding-right", "0");
            $('.ui-jqgrid-htable', option.container).css("width", "100%");
            // $('.ui-jqgrid-btable', option.container).css("width", "100%");
            $('.ui-row-ltr', option.container).css("width", "100%");
            $('.ui-jqgrid-ftable', option.container).css("width", "100%");
            $('.footrow-ltr', option.container).css("width", "100%");
            $('.ui-jqgrid-pager', option.container).css("width", "100%");


            if (settings['loadCompleteTemp'] != undefined) {
                settings['loadCompleteTemp'](x);
            }
        };


        if (!settings['height']) {
            var mh = 320;
            if (settings['minHeight']) mh = settings['minHeight'];
            var h = $(window).height() - $(option.container).offset().top - 110;
            if (h < mh) h = mh;
            if (settings['noPager']) h = h + 28;
            settings['height'] = h;
            settings['needHeightFix'] = true;
        }

        $("#" + jqgridId, option.container).jqGrid(settings);

        $(window).on('resize.jqGrid', function () {
            $("#" + jqgridId, option.container).jqGrid('setGridWidth', $(option.container).width());
            if (settings['needHeightFix']) {
                var mh = 320;
                if (settings['minHeight']) mh = settings['minHeight'];
                var h = $(window).height() - $(option.container).offset().top - 110;
                if (h < mh) h = mh;
                if (settings['noPager']) h = h + 28;
                $("#" + jqgridId, option.container).jqGrid('setGridHeight', h);
            }
        });

        return jqgridId;
    },

    /**
     * 对jquery ui dialog的进一步封装
     */
    dialog: function (option) {
        var winId = option['winId'] ? option['winId'] : 'win_' + new Date().getTime();

        var html = '<div id="' + winId + '" class="winWidget"><h1 class="ajax-loading-animation"><i class="fa fa-cog fa-spin"></i> Loading...</h1></div>';

        if (!option['width']) option['width'] = $(window).width() * 0.8;
        if (!option['height']) option['height'] = $(window).height() * 0.8;

        var fun = null;

        if (option['close']) {
            fun = option['close'];
        }

        option['close'] = function (ev, ui) {
            if (fun != null) {
                fun();
            }
            $(this).dialog("destroy");//.remove();
            var dialogCount = window['dialogCount'];

            if (dialogCount > 0) {
                dialogCount--;
            }
            window['dialogCount'] = dialogCount;
            if (dialogCount == 0) {
                $(document.body).css({"overflow-x": "auto", "overflow-y": "auto"});
            }
        };

        $(html).dialog(option);
        $('#' + winId).load(option['url'], option['data'] != undefined ? option['data'] : null, function () {
            if (option['success'] && $.isFunction(option['success'])) {
                option['success']();
            }
            pageSetUp();
        });

        var dialogCount = window['dialogCount'];
        if (dialogCount) {
            window['dialogCount'] = dialogCount + 1;
        } else {
            window['dialogCount'] = 1;
            $(document.body).css({"overflow-x": "hidden", "overflow-y": "hidden"});
        }

        return winId;
    },

    /**
     * 无阻碍消息提示
     */
    toast: function (msg) {
        layer.msg(msg, {offset: 't'});
    },

    /**
     * 询问弹窗
     */
    confirm: function () {
        var o = {};
        var length = arguments.length;
        o['title'] = arguments[0];
        o['content'] = arguments[1];
        o['width'] = 400;
        o['height'] = 280;
        o['modal'] = true;
        var okFunction = arguments[2];
        o['buttons'] = [
            {
                text: '确定', "class": "btn btn-primary", click: function () {
                $(this).dialog('close');
                okFunction(true);
            }
            },
            {
                text: '取消', "class": "btn btn-default", click: function () {
                $(this).dialog('close');
                okFunction(false);
            }
            }
        ];

        var html = '<div style="text-align:center;vertical-align:middle;"><table style="width:100%;height:100%;"><tr><td>'
            + '<i class="fa fa-3x fa-question txt-color-red"></i><h3>' + o['content'] + '</h3>'
            + '</td></tr></table></div>';
        o['close'] = function (ev, ui) {
            $(this).dialog("destroy");
        };
        $(html).dialog(o);
    },

    /**
     * 弹框提示
     * 0:标题
     * 1:提示内容
     */
    alert: function () {
        var o = {};
        var length = arguments.length;
        if (length == 1) {
            o = arguments[0];
        } else {
            o['title'] = arguments[0];
            o['content'] = arguments[1];
            if (length > 2) {
                if (arguments[2] && $.isFunction(arguments[2])) {
                    o['success'] = arguments[2];
                } else {
                    o['type'] = arguments[2];
                }
                if (length > 3) {
                    o['success'] = arguments[3]
                }
            }
        }

        if (!o['title']) o['title'] = '提示';
        if (!o['width']) o['width'] = 400;
        if (!o['height']) o['height'] = 260;
        if (!o['type']) o['type'] = 'info';
        o['modal'] = true;

        o['buttons'] = [{
            text: '确定', 'class': 'btn btn-primary', click: function () {
                $(this).dialog('close');
                if (o['success']) o['success']();
            }
        }];
        var typeClass = 'fa fa-3x  fa-comment txt-color-blue';
        if (o['type'] == 'warn') typeClass = 'fa fa-3x fa-warning txt-color-yellow';
        else if (o['type'] == 'error') typeClass = 'fa fa-3x fa-flash txt-color-red';
        var html = '<div style="text-align:center;vertical-align:middle;"><table style="width:100%;height:100%;"><tr><td>'
            + '<i class="' + typeClass + '"></i><h3>' + o['content'] + '</h3>'
            + '</td></tr></table></div>';
        o['close'] = function (ev, ui) {
            $(this).dialog("destroy");
        };
        $(html).dialog(o);
    },

    /**
     * 对form的查询的简化
     */
    search: function (form, gridId, params) {
        var postData = $("#" + gridId).jqGrid("getGridParam", "postData");
        $.extend(postData, form.serializeJson());
        if (params) {
            $.extend(postData, params);
        }
        $("#" + gridId).jqGrid("setGridParam", {search: true}).trigger("reloadGrid", [{page: 1}]);
    },

    wait: function () {
        layer.load(2);
    },
    stopWait: function () {
        layer.closeAll('loading');
    },

    /**
     * 角色选择
     */
    chooseRole: function (o) {
        loadScript("static/modules/system/role/choose.js", function () {
            $.system.role.choose.init(o);
        });
    },
    /**
     * 部门选择
     */
    chooseDept: function (o) {
        loadScript("static/modules/system/dept/choose.js", function () {
            $.system.dept.choose.init(o);
        });
    },
    /**
     * 用户选择
     * o.callback:选择用户后的回调，参数为被选择的用户列表(列表具体结构可console参看)，callback返回true将关闭用户选择窗口，否则不关闭
     */
    chooseUser: function (o) {
        loadScript("static/modules/system/user/choose.js", function () {
            $.system.user.choose.init(o);
        });
    },
    /**
     * 重置表单
     */
    formReset: function (formId, parentEle) {
    	var form;
		if(parentEle != undefined){
			form = $('#' + formId,$(parentEle));
		}else{
			form = $('#' + formId);
		}
		if(form.length>0){
			form[0].reset();
		}
    },
    /**
     * 清空隐藏ID
     */
    selectChange: function (containId) {
        $(containId).val("");
    },
    /**
     * 文件上传，仅支持html5浏览器，
     * 采用ajax文件上传
     * params:
     *    file:待上传文件(可以是文件标签的id，也可以是element)，可支持html的multiple属性(一次上传多个文件)
     *    success:请求成功后的回调(并不表示一定会上传成功，需要根据回调参数判断是否上传成功)
     *            回调参数如下:
     *            resultCode:1,表示上传成功，0,表示上传失败
     *          object:数组，具体参考cn.com.intasect.entity.common.Attachment类(其对象数组json)
     *            {"resultCode":1,
	 * 			 "message":null,
	 * 			 "object":[{"status":null,"createdTime":1453699850228,"createdUserId":0,"createdUserName":null,"remark":null,"id":23,"fileName":"上传文件原名称.xlsx","filePath":"/20160125/20160125133050_0797.xlsx","flag":"0"}]
	 * 			}
     *  error:请求失败后的回调
     */
    upFile: function (o) {
        var file = null;
        if ($.type(o.file) == $.type('')) {
            file = $('#' + o.file)[0];
        } else {
            file = o.file[0];
        }

        if (file.files.length == 0) {
            return;
        }

        console.log(file.files.length);

        var formData = new FormData();
        for (var i = 0; i < file.files.length; i++) {
            formData.append('file_' + i, file.files[i]);
        }

        $.ajax({
            type: 'post',
            url: o.rootUrl ? o.rootUrl + '/common/attachment/upload' : 'common/attachment/upload',
            data: formData,
            dataType: 'json',
            sync: true,
            headers: {extParams: o.extParams},
            processData: false,
            contentType: false,
            success: function (json) {
                if (o.success) {
                    o.success(json);
                }
            },
            error: function (e) {
                if (o.error) {
                    o.error(e);
                }
            }
        });
    }
});

Date.prototype.format = function (format) {
    /* 
     * eg:format="yyyy-MM-dd hh:mm:ss"; 
     */
    var o = {
        "M+": this.getMonth() + 1, // month
        "d+": this.getDate(), // day
        "h+": this.getHours(), // hour
        "m+": this.getMinutes(), // minute
        "s+": this.getSeconds(), // second
        "q+": Math.floor((this.getMonth() + 3) / 3), // quarter
        "S": this.getMilliseconds()
        // millisecond  
    }

    if (/(y+)/.test(format)) {
        format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4
            - RegExp.$1.length));
    }

    for (var k in o) {
        if (new RegExp("(" + k + ")").test(format)) {
            format = format.replace(RegExp.$1, RegExp.$1.length == 1
                ? o[k]
                : ("00" + o[k]).substr(("" + o[k]).length));
        }
    }
    return format;
};

(function ($) {
    $.fn.serializeJson = function () {
        var serializeObj = {};
        $(this.serializeArray()).each(function () {
            //对应%查询和查询条件（前后去空可以在这做）
            serializeObj[this.name] = this.value.replace('%', '\\%');
        });
        return serializeObj;
    };
})(jQuery);
$.ajaxSetup({
    headers: {
        'Author': 'isct.com.cn'
    },
    beforeSend: function (xhr) {
        var url = this['url'];
        if (this['sync']) {
            if (!window.sendUrls) {
                window.sendUrls = {};
            }
            if (window.sendUrls[url]) {
                var sendTime = window.sendUrls[url];
                var now = new Date();
                if (now.getTime() - sendTime.getTime() < 1000) {
                    $.toast('数据提交过于频繁!');
                    return false;
                }
            }
            window.sendUrls[url] = new Date();
            $.wait();
        }
        //缓存问题
        if (url != undefined) {
            if (url.indexOf('?') > -1) {
                this['url'] = url + '&_date=' + new Date().getTime();
            } else {
                this['url'] = url + '?_date=' + new Date().getTime();
            }
        }

        return true;
    },
    complete: function (xhr, ts) {
        console.log('ajax complete...');
        if (xhr['status'] == 200 && $.trim(xhr['responseText']) == 'timeout') {
            window.top.location = 'login';
            return;
        }
        if (xhr['status'] == 500) {
            $.alert({
                title: '异常提示',
                content: xhr['responseText'],
                width: $(window).width() * 0.8,
                height: $(window).height() * 0.8,
                type: 'error'
            });
        }
        if (this['sync']) {
            $.stopWait();
        }
    }
});
