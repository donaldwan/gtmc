<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/common/taglibs.jsp" %>

<div id="common-demo-upfile">
    <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <div class="jarviswidget jarviswidget-color-lightblue" data-widget-editbutton="false"
             data-widget-togglebutton="false" data-widget-deletebutton="false">
            <header>
                <h2><strong>文件打包例子</strong> <i></i></h2>
            </header>
            <div class="widget-body">
                <div class="well">
                    <form class="form-horizontal" id="form-search-system-role">
                        <div class="form-group">
                            <label class="col-md-2 control-label"></label>
                            <label class="col-md-5 control-label pull-left">例子会造成通知信息增加，可忽略</label>
                        </div>
                        <!-- 单个文件上传 -->
                        <div class="form-group">
                            <label class="col-md-2 control-label">打包文件参数:</label>
                            <div class="col-md-5">
                                <textarea rows="5" class="form-control" style="width:100%" id="packagefile-demo-param">{"ids":[202119394, 2140399592]}</textarea>
                                <p>类似{ids:[202119394, 2140399592],paths:{'\demo.txt'}} </p>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-2 control-label"></label>
                            <div class="col-md-5">
                                <a id="packagefile-demo-package-btn" class="btn btn-primary btn-sm"
                                   href="javascript:void(0);"><i class="fa fa-upload"></i>&nbsp;打&nbsp;包</a>&nbsp;<span>打包任务提交按钮</span>
                            </div>
                        </div>


                        <div class="form-group">
                            <label class="col-md-2 control-label">上传后回传参数:</label>
                            <div class="col-md-5">
                                <textarea rows="5" class="form-control" style="width:100%"
                                          id="packagefile-demo-package-back-text"></textarea>
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-2 control-label"></label>
                            <div class="col-md-5">
                                <a id="packagefile-demo-down-btn" class="btn btn-primary btn-sm"
                                   href="javascript:void(0);"
                                   onclick="window.location.href='common/attachment/download/packaged/0';$(this).attr('disabled','disabled');"><i
                                        class="fa fa-upload"></i>&nbsp;下&nbsp;载</a>&nbsp;<span>下载打包文件按钮（现逻辑只能下载一次，成功开始下载失败显示null）</span>
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
        $('#packagefile-demo-package-btn').click(function () {
            $.ajax({
                url: 'common/attachment/download/package',
                type: 'post',
                contentType: 'application/json;charset=utf-8',
                sync: false,
                data: $('#packagefile-demo-param').val(),
                success: function (data) {
                    $('#packagefile-demo-package-back-text').val(JSON.stringify(data));
                }
            });
        })
    });
</script>
