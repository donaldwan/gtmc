<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fun" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="page"/>

<!-- 非明细页面 -->
<c:if test="${isDetail eq '0'}">
	<div class="col-12">
		<label class="input">
			<input class="form-control" placeholder="备注信息..." type="text" name="wfRemark" id="wfRemark"
				processDefinitionKey="${processDefinitionKey }" taskId="${taskId}">
		</label>
	</div>
	<br />
	<!-- 判断是否可进行回退操作 -->
	<c:if test="${not empty backActivities}">
		<div class="col-12">
			<label class="select col-6">
				<select id="backTargetId" name="backTargetId">
					<option value="">回退节点选择...</option>
					<c:forEach items="${backActivities}" var="ba">
						<option value="${ba.id}">${ba.name}</option>
					</c:forEach>
				</select> 
				<i></i>
			</label>
		</div>
		<br />
	</c:if>
	
</c:if>

<div class="col-12" id="_complete_buttons_custome">
	<!-- 一些额外的参数 -->
	<div style="display:none;">
		<!-- 数据保存url -->
		<input type="hidden" id="completeUrl" value="${completeUrl}" />
		<!-- 回退URL -->
		<input type="hidden" id="backUrl" value="${backUrl}" />
		<!-- 点击按钮 -->
		<input type="hidden" id="transitionId" name="transitionId" value=""/>
		<!-- 是否草稿 -->
		<input type="hidden" id="isDraft" name="isDraft" value="false"/>
		<!-- 任务ID -->
		<input type="hidden" id="taskId" name="taskId" value="${taskId}"/>
	</div>
	
	<c:forEach items="${buttons}" var="bt">
		<a id="bt-complete-${bt.id}" transitionId="${bt.id}" class="btn btn-primary btn-sm" href="javascript:void(0);"><i class="fa  fa-arrow-circle-o-right"></i>
			&nbsp;<c:if test="${empty bt.name}">提交</c:if>
				  <c:if test="${not empty bt.name}">${bt.name}</c:if>
		</a>
	</c:forEach>
	
	<!-- 草稿按钮 -->
	<c:if test="${isDetail eq '0'}">
		<a id="wf-bt-draft" class="btn btn-default btn-sm" href="javascript:void(0);"><i class="fa  fa-external-link"></i>&nbsp;草&nbsp;&nbsp;搞</a>
	</c:if>
	
	<!-- 查看流程图按钮 -->
	<a id="wf-bt-diagram" class="btn btn-default btn-sm" processDefinitionKey="${processDefinitionKey}" taskId="${taskId}" instanceId="${instanceId}" href="javascript:void(0);"><i class="fa fa-file-excel-o"></i>&nbsp;流程图</a>
	
	<!-- 放弃操作 -->
	<c:if test="${isDetail eq '0'}">
		<c:if test="${not empty backActivities}">
			<a id="wf-bt-back" class="btn btn-default btn-sm" href="javascript:void(0);" title="回退到流转过的指定任务节点"><i class="fa fa-backward"></i>&nbsp;回&nbsp;&nbsp;退</a>
		</c:if>
	
		<a id="wf-bt-cancel" class="btn btn-default btn-sm" href="javascript:void(0);"><i class="fa fa-times-circle"></i>&nbsp;取&nbsp;&nbsp;消</a>
		
	</c:if>
	
	<!-- 明细页面 -->
	<c:if test="${isDetail eq '1'}">
		<a id="wf-bt-cancel" class="btn btn-default btn-sm" href="javascript:void(0);"><i class="fa fa-times-circle"></i>&nbsp;关&nbsp;&nbsp;闭</a>
	</c:if>
	
	
</div>