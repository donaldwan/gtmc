$.namespace('system.mynotify.message');

$.system.mynotify.message.openDetailWindow = function (id, msgType) {
    var buttons = [
        {
            text: '关闭', class: 'btn btn-default btn-sm', click: function () {
            $('#' + $.system.mynotify.message.detailWinId).dialog('close');
        }
        }];

    var bimianchongfuInterval;

    $.system.mynotify.message.detailWinId =
        $.dialog({
            url: 'system/notify/detail?id=' + id + '&msgType='  + msgType,
            title: '查看站内消息',
            width: 600,
            height: 650,
            modal: true,
            buttons: buttons,
            success: function () {
                $("#activity").next(".ajax-dropdown").hide();
                // BUG FIX
                window.clearInterval(bimianchongfuInterval);

                var d =$('#'+$.system.mynotify.message.detailWinId);
                d.delay(800);
                getUserMessage();
                d.delay(800);
                refreshCount();

                bimianchongfuInterval = window.setInterval(function(){
                    refreshCount();
                },10000);
            }
        });
};