<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<form class="form-horizontal" id="user-task-flow-listener" style="width: 99.6%;">
		<input type="hidden" id="id-pid" value=${pid}>
		<c:forEach items="${outs}" var="o">
			<fieldset>
				<legend>${o.name} -> ${o.targetName}</legend>
				<div class="form-group">
					<label class="col-md-2 control-label">处理类型:</label>
					<div class="col-md-6">
						<div class="input-group">
							<select class="form-control" id="select-type-${o.id}" flowid=${o.id}>
								<option value="B" ${(o.processType eq 'B')?'selected':''}>自定义Bean</option>
								<option value="S" ${(o.processType eq 'S')?'selected':''}>自定义脚本</option>
							</select>
							<span class="input-group-addon" ><i class="fa fa-warning"></i></span>
						</div>
					</div>
				</div>
				
				<div class="form-group" id="dv-bean-${o.id}">
					<label class="col-md-2 control-label">Bean ID:</label>
					<div class="col-md-6">
						<div class="input-group">
							<input class="form-control" type="text" id="beanId-${o.id}" value="${o.beanId}">
							<span class="input-group-addon" ><i class="fa fa-warning"></i></span>
						</div>
					</div>
				</div>
						
				<div class="form-group" id="dv-script-${o.id}">
					<label class="col-md-2 control-label">脚本:</label>
					<div class="col-md-6">
						<div class="input-group col-md-12">
							<textarea rows="5" class="custom-scroll" style="width:100%;" id="text-script-${o.id}">${o.processScript}</textarea>
						</div>
					</div>
				</div>
				
				<div class="form-group">
					<label class="col-md-2 control-label"></label>
					<div class="col-md-6">
						<a class="btn btn-primary btn-sm" id="bt-save-${o.id}" flowName="${o.name}" flowid="${o.id}" href="javascript:void(0);"><i class="fa fa-check"></i>&nbsp;确&nbsp;认</a>
					</div>
				</div>
			</fieldset>
		</c:forEach>
</form>
<script type="text/javascript">
	$(function(){
		loadScript("${ctx}/static/modules/plugins/wf/workflow/edit-flow-listener.js",function(){
			$.plugins.wf.workflow.editflowlistener.init({});
		});
	});
</script>