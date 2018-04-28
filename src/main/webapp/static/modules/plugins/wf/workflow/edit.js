/**
 * 工作流设定页面
 * 陈万东
 * chenwandong@intasect.com.cn
 * 2016-05-02
 */
$.namespace('plugins.wf.workflow.edit');

/**
 * 初始化页面
 * pid:流程定义id
 * container:需要展现流程图的容器
 * wfId:流程扩展表id
 */
$.plugins.wf.workflow.edit.init = function(o){
	
	$.plugins.wf.workflow.edit.container = $('#plugin-wf-workflow-edit');
	
	$('#bt-wf-design',$.plugins.wf.workflow.edit.container).addClass('disabled');
	$('#bt-wf-deploy',$.plugins.wf.workflow.edit.container).addClass('disabled');
	
	if(o.pid != ''){
		$.plugins.wf.workflow.edit.drawDiagram(o.pid,o.container);
	}
	
	if(o.wfId != ''){
		$('#bt-wf-design',$.plugins.wf.workflow.edit.container).removeClass('disabled');
		$('#bt-wf-deploy',$.plugins.wf.workflow.edit.container).removeClass('disabled');
	}
	
	$.plugins.wf.workflow.edit.initFormValidator();
};

$.plugins.wf.workflow.edit.initFormValidator = function(){
	var validator = $("#id-form-plugins-wf-workflow-edit",$.plugins.wf.workflow.edit.container).validate({
		rules : {
			wfName : {
				required : true,
				minlength:2,
				maxlength:20
			},
			actProcdefKey : {
				required : true,
				minlength:2,
				maxlength:62
			},
			startForm : {
				required :true,
				minlength:2,
				maxlength:100
			},
			startUrl : {
				required :true,
				minlength:2,
				maxlength:100
			},
			commonForm : {
				required :true,
				minlength:2,
				maxlength:100
			},
			commonUrl : {
				required :true,
				minlength:2,
				maxlength:100
			},
			detailUrl : {
				required :true,
				minlength:2,
				maxlength:100
			},
			backUrl : {
				required :true,
				minlength:2,
				maxlength:100
			},
			businessTable:{
				required:true,
				minlength:5,
				maxlength:200
			}
		},
		submitHandler:function(form){
			$.plugins.wf.workflow.edit.save();
		}
	});
};

/**
 * 对工作流进行编辑保存
 */
$.plugins.wf.workflow.edit.save = function(){
	var form = $("#id-form-plugins-wf-workflow-edit",$.plugins.wf.workflow.edit.container);
	if(form.valid()){
		console.log(form.serialize());
		$.post('plugins/wf/workflow/save',form.serialize(),function(json){
			console.log(json);
			if(json.resultCode == 1){
				var oldId = $('#id-id',$.plugins.wf.workflow.edit.container).val();
				if(oldId == ''){
					$('#id-actProcdefId',$.plugins.wf.workflow.edit.container).val(json['object']['actProcdefId']);
					$('#id-id',$.plugins.wf.workflow.edit.container).val(json['object']['id']);
					$('#id-actModelId',$.plugins.wf.workflow.edit.container).val(json['object']['actModelId']);
					$('#bt-wf-design',$.plugins.wf.workflow.edit.container).removeClass('disabled');
					$('#bt-wf-deploy',$.plugins.wf.workflow.edit.container).removeClass('disabled');
					$.plugins.wf.workflow.edit.openDesignWin();
				}else{
					$.toast('保存成功');
					//layer.alert('保存成功',{icon: 1});
				}
			}else{
				$.toast(json['message']);
				//layer.alert(json['message'],{icon: 2});
			}
		},'json');
	}
};

/**
 * 绘出流程图
 * pid:流程定义id
 * container:需要展现流程图的容器
 */
$.plugins.wf.workflow.edit.drawDiagram = function(pid,container){
	console.log('drawDiagram...');
	$.getJSON('plugins/wf/definition/get-activity-infos',{processDefinitionId:pid},function(json){
		console.log(json);
		var html = '<img src="plugins/wf/definition/create-process-diagram?processDefinitionId=' + pid + '" />';
		for(var i=0;i<json.length;i++){
			var node = json[i];
			html += '<div id="_dv_node_' + node['id'] + '" '
			  + 'nodeType="' + node['type'] + '"'
			  + 'nodeId="' + node['id'] + '" '
			  + 'nodeName="' + node['name'] + '"'
			  + 'style="cursor:pointer;position:absolute;'
			  + 'width:' + node['width'] + 'px;'
			  + 'height:' + node['height'] + 'px;'
			  + 'left:' + (node['x']) + 'px;'
			  + 'top:' + (node['y']) + 'px;'
			  + '" onclick="$.plugins.wf.workflow.edit.openNodeWindow(this);"></div>';
		}
		container.html(html);
	});
};

/**
 * 打开流程设计器
 */
$.plugins.wf.workflow.edit.openDesignWin = function(){
	var modelId = $('#id-actModelId',$.plugins.wf.workflow.edit.container).val();
	var wfName = $('#wfName',$.plugins.wf.workflow.edit.container).val();
	layer.open({
    type:2,
    title:'流程设计-' + wfName,
    area:[$(window).width() + 'px',$(window).height() + 'px'],
    content:'modeler.html?modelId=' + modelId,
    cancel:function(index, layero){
			layer.confirm('确定流程调整已保存?', {icon: 3, title:'提示'}, function(ii){
				layer.close(ii);
				layer.close(index);
			});
			return false;
		}
  });
};

/**
* 流程部署
*/
$.plugins.wf.workflow.edit.deploy = function(){
	var wfId = $('#id-id',$.plugins.wf.workflow.edit.container).val();
	
	$.confirm('提示','确定要重新部署?',function(b){
		if(b){
			$.ajax({
				sync:true,
				type: "POST",
				url: "plugins/wf/workflow/deploy?wfid="+wfId,
				dataType:"json",
				success: function(json){
					if(json.resultCode == 1){
						var pid = json.object['actProcdefId'];
						var container = $('#dv-diagram',$.plugins.wf.workflow.edit.container);
						 $('#id-actProcdefId',$.plugins.wf.workflow.edit.container).val(pid);
						 $.plugins.wf.workflow.edit.drawDiagram(pid,container);
					}else{
						$.toast(json['message']);
					}
				}
			});
		}
	});
	
};

/**
* 打开流程各个节点属性的配置页面
*/
$.plugins.wf.workflow.edit.openNodeWindow = function(me){
	var nodeName = $(me).attr('nodeName');
	var nodeType = $(me).attr('nodeType');
	var nodeId = $(me).attr('nodeId');
	
	var url = '';
	switch(nodeType){
		case 'usertask':
			url = 'plugins/wf/workflow/user-task';
			break;
		case 'exclusivegateway':
			url = 'plugins/wf/workflow/exclusive-gateway';
			break;
		case 'startevent':
		case 'endevent':
			url = 'plugins/wf/workflow/event-config';
			break;
	}
		
	if(url == ''){
		$.alert('提示','节点类型【' + nodeType + '】开发中...'); 
		return;
	}
	var pid = $('#id-actProcdefId',$.plugins.wf.workflow.edit.container).val();
	url += '?pid=' + pid + '&taskKey=' + nodeId;
	
	$.plugins.wf.workflow.edit.nodeEditWinId = 
		$.dialog({
			url:url,
			title:'节点配置-' + nodeName,
			modal:true
		});
};