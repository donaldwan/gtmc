<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div id="common-demo-websocket">
	<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="jarviswidget jarviswidget-color-lightblue" data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false">
			<header>
				<h2><strong>WebSocket例子</strong> <i></i></h2>
			</header>
			<div class="widget-body">
				<div class="well">
					<form class="form-horizontal" id="form-search-system-role">
						<div class="form-group">
							<label class="col-xs-12 col-sm-3 col-md-3 col-lg-2 control-label"></label>
							<div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
								<a id="bt-connect" class="btn btn-primary btn-sm" href="javascript:void(0);">连接</a>
								&nbsp;&nbsp;
								<a id="bt-disconnect" class="btn btn-primary btn-sm" href="javascript:void(0);">断开</a>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-xs-12 col-sm-3 col-md-3 col-lg-2 control-label">消息内容：</label>
							<div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
								<input class="form-control" placeholder="请输入消息内容..." type="text" id="id-text"/>
							</div>
							<div class="col-md-3 col-lg-5">
								<a id="bt-send" class="btn btn-primary btn-sm" href="javascript:void(0);">发送</a>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-xs-12 col-sm-3 col-md-3 col-lg-2 control-label">响应消息：</label>
							<div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
								<textarea rows="5" class="form-control" style="width:100%" id="id-back-text"></textarea>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</article>		
</div>	
<script type="text/javascript">
	$(function(){
		//向websocket注册各种响应事件
		$.websocket.regsiter({
			code:'test',
			onopen:function(e){
				console.log('ononpen...连接了哦');
			},
			onclose:function(e){
				console.log('onclose...');
			},
			onmessage:function(e){
				console.log('onmessage...');
				var data = JSON.parse(e.data);
				//判断是否属于本业务
				if(data.code == 'test'){
					var text = $('#id-back-text',$('#common-demo-websocket'));
					if(text.val() == ''){
						text.val(data.data);
					}else{
						text.val(text.val() + '\n' + data.data);
					}
				}
			},
			onerror:function(e){
				console.log('onerror...');
			}
		});
		
		//连接
		$('#bt-connect',$('#common-demo-websocket')).click(function(){
			$.websocket.init({success:function(){
				console.log('connected');
			}});
		});
		
		//断开
		$('#bt-disconnect',$('#common-demo-websocket')).click(function(){
			$.websocket.disconnect();
		});
		
		//发送消息
		$('#bt-send',$('#common-demo-websocket')).click(function(){
			$.websocket.send('test',$('#id-text',$('#common-demo-websocket')).val());
		});
	});
</script>
