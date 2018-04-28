<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/common/taglibs.jsp" />

<div class="col-sm-12 col-md-12 col-lg-12"  style="padding-right:60px;padding-top:15px;" id="wid-id-system-dictionary-edit">
	<form class="form-horizontal" id="id-edit-form-dictionary">
		<div class="form-group">
			<input type="hidden" id="id-edit-dictionary" name="id" value="${model.id}">
			<label class="col-sm-3 control-label no-padding-right"
				for="typeCode"><font color="red">*</font>字典类型编码:</label>
			<div class="col-sm-9">
				<input type="text" name="typeCode" id="id-typeCode" placeholder="请输入字典类型编码..." class="form-control" value="${model.typeCode}" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-3 control-label no-padding-right" for="dictionaryName"><font color="red">*</font>字典类型名称:</label>
			<div class="col-sm-9">
				<input type="text" name="dictionaryName" placeholder="请输入字典类型名称..." id="id-dictionaryName" class="form-control" value="${model.dictionaryName}" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3 no-padding-right" for="dictionaryCode"><font color="red">*</font>字典编码:</label>
			<div class="col-sm-9">
				<input type="text" name="dictionaryCode" placeholder="请输入字典编码..." id="id-dictionaryCode" class="form-control" value="${model.dictionaryCode}" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3 no-padding-right" for="dictionaryValue">字典值:</label>
			<div class="col-sm-9">
				<input type="text" name="dictionaryValue" placeholder="请输入字典值..." id="id-dictionaryValue" class="form-control" value="${model.dictionaryValue}" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3 no-padding-right" for="sortNum">排序:</label>
			<div class="col-sm-9">
				<input type="text" name="sortNum" placeholder="请输入排序..." id="id-sortNum" class="form-control" value="${model.sortNum}" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3 no-padding-right" for="status">状态:</label>
			<div class="col-sm-9">
				<select class="form-control" name="status" id="id-status">
					<option value="A" ${model.status eq 'A'?'selected':'' }>有效</option>
					<option value="D" ${model.status eq 'D'?'selected':'' }>无效</option>
				</select>
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
	loadScript("${ctx}/static/modules/system/dictionary/edit.js",function(){
		$.system.dictionary.edit.init();
	});
</script>

