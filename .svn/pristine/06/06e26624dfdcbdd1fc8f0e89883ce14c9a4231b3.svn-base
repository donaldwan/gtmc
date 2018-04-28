<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<div class="col-sm-12 col-md-12 col-lg-12 no-padding">
	<article class="col-sm-12 col-md-12 col-lg-12">
		<div class="jarviswidget jarviswidget-color-lightblue" id="wid-id-system-user-property-manager" data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false">
			<header>
				<h2><strong>用户属性扩展管理</strong></h2>
			</header>
			<div class="widget-body">
				<div class="well">
					<form class="form-horizontal" id="id-form-manager-user-property">
					<div class="row">
						<div class="form-group">
							<label for="id-user-propertyCode" class="col-lg-1 col-md-1 hidden-sm hidden-xs control-label form-label">属性编码:</label>
							<div class="col-lg-2 col-md-2 col-sm-2">
								<input class="form-control" type="text" id="id-user-propertyCode" placeholder="请输入属性编码..."
									name="propertyCode" />
							</div>

							<label for="id-user-propertyName" class="col-lg-1 col-md-1 hidden-sm hidden-xs control-label form-label">属性名称:</label>
							<div class="col-lg-2 col-md-2 col-sm-2">
								<input class="form-control" type="text" id="id-user-propertyName" placeholder="请输入属性名称..."
									name="propertyName" />
							</div>

							<label for="id-status" class="col-lg-1 col-md-1 hidden-sm hidden-xs control-label form-label">状态:</label>
							<div class="col-lg-2 col-md-2 col-sm-2">
								<select class="form-control" name="status" id="id-status">
									<option value="">全选</option>
									<option value="A">有效</option>
									<option value="D">无效</option>
								</select>
							</div>

							<div class="col-lg-3 col-md-3 col-sm-3">
								<a class="btn btn-primary btn-sm" id='bt-search' onclick="$.system.user.property.manager.search();"><i class="fa fa-search"></i>&nbsp;搜&nbsp;索</a>
								<a class="btn btn-default btn-sm" id='bt-reset' onclick="document.getElementById('id-form-manager-user-property').reset();"><i class="fa fa-reply"></i>&nbsp;重&nbsp;置</a>
							</div>
						</div>
						</div>
					</form>
				</div>

				<div class="alert alert-info alert-block group-bts" style="padding:5px;">
					<a onclick="$.system.user.property.manager.edit('A');" id='bt-add' class="btn btn-success btn-sm" href="javascript:void(0);" ><i class="fa fa-plus"></i>&nbsp;新&nbsp;增</a>
					<a onclick="$.system.user.property.manager.edit('E');" id='bt-edit' class="btn btn-success btn-sm" href="javascript:void(0);" ><i class="fa fa-edit"></i>&nbsp;编&nbsp;辑</a>
					<a id="bt-change-user-property-status" id='bt-change-status' class="btn btn-warning btn-sm" href="javascript:void(0);" ><i class="fa fa-exchange"></i>&nbsp;状态调整</a>
				</div>
				<div id="id-div-grid-table-user-property"></div>
			</div>
		</div>
	</article>
</div>
<script type="text/javascript">
	loadScript("${ctx}/static/modules/system/user/property/manager.js",function(){
		$.system.user.property.manager.init();
	});
</script>











