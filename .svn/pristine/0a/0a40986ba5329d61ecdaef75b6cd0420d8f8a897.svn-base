<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- 角色管理列表 -->
<div class="col-sm-12 col-md-12 col-lg-12 no-padding" id="system-screen-manager">
	<article class="col-xs-12 col-sm-12 col-md-12 col-lg-8">
		<div class="jarviswidget jarviswidget-color-lightblue" data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false">
			<header>
				<h2><strong>菜单管理</strong> <i></i></h2>
			</header>
			<div>
				<div class="widget-body" id='widget-body-screen'>
					<div class="alert alert-info alert-block group-bts" style="padding:5px;">
						<a class="btn btn-success btn-sm"  onclick="$.system.screen.editScreen('A');"><i class="fa fa-plus"></i>&nbsp;新增子菜单</a>
						<a class="btn btn-success btn-sm"  onclick="$.system.screen.editScreen('E');"><i class="fa fa-edit"></i>&nbsp;编辑子菜单</a>
						<a class="btn btn-success btn-sm"  onclick="$.system.screen.authScreenResoure();"><i class="fa fa-cog"></i>&nbsp;菜单资源配置</a>
						<a class="btn btn-danger btn-sm"  onclick="$.system.screen.delScreen()"><i class="fa fa-times"></i>&nbsp;删除子菜单</a>
					</div>
					
					<input type="hidden" id="id-screen-parentId" > 
					<input type="hidden" id="id-screen-parentName" > 
					<div id="grid-system-screen"></div>
				</div>
			</div>
		</div>
	</article>
	
	<!-- 权限管理 -->
	<article class="col-xs-12 col-sm-12 col-md-12 col-lg-4">
		<div class="jarviswidget jarviswidget-color-lightblue" data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false">
			<header>
				<h2><strong>权限管理</strong> <i></i></h2>
			</header>
			<div>
				<div class="widget-body" id='widget-body-screen-right'>
					<div class="alert alert-info alert-block group-bts" style="padding:5px;">
						<a class="btn btn-success btn-sm"  onclick="$.system.screen.editAuth('true');"><i class="fa fa-plus"></i>&nbsp;新增</a>
						<a class="btn btn-success btn-sm"  onclick="$.system.screen.editAuth('false');"><i class="fa fa-edit"></i>&nbsp;修改</a>
						<a class="btn btn-success btn-sm"  onclick="$.system.screen.authResource();"><i class="fa fa-cog"></i>&nbsp;按钮资源配置</a>
						<a class="btn btn-danger btn-sm"  onclick="$.system.screen.delAuth();"><i class="fa fa-trash-o"></i>&nbsp;删除</a>
					</div>
					<div id="id-screen-auth-table"></div>
				</div>
			</div>
		</div>
	</article>
</div>
<script type="text/javascript">
	loadScript("${ctx}/static/modules/system/screen/manager.js",function(){
		$.system.screen.init();
	});
</script>
