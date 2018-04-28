<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" media="screen" href="static/smart/plugin/jquery-ui-1.11.4.custom/jquery-ui.css">
<link rel="stylesheet" type="text/css" media="screen" href="static/smart/plugin/jqgrid/ui.jqgrid.css">
<script type="text/javascript" src="static/smart/js/libs/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="static/smart/plugin/jqgrid/grid.locale-cn.js"></script>
<script type="text/javascript" src="static/smart/plugin/jqgrid/jquery.jqGrid.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		 $("#treegrid").jqGrid({  
             treeGrid: true,  
             treeGridModel: 'adjacency',  
             ExpandColumn: 'screenName',  
             ExpandColClick: true,  
             url: 'demo/tree',  
             datatype: 'json',  
             colNames: ["管理选项"],  
             colModel: [  
                 { name: 'name', index: 'name' }  
             ],  
             pager: "false",  
             height: 'auto',  
             width: '210',  
             viewrecords: true,
             treeReader : {
                 level_field: "level",
                 parent_id_field: "parentId",
                 leaf_field: "isLeaf",
                 expanded_field: "expanded"
             },
         });  
// 		$("#treegrid").jqGrid({  
// 	        treeGrid: true,  
// 	        treeGridModel: 'adjacency',  
// 	        ExpandColumn: 'screenName',  
// 	        ExpandColClick: true,  
// 	        url: 'system/screen/find-all',  
// 	        datatype: 'json',  
// 	        colNames: ["管理选项"],  
// 	        colModel: [  
// 	            { name: 'screenName', index: 'screenName' }  
// 	        ],  
// 	        pager: "false",  
// 	        height: 'auto',  
// 	        width: '210',  
// 	        viewrecords: true,
// 	        treeReader : {
// 	            level_field: "level",
// 	            parent_id_field: "parentId",
// 	            leaf_field: "leaf",
// 	            expanded_field: "expanded"
// 	        },
// 	    });
	});	
</script>
</head>
<body>
	<table id="treegrid"></table>
</body>
</html>