<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/common/taglibs.jsp" />
<div class="col-sm-12 col-md-12 col-lg-12 no-padding">
	<article class="col-sm-12 col-md-12 col-lg-12">
		<div class="jarviswidget jarviswidget-color-lightblue" id="wid-id-plugins-wf-monitoring-manager"  data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false">
			<header>
				<h2><strong>流程实体监控</strong></h2>
			</header>
			
			<div class="widget-body">
				
				<div class="well">
					<form class="form-horizontal smart-form" id="id-form-search" style="padding-right:20px">
						<div class="row">
							<div class="form-group">
								<label class="col col-md-1 control-label form-label">流程定义key:</label>
					            <section class="col col-lg-2 col-md-2 col-sm-2 col-xs-3">
						            <label class="input"> <i class="icon-append fa fa-edit"></i>
						              <input type="text" id="id-act-procdef-key" placeholder="请输入流程定义key...">
						            </label>
					            </section>
					            
								<label class="col col-md-1 control-label form-label">流程实例id:</label>
					            <section class="col col-lg-2 col-md-2 col-sm-2 col-xs-3">
						            <label class="input"> <i class="icon-append fa fa-edit"></i>
						              <input type="text" id="id-act-instance-id" placeholder="请输入流程实例id...">
						            </label>
					            </section>
					            
								<label class="col col-md-1 control-label form-label">流程名称:</label>
					            <section class="col col-lg-2 col-md-2 col-sm-2 col-xs-3">
						            <label class="input"> <i class="icon-append fa fa-edit"></i>
						              <input type="text" id="id-wf-name" placeholder="请输入流程名称...">
						            </label>
					            </section>
					            
								<label class="col col-md-1 control-label form-label">业务ID:</label>
					            <section class="col col-lg-2 col-md-2 col-sm-2 col-xs-3">
						            <label class="input"> <i class="icon-append fa fa-edit"></i>
						              <input type="text" id="id-business-key" placeholder="请输入业务ID...">
						            </label>
					            </section>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<label class="col col-md-1 control-label form-label">流程启动人员:</label>
					            <section class="col col-lg-2 col-md-2 col-sm-2 col-xs-2">
						            <label class="input"> <i class="icon-append fa fa-search" style="cursor: pointer;" onclick="$.plugins.wf.monitoring.manager.chooseUser();"></i>
						              <input type="text" id="id-apply-user-name" name="applyUserName" onchange="$.selectChange('#id-apply-user-id');" placeholder="请选择流程启动人员...">
						              <input type="hidden" id="id-apply-user-id" name="applyUserId">
						            </label>
					            </section>
					          
								<label class="col col-md-1 control-label form-label">流程实例状态:</label>
					            <section class="col col-lg-2 col-md-2 col-sm-2 col-xs-2">
						             <label class="select">
						                <select id="id-status" name="status" class="form-control ">
						                  <option value="">全部</option>
											<option value="RU">流程运行中</option>
											<option value="EN">流程正常结束</option>
											<option value="EO">流程异常结束</option>
											<option value="KI">流程被终止</option>
											<option value="OT">其他</option>
						                </select>
						                <i></i>
						             </label>
				            	 </section>
				            	
				            	<label class="col col-md-1 control-label form-label">流程当前状态:</label>
					            <section class="col col-lg-2 col-md-2 col-sm-2 col-xs-3">
						            <label class="input"> <i class="icon-append fa fa-edit"></i>
						              <input type="text" id="id-wf-status" placeholder="请输入流程当前状态...">
						            </label>
					            </section>
					            
					            <label class="col col-md-1 control-label form-label">当前操作者:</label>
					            <section class="col col-lg-2 col-md-2 col-sm-2 col-xs-3">
						            <label class="input"> <i class="icon-append fa fa-edit"></i>
						              <input type="text" id="id-wf-operators" placeholder="请输入当前操作者...">
						            </label>
					            </section>
							</div>
						</div>
						<div class="row">
							<div class="form-group">
								<label class="col col-md-10 control-label form-label"></label>
								<section class="col col-lg-2 col-md-2 col-sm-2 col-xs-2" id='section-text-right'>
									<a class="btn btn-primary btn-sm" href="javascript:void(0);" id='bt-search' onclick="$.plugins.wf.monitoring.manager.search();"><i class="fa fa-search"></i>&nbsp;搜&nbsp;索</a>
									<a class="btn btn-default btn-sm" href="javascript:void(0);" id='bt-reset' onclick="$.plugins.wf.monitoring.manager.reset();"><i class="fa fa-reply"></i>&nbsp;重&nbsp;置</a>
								</section>
							</div>
						</div>
					</form>
				</div>
				
				<div class="alert alert-info alert-block group-bts" style="padding:5px;" id='alert-monitoring'>
					<a onclick="javascript:$.plugins.wf.monitoring.manager.detail();" class="btn btn-success btn-sm" href="javascript:void(0);" ><i class="fa fa-edit"></i>&nbsp;查&nbsp;看</a>
					<a onclick="javascript:$.plugins.wf.monitoring.manager.openTrack();" class="btn btn-success btn-sm" href="javascript:void(0);" ><i class="fa fa-edit"></i>&nbsp;跟&nbsp;踪</a>
					<c:if test="${sessionScope.WORKFLOW_STOP eq 'WORKFLOW_STOP'}">
						<a onclick="javascript:$.plugins.wf.monitoring.manager.deleteProcessInstance();" class="btn btn-warning btn-sm" href="javascript:void(0);" ><i class="fa fa-ban"></i>&nbsp;流程终止</a>
					</c:if>
				</div>
				
				<div id="dv-plugins-wf-monitoring" class="grid" ></div>
				
			</div>
		</div>
	</article>
</div>
<script type="text/javascript">
	loadScript("${ctx}/static/modules/plugins/wf/monitoring/manager.js",function(){
		$.plugins.wf.monitoring.manager.init({
			workflow_stop:'${sessionScope.WORKFLOW_STOP}',
		});
	});
</script>

