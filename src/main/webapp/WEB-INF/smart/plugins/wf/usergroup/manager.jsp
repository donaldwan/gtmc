<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>


<!-- row -->
<div id="win-id-plugin-wf-usergroup-manager" class="col-sm-12 col-md-12 col-lg-12 no-padding">
	<!-- 用户组信息管理 -->
	<article class="col-xs-12 col-sm-12 col-md-12 col-lg-7">
		<div class="jarviswidget jarviswidget-color-lightblue" data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false">
			<header>
				<h2><strong>用户组管理</strong> <i></i></h2>
			</header>
			<div>
				<div class="widget-body" id='widget-body-screen'>
					<div class="alert alert-info alert-block group-bts" style="padding:5px;">
						<a class="btn btn-success btn-sm"  onclick="$.plugins.wf.usergroup.manager.editUserGroup('A');" href="javascript:void(0);"><i class="fa fa-plus"></i>&nbsp;新增用户组</a>
						<a class="btn btn-success btn-sm"  onclick="$.plugins.wf.usergroup.manager.editUserGroup('E');" href="javascript:void(0);"><i class="fa fa-edit"></i>&nbsp;编辑用户组</a>
						<a class="btn btn-danger btn-sm"   onclick="$.plugins.wf.usergroup.manager.deleteUserGroup();"><i class="fa fa-times"></i>&nbsp;删除用户组</a>
						
<!-- 						<a class="btn btn-success btn-sm"   onclick="$.plugins.wf.usergroup.manager.dilogTest();"></i>&nbsp;弹窗测试</a>
 -->					</div>
					<div id="grid-plugin-wf-usergroup"></div>
				</div>
			</div>
		</div>
	</article>
	
	<!-- 参数管理 -->
	<article class="col-xs-12 col-sm-12 col-md-12 col-lg-5">
		<div class="jarviswidget jarviswidget-color-lightblue" data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false">
			<header>
				<h2><strong>用户组参数管理</strong> <i></i></h2>
			</header>
			<div>
				<input type="hidden" id="userGroupId" name="userGroupId"/>
				<div class="widget-body">
					<div class="alert alert-info alert-block group-bts" style="padding:5px;">
					    <a class="btn btn-success btn-sm"  onclick="$.plugins.wf.usergroup.manager.editUserGroupParamSys();"><i class="fa fa-plus"></i>&nbsp;选择参数</a>
						<a class="btn btn-success btn-sm"  onclick="$.plugins.wf.usergroup.manager.editUserGroupParam('A');"><i class="fa fa-plus"></i>&nbsp;新增参数</a>
						<a class="btn btn-success btn-sm"  onclick="$.plugins.wf.usergroup.manager.editUserGroupParam('E');"><i class="fa fa-edit"></i>&nbsp;修改参数</a>
						<a class="btn btn-danger btn-sm"   onclick="$.plugins.wf.usergroup.manager.deleteUserGroupParam();"><i class="fa fa-trash-o"></i>&nbsp;删除参数</a>
					</div>
					<div id="id-plugin-wf-usergroup-param-table"></div>
				</div>
			</div>
		</div>
	</article>
</div>
	
<script type="text/javascript">	
	loadScript("${ctx}/static/modules/plugins/wf/usergroup/manager.js",function(){
		$.plugins.wf.usergroup.manager.init();
	});
</script>
