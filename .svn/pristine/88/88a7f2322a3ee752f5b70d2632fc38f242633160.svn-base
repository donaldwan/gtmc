<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/common/taglibs.jsp" />
<section class="winWidget">
	<div class="row">
		<article class="col-sm-12 col-md-12 col-lg-12">
			<div class="jarviswidget" id="wid-id-plugins-wf-workflow-manager"  
				data-widget-editbutton="true" 
				data-widget-deletebutton="false"
				data-widget-custombutton="true">
				<header>
					<span class="widget-icon"> <i class="fa fa-search"></i> </span>
					<h2>工作流设定</h2>
					
					<div class="widget-toolbar">
						<a href="javascript:void(0);" onclick="goBack();" class="btn btn-xs "><i class="fa fa-reply"></i></a>
					</div>
				</header>
				
				<div class="widget-body">
					
					<div class="row">
						<form class="form-horizontal" id="id-form-search">
							<div class="form-group">
								<label class="col-md-1 control-label form-label">工作流名称:</label>
								<div class="col-md-3">
									<input class="form-control" id="id-wf-name" placeholder="请输入工作流名称..." type="text">
								</div>
								
								<label class="col-md-1 control-label form-label">工作流编码:</label>
								<div class="col-md-3">
									<input class="form-control" id="id-wf-code" placeholder="请输入工作流编码..." type="text">
								</div>
								<div class="col-md-3">
									<a class="btn btn-default btn-sm" href="javascript:void(0);" onclick="$.plugins.wf.workflow.manager.search();"><i class="fa fa-search"></i>&nbsp;搜&nbsp;索</a>
									<a class="btn btn-default btn-sm" href="javascript:void(0);" onclick="$.formReset('id-form-search');"><i class="fa fa-reply-all"></i>&nbsp;重&nbsp;置</a>
						
								</div>
							</div>
						</form>
					</div>
					
					<hr class="simple simple-line">
					<div class="row grid-btn">
					<c:if test="${!empty sessionScope.WORKFLOW_ADD}">	
						<a class="btn btn-default btn-sm" href="javascript:void(0);" onclick="$.plugins.wf.workflow.manager.add();"><i class="fa fa-plus"></i>&nbsp;新&nbsp;增</a>
						&nbsp;
					</c:if>	
					<c:if test="${!empty sessionScope.WORKFLOW_EXPXML}">	
						<a class="btn btn-default btn-sm" href="javascript:void(0);" onclick="$.plugins.wf.workflow.manager.expXML();">流程XML导出</a>
						&nbsp;
					</c:if>	
					<c:if test="${!empty sessionScope.WORKFLOW_EXPPNG}">	
						<a class="btn btn-default btn-sm" href="javascript:void(0);" onclick="$.plugins.wf.workflow.manager.expPNG();">流程图导出</a>
					</c:if>	
					</div>
					
					<div class="row">
						<div id="dv-plugins-wf-workflow" class="grid" ></div>
					</div>
					
				</div>
			</div>
		</article>
	</div>
</section>
<script type="text/javascript">
	$(function(){
		$.plugins.wf.workflow.manager.init({
			workflow_edit:'${sessionScope.WORKFLOW_EDIT}',
		});
	});
</script>

