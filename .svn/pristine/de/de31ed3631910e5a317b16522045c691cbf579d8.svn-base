$.namespace('plugins.job.manager');

$.plugins.job.manager.init = function(){
	$.plugins.job.manager.container = $('#plugins-schedule-job-manager');
	$.plugins.job.manager.initGrid();
	
	//新增
	$('#bt-add',$.plugins.job.manager.container).click(function(){
		$.plugins.job.manager.openEditWin('');
	});
	
	//编辑
	$('#bt-edit',$.plugins.job.manager.container).click(function(){
		var ids = $("#" + $.plugins.job.manager.gridId).jqGrid('getGridParam','selarrrow');
		if(ids.length !=1){
			$.toast('请选择一行数据!');
			return;
		}
		$.plugins.job.manager.openEditWin(ids[0]);
	});
	
	//刷新
	$('#bt-refresh',$.plugins.job.manager.container).click(function(){
		$.plugins.job.manager.reload();
	});
};

/**
* 初始化Grid
*/
$.plugins.job.manager.initGrid = function(){
	$.plugins.job.manager.gridId = $.grid({
		container:$('#grid-plugins-schedule-job-manager',$.plugins.job.manager.container),
		url:'plugins/schedule-job/find-page',
		colNames:['ID','任务名称','任务类型','状态','执行对象','触发时间','最后运行时间','运行状态','运行异常','运行结果','操作'],
		autowidth:true,
		colModel : [
				{name:'id',index:'id',hidden:true},
				{name:'jobName',index:'jobName'},
				{name:'jobType',index:'jobType',width:80,formatter:function(v,a,r,d){
					return v == 'J'?'Java对象':'Shell脚本';
				}},
				{name:'status',index:'status',width:50,formatter:function(value,a,row,d){
					return 'A' == value ? '有效':'禁用';
				}},
				{name:'jobObject',index:'jobObject',width:260,formatter:function(v,a,r,d){
					return 'J' == r.jobType?r.jobObject:r.shellPath;
				}},
				{name:'cronExpression',width:100,index:'cronExpression'},
				{name:'runTime',index:'runTime',formatter:function(v,a,r,d){
					if(r.lastRunStartTime == null || r.lastRunStartTime == 'null')return '';
					return r.lastRunStartTime;
				}},
				{name:'runStatus',index:'runStatus',formatter:function(v,a,r,d){
					if(v == 'R')return '正在运行';
					if(r.status != 'A')return '';
					switch(v){
						case 'A':return '已结束';
						case 'R':return '正在运行';
						case 'P':return '暂停';
					}
					return '';
				}},
				{name:'runMessage',index:'runMessage'},
				{name:'runResult',index:'runResult',width:80,formatter:function(v,a,r,d){
					if(r.runStatus == 'R')return '';
					if(r.lastRunStartTime == null || r.lastRunStartTime == 'null')return '';
					return v == '1'?'正常':'异常';
				}},
				{name:'oper',index:'oper',align:'center',formatter:function(v,a,r,d){
					var html = '';
					if(r.status == 'A'){
					    html += '<button class="btn btn-success btn-sm" type="button" onclick="$.plugins.job.manager.trigger(\'' + r.id + '\',false)">运行</button>';
						html += '&nbsp;<button class="btn btn-warning btn-sm" type="button" onclick="$.plugins.job.manager.changeStatus(\'' + r.id + '\',\'D\')">禁用</button>';
					}else{
						html += '<button class="btn btn-primary btn-sm" type="button" onclick="$.plugins.job.manager.changeStatus(\'' + r.id + '\',\'A\')">启用</button>';
					}
					return html;
				}}
			]
	});
};

/**
* 刷新
*/
$.plugins.job.manager.reload = function(){
	$("#" + $.plugins.job.manager.gridId).jqGrid().trigger('reloadGrid');
};

/**
* 启用/禁用
*/
$.plugins.job.manager.changeStatus = function(id,status){
	$.confirm('提示','确定要' + (status == 'A'?'启用':'禁用') + '吗?',function(b){
		if(b){
			$.ajax({
				sync:true,
				url:'plugins/schedule-job/change-status',
				type:'post',
				dataType:'json',
				data:{id:id,status:status},
				success:function(json){
					if(json.resultCode == 1){
						$.toast('保存成功!');
						$.plugins.job.manager.reload();
					}else{
						$.toast(json['message']);
					}
				}
			});
		}
	});
};

/**
* 立即运行一个Job任务
*/
$.plugins.job.manager.trigger = function(id,trigger){
	$.ajax({
		sync:true,
		url:'plugins/schedule-job/trigger',
		type:'post',
		dataType:'json',
		data:{id:id,trigger:trigger},
		success:function(json){
			if(json.resultCode == 1){
				$.plugins.job.manager.reload();
			}else if(json.resultCode == 2){
				$.confirm('提示','Job正在运行，是否确定触发?',function(b){
					if(b){
						$.plugins.job.manager.trigger(id,true);
					}
				});
			}else{
				$.toast(json.message);
			}
		}
		
	});
	
//	$.getJSON('plugins/schedule-job/trigger?id=' + id,function(json){
//		$.plugins.job.manager.reload();
//	});
};

/**
* 打开新增、编辑页面窗口
*/
$.plugins.job.manager.openEditWin = function(id){
	$.plugins.job.manager.editWinId = $.dialog({
		url:'plugins/schedule-job/edit?id=' + id,
		width:800,
		height:440,
		title:'Job任务编辑',
		modal:true,
		buttons:[
			{text:'保存',	"class":"btn btn-primary",click:function(){
				$.plugins.job.manager.save();
			}},
			{text:'取消',"class":"btn btn-default",click:function(){
				$(this).dialog("close");
			}}
		],
		success:function(){
			$.plugins.job.manager.initEditFormValidator();
		}
	});
};

/**
* 保存编辑结果
*/
$.plugins.job.manager.save = function(){
	var form = $("#id-form-plugins-job-edit");
	if(form.valid()){
		$.ajax({
			sync:true,
			url:'plugins/schedule-job/save',
			type:'post',
			dataType:'json',
			data:form.serialize(),
			success:function(json){
				if(json.resultCode == 1){
					$.toast('保存成功!');
					$('#' + $.plugins.job.manager.editWinId).dialog('close');
					$.plugins.job.manager.reload();
				}else{
					$.toast('保存失败，请检查输入参数是否正确！');
				}
			}
		});
	}
};

/**
* 初始化编辑form验证
*/
$.plugins.job.manager.initEditFormValidator = function(){
	$("#id-form-plugins-job-edit").validate({
		rules : {
			jobName : {
				required : true,
				minlength:2,
				maxlength:62
			},
			jobObject : {
				required :true,
				minlength:2,
				maxlength:100
			},
			cronExpression : {
				required :true,
				minlength:2,
				maxlength:100
			}
		},
		submitHandler:function(form){
			$.plugins.job.manager.save();
		}
	});
};