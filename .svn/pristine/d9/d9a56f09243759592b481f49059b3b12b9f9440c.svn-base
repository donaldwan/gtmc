<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/common/taglibs.jsp"/>

<div id="win-id-plugin-wf-usergroup-param-choose-edit" class="col-sm-12 col-md-12 col-lg-12"  style="padding-right:60px;padding-top:15px;">
    <form class="form-horizontal" id="id-edit-form-usergroup-param-choose">
		<div class="form-group">
			<label class="col-sm-4 control-label no-padding-right" for="paramType"><font color="red">*</font>参数类型:</label>
			<div class="col-sm-8">
				<select class="form-control" name="paramType" id="paramType">
					<option value="bp" ${model.paramType eq 'bp'?'selected':'' }>上下文</option>
					<option value="form" ${model.paramType eq 'form'?'selected':'' }>表单</option>
					<option value="re" ${model.paramType eq 're'?'selected':'' }>返回值</option>
				</select>
			</div>
		</div>
		
		<div class="form-group">
			<input type="hidden" id="id-userGroupId" name="userGroupId" value="${model.userGroupId }">
			<input type="hidden" id="id-groupParamId" name="id" value="${model.id }">
			<label class="col-sm-4 control-label no-padding-right" for="paramName"><font color="red">*</font>参数名称:</label>
			<div class="col-sm-8">
				<input type="text" name="paramName" id="paramName" placeholder="请输入参数名称..." class="form-control" value="${model.paramName }" />
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-sm-4 control-label no-padding-right" for="paramValue"><font color="red">*</font>参数表达式:</label>
			<div class="col-sm-8">
				<input type="text" name="paramValue" id="paramValue" placeholder="请输入表达式..." class="form-control" value="${model.paramValue }" />
			</div>
		</div>
    </form>
</div>

<script type="text/javascript">
	loadScript("${ctx}/static/modules/plugins/wf/usergroup/choose/edit-param.js",function(){
		$.plugins.wf.usergroup.choose.editParam.init();
	});
</script>

