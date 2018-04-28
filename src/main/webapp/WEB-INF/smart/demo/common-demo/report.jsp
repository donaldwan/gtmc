<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div id="common-demo-report">
	<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="jarviswidget jarviswidget-color-lightblue" data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false">
			<header>
				<h2><strong>PDF报表导出例子</strong> <i></i></h2>
			</header>
			<div class="widget-body">
				<div class="well">
					<form class="form-horizontal" id="form-search-system-role">
						<!-- 报表模板文件选择 -->
						<div class="form-group">
							<label class="col-md-2 control-label">Jasper报表模板文件:</label>
							<div class="col-md-5">
                                <div class="input-group">
                                    <input type="file" id="id-file-jasper" style="display:none;">
                                    <input type="text" class="form-control" id="id-file-jasper-name"
                                           placeholder="请选择文件...">
                                    <div class="input-group-btn">
                                        <a id="id-file-jasper-choose" class="btn btn-info btn-sm"
                                           href="javascript:void(0);"><i class="fa"></i>文件选择...</a>
                                    </div>
                                </div>
							</div>
							<div class="col-md-5">
								<a id="bt-jasper" class="btn btn-primary btn-sm" href="javascript:void(0);" ><i class="fa fa-upload"></i>上传并导出PDF</a>
								<a id="bt-jasper-execl" class="btn btn-primary btn-sm" href="javascript:void(0);" ><i class="fa fa-upload"></i>上传并导出execl</a>
								<a target="_black" href="static/demo/mysql/report2.jasper">jasperDemo文件下载</a>
							</div>
						</div>
						
						<!-- 一次上传多个文件 -->
						<div class="form-group">
							<label class="col-md-2 control-label">Jrxml报表模板文件:</label>
							<div class="col-md-5">
                                <div class="input-group">
                                    <input type="file" id="id-file-jrxml" style="display:none;">
                                    <input type="text" class="form-control" id="id-file-jrxml-name"
                                           placeholder="请选择文件...">
                                    <div class="input-group-btn">
                                        <a id="id-file-jrxml-choose" class="btn btn-info btn-sm"
                                           href="javascript:void(0);"><i class="fa"></i>文件选择...</a>
                                    </div>
                                </div>
							</div>
							<div class="col-md-5">
								<a id="bt-jrxml" class="btn btn-primary btn-sm" href="javascript:void(0);" ><i class="fa fa-upload"></i>上传并导出PDF</a>
								<a id="bt-jrxml-execl" class="btn btn-primary btn-sm" href="javascript:void(0);" ><i class="fa fa-upload"></i>上传并导出EXECL</a>
								<a target="_black" href="static/demo/mysql/report2.jrxml">jrxmlDemo文件下载</a>
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
		var container = $('#common-demo-report');

        //单个文件上传
        $('#id-file-jasper-choose', container).click(function () {
            $('#id-file-jasper', container).click();
        });
        //单个文件上传
        $('#id-file-jasper', container).change(function () {
            var file = $('#id-file-jasper', container)[0];
            $('#id-file-jasper-name', container).val(file.files[0].name);
        });
		//jasper文件
		$('#bt-jasper',container).click(function(){
			$.upFile({
				file:$('#id-file-jasper',container),
				success:function(json){
					var fileId = json.object[0]['id'];
					window.open('demo/common-demo/export-jasper-pdf?fileId=' + fileId);					
				}
			});
		});
		//jasper文件excel  bt-jasper-execl
		$('#bt-jasper-execl',container).click(function(){
			$.upFile({
				file:$('#id-file-jasper',container),
				success:function(json){
					var fileId = json.object[0]['id'];
					location.href = 'demo/common-demo/export-jasper-execl?fileId=' + fileId;
				}
			});
		});

        //单个文件上传
        $('#id-file-jrxml-choose', container).click(function () {
            $('#id-file-jrxml', container).click();
        });
        //单个文件上传
        $('#id-file-jrxml', container).change(function () {
            var file = $('#id-file-jrxml', container)[0];
            $('#id-file-jrxml-name', container).val(file.files[0].name);
        });
		//jrxml文件
		$('#bt-jrxml',container).click(function(){
			$.upFile({
				file:$('#id-file-jrxml',container),
				success:function(json){
					var fileId = json.object[0]['id'];
					window.open('demo/common-demo/export-jrxml-pdf?fileId=' + fileId);
				}
			});
		});
		
		
		//jrxml文件导出execl
		$('#bt-jrxml-execl',container).click(function(){
			$.upFile({
				file:$('#id-file-jrxml',container),
				success:function(json){
					var fileId = json.object[0]['id'];
					location.href ='demo/common-demo/export-jrxml-execl?fileId=' + fileId;
				}
			});
		});
		
	});
</script>
