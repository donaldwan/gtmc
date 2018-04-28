<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div class="row well" id="id-row-wf-event-config">

	<div class="fuelux ">

		<div class="wizard">
			<ul class="steps">
				<li data-target="#user-task-step1" class="active">
					<span class="badge badge-info">1</span>事件配置<span class="chevron"></span>
				</li>
				<li data-target="#user-task-step2">
					<span class="badge">2</span>任务出口监听<span class="chevron"></span>
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
					<h3><strong>步骤1</strong>-事件设置</h3>

					<form class="form-horizontal" id="user-task-form-event">
						<input type="hidden" name="taskDefKey" value="${taskKey}" />
						<input type="hidden" name="actProcdefId" value="${pid}" />
						<input type="hidden" name="eventType" value="A" />
						
						<section>
							<div class="form-group">
								<label class="col-md-2 control-label">处理类型:</label>
								<div class="col-md-6">
									<div class="input-group">
										<select id="idProcessType" class="form-control" name="processType">
											<option value="B" ${(nodeEvent.processType eq 'B')?'selected':''}>自定义Bean</option>
											<option value="S" ${(nodeEvent.processType eq 'S')?'selected':''}>自定义脚本</option>
										</select>
										<span class="input-group-addon" ><i class="fa fa-warning"></i></span>
									</div>
								</div>
							</div>
						</section>
						<section id="id-sec-process-bean">
							<div class="form-group">
								<label class="col-md-2 control-label">Bean ID:</label>
								<div class="col-md-6">
									<div class="input-group">
										<input class="form-control" type="text" id="beanId" name="beanId" value="${nodeEvent.beanId}">
										<span class="input-group-addon" ><i class="fa fa-warning"></i></span>
									</div>
								</div>
							</div>
						</section>
						<section id="id-sec-process-script">
							<div class="form-group">
								<label class="col-md-2 control-label">脚本:</label>
								<div class="col-md-6">
									<div class="input-group col-md-12">
										<textarea rows="5" id="processScript" name="processScript" class="custom-scroll" style="width:100%;">${nodeEvent.processScript}</textarea>
									</div>
								</div>
							</div>
						</section>
						<section id="id-sec-process-script">
							<div class="form-group">
								<label class="col-md-2 control-label"></label>
								<div class="col-md-6 form-btn">
									<a id="bt-user-task-form-event" class="btn btn-primary btn-sm" href="javascript:void(0);"><i class="fa fa-check"></i>&nbsp;确&nbsp;认</a>
								</div>
							</div>
						</section>
					</form>
				</div>
				
				<!-- 任务出口监听 begin -->
				<div class="step-pane" id="user-task-step2">
					<h3><strong>步骤2</strong> - 任务出口监听事件</h3>
					<div id="id-dv-event-flow-listener" class="row"></div>
				</div>
				<!-- 任务出口监听 end -->
		</div>
	</div>
	
</div>

<script type="text/javascript">
	$(function(){
		loadScript("${ctx}/static/modules/plugins/wf/workflow/user-task.js",function(){
			loadScript("${ctx}/static/modules/plugins/wf/workflow/event-config.js",function(){
				$.plugins.wf.workflow.event_config.init({pid:'${pid}',taskKey:'${taskKey}'});
			});
		});
	});
</script>