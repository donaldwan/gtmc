<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% 
	String requestType = request.getHeader("X-Requested-With");
	if(requestType == null ){
%>
<script type="text/javascript">
	window.top.location = '${pageContext.request.contextPath}/login';
</script>
<%
	}else{out.print("timeout");}
%>