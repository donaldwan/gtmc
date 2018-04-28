<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- 资源编辑 -->
<div class="col-sm-12 col-md-12 col-lg-12" id="common-document-referBusiness-edit" style="padding-right:50px;padding-top:50px;">
		<form class="form-horizontal" id="form-edit-common-document-referBusiness">
			<input type="hidden" id="id" name="id" value="${model.id}"/>
			<div class="form-group">
				<label class="control-label col-md-3"><font color="red">*</font>文件路径</label>
				<div class="col-md-9">
					<input class="form-control" placeholder="请输文件路径..." type="text"
						id="path" name="path" value="${model.path}" ${isDetail?'disabled':''}/>
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-md-3"><font color="red">*</font>管理类型</label>
				<div class="col-md-9">
					<input class="form-control" placeholder="请输文件路径..." type="text"
						id="" name="" value="${model.path}" ${isDetail?'disabled':''}/>
				</div>
			</div>
			
			
			<div class="form-group">
				<label class="control-label col-md-3"><font color="red">*</font>文件路径</label>
				<div class="col-md-9">
					<select class="form-control" id="resourceType" name="resourceType">
						<option value="D" ${model.resourceType eq 'I' ? '':'selected'}>默认方式</option>
						<option value="I" ${model.resourceType eq 'I' ? 'selected':''}>IFrame</option>
					</select>
				</div>
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label"><font color="red">*</font>资源名称:</label>
				<div class="col-md-9">
					<input class="form-control" placeholder="请输入资源名称..." type="text"
						id="resourceName" name="resourceName" value="${model.resourceName }" ${isDetail?'disabled':''}/>
				</div>
				
			</div>
			<div class="form-group">
				<label class="col-md-3 control-label"><font color="red">*</font>uri:</label>
				<div class="col-md-9">
					<input class="form-control" placeholder="请输入uri..." type="text"
						id="uri" name="uri" value="${model.uri }"  ${isDetail?'disabled':''}/>
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
<!-- end row -->
