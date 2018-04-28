<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<c:if test="${not empty remarks}">
<div class="row">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
		<div class="well well-sm no-padding">
			<div class="smart-timeline">
				<ul class="smart-timeline-list">
					<c:forEach items="${remarks}" var="r">
						<li>
							<div class="smart-timeline-icon">
								<i class="fa fa-file-text"></i>
							</div>
							<div class="smart-timeline-time">
								<small>${r.createdUserName}</small>
							</div>
							<div class="smart-timeline-content">
								<p>
									<strong>${r.taskDefName}[<a href="javascript:void(0);"><i>${r.transitionName}</i></a>]</strong>
								</p>
								
								<p>
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