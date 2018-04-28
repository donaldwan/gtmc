<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
	<meta name=”viewport” content=”width=device-width, initial-scale=1″ />
	<head>
		<script src="http://172.16.3.12/_viewer/static/jquery.min.js"></script>
		<script src="http://172.16.3.12/_viewer/static/main.js"></script>
	</head>
	<body>
		<div id="viewer" style="height: 100%"></div>
		    <script type="text/javascript">
		    	var path = "${path}";
		        var token = "${token}";
		        viewer = EdoViewer.createViewer('viewer', {
		        	
		        	//height:100
		        });
		        viewer.load_from_wo(path, token);
			</script>
	</body>
</html>
