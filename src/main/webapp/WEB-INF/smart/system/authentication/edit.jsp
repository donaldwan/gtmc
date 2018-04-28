<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<jsp:include page="/common/taglibs.jsp" />


<div class="col-sm-12 col-md-12 col-lg-12" id="wid-id-plugins-system-auth-screen-edit" style="padding-right:15px;padding-top:20px;">
		<form class="form-horizontal"
			id="id-form-auth">
			<input type="hidden" id="id-auth-screen-id" name="screenId" value="${model.screenId}">
			<input type="hidden" id="id-auth-id" name="id" value="${model.id}">
			<div class="row">
			<div class="form-group has-warning col-sm-12">
				<label class="col-md-3 control-label form-label">权限名称:</label>
				<div class="col-md-8">
					<input class="form-control" type="text" name="authName"
						id="id-auth-authName" placeholder="请填写权限名称..."
						value="${model.authName}">
				</div>
				
			</div>
			</div>
			<div class="row">
			<div class="form-group has-warning col-sm-12">
				<label class="col-md-3 control-label form-label">权限编码:</label>
				<div class="col-md-8">
					<input class="form-control" type="text" name="authCode"
						id="id-auth-authCode" placeholder="请填写权限编码(大写)..." value="${model.authCode}">
				</div>
			</div>
			</div>
		</form>
</div>

<!-- js脚本 -->
<!-- <script src="static/ace/js/jquery.validate.js"></script> -->
<script type="text/javascript">
	loadScript("${ctx}/static/modules/system/authentication/edit.js",function(){
		$.system.authentication.edit.init();
	});
</script>
