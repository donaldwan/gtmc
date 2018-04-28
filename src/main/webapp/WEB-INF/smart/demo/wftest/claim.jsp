<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="wf" uri="/workflow-tags" %>

<div class="row" id="demo-wftest-task-claim">
	
	<!-- 表单区域 -->
	<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="jarviswidget jarviswidget-color-lightblue" data-widget-editbutton="false" 
			data-widget-togglebutton="false" data-widget-deletebutton="false" data-widget-fullscreenbutton="false">
			
			<header>
				<h2><strong>表单区域</strong> <i></i></h2>
			</header>

			<!-- widget div-->
			<div>
				<!-- widget content -->
				<div class="widget-body ">
					<form class="form-horizontal" id="form-edit-demo-cliam">
						<input type="hidden" id="id" name="id" value="${model.id}"/>
						<div class="form-group">
							<label class="control-label col-md-3"><font color="red">*</font>测试参数一:</label>
							<div class="col-md-6">
								<input class="form-control" type="text" id="paramA" name="paramA" value="${model.paramA}"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label"><font color="red">*</font>测试参数二:</label>
							<div class="col-md-6">
								<input class="form-control" type="text" id="paramB" name="paramB" value="${model.paramB}"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">备注:</label>
							<div class="col-md-6">
								<input class="form-control" placeholder="请输入备注..." type="text"
									id="reasion" name="reasion" value="${model.reasion }"/>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-md-3 control-label"></label>
							<div class="col-md-9">
							
								<wf:button businessKey="${model.id}" class="btn btn-primary btn-sm"
									onBeforeSend="$.demo.wftest.claim.beforeSend"
									onSuccess="$.demo.wftest.claim.success"/>
								
								<wf:button businessKey="${model.id}" class="btn btn-primary btn-sm" draft="true"
									onBeforeSend="$.demo.wftest.claim.beforeSend"
									onSuccess="$.demo.wftest.claim.success"/>	
									
								<wf:diagram class="btn btn-default btn-sm" processInstanceId="${model.procInstId}" value="流程图"/>
								
								<wf:log class="btn btn-default btn-sm" processInstanceId="${model.procInstId}" value="日志查看"/>
								
								<wf:cancel class="btn btn-default btn-sm" value="暂不处理"/>
								
							</div>
						</div>
					</form>
				</div>
				<!-- end widget content -->
				
			</div>
			<!-- end widget div -->
			
		</div>
	</article>
	
</div>
<script type="text/javascript">
	$(function(){
		loadScript("${ctx}/static/modules/demo/wftest/claim.js",function(){
			$.demo.wftest.claim.init();
		});	
	});
</script>

