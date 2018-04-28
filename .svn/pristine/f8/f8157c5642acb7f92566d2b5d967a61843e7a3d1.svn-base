<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!-- row -->
<div class="row" id="demo-i18n">
	<div class="well">
		<spring:message code="money" ></spring:message>
	</div>
	<br />
	
	<a href="${ctx}/demo/i18n-change?language=en&country=US">English</a>
	&nbsp;
	<a href="${ctx}/demo/i18n-change?language=zh&country=CN">中文</a>
	&nbsp;
	<a href="${ctx}/demo/i18n-change?language=ja&country=JP">日文</a>
	&nbsp;
	<a href="#" onclick="clickI18N();">JS国际化</a>
</div>
<!-- end row -->
<script type="text/javascript" src="${ctx}/<spring:message code='i18n.js' />"></script>
<script type="text/javascript">
	function clickI18N(){
		alert(i18n.lang);
	}
</script>