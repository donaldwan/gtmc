<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="bt" uri="/button-tags" %>

<!-- 用户管理页面 -->
<div class="col-sm-12 col-md-12 col-lg-12 no-padding" id="system-user-manager">
	<!-- 部门管理begin -->
	<article class="col-xs-12 col-sm-12 col-md-12 col-lg-4">
		<div class="jarviswidget jarviswidget-color-lightblue" data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false">
			<header>
				<h2><strong>部门管理</strong> <i></i></h2>
			</header>
			<div>
				<div class="widget-body">
					<div class="alert alert-info alert-block group-bts" style="padding:5px;">
					<bt:button code="INSERT_T">
						<a id="bt-add-same" class="btn btn-success btn-sm" href="javascript:void(0);" ><i class="fa fa-plus"></i>新增同级</a>
					</bt:button>
					<bt:button code="CODE_DEPT_EDIT">
						<a id="bt-add-sub" class="btn btn-success btn-sm" href="javascript:void(0);" ><i class="fa fa-plus"></i>新增下级</a>
					</bt:button>
						<a id="bt-edit-dept" class="btn btn-success btn-sm" href="javascript:void(0);" ><i class="fa fa-edit"></i>&nbsp;编&nbsp;辑</a>
						<a id="bt-delete-dept" class="btn btn-danger btn-sm" href="javascript:void(0);" ><i class="fa fa-times"></i>&nbsp;删&nbsp;除</a>
					</div>	
					<div id="grid-system-dept"></div>
				</div>
			</div>
		</div>
	</article>
	<!-- 部门管理end -->
	
	<!-- 用户管理begin -->
	<article class="col-xs-12 col-sm-12 col-md-12 col-lg-8">
		<div class="jarviswidget jarviswidget-color-lightblue" data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false">
			<header>
				<h2><strong>用户管理</strong> <i></i></h2>
			</header>
			<div>
				<div class="widget-body">
					<div class="well">
					<form class="form-horizontal" id="form-search-system-user">
						<div class="form-group">
							<label class="hidden-xs hidden-sm hidden-md col-lg-1 control-label">姓名:</label>
							<div class="col-sm-4 col-md-4 col-lg-3">
								<input id="id-name" class="form-control" name="name" placeholder="请输入姓名..." type="text">
							</div>
							
							<label class="hidden-xs hidden-sm hidden-md col-lg-1 control-label">工号:</label>
							<div class="col-sm-4 col-md-4 col-lg-3">
								<input id="id-empCode" class="form-control" name="empCode" placeholder="请输入员工编号..." type="text">
							</div>
							
							<div class="col-sm-4 col-md-4 col-lg-3">
								<a id="bt-search" onClick="javascript:$.system.user.search();" class="btn btn-primary btn-sm" href="javascript:void(0);" ><i class="fa fa-search"></i>&nbsp;搜&nbsp;索</a>
								<a id="bt-reset" onClick="javascript:$('#form-search-system-user')[0].reset();" class="btn btn-default btn-sm" href="javascript:void(0);" ><i class="fa fa-reply "></i>&nbsp;重&nbsp;置</a>
							</div>
						</div>
						
					</form>
				</div>
				
					<div class="alert alert-info alert-block group-bts" style="padding:5px;">
						<a id="bt-add" class="btn btn-success btn-sm" href="javascript:void(0);" ><i class="fa fa-plus"></i>&nbsp;新&nbsp;增</a>
						<a id="bt-edit" class="btn btn-success btn-sm" href="javascript:void(0);" ><i class="fa fa-edit"></i>&nbsp;编&nbsp;辑</a>
						<a id="bt-role-set" class="btn btn-info btn-sm" href="javascript:void(0);" ><i class="fa fa-cog"></i>&nbsp;角色配置</a>
						<a id="bt-change-status" class="btn btn-warning btn-sm" href="javascript:void(0);" ><i class="fa fa-exchange"></i>&nbsp;状态调整</a>
					</div>
					<div id="grid-system-user"></div>
				</div>
			</div>
		</div>
	</article>
	<!-- 用户管理end -->
</div>
<script type="text/javascript">
	loadScript("${ctx}/static/modules/system/user/manager.js",function(){
		$.system.user.init();
	});

	
</script>
