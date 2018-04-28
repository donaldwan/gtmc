<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- 角色编辑 -->
<div class="col-sm-12 col-md-12 col-lg-12" id="system-role-edit" style="padding-right:50px;padding-top:50px;">
	<form class="form-horizontal" id="form-edit-system-role">
		<input type="hidden" id="id" name="id" value="${model.id}"/>
		<input type="hidden" id="status" name="status" value="A" />
		<div class="form-group">
			<label class="col-md-3 control-label"><font color="red">*</font>角色名称:</label>
			<div class="col-md-9">
				<input class="form-control" placeholder="请输入角色名称..." type="text"
					id="roleName" name="roleName" value="${model.roleName }" ${isDetail?'disabled':''}/>
			</div>
			
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">角色编码:</label>
			<div class="col-md-9">
				<input class="form-control" placeholder="请输入角色编码..." type="text"
					id="roleCode" name="roleCode" value="${model.roleCode }"  ${isDetail?'disabled':''}/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-md-3 control-label">备注信息:</label>
			<div class="col-md-9">
				<input class="form-control" placeholder="请输入备注信息..." type="text"
					id="remark" name="remark" value="${model.remark }"  ${isDetail?'disabled':''}/>
			</div>
		</div>
	</form>
</div>
