/**
 * 工作流设定列表查询
 * 陈万东
 * chenwandong@intasect.com.cn
 * 2016-05-02
 */

//命名空间，避免js名称冲突
$.namespace('plugins.wf.workflow.manager');

/**
 * 初始化页面
 */
$.plugins.wf.workflow.manager.init = function(o){
	$.plugins.wf.workflow.manager.initGrid(o);
	$.plugins.wf.workflow.manager.container = $('#plugin-wf-workflow-manager');
	
	$('#bt-add',$.plugins.wf.workflow.manager.container).click(function(){
		$.plugins.wf.workflow.manager.openEditWin();
	});
	
	$('#bt-edit',$.plugins.wf.workflow.manager.container).click(function(){
		var ids = $("#" + $.plugins.wf.workflow.manager.gridId).jqGrid('getGridParam','selarrrow');
		if(ids.length !=1){
			$.toast('请选择一行数据!');
			return;
		}
		$.plugins.wf.workflow.manager.openEditWin(ids[0]);
	});

	//流程定义xml导出
	$('#bt-export-xml',$.plugins.wf.workflow.manager.container).click(function(){
		$.plugins.wf.workflow.manager.expXML();
	});
	
	//图片导出
	$('#bt-export-img',$.plugins.wf.workflow.manager.container).click(function(){
		$.plugins.wf.workflow.manager.expPNG();
	});
	
	//流程导入
	$('#bt-import',$.plugins.wf.workflow.manager.container).click(function(){
		$.plugins.wf.workflow.manager.openImportWin();
	});
	
	//搜索
	$('#bt-search',$.plugins.wf.workflow.manager.container).click(function(){
		$.plugins.wf.workflow.manager.search();
	});
	
	//重置
	$('#bt-reset',$.plugins.wf.workflow.manager.container).click(function(){
		$('#form-search-plugin-wf-manager',$.plugins.wf.workflow.manager.container)[0].reset();
	});
};

/**
 * 初始化grid组件
 */
$.plugins.wf.workflow.manager.initGrid = function(o){
	$.plugins.wf.workflow.manager.gridId = 
		$.grid({
			container:$('#dv-plugins-wf-workflow'),
			url:'plugins/wf/workflow/find-page',
			colNames:['ID','工作流名称','工作流编码','流程定义ID','模型ID','状态','当前版本','起始表单','通用回退URL'],
			colModel : [
				{name:'id',index:'id',hidden:true},
				{name:'wfName',index:'wfName',width:100},
				{name:'actProcdefKey',index:'actProcdefKey'},
				{name:'actProcdefId',index:'actProcdefId'},
				{name:'actModelId',index:'actModelId'},
				{name:'status',index:'status',width:50,formatter:function(value,a,row,d){
					switch(value){
						case "A": return "有效";
						case "D": return "无效";
					}
					return "未知";
				}},
				{name:'currentVersion',index:'currentVersion',width:80},
				{name:'startForm',index:'startForm'},
				{name:'backUrl',index:'globalForm'}
			]
		});
};

$.plugins.wf.workflow.manager.getOperate = function(o){
	
}

/**
 * 列表搜索
 */
$.plugins.wf.workflow.manager.search=function(){
	var postData = $('#' + $.plugins.wf.workflow.manager.gridId,$.plugins.wf.workflow.manager.container).jqGrid("getGridParam", "postData");
	var wfName = $('#id-wf-name',$.plugins.wf.workflow.manager.container).val();
	var wfKey = $('#id-wf-code',$.plugins.wf.workflow.manager.container).val();
  $.extend(postData, { wfName:wfName ,actProcdefKey: wfKey});
	$('#' + $.plugins.wf.workflow.manager.gridId,$.plugins.wf.workflow.manager.container).jqGrid("setGridParam", { search: true }).trigger("reloadGrid", [{ page: 1}]);
};

/**
 * 打开流程编辑窗口
 */
$.plugins.wf.workflow.manager.openEditWin = function(id){
	$.plugins.wf.workflow.manager.editWinId = 
		$.dialog({
				url:'plugins/wf/workflow/edit?id=' + id,
				title:'流程编辑',
				width:$(window).width() * 0.9,
				height:$(window).height() * 0.9,
				modal:true
			});
};

/**
 * 跳转套编辑页面
 * @param:id,被修改数据的唯一id
 */
$.plugins.wf.workflow.manager.edit=function(id){
	loadUrl({
		url:'plugins/wf/workflow/edit?id='+id,
		title:'流程设计'
	});
};

/**
 * 打开流程设计器窗口
 */
$.plugins.wf.workflow.manager.openDesignWindow = function(modelId,name){
	loadUrl({
		url:'${ctx}/modeler.html?modelId=' + modelId,
		title:'流程设计' + name,
		type:'I'
	});
};

/**
* 导出流程定义XML文件
*/
$.plugins.wf.workflow.manager.expXML = function(){
	var ids=$("#" + $.plugins.wf.workflow.manager.gridId).jqGrid("getGridParam","selarrrow");
	if(ids.length ==1){
		var rowData = $("#" + $.plugins.wf.workflow.manager.gridId).jqGrid('getRowData',ids[0]);
		if(rowData.actProcdefId != ''){
			window.open('plugins/wf/definition/exp-xml?id=' + rowData.actProcdefId);
		}else{
			$.toast('选择的流程还未进行流程发布');
		}
	}else{
		$.toast('请选择一条流程');
	}
};

/**
* 导出流程定义图片文件
*/
$.plugins.wf.workflow.manager.expPNG = function(){
	var ids=$("#" + $.plugins.wf.workflow.manager.gridId).jqGrid("getGridParam","selarrrow");
	if(ids.length ==1){
		var rowData = $("#" + $.plugins.wf.workflow.manager.gridId).jqGrid('getRowData',ids[0]);
		if(rowData.actProcdefId != ''){
			window.open('plugins/wf/definition/create-process-diagram?processDefinitionId=' + rowData.actProcdefId);
		}else{
			$.toast('选择的流程还未进行流程发布');
		}
	}else{
		$.toast('请选择一条流程');
	}
};

/**
 * 流程导入
 */
$.plugins.wf.workflow.manager.openImportWin = function(){
	var buttons = [{text:'保存',class:'btn btn-primary btn-sm',click:function(){
			 $.plugins.wf.workflow.manager.xmlImport();
	   }},
	   {text:'取消',class:'btn btn-default btn-sm',click:function(){
		   $('#' + $.plugins.wf.workflow.manager.importWinId).dialog('close');
	   }}];
	$.plugins.wf.workflow.manager.importWinId = $.dialog({
		url:'plugins/wf/workflow/xml-import',
		modal:true,
		title:'流程导入',
		width:800,
		height:400,
		buttons:buttons
	});
};

/**
 * 外部流程定义文件导入
 */
$.plugins.wf.workflow.manager.xmlImport = function(){
	var file = $('#id-file',$('#' + $.plugins.wf.workflow.manager.importWinId))[0];
	if(file.files.length == 0){
		$.toast('请选择文件!');
		return false;
	}
	var formData = new FormData();
	formData.append('file',file.files[0]);
	$.ajax({
		sync:true,
		type:'post',
		url:'plugins/wf/workflow/xml-import',
		data:formData,
		processData:false,
		contentType:false,
		success:function(json){
			if(json.resultCode == 1){
				$.toast("导入成功！");
				$('#' + $.plugins.wf.workflow.manager.importWinId).dialog('close');
				$('#' + $.plugins.wf.workflow.manager.gridId).trigger('reloadGrid');
			 }else{
				 $.toast(json['message']);
			 }
		}
	});
};