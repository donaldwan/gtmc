<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<jsp:include page="/common/taglibs.jsp" />
<div class="col-sm-12 col-md-12 col-lg-12 no-padding" id="div-id-plugins-wf-proxy">
	<article class="col-sm-6 col-md-6 col-lg-6">
		<div class="jarviswidget jarviswidget-color-lightblue" id="wid-id-plugins-wf-proxy-manager"  data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false">
			<header>
				<h2><strong>工作流</strong></h2>
			</header>
			
			<div class="widget-body">
				
				<div class="well">
					<form class="form-horizontal" id="id-form-search">
						<div class="form-group" style="margin-left:5px;">
							<div class="col-md-4">
								<input class="form-control" id="id-wf-name" placeholder="请输入工作流名称..." type="text">
							</div>
							
							<div class="col-md-4">
								<input class="form-control" id="id-wf-code" placeholder="请输入工作流编码..." type="text">
							</div>
							<div class="col-md-4">
								<a class="btn btn-primary btn-sm" href="javascript:void(0);" id='bt-search' onclick="$.plugins.wf.proxy.manager.search();"><i class="fa fa-search"></i>&nbsp;搜&nbsp;索</a>
								<a class="btn btn-default btn-sm" id='bt-reset' onclick="document.getElementById('id-form-search').reset();"><i class="fa fa-reply"></i>&nbsp;重&nbsp;置</a>
							</div>
						</div>
					</form>
				</div>
				
				<div id="dv-plugins-wf-proxy" class="grid"  style="margin-top:5px;"></div>
				
			</div>
		</div>
	</article>
	<article class="col-sm-6 col-md-6 col-lg-6">
		<div class="jarviswidget jarviswidget-color-lightblue" id="wid-id-plugins-wf-proxy-add"  data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false">
			<header>
				<h2><strong>工作流代理设定</strong></h2>
			</header>
			
			<div class="widget-body">
				<div class="well">
					<form class="form-horizontal smart-form" id="id-form-search2" style="padding-left:30px;">
						<div class="row">
								<div class="form-group">
									<label class="col-md-2 control-label">代理人:</label>
									<section class="col col-8">
										<div class="input-group">
											<input style="cursor:pointer;" onclick="$.plugins.wf.proxy.manager.openProcesserWin();" class="form-control" name="proxyUserName" id="id-user-name" placeholder="   请选择代理人..." readonly type="text">
											<span  style="cursor:pointer;" onclick="$.plugins.wf.proxy.manager.openProcesserWin();" class="input-group-addon"><i class="fa fa-search-plus"></i></span>
										</div>
									</section>
								</div>
						</div>
						<div class="row">
							<div class="form-group">
								<label class="col-md-2 control-label">开始日期:</label>
								<section class="col col-5">
									<label class="input"> <i class="icon-append fa fa-calendar"></i>
										<input type="text" name="startDate" id="id-start-date" onFocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:new Date()})" placeholder="请选择代理开始日期..." />
									</label>
								</section>
							</div>
							<div class="form-group">
								<label class="col-md-2 control-label">结束日期:</label>
								<section class="col col-5">
									<label class="input"> <i class="icon-append fa fa-calendar"></i>
										<input type="text" name="endDate" id="id-end-date"  onFocus="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:new Date()})" placeholder="请选择代理结束日期..." />
									</label>
								</section>
								
								<span class="col col-md-3 grid-btn">
									<a class="btn btn-default btn-sm" href="javascript:void(0);" onclick="$.plugins.wf.proxy.manager.saveProxy();"><i class="fa fa-plus"></i>&nbsp;添加代理人</a>
								</span>
							</div>
						</div>
					</form>
				</div>
				
				<div class="alert alert-info alert-block group-bts" style="padding:5px;">
					<a onclick="javascript:$.plugins.wf.proxy.manager.del();" id='bt-delete' class="btn btn-danger btn-sm" href="javascript:void(0);" ><i class="fa fa-times"></i>&nbsp;删&nbsp;除</a>
				</div>
				
				<div id="dv-plugins-wf-add" class="grid"></div>
			</div>
		</div>
	</article>
</div>
<script type="text/javascript">
	loadScript("${ctx}/static/modules/plugins/wf/proxy/manager.js",function(){
		$.plugins.wf.proxy.manager.init();
	});
</script>

