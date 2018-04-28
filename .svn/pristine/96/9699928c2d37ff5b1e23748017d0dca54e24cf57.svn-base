<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<meta charset="utf-8">
	<title>XXXX管理系统-登录</title>
	<meta name="description" content="">
	<meta name="author" content="">
	<meta http-equiv="X-UA-Compatible" content="IE=EDGE"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<link rel="stylesheet" type="text/css" media="screen" href="static/login/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" media="screen" href="static/login/css/style.css">
</head>
<body>
	<form action="j_spring_security_check" method="post" id="login-form">
		<div class="container-fluid">
	        <header class="row ist-padding">
	            <div class="col-md-6 col-xs-12">
	                <img src="static/login/img/logo.png" alt=""/>
	                <span class="ist-word">XXXX管理系统</span>
	            </div>
	        </header>
	        <div class="row">
	            <div class="col-md-12">
            		<div class="col-md-8" style="">
            				<img src="static/login/img/BG.png" class="ist-bg" alt=""/>
            		</div>
	                
	                <div class=" col-md-4 ist-check">
	                    <div class="ist-register">用户登录</div>
	                    <div class="ist-center">
	                         <div class="ist-all">
	                             <img src="static/login/img/account.png" class="ist-input-img" alt=""/>
	                             <input class="ist-input" name="j_username" id="j_username" type="text" placeholder="请输入用户名"/>
	                         </div>
	                        <div class="ist-all">
	                            <img src="static/login/img/password.png" class="ist-input-img" alt=""/>
	                            <input class="ist-input" name="j_password" id="j_password" type="password" placeholder="请输入密码"/>
	                        </div>
	                        <div class="ist-all">
	                            <img src="static/login/img/key.png" class="ist-input-img" alt=""/>
	                            <input class="ist-input" name="randCode" id="randCode" maxlength="4" type="text" placeholder="请输入验证码"/>
	                            <img id="randCodeImg" alt="点击更换" title="点击更换" src="" />
	                        </div>
	                    </div>
	                    <div class="ist-error ist-all" id="ist-error" style="padding-left:42px;">
	                        <c:set var="login_message" scope="session" value='${empty sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}'/>
	                        <c:if test="${'true'!=login_message}">您输入的用户名或密码不正确，请重新输入！ </c:if>
	                        <c:if test="${not empty sessionScope.message}">${sessionScope.message}</c:if>
	                    </div>
	                    <input type="submit" value="登录" class="ist-btn" id="bt-login"/>
	                </div>
	            </div>
	        </div>
	    </div>
    </form>
</body>
</html>