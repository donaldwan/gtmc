<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- row -->
<div class="row" id="plugin-wf-workflow-edit">
	<div class="well">
		<form class="form-horizontal" id="id-form-plugins-wf-workflow-edit">
			<input type="hidden" id="id-actProcdefId" value="${model.actProcdefId}"/>
			<input type="hidden" id="id-id" name="id" value="${model.id}">
			<input type="hidden" id="id-actModelId" value="${model.actModelId}">
			
			<div class="form-group">
				<label class="col-md-1 control-label form-label"><font color="red">*</font>工作流名称:</label>
				<div class="col-md-3">
					<input class="form-control" name="wfName" id="wfName" placeholder="请输入工作流名称..." 
						type="text" value="${model.wfName}">
				</div>
				
				<label class="col-md-1 control-label form-label"><font color="red">*</font>工作流编码:</label>
				<div class="col-md-3">
					<input class="form-control" name="actProcdefKey" id="actProcdefKey" placeholder="请输入工作流编码..." 
						type="text" value="${model.actProcdefKey}" ${not empty model.id?'disabled':''}>
				</div>
				
				<label class="col-md-1 control-label form-label"><font color="red">*</font>业务表名:</label>
				<div class="col-md-3">
					<input class="form-control" name="businessTable" id="businessTable" placeholder="业务表名称" 
						type="text" value="${model.businessTable}">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-1 control-label form-label"><font color="red">*</font>起始表单:</label>
				<div class="col-md-3">
					<input class="form-control" name="startForm" id="startForm" placeholder="请输入起始表单..." 
						type="text" value="${model.startForm}">
						
				</div>
				
				<label class="col-md-1 control-label form-label"><font color="red">*</font>起始提交URL:</label>
				<div class="col-md-3">
					<input class="form-control" name="startUrl" id="startUrl" placeholder="起始提交URL" 
						type="text" type="text" value="${model.startUrl}">
				</div>
				
				<label class="col-md-1 control-label form-label"><font color="red">*</font>回退URL:</label>
				<div class="col-md-3">
					<input class="form-control" name="backUrl" id="backUrl" placeholder="回退URL" 
						type="text" type="text" value="${model.backUrl}">
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-1 control-label form-label"><font color="red">*</font>通用表单:</label>
				<div class="col-md-3">
					<input class="form-control" name="commonForm" id="commonForm" placeholder="请输入通用表单..." 
						type="text" value="${model.commonForm}">
				</div>
				
				<label class="col-md-1 control-label form-label"><font color="red">*</font>通用提交URL:</label>
				<div class="col-md-3">
					<input class="form-control" name="commonUrl" id="commonUrl" placeholder="通用提交URL.." 
						type="text" type="text" value="${model.commonUrl}">
				</div>
				
				<label class="col-md-1 control-label form-label"><font color="red">*</font>通用查看URL:</label>
				<div class="col-md-3">
					<input class="form-control" name="detailUrl" id="detailUrl" placeholder="明细URL" 
						type="text" value="${model.detailUrl}">
				</div>
			</div>
		</form>
		<div class="alert alert-info alert-block group-bts">
			<a class="btn btn-success btn-sm" onclick="$.plugins.wf.workflow.edit.save();" href="javascript:void(0);"><i class="fa fa-save"></i>&nbsp;保&nbsp;存</a>
			<a class="btn btn-default btn-sm" onclick="$.formReset('id-form-plugins-wf-workflow-edit');" href="javascript:void(0);"><i class="fa fa-reply"></i>&nbsp;重&nbsp;置</a>
			<a class="btn btn-default btn-sm" onclick="$.plugins.wf.workflow.edit.openDesignWin();" id="bt-wf-design" href="javascript:void(0);"><i class="fa fa-tasks"></i>流程设计</a>
			<a class="btn btn-default btn-sm" onclick="$.plugins.wf.workflow.edit.deploy();" id="bt-wf-deploy" href="javascript:void(0);"><i class="fa fa-building"></i>流程部署</a>
		</div>
		
		<article class="col-sm-12 col-md-12 col-lg-12">							
			<div  id="dv-diagram" style="position:relative; width:100%;overflow-x:auto;">
				<c:if test="${not empty model.actProcdefId}">
					<img src="${ctx}/static/smart/img/select2-spinner.gif">
				</c:if>
			</div>
		</article>
	</div>
	
</div>
<!-- end row -->
<script type="text/javascript">
	loadScript("${ctx}/static/modules/plugins/wf/workflow/edit.js",function(){
		$.plugins.wf.workflow.edit.init({
			pid:'${model.actProcdefId}',
			container:$('#dv-diagram',$('#plugin-wf-workflow-edit')),
			wfId:'${model.id}'
		});
	});
</script>