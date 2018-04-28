<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/common/taglibs.jsp" %>

<div id="template-demo-mail">
    <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <div class="jarviswidget jarviswidget-color-lightblue" data-widget-editbutton="false"
             data-widget-togglebutton="false" data-widget-deletebutton="false">
            <header>
                <h2><strong>模版邮件发送例子</strong> <i></i></h2>
            </header>
            <div class="widget-body">
                <div class="well">
                    <form class="form-horizontal" id="form-search-system-role">
                        <div class="form-group">
                            <label for="id-to-address" class="col-xs-12 col-sm-3 col-md-3 col-lg-2 control-label">To邮件地址:</label>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                <input id="id-to-address" class="form-control" name="toAddress" type="text"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="id-template-name" class="col-xs-12 col-sm-3 col-md-3 col-lg-2 control-label">模版名称（从邮件模版管理页面获取）:</label>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                <input id="id-template-name" class="form-control" name="templateName" type="text" value="1487225584693.vm"/>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-12 col-sm-3 col-md-3 col-lg-2 control-label">模拟填充参数:</label>
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                <textarea rows="5" class="form-control" style="width:100%"
                                          id="id-params">{"userName":"adminadmin"}</textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-xs-12 col-sm-3 col-md-3 col-lg-2 control-label">邮件名称为[测试邮件XXXX]</label>
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-5">
                                <a id="bt-send-mail" class="btn btn-primary btn-sm" href="javascript:void(0);"><i
                                        class="fa fa-upload"></i>&nbsp;发&nbsp;送</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </article>

</div>
<script type="text/javascript">
    $(function () {
        var container = $('#template-demo-mail');

        $(function () {
            $('#bt-send-mail', container).click(function () {
                var p = {
                    toAddress: $('#id-to-address', container).val(),
                    templateName: $('#id-template-name', container).val(),
                    params: $('#id-params', container).val()
                };

                $.ajax({
                    url: 'demo/template-demo/sendMail',
                    type: 'post',
                    contentType: 'application/json;charset=utf-8',
                    sync: false,
                    data: JSON.stringify(p),
                    success: function (data) {
                    	if(data.resultCode == 1){
                        	$.toast("邮件发送成功！");
                    	}
                    }
                });
            })
        });
    });
</script>
