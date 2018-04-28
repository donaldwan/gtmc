$(function () {
    $("#smart-styles > a").on("click",
        function () {
            var a = $(this),
                b = $("#logo img");
            $.root_.removeClassPrefix("smart-style").addClass(a.attr("id")),
                $("html").removeClassPrefix("smart-style").addClass(a.attr("id")),
                b.attr("src", a.data("skinlogo")),
                $("#smart-styles > a #skin-checked").remove(),
                a.prepend("<i class='fa fa-check fa-fw' id='skin-checked'></i>")
        });

    window.setInterval(function () {
        $('#id-span-current-time').html(new Date().format("yyyy-MM-dd hh:mm:ss"));
    }, 1000);

    $('#smart-style-4').click();

    $.root_.addClass("fixed-header");
    $.root_.addClass("fixed-navigation");
    $.root_.removeClass("container");

    $('#init-cover').delay(500).remove();

    $(document).keydown(function (e) {
        if (e.keyCode == 8) {
            console.log(e);
            var tagName = e.target.tagName.toUpperCase();
            //console.log('e.targetName:' + tagName);
            if (tagName == 'INPUT' || tagName == 'TEXTAREA' || tagName == 'PASSWORD' || tagName == 'FILE') {
            } else {
                e.preventDefault();
            }
        }
        if (e.keyCode == 116) {
            //refresh();
            e.preventDefault();
        }
    });

    /**
     $.getJSON('get-js-modules',function(list){
		$.each(list,function(i,url){
			console.log(url);
			loadScript(url);
		});
	});
     */
});

var bimianchongfuInterval;

$(function () {
    getUserMessage();

    bimianchongfuInterval = window.setInterval(function () {
        refreshCount();
    }, $.message_fresh_time ? $.message_fresh_time : 1000 * 60 * 10);
});

function getUserMessage() {
    var _this = $($('input[name="activity"]')[0]);
    var url = _this.attr("id");
    var container = $(".ajax-notifications");
    //BUG FIX
    fixLoadURL({url: url, container: container});
    _this.click();
}

function fixLoadURL(o) {
    var url = o.url;
    var container = o.container;
    container.html($.ajax({url: url, async: false}).responseText)
}

function refreshCount() {
    var b = $('#activity');

    var unreadCount = b.find(".badge");
    var ls = b.next('.ajax-dropdown').find('label');
    var unreadCountUser = $(ls[0]);
    var unreadCountSystem = $(ls[1]);

    $.ajax({
        url: 'system/notify/refresh-count',
        dataType: 'json',
        success: function (data) {
            unreadCount.html(data.unreadCount);
            unreadCountUser.html('<input type=\"radio\" name=\"activity\" id=\"system/notify/message?msgType=02\"> 用户消息 (' + data.unreadCountUser + ')');
            unreadCountSystem.html('<input type=\"radio\" name=\"activity\" id=\"system/notify/message?msgType=01\">系统通知 (' + data.unreadCountSystem + ')');

            $('input[name="activity"]').change(function () {
                var a = $(this);
                var url = a.attr("id");
                var container = $(".ajax-notifications");
                fixLoadURL({url: url, container: container});
                a = null
            });
        }
    });
}

function loadHome() {
    window.location.hash = 'home';
    //loadURL({container:$("#content"),url:'home',openType:'D'});
}

function goBack() {
    var a = location.href.split("#").splice(1).join("#");
    console.log(a);
    if (a == '' || a == 'undefined' || typeof(a) == 'undefined' || a == 'home') {
        console.log('can not back...');
    } else {
        window.history.back();
    }
}

function goForward() {
    window.history.forward();
}

function refresh() {
    var a = location.href.split("#").splice(1).join("#");
    var divId = '_dv-content-' + $.md5(a);
    $('#' + divId).remove();
    checkURL();
}

//验证密码强度规则    
$.validator.addMethod("checkPasswordRole", function (value, element) {
    return this.optional(element) || /^[a-zA-Z0-9]{5,32}$/.test(value);
//     "密码只能包含大小写字母和数字的组合，长度在8-32之间"
//     return this.optional(element) ||/^(?=^.{8,32}$)(?=(?:.*?\d){1})(?=(?:.*?[A-Z]){1})(?=(?:.*?[a-z]){1})(?!.*\s)[0-9a-zA-Z!@#$%*()_+^&]*$/.test(value); 
}, "密码只能包含大小写字母和数字的组合，长度在5-32之间");

/**
 * 修改密码
 * @param c
 */
function pwdChange(c) {
    var buttons = [];

    buttons.push({
        text: '保    存', 'class': 'btn btn-primary', click: function () {
            if ($('#id-form-pwd-change').valid()) {
                var form = $('#id-form-pwd-change');
                $.ajax({
                    url: 'system/user/update-pwd',
                    type: 'post',
                    dataType: 'json',
                    sync: true,
                    data: $('#id-form-pwd-change').serialize(),
                    success: function (json) {
                        if (json.resultCode == 0) {
                            $.alert('提示', json.message, 'error');
                        } else {
                            window.location = 'j_spring_security_logout';
                        }
                    }
                });
            }
        }
    });

    if (c) {
        buttons.push({
            text: '取    消', 'class': 'btn btn-default', click: function () {
                $(this).dialog('close');
            }
        });
    }

    $.dialog({
        title: '密码修改',
        width: 600,
        height: 450,
        modal: true,
        url: 'system/user/showPwdChangePage?showCloseBtnFlag=1',
        buttons: buttons,
        success: function () {
            $("#id-form-pwd-change").validate({
                rules: {
                    oldLoginPassword: {
                        required: true,
                        remote: {
                            type: "post",
                            dateType: 'json',
                            url: "system/user/check-old-pwd",
                            data: {
                                oldLoginPassword: function () {
                                    return $("#oldLoginPassword").val()
                                }
                            }
                        }
                    },
                    newLoginPassword: {
                        required: true,
                        rangelength: [5, 32],
                        equalNo: '#oldLoginPassword',
                        checkPasswordRole: true
                    },
                    confirmNewLoginPassword: {
                        required: true,
                        equalTo: '#newLoginPassword',
                        checkPasswordRole: true
                    }
                },
                messages: {
                    oldLoginPassword: {
                        remote: '旧密码不正确'
                    }
                }
            });
        }
    });
}