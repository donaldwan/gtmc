<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fun" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="request"/>
<div class="row well" id="plugin-wf-workflow-node-exclusive-gateway">
	<div class="fuelux">
		<div class="wizard">
			<ul class="steps">
				<li data-target="#user-task-step1" class="active">
					<span class="badge badge-info">1</span>出口条件设置<span class="chevron"></span>
				</li>
				<li data-target="#user-task-step2">
					<span class="badge">2</span>出口监听事件<span class="chevron"></span>
				</li>
			</ul>
			<div class="actions">
				<button type="button" class="btn btn-sm btn-primary btn-prev">
					<i class="fa fa-arrow-left"></i>上一步
				</button>
				<button type="button" class="btn btn-sm btn-success btn-next" data-last="结束">
					下一步<i class="fa fa-arrow-right"></i>
				</button>
			</div>
		</div>
		
		<div class="step-content">
			
				<div class="step-pane active" id="user-task-step1">
					<h3><strong>步骤1</strong>-出口条件设置</h3>
					<div class="row">
						<form class="form-horizontal" id="id-form-plugins-wf-exclusive-gateway">
							<input type="hidden" id="id-pid" value="${pid}">
							<c:forEach items="${outs}" var="o">
								<div class="form-group">
									<label class="col-md-3 control-label form-label">
										${o.name}<br />
										<a>->${o.targetName}</a>
									</label>
									<div class="col-md-6">
										<textarea  class="col-xs-12 col-sm-12 form-control" rows="3" tid="${o.id}" ename="${o.name}">
											<c:forEach items="${eps}" var="e">
												<c:if test="${e.elementId eq o.id}">${e.conditionExpression}</c:if>
											</c:forEach>			
										</textarea>
									</div>
								</div>
							</c:forEach>
							<div class="form-group">
									<label class="col-md-3 control-label form-label"></label>
									<div class="col-md-6">
										<a class="btn btn-primary btn-sm" onclick="$.plugins.wf.workflow.exclusive_gateway.save();" href="javascript:void(0);"><i class="fa fa-check"></i>&nbsp;确&nbsp;认</a>
									</div>
								</div>
						</form>
					</div>
				</div>
				
				<div class="step-pane" id="user-task-step2">
					<h3><strong>步骤2</strong> - 任务出口监听事件</h3>
					<div id="id-dv-gateway-flow-listener" class="row"></div>
				</div>
		</div>
	</div>
</div>
<script type="text/javascript">
    loadScript("${ctx}/static/modules/plugins/wf/workflow/exclusive-gateway.js", function () {
        $.plugins.wf.workflow.exclusive_gateway.init({pid: '${pid}', 'taskKey': '${taskKey}'});
    });
</script>