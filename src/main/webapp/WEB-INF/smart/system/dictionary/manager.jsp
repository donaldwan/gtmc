<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/taglibs.jsp"%>
<div class="col-sm-12 col-md-12 col-lg-12 no-padding">
	<article class="col-sm-12 col-md-12 col-lg-12">
		<div class="jarviswidget jarviswidget-color-lightblue" id="wid-id-system-dictionary-manager" data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false">
			<header>
				<h2><strong>字典</strong></h2>
			</header>
			<div class="widget-body">
				<div class="well">
					<form class="form-horizontal" id="id-form-manager-dictionary">
						<div class="form-group">
							<label for="id-dictionaryName" class="col-lg-1 col-md-3 hidden-sm hidden-xs control-label form-label">字典名称:</label>
							<div class="col-lg-3 col-md-5 col-sm-5">
							<input class="form-control" type="text" id="id-dictionaryName" placeholder="请输入字典名称..."
								name="dictionaryName" />
								</div>
							<div class="col-lg-3 col-md-3 col-sm-3">
								<a class="btn btn-primary btn-sm" id='bt-search'  onclick="$.system.dictionary.manager.search();"><i class="fa fa-search"></i>&nbsp;搜&nbsp;索</a>
								<a class="btn btn-default btn-sm" id='bt-reset' onclick="document.getElementById('id-form-manager-dictionary').reset();"><i class="fa fa-reply"></i>&nbsp;重&nbsp;置</a>
							</div>
						</div>
					</form>
				</div>

				<div class="alert alert-info alert-block group-bts" style="padding:5px;" id='alert-dictionary'>
					<a onclick="$.system.dictionary.manager.edit('A');" class="btn btn-success btn-sm" href="javascript:void(0);" ><i class="fa fa-plus"></i>&nbsp;新&nbsp;增</a>
					<a onclick="$.system.dictionary.manager.edit('E');" class="btn btn-success btn-sm" href="javascript:void(0);" ><i class="fa fa-edit"></i>&nbsp;编&nbsp;辑</a>
					<a onclick="$.system.dictionary.manager.del();" class="btn btn-danger btn-sm" href="javascript:void(0);" ><i class="fa fa-times"></i>&nbsp;删&nbsp;除</a>
				</div>
				<div id="id-div-grid-table-dictionary"></div>
			</div>
		</div>
	</article>
</div>
<script type="text/javascript">
	loadScript("${ctx}/static/modules/system/dictionary/manager.js",function(){
		$.system.dictionary.manager.init();
	});
</script>










