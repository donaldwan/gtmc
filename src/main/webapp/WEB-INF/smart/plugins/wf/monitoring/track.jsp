<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<jsp:include page="/common/taglibs.jsp" />


<div class="row col-sm-12" id="id-div-wf-track-content" style="margin-left:1px;margin-top:25px">
	<div class="col-sm-12 sortable-grid ui-sortable" id="id-div-wf-track-top">
		<section class="winWidget">
			<div class="row">
				<article class="col-sm-12 col-md-12 col-lg-12">
					<div class="jarviswidget jarviswidget-color-lightblue" id="wid-id-wf-track-history"  data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false">
						<header>
							<span class="widget-icon"> <i class="fa fa-comment"></i> </span>
							<h2><strong>流程处理日志</strong></h2>
						</header>
						
						<div class="widget-body">
							<div class="smart-timeline wf-time-line">
								<ul class="smart-timeline-list">
									<li>
										<div class="smart-timeline-icon">
											<i class="fa fa-comment"></i>
										</div>
										<c:forEach items="${runningTaskList}" var="task" varStatus="status">
											<div class="smart-timeline-content" style="margin-left:50px;<c:if test='${status.count%2==0}'>color:red;</c:if><c:if test='${status.count%2!=0}'>color:#B21243;</c:if>">
												<p>
													进行中的任务：<strong>${task.taskName}</strong>
												</p>
												<p>
													<small>到达时间：<em><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${task.taskTime}"/></em></small>
												</p>
												<c:if test="${!empty task.groupName}">
													<p>
														<small>候选组：<em>${task.groupName}</em></small>
													</p>
												</c:if>
												<c:if test="${!empty task.userName}">
													<p>
														<small>候选人：<em>${task.userName}</em></small>
													</p>
												</c:if>
												<br/>
											</div>
										</c:forEach>
										<div class="smart-timeline-content" style="margin-left:50px;">
											<c:if test="${fn:length(runningTaskList) == 0}">
													${status}
<%-- 												${status eq 'EN'?'流程正常结束':''} --%>
<%-- 												${status eq 'EO'?'流程异常结束':''} --%>
<%-- 												${status eq 'KI'?'流程被终止':''} --%>
											</c:if>
										</div>
									</li>
									<c:forEach items="${operateRecordList}" var="operateRecord">
										<li>
											<div class="smart-timeline-icon">
												<i class="fa fa-comment"></i>
											</div>
											<div class="smart-timeline-content" style="margin-left:50px;">
												<p>
													<a href="javascript:void(0);"><strong>${operateRecord.createdUserName}</strong></a>
													<small><a>${operateRecord.taskDefName}</a>&nbsp;<em>${operateRecord.transitionName}</em></small>
													<small>&nbsp;<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${operateRecord.createdTime}"/></small>
												</p>
												<c:if test="${!empty operateRecord.remark}">
													<div class="well display-inline">
														${operateRecord.remark}
													</div>										
												</c:if>
											</div>
										</li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</div>
				</article>
			</div>
		</section>
	</div>
	
	<div class="col-sm-12 sortable-grid ui-sortable" id="id-div-wf-track-bottom">
		<section class="winWidget">
			<div class="row">
				<article class="col-sm-12 col-md-12 col-lg-12">
					<div class="jarviswidget jarviswidget-color-lightblue" id="wid-id-wf-track-pic"  data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false">
						<header>
							<span class="widget-icon"> <i class="fa fa-sitemap"></i> </span>
							<h2><strong>流程图</strong></h2>
						</header>

						<div class="widget-body"  style="width:100%;overflow-x:auto;">
							<div id="id-div-wf-track-bottom-pic">
								
							</div>
						</div>
					</div>
				</article>
			</div>
		</section>
			
	</div>
</div>
