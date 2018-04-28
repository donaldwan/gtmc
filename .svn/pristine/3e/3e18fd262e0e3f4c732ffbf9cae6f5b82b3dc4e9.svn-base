<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/common/taglibs.jsp"/>

<div id="wid-id-system-mailTemplate-edit">
    <form class="form-horizontal" id="id-edit-form-mailTemplate">
        <input type="hidden" id="id-edit-mailTemplate" name="id" value="${model.id}">
        <input type="hidden" id="templateName-edit-mailTemplate" name="templateName" value="${model.templateName}">
        <input type="hidden" id="templateContent-edit-mailTemplate" name="templateContent"
               value="${model.templateContent}">
        <div class="form-group">
            <label class="control-label no-padding-right col-sm-2" for="id-remark">模版描述:</label>
            <div class="col-sm-9">
                <input type="text" name="remark" id="id-remark" placeholder="请输入模版描述..." class="form-control"
                       value="${model.remark}"/>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label no-padding-right col-sm-2" for="id-remark">模版内容:</label>
            <div class="col-sm-9">
                <script type="text/plain" id="templateEditor" style="width:100%;height:220px;"></script>
            </div>
        </div>
        <div class="form-group">
            <label class="control-label no-padding-right col-sm-2" for="id-status">状态:</label>
            <div class="col-sm-9">
                <select class="form-control" name="status" id="id-status">
                    <option value="A" ${model.status eq 'A'?'selected':'' }>有效</option>
                    <option value="D" ${model.status eq 'D'?'selected':'' }>无效</option>
                </select>
            </div>
        </div>

    </form>
</div>

<script type="text/javascript">
    loadScript("${ctx}/static/plugin/umeditor/third-party/template.min.js", function () {
        loadScript("${ctx}/static/plugin/umeditor/umeditor.config.js", function () {
            loadScript("${ctx}/static/plugin/umeditor/umeditor.config.js", function () {
                loadScript("${ctx}/static/plugin/umeditor/umeditor.min.js", function () {
                    loadScript("${ctx}/static/plugin/umeditor/lang/zh-cn/zh-cn.js", function () {
                        loadScript("${ctx}/static/modules/system/mailTemplate/edit.js", function () {
                            $.system.mailTemplate.edit.init();
                        });
                    });
                });
            });
        });
    });
</script>

