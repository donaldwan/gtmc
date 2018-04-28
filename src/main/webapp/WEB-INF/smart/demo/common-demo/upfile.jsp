<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div id="common-demo-upfile">
	<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="jarviswidget jarviswidget-color-lightblue" data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false">
			<header>
				<h2><strong>文件上传例子</strong> <i></i></h2>
			</header>
			<div class="widget-body">
				<div class="well">
					<form class="form-horizontal" id="form-search-system-role">
						<!-- 单个文件上传 -->
						<div class="form-group">
							<label class="col-xs-12 col-sm-3 col-md-3 col-lg-2 control-label">单个文件上传:</label>
							<div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                <div class="input-group">
                                    <input type="file" id="id-one-file" style="display:none;">
                                    <input type="text" class="form-control" id="id-one-file-name"
                                           placeholder="请选择文件...">
                                    <div class="input-group-btn">
                                        <a id="id-one-file-choose" class="btn btn-info btn-sm"
                                           href="javascript:void(0);"><i class="fa"></i>文件选择...</a>
                                    </div>
                                </div>
							</div>
							<div class="col-xs-12 col-sm-3 col-md-3 col-lg-5">
								<a id="bt-one-file" class="btn btn-primary btn-sm" href="javascript:void(0);" ><i class="fa fa-upload"></i>&nbsp;上&nbsp;传</a>
							</div>
						</div>

						<!-- 一次上传多个文件 -->
						<div class="form-group">
							<label class="col-xs-12 col-sm-3 col-md-3 col-lg-2 control-label">多个文件上传:</label>
							<div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                <div class="input-group">
                                    <input type="file" multiple="multiple" id="id-mult-file" style="display:none;">
                                    <input type="text" class="form-control" id="id-mult-file-name"
                                           placeholder="请选择文件...">
                                    <div class="input-group-btn">
                                        <a id="id-mult-file-choose" class="btn btn-info btn-sm"
                                           href="javascript:void(0);"><i class="fa"></i>文件选择...</a>
                                    </div>
                                </div>
								<p>在选择文件时按住Ctrl键进行多个文件选择</p>
							</div>
							<div class="col-xs-12 col-sm-3 col-md-3 col-lg-5">
								<a id="bt-mult-file" class="btn btn-primary btn-sm" href="javascript:void(0);" ><i class="fa fa-upload"></i>&nbsp;上&nbsp;传</a>
							</div>
						</div>

						<!-- 限制文件类型 -->
						<div class="form-group">
							<label class="col-xs-12 col-sm-3 col-md-3 col-lg-2 control-label">限制文件类型:</label>
							<div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                                <div class="input-group">
                                    <input type="file" accept="image/gif,image/jpeg" id="id-type-file" style="display:none;">
                                    <input type="text" class="form-control" id="id-type-file-name"
                                           placeholder="请选择文件...">
                                    <div class="input-group-btn">
                                        <a id="id-type-file-choose" class="btn btn-info btn-sm"
                                           href="javascript:void(0);"><i class="fa"></i>文件选择...</a>
                                    </div>
                                </div>
								<p>以仅上传gif/jpg为例子</p>
							</div>
							<div class="col-xs-12 col-sm-3 col-md-3 col-lg-5">
								<a id="bt-type-file" class="btn btn-primary btn-sm" href="javascript:void(0);" ><i class="fa fa-upload"></i>&nbsp;上&nbsp;传</a>
							</div>
						</div>

						<!-- 文件下载 -->
						<div class="form-group">
                 <label class="col-xs-12 col-sm-3 col-md-3 col-lg-2 control-label">文件下载例子:</label>
                 <div class="col-xs-12 col-sm-6 col-md-6 col-lg-5">
                     <input id="id-file-id" class="form-control" type="text" >
                     <p>请输入文件上传后在文件表的id</p>
                 </div>
                 <div class="col-xs-12 col-sm-3 col-md-3 col-lg-5">
                     <a id="bt-download-file" class="btn btn-primary btn-sm" href="javascript:void(0);" ><i class="fa fa-download"></i>&nbsp;下&nbsp;载</a>
                 </div>
             </div>

						<div class="form-group">
							<label class="col-xs-12 col-sm-3 col-md-3 col-lg-2 control-label">上传后回传参数:</label>
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
		var container = $('#common-demo-upfile');

        //单个文件上传
        $('#id-one-file-choose', container).click(function () {
            $('#id-one-file', container).click();
        });
        //单个文件上传
        $('#id-one-file', container).change(function () {
            var file = $('#id-one-file', container)[0];
            $('#id-one-file-name', container).val(file.files[0].name);
        });
		//单个文件上传
		$('#bt-one-file',container).click(function(){
			$.upFile({
				file:$('#id-one-file',container),
				success:function(json){
					$('#id-back-text',container).val(JSON.stringify(json));
				}
			});
		});

        //多个文件上传
        $('#id-mult-file-choose', container).click(function () {
            $('#id-mult-file', container).click();
        });
        //多个文件上传
        $('#id-mult-file', container).change(function () {
            var file = $('#id-mult-file', container)[0];
            var n = '';
            for (var i=0; i< file.files.length;i++) {
                n += file.files[i].name;
                n += ',';
            }
            n = n.substring(0, n.length - 1);
            $('#id-mult-file-name', container).val(n);
        });
		//多个文件上传
		$('#bt-mult-file',container).click(function(){
			$.upFile({
				file:$('#id-mult-file',container),
				success:function(json){
					$('#id-back-text',container).val(JSON.stringify(json));
				}
			});
		});

        //限制上传文件类型
        $('#id-type-file-choose', container).click(function () {
            $('#id-type-file', container).click();
        });
        //限制上传文件类型
        $('#id-type-file', container).change(function () {
            var file = $('#id-type-file', container)[0];
            $('#id-type-file-name', container).val(file.files[0].name);
        });
		//限制上传文件类型
		$('#bt-type-file',container).click(function(){
			$.upFile({
				file:$('#id-type-file',container),
				success:function(json){
					$('#id-back-text',container).val(JSON.stringify(json));
				}
			});
		});

		//文件下载
		$('#bt-download-file',container).click(function(){
			var id = $.trim($('#id-file-id',container).val());
			if(id == ''){
				$.alert('请输入文件id');
				return;
			}
			window.open('common/attachment/download/' + id);
		});
	});
</script>
