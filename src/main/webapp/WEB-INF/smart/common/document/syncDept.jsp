
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div id="common-dept-management">
	<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="jarviswidget jarviswidget-color-lightblue" data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false">
			<header>
				<h2><strong>组织结构同步</strong> <i></i></h2>
			</header>
			<div class="widget-body">
				<div class="well">
					
					<a id="bt-dept-reset" class="btn btn-default btn-sm" href="javascript:void(0);" ><i class="fa fa-reply "></i>&nbsp;同步部门信息</a>
					
					<a id="bt-user-reset" class="btn btn-default btn-sm" href="javascript:void(0);" ><i class="fa fa-reply "></i>&nbsp;同步用户信息</a>
					
				</div>
			</div>
		</div>
	</article>
</div>
	
<script type="text/javascript">
$(function(){
	var container = $('#common-dept-management');

	$('#bt-dept-reset',container).click(function(){
		$.ajax({
			url:'system/dept/syncDeptInfo',
			type:'post',
			sync:true,
			success:function(json){
				console.log("xiapx");
				
				console.log(json);
			}
		});
	});
	
	
	$('#bt-user-reset',container).click(function(){
		$.ajax({
			url:'system/user/syncUserInfo',
			type:'post',
			sync:true,
			success:function(json){
				console.log("xiapx");
				
				console.log(json);
			}
		});
	});
	
});
	
	
</script>
