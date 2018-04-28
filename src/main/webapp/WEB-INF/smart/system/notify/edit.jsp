<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/common/taglibs.jsp" %>


<div id="system-notify-edit">
    <form class="form-horizontal" id="form-edit-system-notify">
        <input type="hidden" id="id" name="id" value="${model.id}"/>
        <input type="hidden" id="status" name="status" value="A"/>
        <input type="hidden" id="message-userIds" name="userIds"/>
        <div class="form-group">
            <label class="col-md-2 control-label"><font color="red">*</font>消息标题:</label>
            <div class="col-md-9">
                <input class="form-control" placeholder="请输入消息标题..." type="text"
                       id="title" name="title" value="${model.title }" ${isDetail?'disabled':''}/>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-2 control-label"><font color="red">*</font>消息内容:</label>
            <div class="col-md-9">
                    <textarea class="form-control" placeholder="请输入消息内容..." maxlength="1000"
                              id="message-content" name="content"
                              style="width: 100%; height: 200px; max-height: 300px; min-height: 200px; resize: vertical"
                    ${isDetail?'disabled':''}>${model.content }</textarea>
            </div>
        </div>
        <div class="form-group">
            <label class="col-md-2 control-label"><font color="red">*</font>消息类型:</label>
            <div class="col-md-9">
                <label class="radio radio-inline">
                    <input type="radio" class="radiobox" name="msgType" value="01" checked="checked">
                    <span>系统消息</span>
                </label>
                <label class="radio radio-inline">
                    <input type="radio" class="radiobox" name="msgType" value="02">
                    <span>用户消息</span>
                </label>
            </div>
        </div>
        <div class="form-group" id="system-notify-edit-user-list">
            <label class="col-md-2 control-label">用户列表:</label>
            <div class="col-md-9">
                <div id="system-notify-edit-user-table"></div>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript">
    loadScript("${ctx}/static/modules/system/notify/notify-add.js", function () {
        $.system.mynotify.add.init();
    });
</script>