<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div id="common-demo-sendMessage">
	<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="jarviswidget jarviswidget-color-lightblue" data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false">
			<header>
				<h2><strong>短信发送Demo</strong> <i></i></h2>
			</header>
			<div class="widget-body">
				<div class="well">
					<form class="form-horizontal" id="common-demo-sendMessage-send">
						
						<div class="form-group">
							<label class="col-md-1 control-label">手机号码</label>
							<div class="col-md-5">
							  <input class = "form-control" name= "mobileNo" type="text"/>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-md-1 control-label">短信内容</label>
			                <div class="col-md-11">
			                     <textarea name = "content" rows="5" class="form-control" style="width:100%"></textarea>
			                </div>
						</div>
						
						<div class="form-group">
							<a id="bt-sendMessage" class="btn btn-primary btn-sm" href="javascript:void(0);" ><i class="fa fa-upload"></i>&nbsp;发送信息</a>
						</div>
						
					</form>
				</div>
			</div>
		</div>
	</article>
						
</div>
	
<script type="text/javascript">
	$(function(){
		var container = $('#common-demo-sendMessage');
		//发送短信
		 $('#bt-sendMessage',container).click(function(){
				$.ajax({
					url:'common/sendMessage/send',
					data:$('#common-demo-sendMessage-send').serialize(),
					type:'post',
					sync:false,
					success:function(json){
						if(json.resultCode == 1){
							$.toast('短信发送成功!');
						}else{
							$.toast('短信发送失败!');
						}
					}
				});
			});
	});
</script>
