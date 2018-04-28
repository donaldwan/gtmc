<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div id="demo-wftest-manager">
	
	<!-- NEW WIDGET START -->
	<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

		<div class="jarviswidget jarviswidget-color-lightblue" data-widget-editbutton="false" 
			data-widget-togglebutton="false" data-widget-deletebutton="false">
			
			<header>
				<h2><strong>测试数据</strong> <i></i></h2>
			</header>

			<!-- widget div-->
			<div>
				<!-- widget content -->
				<div class="widget-body ">
					<!-- 搜索条件begin -->
					<div class="well">
						<form class="form-horizontal" id="form-search-demo-leave">
							
						</form>
					</div>
					<!-- 搜索条件end -->
					
					<!-- buttons begin -->
					<div class="alert alert-info alert-block group-bts">
						<a id="bt-add" class="btn btn-success btn-sm" href="javascript:void(0);" ><i class="fa fa-plus"></i>&nbsp;新&nbsp;增</a>
						<a id="bt-edit" class="btn btn-success btn-sm" href="javascript:void(0);" ><i class="fa fa-edit"></i>&nbsp;编&nbsp;辑</a>
						<a id="bt-mytask" class="btn btn-success btn-sm" href="javascript:void(0);" ><i class="fa fa-edit"></i>我的任务</a>
						<a id="bt-detail" class="btn btn-info btn-sm" href="javascript:void(0);" ><i class="fa fa-file-text"></i>&nbsp;明&nbsp;细</a>
						<a id="bt-delete" class="btn btn-danger btn-sm" href="javascript:void(0);" ><i class="fa fa-times"></i>&nbsp;删&nbsp;除</a>
						
					</div>
					<!-- buttons end -->
					
					<!-- grid begin -->
					<div id="grid-demo-wftest"></div>
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
		loadScript("${ctx}/static/modules/demo/wftest/manager.js",function(){
			$.demo.wftest.init();
		});	
	});
</script>