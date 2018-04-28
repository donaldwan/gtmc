<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fun" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="request"/>
<style type="text/css">
	.history{
		border:3px solid #0000FF;
		position:absolute;
	}
	.current{
		border:3px solid #FF0000;
		position:absolute;
	}
</style>
<div style="position:relative;">
	<img alt="流程跟踪图" src="${ctx}/plugins/wf/definition/create-process-diagram?processDefinitionKey=${processDefinitionKey}&taskId=${taskId}&processInstanceId=${instanceId}">

	<c:if test="${not empty activities}">
		<c:forEach items="${activities}" var="ac">
			<div class="history" style="width:${ac.width+5}px;height:${ac.height+5}px;top:${ac.y-2}px;left:${ac.x-2}px;"></div>
		</c:forEach>
	</c:if>
	<c:if test="${not empty currentActivities}">
		<c:forEach items="${currentActivities}" var="currentActivity">
			<div class="current" style="width:${currentActivity.width+5}px;height:${currentActivity.height+5}px;top:${currentActivity.y-2}px;left:${currentActivity.x-2}px;"></div>
		</c:forEach>
	</c:if>
</div>