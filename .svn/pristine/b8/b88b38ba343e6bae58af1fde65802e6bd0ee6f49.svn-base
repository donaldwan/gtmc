<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div id="common-document-management-referDeptUser">
	<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="jarviswidget jarviswidget-color-lightblue" data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false">
			<header>
				<h2><strong>文档管理系统-关联部门/用户</strong> <i></i></h2>
			</header>
			<div class="widget-body">
				<div class="well">
					
					<form class="form-horizontal" id="form-upload-document-referDeptUser">
						<div class = "form-group">
							<lable class="col-md-1 control-label">路径:</lable>
							<div class = "col-md-2">
								<input class="form-control" id = "filePath" name='filePath' value = 'files' />
							</div>
							<lable class="col-md-1 control-label">部门:</lable>
							<div class = "col-md-2">
								<input class="form-control" id = "permissionDept" name ='permissionDept' value = 'contract'/>
							</div>
							<lable class="col-md-1 control-label">选择文件</lable>
							<div class = "col-md-2	">
								<input class = "btn btn-default" id="uploadFile" name = "uploadFile"  type = 'file'/>
							</div>
                        </div>
							
						<div class = "form-group" >
							<lable class="col-md-1 control-label">角色</lable>
							<div class = "col-md-2">
								<input class="form-control" id= "permissionRole" name = 'permissionRole' value = 'C01'/>
							</div>
							<lable class="col-md-1 control-label">指定人:</lable>
							<div class = "col-md-2">
								<input class="form-control" id= "permissionUser" name = 'permissionUser' value = 'C01'/>
							</div>
							
							<lable class="col-md-1 control-label">下载:</lable>
							<div class = "col-md-2">
								<select class="form-control col-md-1" id = "permissionDown" name="permissionDown" class="btn btn-default dropdown-toggle">
									<option value = '1'>是</option>
									<option value = '0'>否</option>
								</select>
							</div>
							
							<div class = "col-md-3">
								<a id="business-one-fileUpload" class="btn btn-primary btn-sm" href="javascript:void(0);" ><i class="fa fa-upload"></i>&nbsp;上&nbsp;传</a>
							</div>
						</div>	
					</form>
				</div>
				
				<div class="well">
					<form class="form-horizontal" id="form-search-common-document">
						<div class = "form-group">
							<lable class="hidden-xs hidden-sm hidden-md col-md-1 control-label">路径:</lable>
							<div class = "col-xs-12 col-sm-4 col-md-4 col-lg-3">
								<input class="form-control" type="text" name='filePath' placeholder="请输入文件路径...">
							</div>
							<lable class="hidden-xs hidden-sm hidden-md col-md-1 control-label">部门:</lable>
							<div class = "col-xs-12 col-sm-4 col-md-4 col-lg-3">
								<input class = "form-control" name = 'permissionDept' placeholder= "请输入部门..."/>
							</div>
							<lable class="hidden-xs hidden-sm hidden-md col-md-1 control-label">角色:</lable>
							<div class = "col-xs-12 col-sm-4 col-md-4 col-lg-3">
								<input class = "form-control" name = 'permissionRole' placeholder= "请输入角色..."/>
							</div>
							
						</div>
						<div class = "form-group">
							<lable class="hidden-xs hidden-sm hidden-md col-md-1 control-label">指定人:</lable>
							<div class = "col-xs-12 col-sm-4 col-md-4 col-lg-3">
								<input class = "form-control" name = 'permissionUser' placeholder="请输入指定人...">
							</div>
							<lable class="hidden-xs hidden-sm hidden-md col-md-1 control-label"></lable>
							<div class = "col-xs-12 col-sm-4 col-md-4 col-lg-3">
								<a id="bt-search" class="btn btn-primary btn-sm" href="javascript:void(0);" ><i class="fa fa-search"></i>&nbsp;搜&nbsp;索</a>
								<a id="bt-reset" class="btn btn-default btn-sm" href="javascript:void(0);" ><i class="fa fa-reply "></i>&nbsp;重&nbsp;置</a>
							</div>
						</div>
					</form>
					
					<!-- <div class="alert alert-info alert-block group-bts" style="padding:5px;">
						<a id="bt-add" class="btn btn-success btn-sm" href="javascript:void(0);" ><i class="fa fa-plus"></i>&nbsp;新&nbsp;增</a>
						<a id="bt-edit" class="btn btn-success btn-sm" href="javascript:void(0);" ><i class="fa fa-edit"></i>&nbsp;编&nbsp;辑</a>
						<a id="bt-delete" class="btn btn-danger btn-sm" href="javascript:void(0);" ><i class="fa fa-times"></i>&nbsp;删&nbsp;除</a>
					</div> -->
					
					<div id="grid-document-referDeptUser"></div>
					
				</div>
				
			</div>
		</div>
	</article>
</div>
	
<script type="text/javascript">
	loadScript("${ctx}/static/modules/common/document/referDeptUser.js",function(){
		$.common.document.referDeptUser.init();
	});
</script>
