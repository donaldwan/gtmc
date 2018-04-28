<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div class="row" id="demo-leave-my-task">
	
	<!-- NEW WIDGET START -->
	<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

		<div class="jarviswidget jarviswidget-color-lightblue" data-widget-editbutton="false" 
			data-widget-togglebutton="false" data-widget-deletebutton="false" data-widget-fullscreenbutton="false">
			
			<header>
				<h2><strong>我的代办任务</strong> <i></i></h2>
			</header>

			<!-- widget div-->
			<div>
				<!-- widget content -->
				<div class="widget-body ">
					<!-- 搜索条件begin -->
					<div class="well">
						<form class="form-horizontal" id="form-search-my-task-demo-leave">
							<div class="form-group">
								<label class="col-md-1 control-label">请假时间:</label>
								<div class="col-md-3">
									<input class="form-control" name="resourceName" placeholder="请假时间..." type="text">
								</div>
								
								<label class="col-md-1 control-label">结束时间:</label>
								<div class="col-md-3">
									<input class="form-control" name="uri" placeholder="结束时间..." type="text">
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
						
						<a id="bt-complete" class="btn btn-success btn-sm" href="javascript:void(0);" ><i class="fa fa-edit"></i>&nbsp;处&nbsp;理</a>
						
					</div>
					<!-- buttons end -->
					
					<!-- grid begin -->
					<div id="grid-my-task-leave-demo"></div>
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
		loadScript("${ctx}/static/modules/demo/leave/my-task.js",function(){
			$.demo.leave.mytask.init();
		});	
	});
</script>
