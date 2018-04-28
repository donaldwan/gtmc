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
<script src="${ctx}/static/menu/js/jquery-accordion-menu.js" type="text/javascript"></script>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',border:false" style="height:60px;background:#B3DFDA;padding:10px">north region</div>
	<div data-options="region:'west',split:false," 
		style="width:220px;padding:0px;overflow-x:hidden;background-color: #ED5565;">
		<div id="jquery-accordion-menu" class="jquery-accordion-menu red">
			
			<ul id="demo-list">
			 	
			    <li class="active"><a href="#"><i class="fa fa-home"></i>Home </a></li>
				<li><a href="#"><i class="fa fa-glass"></i>Events </a></li>
				<li><a href="#"><i class="fa fa-file-image-o"></i>Gallery </a><span class="jquery-accordion-menu-label">
					12 </span></li>
				<li><a href="#"><i class="fa fa-cog"></i>Demo一级菜单</a>
					<ul class="submenu">
						<li><a href="#"><i class="fa fa-home"></i>二级菜单1</a></li>
						<li><a href="#">二级菜单2</a></li>
						<li><a href="#">二级菜单3</a>
							<ul class="submenu">
								<li><a href="#">三级菜单1</a></li>
								<li><a href="#">三级菜单2</a></li>
								<li><a href="#">三级菜单3</a></li>
								<li><a href="#">三级菜单4</a></li>
							</ul>
						</li>
						<li><a href="#">二级菜单4</a></li>
					</ul>
				</li>
				<li><a href="#"><i class="fa fa-home"></i>系统管理 </a></li>
				<li><a href="#"><i class="fa fa-suitcase"></i>Portfolio </a>
					<ul class="submenu">
						<li><a href="#">Web Design </a></li>
						<li><a href="#">Graphics </a><span class="jquery-accordion-menu-label">10 </span>
						</li>
						<li><a href="#">Photoshop </a></li>
						<li><a href="#">Programming </a></li>
					</ul>
				</li>
				<li><a href="#"><i class="fa fa-user"></i>About </a></li>
				<li><a href="#"><i class="fa fa-envelope"></i>Contact </a></li>
			   
			</ul>
		</div>
	
	</div>
	<div data-options="region:'south',border:false" style="height:30px;background:#A9FACD;padding:10px;">版权所有</div>
	<div data-options="region:'center'">
		<div id="id-tab-main" class="easyui-tabs" data-options="fit:true">
			    
		</div>
	</div>
</body>
</html>
<script type="text/javascript">

	$(function(){
		$("#jquery-accordion-menu").jqueryAccordionMenu();
		
		$("#demo-list li").click(function(){
			$("#demo-list li.active").removeClass("active")
			$(this).addClass("active");
		});
		
		addTab('首页','home','fa fa-user',true);
		
		$('div[isActive]').bind('click',function(){
			
			$('div[isActive=1]').attr('class','menuNormal');
			$('div[isActive=1]').attr('isActive','0');
			
			$(this).attr('class','menuActive');
			$(this).attr('isActive','1');
			
		});
	});

	function addTab(title,url,iconCls,closable){
		if($('#id-tab-main').tabs('exists',title)){
			$('#id-tab-main').tabs('select',title);
		}else{
			$('#id-tab-main').tabs('add',{
				title:title,
				iconCls:iconCls,
				closable:closable,
				content:'<iframe src="' + url + '" width="100%;" height="100%;" frameborder="0"></iframe>'
			});
		}
	}
</script>