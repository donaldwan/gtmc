<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>


	<!-- row -->
<div id="plugin-wf-workflow-manager">
	
	<!-- NEW WIDGET START -->
	<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

		<div class="jarviswidget jarviswidget-color-lightblue" data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false">
			
			<header>
				<h2><strong>工作流管理</strong> <i></i></h2>
			</header>

			<!-- widget div-->
			<div>
				<!-- widget content -->
				<div class="widget-body ">
					<!-- 搜索条件begin -->
					<div class="well">
						<form class="form-horizontal" id="form-search-plugin-wf-manager">
							<div class="form-group">
								<label class="col-md-1 control-label">工作流名称:</label>
								<div class="col-md-3">
									<input class="form-control" id="id-wf-name"  placeholder="请输入工作流名称" type="text">
								</div>
								
								<label class="col-md-1 control-label">工作流编码:</label>
								<div class="col-md-3">
									<input class="form-control" id="id-wf-code"  placeholder="请输入工作流编码" type="text">
								</div>
								<div class="col-md-4">
									<a id="bt-search" class="btn btn-primary btn-sm" href="javascript:void(0);" ><i class="fa fa-search"></i>&nbsp;搜&nbsp;索</a>
									<a id="bt-reset" class="btn btn-default btn-sm" href="javascript:void(0);" ><i class="fa fa-reply "></i>&nbsp;重&nbsp;置</a>
									
								</div>
							</div>
							
						</form>
					</div>
					<!-- 搜索条件end -->
					
					<!-- buttons begin -->
					<div class="alert alert-info alert-block group-bts">
						 
						<a id="bt-add" class="btn btn-success btn-sm" href="javascript:void(0);" ><i class="fa fa-plus"></i>&nbsp;新&nbsp;增</a>
						<a id="bt-edit" class="btn btn-success btn-sm" href="javascript:void(0);" ><i class="fa fa-edit"></i>&nbsp;编&nbsp;辑</a>
						
						<a id="bt-import" class="btn btn-success btn-sm" href="javascript:void(0);" ><i class="fa fa-edit"></i>流程导入</a>
						
						<a id="bt-export-xml" class="btn btn-info btn-sm" href="javascript:void(0);" ><i class="fa"></i>流程XML导出</a>
						<a id="bt-export-img" class="btn btn-info btn-sm" href="javascript:void(0);" ><i class="fa"></i>流程图片导出</a>
					</div>
					<!-- buttons end -->
					
					<!-- grid begin -->
					
						<div id="dv-plugins-wf-workflow"></div>
					
					<!-- grid end -->
				</div>
				<!-- end widget content -->
				
			</div>
			<!-- end widget div -->
			
		</div>
	</article>
	<!-- WIDGET END -->
</div>
	
<script type="text/javascript">
	
	
	$(function(){
		loadScript("${ctx}/static/modules/plugins/wf/workflow/manager.js",function(){
			$.plugins.wf.workflow.manager.init();
		});
	});
</script>
