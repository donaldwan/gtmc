<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<form id="form-dept-edit" method="post">
	<input type="hidden" id="id" name="id" value="${model.id}">
	<table class="edit-table">
		<tr>
			<td class="td-label-1">上级部门:</td>
			<td class="td-input-1">
				<input type="text" class="easyui-textbox" style="height:28px;" data-options="disabled:true"
					value="${parent.deptName}"/>
			</td>
		</tr>
		
		<tr>
			<td class="td-label-1">部门名称:</td>
			<td class="td-input-1">
				<input type="text" id="deptName" name="deptName" class="easyui-textbox" style="height:28px;"
					value="${model.deptName}" required="true" validType="length[2,20]" />
			</td>
		</tr>
		
		<tr>
			<td class="td-label-1">部门编码:</td>
			<td class="td-input-1">
				<input type="text" id="deptCode" name="deptCode" class="easyui-textbox" style="height:28px;"
					value="${model.deptCode}" validType="length[2,20]"/>
			</td>
		</tr>
	</table>
</form>