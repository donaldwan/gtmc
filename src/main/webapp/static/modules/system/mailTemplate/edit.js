$.namespace("system.mailTemplate.edit");

$.system.mailTemplate.edit.mailTemplateEdit = function () {
    var te = $.system.mailTemplate.edit.templateEditor;
    if (!te.getContentTxt() || te.getContentTxt().length == 0) {
        $.toast('请输入邮件模版内容!');
        return false;
    }
    var form = $("#id-edit-form-mailTemplate", $.system.mailTemplate.edit.container);
    if (!form.valid()) {
        return false;
    }
    $.ajax({
        type: 'post',
        dataType: 'json',
        url: 'system/mailTemplate/save',
        data: $('#id-edit-form-mailTemplate').serialize(),
        success: function (json) {
            if (json.resultCode == 1) {
                $.toast("保存成功");
                $('#' + $.system.mailTemplate.manager.winId).dialog('close');
                $("#" + $.system.mailTemplate.manager.gridId).jqGrid("setGridParam", {search: true}).trigger("reloadGrid");
                //$.system.mailTemplate.edit.templateEditor.destroy();
            } else {
                $.toast("保存失败");
            }
        }
    });
};

$.system.mailTemplate.edit.init = function () {
    $.system.mailTemplate.edit.container = $("#wid-id-system-mailTemplate-edit");

    var te = UM.getEditor('templateEditor', {
        toolbar: [
            'undo redo | bold italic underline strikethrough | superscript subscript | forecolor backcolor | removeformat selectall cleardoc |',
            'insertorderedlist insertunorderedlist | fontfamily fontsize paragraph',
            '| justifyleft justifycenter justifyright justifyjustify'
        ]
    });
    $.system.mailTemplate.edit.templateEditor = te;

    var tc = $("#templateContent-edit-mailTemplate", $.system.mailTemplate.edit.container);
    te.setContent(tc.val());
    te.addListener('contentchange',function(){
        tc.val(te.getContent());
    });
    //BUG FIX
    te.addListener('keydown',function(type, event){
        if(event.keyCode == 8){
            event.stopPropagation();
        }
    });

    $("#id-edit-form-mailTemplate", $.system.mailTemplate.edit.container).validate({
        rules: {
            remark: {
                required: true,
                minlength: 5,
                maxlength: 60
            }
        }
    });
};