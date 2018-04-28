<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/common/taglibs.jsp" />
<div class="col-sm-12 col-md-12 col-lg-12 no-padding" style="padding-right: 25px !important; margin-top: 50px;">
	<form class="smart-form form-horizontal" id="id-form-pwd-change">
		<div class="form-group">
			<label class="col-lg-2 col-md-2 col-sm-2 hidden-xs control-label">旧密码:</label>
			<section class="col col-lg-9 col-md-9 col-sm-9 col-xs-12">
				<label class="input"><i class="icon-append fa fa-edit"></i>
					<input type="password" id="oldLoginPassword" name="oldLoginPassword" placeholder="旧密码"/>
				</label>
			</section>
		</div>
		<div class="form-group">
			<label class="col-lg-2 col-md-2 col-sm-2 hidden-xs control-label">新密码:</label>
			<section class="col col-lg-9 col-md-9 col-sm-9 col-xs-12">
				<label class="input"><i class="icon-append fa fa-edit"></i>
					<input type="password" id="newLoginPassword" name="newLoginPassword" placeholder="新密码"/>
				</label>
				
			</section>
		</div>
		<div class="form-group">
			<label class="col-lg-2 col-md-2 col-sm-2 hidden-xs control-label">密码确认:</label>
			<section class="col col-lg-9 col-md-9 col-sm-9 col-xs-12">
				<label class="input"><i class="icon-append fa fa-edit"></i>
					<input type="password" id="confirmNewLoginPassword" name="confirmNewLoginPassword" placeholder="密码确认"/>
				</label>
			</section>
		</div>
		<div class="form-group" id="id-dv-up-import-error">
			<label class="col-lg-1 col-md-1 col-sm-1 hidden-xs control-label"></label>
			<section class="col col-lg-10 col-md-10 col-sm-10 col-xs-12">
				<div class="alert alert-info fade in">
					<strong>1、</strong>新密码不能和旧密码一致<br />
					<strong>2、</strong>新密码只能输入大小写字母或者数字，并且长度在5-32之间的字符串<br />
<!-- 					<strong>2、</strong>新密码必须同时包含大小写字母、数字，并且长度不少于8位<br /> -->
					<strong>3、</strong>修改密码后必须重新登录
				</div>
			</section>
		</div>
	</form>
</div>