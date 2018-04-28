<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="wf" uri="/workflow-tags" %>
<!-- row -->
<div class="row" id="demo-wftest-edit">
	<div class="well">
		<form class="form-horizontal" id="form-edit-demo-wftest">
			<input type="hidden" id="id" name="id" value="${model.id}"/>
			<div class="form-group">
				<label class="control-label col-md-3"><font color="red">*</font>测试参数一:</label>
				<div class="col-md-9">
					<input class="form-control" type="text" id="paramA" name="paramA" value="${model.paramA}"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label"><font color="red">*</font>测试参数二:</label>
				<div class="col-md-9">
					<input class="form-control" type="text" id="paramB" name="paramB" value="${model.paramB}"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">备注:</label>
				<div class="col-md-9">
					<input class="form-control" placeholder="请输入备注..." type="text"
						id="reasion" name="reasion" value="${model.reasion }"/>
				</div>
			</div>
			
			
			<div class="form-group">
				<label class="col-md-3 control-label"></label>
				<div class="col-md-9">
					<wf:start processDefinitionKey="WF_GROOVY" class="btn btn-primary btn-sm"  
						onSuccess="$.demo.wftest.edit.success" onBeforeSend="$.demo.wftest.edit.beforeSend"/>
					
					<wf:start draft="true" processDefinitionKey="WF_GROOVY" class="btn btn-primary btn-sm" value="保存草稿"
						onSuccess="$.demo.wftest.edit.success" onBeforeSend="$.demo.wftest.edit.beforeSend" />
					
					<wf:diagram processDefinitionKey="WF_GROOVY" class="btn btn-default btn-sm" value="流程图"/>
					
					<input id="bt-cancel" type="button" class="btn btn-default btn-sm" value="取消" />
					
				</div>
			</div>
		</form>
	</div>
</div>
<!-- end row -->
<script type="text/javascript">
	 loadScript("${ctx}/static/modules/demo/wftest/edit.js",function(){
		$.demo.wftest.edit.init();
	}); 
</script>
