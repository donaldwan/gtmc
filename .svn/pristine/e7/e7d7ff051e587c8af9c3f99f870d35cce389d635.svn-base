<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div class="row" id="system-role-set-manager">
	<input type="hidden" id="system-role-set-user-id" value="${userId}" />
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="well">
			<form class="form-horizontal" id="form-search-system-role-set">
				<div class="form-group">
					<label class="col-md-1 control-label">角色名称:</label>
					<div class="col-md-3">
						<input class="form-control" name="roleName" placeholder="请输入角色名称..." type="text">
					</div>
					
					<div class="col-md-8">
						<a id="bt-search" class="btn btn-primary btn-sm" href="javascript:void(0);" ><i class="fa fa-search"></i>&nbsp;搜&nbsp;索</a>
						<a id="bt-reset" class="btn btn-default btn-sm" href="javascript:void(0);" ><i class="fa fa-reply "></i>&nbsp;重&nbsp;置</a>
					</div>
				</div>
				
			</form>
		</div>
	</div>
	<div class="col-sm-12 col-md-12 col-lg-12" id="grid-system-role-set"></div>
</div>
	
<script type="text/javascript">
	loadScript("${ctx}/static/modules/system/user/edit-role.js",function(){
		$.system.role.set.init();
	});
</script>
