<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div id="system-resource-manager">
	<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="jarviswidget jarviswidget-color-lightblue" data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false">
			<header>
				<h2><strong>资源管理</strong> <i></i></h2>
			</header>
			<div>
				<div class="widget-body ">
					<!-- 搜索条件begin -->
					<div class="well">
						<form class="form-horizontal" id="form-search-system-resource">
							<div class="form-group">
								<label class="hidden-xs hidden-sm hidden-md col-lg-1 control-label">资源名称:</label>
								<div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
									<input class="form-control" name="resourceName" placeholder="请输入资源名称..." type="text">
								</div>
								
								<label class="hidden-xs col-lg-1 hidden-sm hidden-md control-label">uri:</label>
								<div class="col-xs-12 col-sm-4 col-md-4 col-lg-3">
									<input class="form-control" name="uri" placeholder="请输入uri..." type="text">
								</div>
								
								<div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
									<a id="bt-search" class="btn btn-primary btn-sm" href="javascript:void(0);" ><i class="fa fa-search"></i>&nbsp;搜&nbsp;索</a>
									<a id="bt-reset" class="btn btn-default btn-sm" href="javascript:void(0);" ><i class="fa fa-reply "></i>&nbsp;重&nbsp;置</a>
								</div>
							</div>
							
						</form>
					</div>
					<!-- 搜索条件end -->
					
					<div class="alert alert-info alert-block group-bts" style="padding:5px;">
						<a id="bt-add" class="btn btn-success btn-sm" href="javascript:void(0);" ><i class="fa fa-plus"></i>&nbsp;新&nbsp;增</a>
						<a id="bt-edit" class="btn btn-success btn-sm" href="javascript:void(0);" ><i class="fa fa-edit"></i>&nbsp;编&nbsp;辑</a>
						<a id="bt-delete" class="btn btn-danger btn-sm" href="javascript:void(0);" ><i class="fa fa-times"></i>&nbsp;删&nbsp;除</a>
					</div>
					<div id="grid-system-resource"></div>
				</div>
				
			</div>
		</div>
	</article>
</div>
	
<script type="text/javascript">
	loadScript("${ctx}/static/modules/system/resource/manager.js",function(){
		$.system.resource.init();
	});
</script>
