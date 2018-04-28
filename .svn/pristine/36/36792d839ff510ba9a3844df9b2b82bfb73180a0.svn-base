<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fun" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:forEach var="menu" items="${menus}" varStatus="vs">  
  <c:set var="index" value="${index + 1}" scope="request" />
  
  <li>
  	<c:if test="${empty menu.uri}">
  		<a href="#" title="${menu.screenName}" iconCls="${menu.normalCss }">
  	</c:if>
	<c:if test="${not empty menu.uri}">
  		<a href="${menu.uri}" title="${menu.screenName}" iconCls="${menu.normalCss }" openType="${menu.openType}">
  	</c:if>
		<c:if test="${empty menu.normalCss}">
			<c:if test="${level == 0 }">
				<i class="fa fa-lg fa-fw fa-windows"></i>
			</c:if>
			<c:if test="${level != 0 and menu.isParent}">
				<i class="fa fa-lg fa-fw fa-folder-open"></i>
			</c:if>
			<c:if test="${level != 0 and !menu.isParent}">
				<i class="fa fa-lg fa-fw fa-file-text"></i>
			</c:if>
		</c:if>
		<c:if test="${not empty menu.normalCss}">
			<i class="fa fa-lg fa-fw ${menu.normalCss }"></i> 
		</c:if>
	<span class="menu-item-parent">${menu.screenName}</span></a>
	
  <c:if test="${menu.isParent}"> 
  	<ul>
	    <c:set var="level" value="${level + 1}" scope="request" />
	    <c:set var="menus" value="${menu.children}" scope="request" />
	    <c:import url="menu.jsp" />
    </ul>
  </c:if>
  
  </li>	
  
</c:forEach>  
<c:set var="level" value="${level - 1}" scope="request" />  
				