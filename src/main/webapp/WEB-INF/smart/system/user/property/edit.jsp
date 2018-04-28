<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/common/taglibs.jsp" />

<div class="col-sm-12 col-md-12 col-lg-12"  style="padding-right:60px;padding-top:15px;" id="wid-id-system-user-property-edit">
	<form class="form-horizontal" id="id-edit-form-user-property">
		<div class="form-group">
			<input type="hidden" id="id-edit-user-property" name="id" value="${model.id}">
			<label class="col-sm-3 control-label no-padding-right"
				for="typeCode"><font color="red">*</font>属性编码:</label>
			<div class="col-sm-9">
				<input type="text" name="propertyCode" id="id-user-propertyCode" placeholder="请输入属性编码..." class="form-control" value="${model.propertyCode}" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="propertyName"><font color="red">*</font>属性名称:</label>
			<div class="col-sm-9">
				<input type="text" name="propertyName" placeholder="请输入属性名称..." id="id-user-propertyName" class="form-control" value="${model.propertyName}" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3 no-padding-right" for="regular">属性值正则:</label>
			<div class="col-sm-9">
				<input type="text" name="regular" placeholder="请输入属性值正则..." id="id-regular" class="form-control" value="${model.regular}" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3 no-padding-right" for="remark">备注:</label>
			<div class="col-sm-9">
				<input type="text" name="remark" id="id-remark" placeholder="请输入备注..." class="form-control" value="${model.remark}" />
			</div>
		</div>
	</form>
</div>

<script type="text/javascript">
	loadScript("${ctx}/static/modules/system/user/property/edit.js",function(){
		$.system.user.property.edit.init();
	});
</script>

