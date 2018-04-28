<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- 部门编辑 -->
<div class="col-sm-12 col-md-12 col-lg-12" id="system-dept-edit" style="padding-right:50px;padding-top:50px">
		<form class="form-horizontal" id="form-edit-system-dept">
			<input type="hidden" id="id" name="id" value="${model.id}"/>
			<input type="hidden" id="parentId" name="parentId" value="${parent.id}"/>
			<c:if test="${empty model}">
				<input type="hidden" id="status" name="status" value="A"/>
			</c:if>
			<c:if test="${not empty model}">
				<input type="hidden" id="status" name="status" value="${model.status }"/>
			</c:if>
			
			<div class="form-group">
				<label class="col-md-3 control-label">上级部门:</label>
				<div class="col-md-9">
					<input class="form-control" type="text" value="${parent.deptName}" disabled="disabled"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label"><font color="red">*</font>部门名称:</label>
				<div class="col-md-9">
					<input class="form-control" placeholder="请输入角色名称..." type="text"
						id="deptName" name="deptName" value="${model.deptName }"/>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label">部门编码:</label>
				<div class="col-md-9">
					<input class="form-control" placeholder="请输入角色编码..." type="text"
						id="deptCode" name="deptCode" value="${model.deptCode }"/>
				</div>
			</div>
		</form>
</div>
<!-- end row -->

