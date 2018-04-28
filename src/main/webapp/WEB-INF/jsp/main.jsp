<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=EDGE"/>
<title>XXX-系统</title>
<%@ include file="/common/static.jsp"%>
<link href="${ctx}/static/menu/css/jquery-accordion-menu.css" rel="stylesheet" type="text/css" />
<link href="${ctx}/static/menu/css/font-awesome.css" rel="stylesheet" type="text/css" />
<%-- <link href="${ctx}/static/smart/css/custome.css" rel="stylesheet" type="text/css"/> --%>
<script type="text/javascript" src="${ctx}/static/easyui/menu/js/jquery-accordion-menu.js" ></script>
<script type="text/javascript" src="${ctx}/static/plugin/layer/layer.js"></script>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false" style="height:40px;background:#B3DFDA;padding:10px">north region</div>
	<div data-options="region:'west',split:false," 
		style="width:220px;padding:0px;overflow-x:hidden;background-color: #ED5565;">
		<div id="jquery-accordion-menu" class="jquery-accordion-menu red">
			<ul id="menu-list">
			    <li url="home" title="首页" iconCls="fa fa-home"><a href="javascript:void(0);"><i class="fa fa-home"></i>首页</a></li>
			</ul>
		</div>
	
	</div>
	<div data-options="region:'south',border:false" style="height:30px;background:#FFFFFF;padding:0px;line-height:30px;">版权所有</div>
	<div data-options="region:'center'">
		<div id="id-tab-main" class="easyui-tabs" data-options="fit:true">
			    
		</div>
	</div>
</body>
</html>
<script type="text/javascript">

	$(function(){
		
		$.getJSON('${ctx}/system/screen/find-by-user',function(menus){
			console.log(menus);
			var html = '';
			for(var i=0;i<menus.length;i++){
				var menu = menus[i];
				if(menu.parentId == null || menu.parentId == 'null'){
					html += '<li url="' + menu.uri + '" title="' + menu.screenName + '" iconCls="' + menu.normalCss + '"><a href="javascript:void(0);"><i class="fa fa-cog"></i>' + menu.screenName + '</a>'
						 + renderSubMenu(menu.id,menus)
						 + '</li>';
				}
			}
			
			console.log(html);
			
			$('#menu-list').append(html);
			
			$("#jquery-accordion-menu").jqueryAccordionMenu();
			
			$("#menu-list li").click(function(){
				$("#menu-list li.active").removeClass("active")
				$(this).addClass("active");
				
				var url = $(this).attr('url');
				if(url != null && url != 'null'){
					var title = $(this).attr('title');
					var cls = $(this).attr('iconCls');
					addTab(title,url,cls,true);
				}
				
			});
			
		});
		
		addTab('首页','home','fa fa-home',false);
	});
	
	
	function renderSubMenu(parentId,menus){
		var html = '';
		for(var i=0;i<menus.length;i++){
			var menu = menus[i];
			if(menu.parentId == parentId){
				html += '<li url="' + menu.uri + '" title="' + menu.screenName + '" iconCls="' + menu.normalCss + '"><a href="javascript:void(0);">' + menu.screenName + '</a>'
					  + renderSubMenu(menu.id,menus)
					  + '</li>';
			}
		}
		if(html != ''){
			return '<ul class="submenu">' + html + '</ul>';
		}
		return html;
	}

	//添加菜单
	function addTab(title,url,iconCls,closable){
		if($('#id-tab-main').tabs('exists',title)){
			$('#id-tab-main').tabs('select',title);
		}else{
			$('#id-tab-main').tabs('add',{
				title:title,
				iconCls:iconCls=='null'?'icon-edit':iconCls,
				closable:closable,
				content:'<iframe src="' + url + '" width="100%;" height="100%;" frameborder="0"></iframe>'
			});
		}
	}
	
	function showMsg(msg){
		layer.msg(msg,{offset:'t'});
	}
	
	function wait(){
		$.messager.progress(); 
	}
	
	function stopWait(){
		$.messager.progress('close'); 
	}
</script>