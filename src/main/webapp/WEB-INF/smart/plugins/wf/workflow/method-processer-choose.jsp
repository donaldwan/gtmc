<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<jsp:include page="/common/taglibs.jsp" />
<div class="row col-sm-12" >
<div class="col-sm-12">
<section class="winWidget">						
	<div class="row">					
		<article class="col-sm-12 col-md-12 col-lg-12">				
			<div id="wid-id-plugins-wf-processer-choose"  			
				data-widget-custombutton="true">		
				<div class="widget-body">		
					<!--业务代码begin-->
					<form class="form-horizontal" id="id-method-processer-choose" style="margin-top:50px">
					<div class="form-group">
						<label class="col-md-3 control-label">处理人员类型:</label>
						<div class="col-md-9">
							<label class="radio radio-inline">
								<input type="radio" class="radiobox" name="processerType" value="USER" checked>
								<span>用户</span> 
							</label>
							<label class="radio radio-inline">
								<input type="radio" class="radiobox" name="processerType" value="GROUP">
								<span>用户组</span>  
							</label>
						</div>
					</div>
							
					<div class="form-group">
						<label class="col-md-3 control-label">自定义方法BeanId:</label>
						<div class="col-md-9">
							<input class="form-control" placeholder="自定义方法BeanId" name="processerId" type="text">
						</div>
					</div> 	
							
					<div class="form-group">
						<label class="col-md-3 control-label">处理人员名称:</label>
						<div class="col-md-9">
							<input class="form-control" placeholder="请输入处理人员名称" name="processerName"  type="text">
						</div>
					</div> 	
					</form>
					<!--业务代码end-->	
				</div>		
			</div>			
		</article>				
	</div>					
</section>	
</div>
</div>					
