<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- row -->
<div class="row" id="plugin-wf-workflow-xml-import">
	<div class="well">
		<form class="form-horizontal" id="id-form-plugins-wf-workflow-edit">
			<div class="form-group">
				<label class="col-md-2 control-label form-label"><font color="red">*</font>工作流名称:</label>
				
				<div class="col-md-10">
					<div class="input-group">
						<input type="file" id="id-file" style="display:none;">
						<input type="text" class="form-control" id="id-file-name" placeholder="请选择文件...">
						<div class="input-group-btn">
							<a id="bt-file-choose" class="btn btn-info btn-sm" href="javascript:void(0);" ><i class="fa"></i>文件选择...</a>
						</div>
					</div>
					
<!-- 					<input class="form-control" name="wfName" id="wfName" placeholder="请输入工作流名称..."  -->
<%-- 						type="text" value="${model.wfName}"> --%>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-2 control-label form-label"></label>
				<div class="col-md-10">
					<div class="alert alert-warning alert-block">
						注：
						<ul>
							<li>流程Key将以导入文件中的process id 为准，如果库中已经存在相同key，将进行覆盖，否则添加新的工作流。</li>
							<li>如果是新添加的工作流，将以上传的文件名称作为流程的中文名称。</li>
							<li>无论是新添加或更新的流程，都必须对流程的相关配再进行核对(外部导入的流程有可能对某些节点的key进行了调整)。</li>
						</ul>
					</div>			
				</div>
			</div>
		</form>
	</div>
</div>
<!-- end row -->
<script type="text/javascript">
	$(function(){
		loadScript("${ctx}/static/modules/plugins/wf/workflow/xml-import.js",function(){
			$.plugins.wf.workflow.xmlimport.init();
		});
	});
</script>