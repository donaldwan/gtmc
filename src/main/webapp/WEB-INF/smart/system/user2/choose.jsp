<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- 用户通用选择頁面 -->

<!-- row -->
<div class="col-sm-12 col-md-12 col-lg-12" id="system-user-choose" style="padding:0px;margin-top:5px">
	
	<!-- 部门begin -->
	<article class="col-xs-4 col-sm-4 col-md-4 col-lg-4" style="padding:0px">
		<div class="jarviswidget" data-widget-editbutton="false" 
			data-widget-togglebutton="false" 
			data-widget-deletebutton="false"
			data-widget-fullscreenbutton="false">
			<header>
			</header>
			
			<div>
				<div class="widget-body">
					<div id="grid-system-user-choose-dept"></div>
				</div>
			</div>
		</div>
	</article>
	<!-- 部门end -->
	
	<!-- 用户begin -->
	<article class="col-xs-8 col-sm-8 col-md-8 col-lg-8" style="padding-right:0px">
		<div class="jarviswidget" 
			data-widget-editbutton="false" data-widget-togglebutton="false" 
			data-widget-deletebutton="false" data-widget-fullscreenbutton="false">
			
			<header>
			</header>
			
			<div>
				<div class="widget-body">
				
					<form class="form-horizontal" id="form-search-system-user">
						<div class="form-group">
							<label class="col-md-2 control-label">姓名:</label>
							<div class="col-md-3">
								<input id="id-choose-name" class="form-control" name="name" placeholder="请输入姓名..." type="text">
							</div>
							
							<label class="col-md-2 control-label">员工编号:</label>
							<div class="col-md-3">
								<input id="id-choose-empCode" class="form-control" name="empCode" placeholder="请输入员工编号..." type="text">
							</div>
							
							<div class="col-md-2">
								<a id="bt-search" onclick="javascript:$.system.user.choose.search();" class="btn btn-primary btn-sm" href="javascript:void(0);"><i class="fa fa-search"></i>&nbsp;搜&nbsp;索</a>
<!-- 								<a id="bt-reset" onclick="javascript:$('#form-search-system-user')[0].reset();" class="btn btn-default btn-sm" href="javascript:void(0);"><i class="fa fa-reply "></i>&nbsp;重&nbsp;置</a> -->
							</div>
						</div>
					</form>
					<hr class="simple simple-line">
					<div id="grid-system-user-choose"></div>
				</div>
			</div>
		</div>
	</article>
	<!-- 用户end -->
</div>
