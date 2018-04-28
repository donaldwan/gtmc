<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="wf" uri="/workflow-tags" %>
<!-- row -->
<div class="row" id="demo-leave-edit">
	<div class="well">
		<form class="form-horizontal" id="form-edit-demo-leave">
			<input type="hidden" id="id" name="id" value="${model.id}"/>
			<div class="form-group">
				<label class="control-label col-md-3"><font color="red">*</font>开始日期:</label>
				<div class="col-md-9">
					<input class="form-control" placeholder="请选择开始日期..." type="text" onclick="WdatePicker();"
						id="beginDate" name="beginDate" value="<fmt:formatDate value='${model.beginDate}' pattern='yyyy-MM-dd'/>"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label"><font color="red">*</font>结束日期:</label>
				<div class="col-md-9">
					<input class="form-control" placeholder="请选择结束日期..." type="text" onclick="WdatePicker();"
						id="endDate" name="endDate" value="<fmt:formatDate value='${model.endDate}' pattern='yyyy-MM-dd'/>"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">请假事由:</label>
				<div class="col-md-9">
					<input class="form-control" placeholder="请输入请假事由..." type="text"
						id="reasion" name="reasion" value="${model.reasion }"/>
				</div>
			</div>
			
			<div class="form-group">
				<label class="col-md-3 control-label"></label>
				<div class="col-md-9">
					<wf:start processDefinitionKey="WF_LEAVE" class="btn btn-primary btn-sm"  
						onSuccess="$.demo.leave.edit.success" onBeforeSend="$.demo.leave.edit.beforeSend"/>
					
					<wf:start draft="true" processDefinitionKey="WF_LEAVE" class="btn btn-primary btn-sm" value="保存草稿"
						onSuccess="$.demo.leave.edit.success" onBeforeSend="$.demo.leave.edit.beforeSend" />
					
					<wf:diagram processDefinitionKey="WF_LEAVE" class="btn btn-default btn-sm" value="流程图"/>
					
					<input id="bt-cancel" type="button" class="btn btn-default btn-sm" value="取消" />
					
				</div>
			</div>
		</form>
	</div>
</div>
<!-- end row -->
<script type="text/javascript">
	$(function(){
		loadScript("${ctx}/static/modules/demo/leave/edit.js",function(){
			$.demo.leave.edit.init();
		});	
	});
</script>
