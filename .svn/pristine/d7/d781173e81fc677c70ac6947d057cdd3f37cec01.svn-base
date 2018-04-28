<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div class="row" id="demo-leave-task-claim">
	
	
	<!-- 表单区域 -->
	<article class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
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
							<label class="control-label col-md-3"><font color="red">*</font>开始日期:</label>
							<div class="col-md-9">
								<input class="form-control" placeholder="请选择开始日期..." type="text" onclick="WdatePicker();"
									id="beginDate" name="beginDate" value="<fmt:formatDate value='${model.beginDate}' pattern='yyyy-MM-dd'/>"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label"><font color="red">*</font>结束日期:</label>
							<div class="col-md-9">
								<input class="form-control" placeholder="请选择结束日期..." type="text" onclick="WdatePicker();"
									id="endDate" name="endDate" value="<fmt:formatDate value='${model.endDate}' pattern='yyyy-MM-dd'/>"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">请假事由:</label>
							<div class="col-md-9">
								<input class="form-control" placeholder="请输入请假事由..." type="text"
									id="reasion" name="reasion" value="${model.reasion }"/>
							</div>
						</div>
					</form>
				</div>
				<!-- end widget content -->
				
			</div>
			<!-- end widget div -->
			
		</div>
	</article>
	
	<!-- 日志展现区域 -->
	<article class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
		<div class="jarviswidget jarviswidget-color-lightblue" data-widget-editbutton="false" 
			data-widget-togglebutton="false" data-widget-deletebutton="false" data-widget-fullscreenbutton="false">
			
			<header>
				<h2><strong>日志区域</strong> <i></i></h2>
			</header>

			<!-- widget div-->
			<div>
				<!-- widget content -->
				<div class="widget-body" id="log-container">
						
				</div>
				<!-- end widget content -->
				
			</div>
			<!-- end widget div -->
			
		</div>
	</article>
</div>

