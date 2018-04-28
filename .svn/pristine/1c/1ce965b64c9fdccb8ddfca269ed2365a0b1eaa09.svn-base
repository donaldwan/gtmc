<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<c:if test="${not empty operateRecords or not empty currentTaskInfos}">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
		<div class="well well-sm no-padding">
			<div class="smart-timeline">
				<ul class="smart-timeline-list">
					<c:forEach items="${currentTaskInfos}" var="cti">
						<li style="color:red;">
							<div class="smart-timeline-icon">
								<i class="fa fa-tasks "></i>
							</div>
							<div class="smart-timeline-time">
								<small>${cti.name}</small>
							</div>
							<div class="smart-timeline-content">
								<p>
									<strong>当前处理人： <a href="javascript:void(0);"><i>${cti.assigneeUser}</i></a></strong>
								</p>
								<c:if test="${not empty cti.taskUsers}">
									<div class="display-inline " style="margin:0px;padding:3px;color:#000000;">
										<strong>候选人：</strong>
										<c:forEach items="${cti.taskUsers}" var="tu" varStatus="vStatus">
											${tu}
											<c:if test="${not vStatus.last}">,</c:if>
										</c:forEach>
									</div>
								</c:if>
							</div>
						</li>
						
					</c:forEach>
					
					
					<c:forEach items="${operateRecords}" var="r">
						<li>
							<div class="smart-timeline-icon">
								<i class="fa fa-file-text"></i>
							</div>
							<div class="smart-timeline-time">
								<small>${r.taskDefName}</small>
							</div>
							<div class="smart-timeline-content">
								<p>
									<strong>${r.createdUserName}[<a href="javascript:void(0);"><i>${r.transitionName}</i></a>]</strong>
									<small><fmt:formatDate value="${r.createdTime}" pattern="yyyy-MM-dd HH:mm:ss"/></small>
								</p>
								
								<c:if test="${not empty r.remark}">
									<div class="well display-inline">
										${r.remark}
									</div>										
								</c:if>	
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>

	</div>
</div>
</c:if>