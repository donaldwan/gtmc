<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<!-- 设置页面编码格式  -->
    <meta charset="utf-8">
    <!-- 把 content 属性关联到 HTTP 头部-->
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <!-- 把 content 属性关联到一个名称 -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>XXX管理系统-登录</title>

    <!-- CSS -->
    <link rel="stylesheet" href="${ctx}/static/login/login2/font/font.css" />
    <link rel="stylesheet" href="${ctx}/static/login/login2/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${ctx}/static/login/login2/font-awesome/css/font-awesome.min.css" />
	 <link rel="stylesheet" href="${ctx}/static/login/login2/css/form-elements.css" />
    <link rel="stylesheet" href="${ctx}/static/login/login2/css/style.css" />

      <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <!-- Favicon and touch icons -->
    <link rel="shortcut icon" href="assets/ico/favicon.png">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="${ctx}/static/login/login2/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="${ctx}/static/login/login2/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="${ctx}/static/login/login2/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="${ctx}/static/login/login2/ico/apple-touch-icon-57-precomposed.png">

</head>
<body>
	<!-- Top content -->
   <div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-8 col-sm-offset-2 text">
                            <h1><strong>Toyota-管理系统</strong>登录页面</h1>
                            <div class="description">
                            	<p>
	                            			这个是默认登录模板页面，各个项目可根据需要自定义登录页面，只要保持form表单的元素名一致即可！
                            	</p>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-left">
                        			<h3><i class="fa fa-user fa-fw"></i>系统登录</h3>
                            		<p>请输入你的登录帐号和密码:</p>
                        		</div>
                        		<div class="form-top-right">
                        			<i class="fa fa-key"></i>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                    <form role="form" action="j_spring_security_check" method="post" class="login-form">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-username">UserName</label>
			                        	<input type="text" name="j_username" placeholder="UserName..." class="form-username form-control" id="form-username">
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">Password</label>
			                        	<input type="password" name="j_password" placeholder="Password..." class="form-password form-control" id="form-password">
			                        </div>
			                        <div class="form-group">
			                        	<button type="submit" class="btn">登   录</button>
			                        </div>
			                    </form>
		                    </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 social-login">
                        	<span>
                        				<c:set var="login_message" scope="session" value='${empty sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}'/>
				                        <c:if test="${'true'!=login_message}">您输入的用户名或密码不正确，请重新输入！ </c:if>
				                        <c:if test="${not empty sessionScope.message}">${sessionScope.message}</c:if>
                        	</span>
                        </div>
                    </div>
                    
                </div>
            </div>
            
        </div>


        <!-- Javascript -->
        <script src="${ctx}/static/login/login2/js/jquery-1.11.1.min.js"></script>
        <script src="${ctx}/static/login/login2/bootstrap/js/bootstrap.min.js"></script>
        <script src="${ctx}/static/login/login2/js/jquery.backstretch.min.js"></script>
        <script src="${ctx}/static/login/login2/js/scripts.js"></script>
        
        <!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->

    </body>
</html>