<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!-- row -->
<div id="win-id-plugin-wf-usergroup-manager-choose" class="col-sm-12 col-md-12 col-lg-12 no-padding">
	<article class="col-xs-7 col-sm-7 col-md-7 col-lg-7 no-padding">
		<div class="jarviswidget jarviswidget-color-lightblue no-padding" data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false" data-widget-fullscreenbutton="false">
			<header>
				<h2><strong>用户组管理</strong> <i></i></h2>
			</header>
			<div>
				<div class="widget-body" id='widget-body-screen'>
					<div class="alert alert-info alert-block group-bts">
						<a class="btn btn-success btn-sm"  onclick="$.plugins.wf.usergroup.manager_choose.editUserGroup('A');" href="javascript:void(0);"><i class="fa fa-plus"></i>&nbsp;新增用户组</a>
						<a class="btn btn-success btn-sm"  onclick="$.plugins.wf.usergroup.manager_choose.editUserGroup('E');" href="javascript:void(0);"><i class="fa fa-edit"></i>&nbsp;编辑用户组</a>
						<!-- <a class="btn btn-danger btn-sm"   onclick="$.plugins.wf.usergroup.manager_choose.deleteUserGroup();"><i class="fa fa-times"></i>&nbsp;删除用户组</a> -->
					</div>
					<div id="grid-plugin-wf-usergroup-choose"></div>
				</div>
			</div>
		</div>
	</article>
	
	<article class="col-xs-5 col-sm-5 col-md-5 col-lg-5 no-padding">
		<div class="jarviswidget jarviswidget-color-lightblue no-padding" data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false" data-widget-fullscreenbutton="false">
			<header>
				<h2><strong>用户组参数管理</strong> <i></i></h2>
			</header>
			<div>
				<input type="hidden" id="userGroupId" name="userGroupId"/>
				<div class="widget-body">
					<div class="alert alert-info alert-block group-bts">
						<a class="btn btn-success btn-sm"  onclick="$.plugins.wf.usergroup.manager_choose.editUserGroupParamSys();"><i class="fa fa-plus"></i>&nbsp;选择参数</a>
						<a class="btn btn-success btn-sm"  onclick="$.plugins.wf.usergroup.manager_choose.editUserGroupParam('A');"><i class="fa fa-plus"></i>&nbsp;新增参数</a>
						<a class="btn btn-success btn-sm"  onclick="$.plugins.wf.usergroup.manager_choose.editUserGroupParam('E');"><i class="fa fa-edit"></i>&nbsp;修改参数</a>
						<a class="btn btn-danger btn-sm"   onclick="$.plugins.wf.usergroup.manager_choose.deleteUserGroupParam();"><i class="fa fa-trash-o"></i>&nbsp;删除参数</a>
					</div>
					<div id="id-plugin-wf-usergroup-param-table-choose"></div>
				</div>
			</div>
		</div>
	</article>
</div>
	
<script type="text/javascript">	
	loadScript("${ctx}/static/modules/plugins/wf/usergroup/choose/manager-choose.js",function(){
		$.plugins.wf.usergroup.manager_choose.init();
		$("#pager_867aef516a945f23c028e02a0d197f09_left").remove();
	});
</script>
