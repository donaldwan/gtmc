<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/common/taglibs.jsp" %>

<style>
    .notification-body > li a.msg {
        padding-left: 0 !important;
    }
</style>
<ul class="notification-body">
    <c:forEach items="${messages}" var="m">
    <li>
        <span class="unread">
            <a href="javascript:void(0);" ondblclick="$.system.mynotify.message.openDetailWindow(${m.id},'${m.msgType}')" class="msg">
                <span class="from">${m.releaseUserName} <i class="icon-paperclip"></i></span>
                <time><fmt:formatDate value="${m.releaseTime}" pattern="yyyy-MM-dd HH:mm:ss" /> </time>
                <span class="subject">${m.title}</span>
            </a>
        </span>
    </li>
    </c:forEach>
</ul>

<script type="text/javascript">
    loadScript("${ctx}/static/modules/system/notify/message.js", function () {
    });
</script>