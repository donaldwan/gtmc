<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<jsp:include page="/common/taglibs.jsp" />

<div class="col-sm-12 col-md-12 col-lg-12"  style="padding-right:30px;padding-top:45px;">
	<form class="form-horizontal" id="id-edit-form-screen" method="post">
		<input type="hidden" name="id" id="id-edit-screenId" value="${model.id}">
		<input type="hidden" name="parentId" id="parentId-edit-screenId" value="${model.parentId}">
		<input type="hidden" name="resourceId" id="id-edit-resourceId" value="${model.resourceId}">
		<div class="row">
			<div class="form-group has-warning col-sm-12">
				<label class="col-md-3 control-label">菜单名称:</label>
				<div class="col-md-9">
					<input type="text" class="form-control" name="screenName" id="id-edit-screenName" placeholder="请填写菜单名称..." value="${model.screenName}"/>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group col-sm-12">
				<label class="col-md-3 control-label">打开方式:</label>
				<div class="col-md-9">
					<select class="form-control" id="id-edit-openType" name="openType">
						<option value="D" ${model.openType eq 'I' ? '':'selected'}>默认方式</option>
						<option value="I" ${model.openType eq 'I' ? 'selected':''}>IFrame</option>
					</select>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="form-group col-sm-12">
				<label class="col-md-3 control-label">排序数字:</label>
				<div class="col-md-9">
					<input type="text" class="form-control" name="sortNum" id="id-edit-sortNum" placeholder="请填写排序数字..." value="${model.sortNum}"/>
				</div>
			</div>
		</div>
	</form>
</div>

<!-- js脚本 -->
<script type="text/javascript">
	loadScript("${ctx}/static/modules/system/screen/edit-screen.js",function(){
		$.system.screen.edit.init();
	});
</script>
