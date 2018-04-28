<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="winWidget" id="id-auth-resource-section">
<input type="hidden" id="id-screen-auth-id" value="${authId}"> 
<input type="hidden" id="id-screen-id" value="${screenId}"> 
<input type="hidden" id="id-screen-auth-screen-flag" value="${authOrScreen}"> 
	<!-- 所有的资源 -->		
	<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
			<div class="widget-body">
				 <div class="row">
					<form class="form-horizontal" id="div-auth-resource-form">
						<div class="form-group" >
								<label class="col-md-2 control-label form-label">资源名称:</label>
								<div class="col-md-6" id="id-test">
									<input class="form-control" name="name" id="id-auth-all-resource-name" placeholder="请输入资源名称..." type="text">
								</div>
								<div class="col-md-4">
									<a id="bt-search" onclick="$.system.screen.auth.resource.searchAll();" class="btn btn-primary btn-sm" href="javascript:void(0);" ><i class="fa fa-search"></i>&nbsp;搜&nbsp;索</a>
									<a id="bt-reset" onclick="javascript:$('#div-auth-resource-form')[0].reset();" class="btn btn-default btn-sm" href="javascript:void(0);" ><i class="fa fa-reply "></i>&nbsp;重&nbsp;置</a>
								</div>
						</div>
					</form>
				 </div>
				<div>
				<hr class="simple simple-line">
					<div class="row">
						<div id="id-div-system-auth-resource-all-table" class="grid"></div>
					</div>
				</div>
			</div>
	</article>
			
</section>


<script type="text/javascript">
	loadScript("${ctx}/static/modules/system/screen/auth-resource.js",function(){
		$.system.screen.auth.resource.init();
	});
</script>