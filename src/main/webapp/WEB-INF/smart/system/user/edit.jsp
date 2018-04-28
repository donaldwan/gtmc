<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- 用户编辑 -->
<div class="col-sm-12 col-md-12 col-lg-12" id="system-user-edit" style="padding-right:80px;padding-top:35px;">
	<form class="form-horizontal" id="form-edit-system-user">
		<input type="hidden" id="id" name="id" value="${model.id}"/>
		
		<div class="form-group">
			<label class="col-md-3 control-label"><font color="red">*</font>姓名:</label>
			<div class="col-md-9">
				<input class="form-control" placeholder="请输入名称..." type="text"
					id="name" name="name" value="${model.name }"/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label"><font color="red">*</font>工号:</label>
			<div class="col-md-9">
				<input class="form-control" placeholder="请输入工号..." type="text"
					id="empCode" name="empCode" value="${model.empCode }"/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-3"><font color="red">*</font>部门:</label>
			<div class="col-md-9">
						<div class="input-group">
							<input type="hidden" id="deptId" name="deptId" value="${model.deptId }"/>
							<input class="form-control" placeholder="请选择部门..." type="text"
								value="${model.deptName}" id="deptName" name="deptName" readOnly style="cursor:pointer;">
							<span class="input-group-addon" id='deptChoose' style="cursor:pointer;">点击选择</span>
						</div>
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">电话:</label>
			<div class="col-md-9">
				<input class="form-control" placeholder="请输入电话号码..." type="text"
					id="telephone" name="telephone" value="${model.telephone }"/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label"><font color="red">*</font>Email:</label>
			<div class="col-md-9">
				<input class="form-control" placeholder="请输入Email..." type="text"
					id="email" name="email" value="${model.email }"/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">性别</label>
			<div class="col-md-9">
				<label class="radio radio-inline"><input type="radio" name="sex" value="M" ${(model.sex eq 'M' or empty model.sex)?'checked':''}>男</label>
				<label class="radio radio-inline"><input type="radio" name="sex" value="W" ${model.sex eq 'W'?'checked':''}>女</label>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-3">用户类型</label>
			<div class="col-md-9">
				<select class="form-control" name="userType" id="id-user-type">
					<c:forEach items="${dictionaryList}" var="d">
						<option value="${d.dictionaryCode}" ${model.userType eq d.dictionaryCode?'selected':'' }>${d.dictionaryValue}</option>
					</c:forEach>
				</select>
			</div>
		</div>
		<c:forEach items="${userPropertyList}" var="userProperty">
			<div class="form-group">
				<label class="col-md-3 control-label">${userProperty.propertyName}:</label>
				<div class="col-md-9">
					<input class="form-control userProperty" placeholder="请输入${userProperty.propertyName}..." type="text"
						id="${userProperty.propertyCode}" regular="${userProperty.regular}" propertyId="${userProperty.id}" name="${userProperty.propertyCode}"
						value="<c:forEach items='${userPropertyValueList}' var='userPropertyValue'><c:if test='${userProperty.propertyCode eq userPropertyValue.propertyCode}'>${userPropertyValue.propertyValue}</c:if></c:forEach>"/>
				</div>
			</div>
		</c:forEach>
		<c:if test="${empty model.id}">
			<div class="form-group">
				<label class="col-md-3 control-label">注:</label>
				<div class="col-md-9">
					<div class="alert alert-info alert-block" style="margin:0px;color: red;">
						新增用户的初始密码为:123456
					</div>
				</div>
			</div>
		</c:if>
	</form>
</div>
