<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=EDGE" />
<title></title>
<%@ include file="/common/static.jsp"%>
</head>
<body class="easyui-layout">
	
	<div data-options="region:'west',title:'部门维护',split:true" style="width: 400px;">
		<div id="tb-grid-dept-tools">
			
			<a href="javascript:void(0)" id="mb" class="easyui-menubutton" data-options="menu:'#mm',iconCls:'icon-add'">新增</a>
			<div id="mm" style="width:100px;">    
				<div id="bt-add-same" data-options="iconCls:'icon-undo'">同级部门</div>
				<div class="menu-sep"></div>
				<div id="bt-add-child" data-options="iconCls:'icon-redo'">下级部门</div>    
			</div>
			
			<a href="#" class="easyui-linkbutton" onclick="edit();"
				data-options="iconCls:'icon-edit',plain:true">修改</a>
			
			<a href="#" id="bt-ok" class="easyui-linkbutton" onclick="changeStatus('D');"
				data-options="iconCls:'icon-ok',plain:true,disabled:true">启用</a>
			<a href="#" id="bt-no" class="easyui-linkbutton" onclick="changeStatus('A');"
				data-options="iconCls:'icon-no',plain:true,disabled:true">禁用</a>
		</div>
		<table id="tb-grid-dept"></table>
	</div>
	<div data-options="region:'center',title:'用户维护'" style="padding: 5px;">
		<div id="dv-grid-user"></div>
	</div>
	
	
</body>
</html>
<script type="text/javascript">
	$(function(){
		$('#tb-grid-dept').treegrid({
			url:'${ctx}/system/dept/find-all',
			idField:'id',   
			treeField:'deptName',
			fitColumns:true,
			rownumbers: true,
			animate: true,
			collapsible: true,
			fit:true,
			toolbar:'#tb-grid-dept-tools',
			columns:[[     
				{title:'部门名称',field:'deptName',width:40},
				{title:'部门编码',field:'deptCode',width:40},
				{title:'状态',field:'status',width:20,formatter:function(v,r,i){
					return v == 'A'?'启用':'禁用'
				}}
			]],
			onSelect:function(row){
				$('#bt-ok').linkbutton(row.status == 'A'?'disable':'enable');
				$('#bt-no').linkbutton(row.status != 'A'?'disable':'enable');
			}
		});
	});
	
	/**
	* 修改状态
	*/
	function changeStatus(status){
		var row = $('#tb-grid-dept').treegrid('getSelected');
		console.log(row);
		$.messager.confirm('提示','确定要调整状态?',function(b){
			if(b){
				$.ajax({
					url:'${ctx}/system/dept/change-status',
					type:'post',
					sync:true,
					dataType:'json',
					data:{id:row.id,status:row.status=='A'?'D':'A'},
					success:function(json){
						$.toast('修改成功!');
						$('#tb-grid-dept').treegrid('reload');
						$('#tb-grid-dept').treegrid('unselectAll');
					}
				});
			}
		});
	}
	
	/**
	* 修改
	*/
	function edit(){
		var row = $('#tb-grid-dept').treegrid('getSelected');
		console.log(row);
		if(row){
			openEditWin(row.id);
		}else{
			$.toast('请选择要编辑的部门!');	
		}
	}
	
	/**
	* 打开编辑窗口
	*/
	function openEditWin(id){
		var url = '${ctx}/system/dept/edit?id=' + id;
		var winId = $.win({href:url,title:'部门编辑',width:400,height:280,
			buttons:[
			         {text:'保存',iconCls:'icon-save',handler:function(){
			        	 saveDept(winId);
						}
			         },
					 {text:'取消',iconCls:'icon-no',handler:function(){
							$('#' + winId).window('close');
						}
					 }
				]
		});
	}
	
	/**
	* 保存部门
	*/
	function saveDept(win){
		$.messager.progress();
		$('#form-dept-edit').form('submit',{
			url:'${ctx}/system/dept/save',
			onSubmit:function(){
				var valid = $(this).form('validate');
				if(!valid){
					$.messager.progress('close');
				}
				return valid;
			},
			success:function(json){
				$.messager.progress('close');
			}
		});
	}
</script>