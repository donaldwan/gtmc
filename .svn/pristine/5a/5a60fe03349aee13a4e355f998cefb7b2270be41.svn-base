<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div id="common-demo-import-data">
	<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="jarviswidget jarviswidget-color-lightblue" data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false">
			<header>
				<h2><strong>文件导入</strong> <i></i></h2>
			</header>
			<div class="widget-body">
				<div class="well">
					<form class="form-horizontal" id="form-search-system-role">
						<!-- 单个文件上传 -->
						<div class="form-group">
							<label class="col-md-1 control-label">数据文件选择:</label>
							<div class="col-md-5">
							  <input id="id-data-file-id" type="hidden"/><!-- 存放上传文件ID -->
							  <input id="id-error-path" type="hidden"/><!-- 存放错误文件相对路径 -->
                                <div class="input-group">
                                    <input type="file" id="id-data-file" style="display:none;">
                                    <input type="text" class="form-control" id="id-data-file-name"
                                           placeholder="请选择文件...">
                                    <div class="input-group-btn">
                                        <a id="id-data-file-choose" class="btn btn-info btn-sm"
                                           href="javascript:void(0);"><i class="fa"></i>文件选择...</a>
                                    </div>
                                </div>
							</div>
							<div class="col-md-5">
								<a id="bt-upfile" class="btn btn-primary btn-sm" href="javascript:void(0);" ><i class="fa fa-upload"></i>&nbsp;上&nbsp;传</a>
								&nbsp;
								<a id="bt-import" class="btn btn-primary btn-sm" href="javascript:void(0);" ><i class="fa fa-building"></i>&nbsp;解析数据</a>
								&nbsp;
                  <a id="bt-error" class="btn btn-primary btn-sm" href="javascript:void(0);" ><i class="fa fa-download"></i>&nbsp;错误信息下载</a>
							</div>
						</div>
						
						<div class="form-group">
                 <label class="col-md-1 control-label">解析文件返回数据:</label>
                 <div class="col-md-11">
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
		var container = $('#common-demo-import-data');

        //单个文件上传
        $('#id-data-file-choose', container).click(function () {
            $('#id-data-file', container).click();
        });
        //单个文件上传
        $('#id-data-file', container).change(function () {
            var file = $('#id-data-file', container)[0];
            $('#id-data-file-name', container).val(file.files[0].name);
        });
		//单个文件上传
		$('#bt-upfile',container).click(function(){
			$.upFile({
				file:$('#id-data-file',container),
				success:function(json){
                    if(json.resultCode == 1) {
                        $.toast('上传成功!');
                        $('#id-data-file-id', container).val(json.object[0].id);
                    } else {
                        $.toast('上传失败!');
                    }
				}
			});
		});
		
		//文件下载
		$('#bt-import',container).click(function(){
			$.ajax({
				url:'common/import/imort-data',
				data:{fileId:$('#id-data-file-id',container).val(),executor:'demoImportExecutor'},
				sync:true,
				success:function(json){
					$('#id-error-path',container).val(json.object.errorFile);
					$('#id-back-text',container).val(JSON.stringify(json));
				}
			});
		});
		//错误信息下载
		$('#bt-error',container).click(function(){
			window.open('common/attachment/download?path=' + $('#id-error-path',container).val());
		});
	});
</script>
