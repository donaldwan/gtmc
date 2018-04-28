<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/common/taglibs.jsp" %>

<!-- row -->
<div class="row" id="system-notify-detail">
    <div class="well">
        <div class="widget-body">
            <h2 class="alert alert-success"> ${model.title}</h2>
            <br><br>
            <span>${model.content}</span>
            <br><br>
            <br><br>
            <div class="col-md-5  pull-right">
                <span class="subject">${model.releaseUserName}</span>&nbsp;&nbsp;&nbsp;
                <time><fmt:formatDate value="${model.releaseTime}" pattern="yyyy-MM-dd HH:mm:ss"/></time>
            </div>
            <div class="col-md-3 pull-left">
                <c:forEach items="${scripts}" var="li" varStatus="status">
                    <a id="bt-add" class="btn btn-success btn-sm" href="javascript:void(0);"
                       onclick="window.location.href='${li.url}';$(this).attr('disabled','disabled');"><i
                            class="fa fa-plus"></i>${li.name}</a>
                </c:forEach>
            </div>
            <br>
        </div>
    </div>
</div>
<!-- end row -->