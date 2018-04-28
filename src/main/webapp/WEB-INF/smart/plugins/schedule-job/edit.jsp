<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fun" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<section class="winWidget">
	
	<div class="row">
		<div class="col col-md-11">
			<form class="form-horizontal smart-form" id="id-form-plugins-job-edit">
				<input type="hidden" name="id" value="${model.id}">
				<section>
					<div class="form-group">
						<label class="col-lg-3 col-md-3 col-sm-3 hidden-xs control-label">任务名称:</label>
						<section class="col col-lg-8 col-md-8 col-sm-8 col-xs-11">
							<label class="input"> <i class="icon-append fa fa-edit"></i>
								<input type="text" id="jobName" name="jobName" value="${model.jobName}"/>
							</label>
						</section>
					</div>
					<div class="form-group">
						<label class="col-lg-3 col-md-3 col-sm-3 hidden-xs control-label">任务类型:</label>
						<section class="col col-lg-8 col-md-8 col-sm-8 col-xs-11">
							<label class="select">
								<select id="jobType" name="jobType">
									<option value="J">Java对象</option>
									<option value="S">Shell脚本</option>
								</select><i></i>
							</label>
						</section>
					</div>
					<div class="form-group">
						<label class="col-lg-3 col-md-3 col-sm-3 hidden-xs control-label">执行对象:</label>
						<section class="col col-lg-8 col-md-8 col-sm-8 col-xs-11">
							<label class="input"> <i class="icon-append fa fa-edit"></i>
								<input type="text" id="jobObject" name="jobObject" value="${model.jobObject}"/>
							</label>
						</section>
					</div>
					<div class="form-group">
						<label class="col-lg-3 col-md-3 col-sm-3 hidden-xs control-label">触发时间:</label>
						<section class="col col-lg-8 col-md-8 col-sm-8 col-xs-11">
							<label class="input"> <i class="icon-append fa fa-edit"></i>
								<input type="text" id="cronExpression" name="cronExpression" value="${model.cronExpression}"/>
							</label>
						</section>
					</div>
					<div class="form-group">
						<label class="col-lg-2 col-md-2 col-sm-2 hidden-xs control-label"></label>
						<section class="col col-lg-9 col-md-9 col-sm-9 col-xs-11">
							<p class="alert alert-info no-margin">
								1、当任务类型为"Java对象"时，执行对象为实现了"org.quartz.Job"的类名<br />
								2、当任务类型为"Shell脚本"时，执行对象为Shell脚本的路径<br />
								3、触发时间参考"Cron表达式"(参考:<a href="http://cron.qqe2.com" target="_blank">http://cron.qqe2.com</a>)
							</p>
						</section>
					</div>
				</section>
			</form>
		</div>
	</div>
	
</section>