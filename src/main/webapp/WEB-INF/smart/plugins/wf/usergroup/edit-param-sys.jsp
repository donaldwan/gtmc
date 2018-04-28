<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/common/taglibs.jsp"/>

<div id="win-id-plugin-wf-usergroup-Param-Sys-edit" class="col-sm-12 col-md-12 col-lg-12"  style="padding-right:60px;padding-top:15px;">
    <form class="form-horizontal" id="id-edit-form-usergroup-param-sys">
    	<input type="hidden" id="id-userGroupId" name="userGroupId" value="${model.userGroupId }">
		<div class="form-group">
			<label class="col-sm-4 control-label no-padding-right" for="paramType">参数类型:</label>
			<div class="col-sm-8">
				<select class="form-control" name="paramType" id="paramType" onchange="$.plugins.wf.usergroup.editParamSys.changeParamType(this);">
					<option value="bp">上下文参数</option>
					<option value="sys">系统参数</option>					
				</select>
			</div>
		</div>
		<div class="form-group" id="id-paramType-bp">
			<label class="col-sm-4 control-label no-padding-right" for="paramType">系统参数:</label>
			<div class="col-sm-8">
				<select class="form-control" name="paramInfoBp" id="paramInfoBp" onchange="$.plugins.wf.usergroup.editParamSys.changeParamInfoBp();">
					<option value="">==请选择==</option>	
					<option value="applyUserId">发起人ID</option>	
					<option value="logerUserId">登录人ID</option>	
					<option value="lastUserId">上一步执行人ID</option>								
				</select>
			</div>
		</div>
		<div id="id-paramType-sys" style="display: none;">
			<div class="form-group">
				<label class="col-sm-4 control-label no-padding-right" for="paramInfoSys">系统参数:</label>
				<div class="col-sm-8 input-group">
					<select class="form-control" style="margin-left: 5px" name="paramInfoSys" id="paramInfoSys">
						<option value="">==请选择==</option>	
						<option value="role">系统角色</option>	
						<option value="dept">系统部门</option>	
						<!-- <option value="job">系统职务</option>	 -->							
					</select>
					<span class="input-group-addon" onclick="$.plugins.wf.usergroup.editParamSys.selectSysInfo();"><i class="fa fa-search-plus"></i></span>
				</div>
			</div>			
		</div>
		<div class="form-group" id="">
			<label class="col-sm-4 control-label no-padding-right" for="paramName">参数名称:</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="paramName" id="paramName" disabled/>
			</div>
		</div>
		<div class="form-group" id="">
			<label class="col-sm-4 control-label no-padding-right" for="paramValue">参数值:</label>
			<div class="col-sm-8">
				<input type="text" class="form-control" name="paramValue" id="paramValue" disabled/>
			</div>
		</div>
		<input type="hidden" class="form-control" name="sysParamType" id="sysParamType"/>
		<input type="hidden" class="form-control" name="sysParamValue" id="sysParamValue"/>
    </form>
</div>

<script type="text/javascript">
	loadScript("${ctx}/static/modules/plugins/wf/usergroup/edit-param-sys.js",function(){
		$.plugins.wf.usergroup.editParamSys.init();
	});
</script>

