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
					<form class="form-horizontal" id="id-wf-processer-choose-user">	
					 <div class="col-md-10" style="margin-left: 50px;margin-top:50px" >
						<div class="checkbox">
							<label>
							  <input type="checkbox" class="checkbox style-0" lang="process_type" name="APPLY_USER" value="流程启动人员">
							  <span>流程启动人员</span>
							</label>
						</div>
						<br>

						<div class="checkbox">
							<label>
							  <input type="checkbox" class="checkbox style-0" lang="process_type"  name="PREV_USER" value="上一个节点处理人员">
							  <span>上一个节点处理人员</span>
							</label>
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
