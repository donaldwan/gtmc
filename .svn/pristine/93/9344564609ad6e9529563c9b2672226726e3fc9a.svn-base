/**
 * 工作流外部文件导入
 */
$.namespace('plugins.wf.workflow.xmlimport');

/**
 * 初始化页面
 */
$.plugins.wf.workflow.xmlimport.init = function(){
	$.plugins.wf.workflow.xmlimport.container = $('#plugin-wf-workflow-xml-import');
	
	$('#bt-file-choose',$.plugins.wf.workflow.xmlimport.container).click(function(){
		$('#id-file',$.plugins.wf.workflow.xmlimport.container).click();
	});
	
	$('#id-file',$.plugins.wf.workflow.xmlimport.container).change($.plugins.wf.workflow.xmlimport.fileChange);
};

$.plugins.wf.workflow.xmlimport.fileChange = function(){
	var file = $('#id-file',$.plugins.wf.workflow.xmlimport.container)[0];
	$('#id-file-name',$.plugins.wf.workflow.xmlimport.container).val(file.files[0].name);
};