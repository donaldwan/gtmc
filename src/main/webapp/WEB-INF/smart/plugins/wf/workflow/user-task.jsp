<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<div class="row well" id="plugin-wf-workflow-node-user-task">
	<div class="fuelux">
		<div class="wizard">
			<ul class="steps">
				<li data-target="#user-task-step1" class="active">
					<span class="badge badge-info">1</span>常规设置<span class="chevron"></span>
				</li>
				<li data-target="#user-task-step2">
					<span class="badge">2</span>人员设置<span class="chevron"></span>
				</li>
				<li data-target="#user-task-step3">
					<span class="badge">3</span>任务脚本设置<span class="chevron"></span>
				</li>
				<li data-target="#user-task-step4">
					<span class="badge">4</span>任务出口监听<span class="chevron"></span>
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
			
				<!-- 常规设置begin -->
				<div class="step-pane active" id="user-task-step1">
					<h3><strong>步骤1</strong>-常规设置</h3>

					<!-- wizard form starts here -->
					<fieldset>
						<form class="form-horizontal smart-form" id="user-task-form-normal">
							<input type="hidden" name="taskDefKey" value="${taskKey}" />
							<input type="hidden" name="actProcdefId" value="${pid}" />
							
							<div class="form-group">
								<label class="col col-lg-2 col-md-2 col-sm-2 hidden-xs control-label">处理表单URL:</label>
								<section class="col col-lg-4 col-md-4 col-sm-4 col-xs-11">
									<label class="input">
										<input type="text" id="form" name="form" placeholder="处理表单URL"
											value="${nodeExt.form}"/>
									</label>
								</section>
								
								<label class="col col-lg-2 col-md-2 col-sm-2 hidden-xs control-label">表单提交URL:</label>
								<section class="col col-lg-4 col-md-4 col-sm-4 col-xs-11">
									<label class="input">
										<input type="text" id="completeUrl" name="completeUrl" placeholder="请输入信息"
											value="${nodeExt.completeUrl}"/>
									</label>
								</section>
							</div>
							
							<div class="form-group">
								<label class="col col-lg-2 col-md-2 col-sm-2 hidden-xs control-label">任务处理时限:</label>
								<section class="col col-lg-3 col-md-3 col-sm-3 col-xs-11">
									<label class="input">
										<input type="text" id="dueDays" name="dueDays" placeholder="任务处理时限"
											value="${nodeExt.dueDays}"/>
									</label>
								</section>
								<label class="col col-lg-1 col-md-1 col-sm-1 hidden-xs control-label" style="text-align:left;">天</label>
								
								<label class="col col-lg-2 col-md-2 col-sm-2 hidden-xs control-label">默认下一步:</label>
								<section class="col col-lg-4 col-md-4 col-sm-4 col-xs-11">
									<label class="select">
										<select class="form-control" name="defaultOut">
											<c:forEach items="${outs}" var="o">
												<option value="${o.id}">${o.name }</option>
											</c:forEach>
										</select><i></i>
									</label>
								</section>
								
							</div>
							
							<div class="form-group">
								<label class="col col-lg-2 col-md-2 col-sm-2 hidden-xs control-label">免审表达式:</label>
								<section class="col col-lg-4 col-md-4 col-sm-4 col-xs-11">
									<label class="input">
										<input type="text" id="passExpression" name="passExpression" placeholder="免审表达式"
											value="${nodeExt.passExpression}"/>
									</label>
								</section>
								<label class="col col-lg-6 col-md-6 col-sm-6 col-xs-11 control-label " style="text-align: left;">	
									<i class="fa-fw fa fa-warning"></i>
									<strong class="alert-warning">表达式的值为真时，流程将跳过此任务节点</strong>
								</label>
							</div>
							
							<div class="form-group">
							
								<label class="col col-lg-2 col-md-2 col-sm-2 hidden-xs control-label">会签节点设置:</label>
								<section class="col col-lg-2 col-md-2 col-sm-2 col-xs-11">
									<label class="select">
										<select class="form-control" name="isCountersign">
											<option value="0" ${('0' eq nodeExt.isCountersign)?'selected':''}>非会签任务</option>
											<option value="1" ${('1' eq nodeExt.isCountersign)?'selected':''}>会签任务</option>
										</select><i></i>
									</label>
								</section>
								<section class="col col-lg-2 col-md-2 col-sm-2 col-xs-11">
									<label class="select">
										<select class="form-control" name="isSequential">
											<option value="0" ${('0' eq nodeExt.isSequential)?'selected':''}>并行会签</option>
											<option value="1" ${('1' eq nodeExt.isSequential)?'selected':''}>顺序会签</option>
										</select><i></i>
									</label>
								</section>
							
								<label class="col col-lg-2 col-md-2 col-sm-2 hidden-xs control-label">会签结束表达式:</label>
								<section class="col col-lg-4 col-md-4 col-sm-4 col-xs-11">
									<label class="input">
										<input type="text" id="completionCondition" name="completionCondition" placeholder="会签结束表达式"
											value="${nodeExt.completionCondition}"/>
									</label>
								</section>
							</div>
							
							<hr class="simple simple-line">
							
							<div class="row" style="text-align:center;">
								<a id="bt-user-task-form-normal" class="btn btn-primary btn-sm" href="javascript:void(0);"><i class="fa fa-check"></i>&nbsp;确&nbsp;认</a>
							</div>

						</form>
					</fieldset>

				</div>
				<!-- 常规设置end -->
				
				<!-- 人员设置begin -->
				<div class="step-pane" id="user-task-step2">
					<h3><strong>步骤2</strong> - 人员设置</h3>
					<fieldset>
						<form class="form-horizontal" id="user-task-form-users">
							<input type="hidden" name="taskDefKey" value="${taskKey}" />
							<input type="hidden" name="actProcdefId" value="${pid}" />
							<section>
								<div class="form-group">
									<label class="col-md-2 control-label">流程人员类别:</label>
									<div class="col-md-6">
										<div class="input-group">
											<select id="id-sel-task-user-category" class="form-control">
												<c:forEach items="${processerCategories}" var="pc">
													<option category="${pc.category}" processerType="${pc.processerType}"
														url="${pc.url}">${pc.name }</option>
												</c:forEach>
											</select>
											<span class="input-group-addon" onclick="$.plugins.wf.workflow.user_task.openProcesserWin();"><i class="fa fa-search-plus"></i></span>
										</div>
									</div>
								</div>
							</section>
							<section>
								<div class="form-group has-warning">
									<label class="col-md-2 control-label">已有流程人员:</label>
									<div class="col-md-8">
										<div id="dv-plugins-wf-workflow-user-task-users" class="grid" ></div>
									</div>
								</div>
							</section>
						</form>
					</fieldset>
					
				</div>
				
				<!-- 人员设置end -->

				<!-- 脚本设置begin -->
				<div class="step-pane" id="user-task-step3">
					<h3><strong>步骤3</strong> - 脚本任务设置</h3>
					
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
							<div class="form-group">
								<label class="col-lg-2 col-md-2 col-sm-2 hidden-xs control-label"></label>
								<section class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">
									<p class="alert alert-info no-margin">
										备注：BeanID实体类</br>
										例如：beanListener								
									</p>
								</section>
							</div>
						</section>
						<section id="id-sec-process-script">
							<div class="form-group">
								<label class="col-md-2 control-label">脚本:</label>
								<div class="col-md-6">
									<div class="input-group col-md-12">
										<textarea rows="10" id="processScript" name="processScript" class="custom-scroll" style="width:100%;">${nodeEvent.processScript}</textarea>
									</div>
								</div>								
							</div>
							<div class="form-group">
								<label class="col-lg-2 col-md-2 col-sm-2 hidden-xs control-label"></label>
								<section class="col col-lg-6 col-md-6 col-sm-6 col-xs-6">
									<p class="alert alert-info no-margin">
										备注：dao.execute("可执行的SQL语句")</br>
										例如：dao.execute("update demo_leave set status = '待Leader审核'  where id = '" + bpmnModel.id + "'")								
									</p>
								</section>
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
				
				<!-- 脚本设置end -->
				
				<!-- 任务出口监听 begin -->
				<div class="step-pane" id="user-task-step4">
					<h3><strong>步骤4</strong> - 任务出口监听事件</h3>
					<div id="id-dv-flow-listener" class="row"></div>
				</div>
				<!-- 任务出口监听 end -->
		</div>

	</div>
</div>
<script type="text/javascript">
	$(function(){
		loadScript("${ctx}/static/modules/plugins/wf/workflow/user-task.js",function(){
			$.plugins.wf.workflow.user_task.init({
				pid:'${pid}',
				taskKey:'${taskKey}'
			});	
		});
	});
	
</script>