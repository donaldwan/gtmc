<%@ page language="java" contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
ul.color-select{
	min-width:140px;
}
.ui-widget-content{
 	width:96%; 
 	margin-left:4px;
}
.ui-jqgrid-bdiv table td{
	border:1px solid #DDDDDD;
}
</style>
<div style="padding:35px" id="system-choose-role">
	<div class="row">
		<form class="form-horizontal">
			<div class="form-group">
					<label class="col-sm-2 control-label ">角色名称:</label>
					<div class="col-sm-4">
						<input class="form-control" name="roleName" id="id-choose-role-name" placeholder="请输入角色名称..." type="text">
					</div>
					<div class="col-sm-4">
						<a id="bt-search" onclick="javascript:$.system.role.choose.search();" class="btn btn-primary btn-sm" href="javascript:void(0);"><i class="fa fa-search"></i>&nbsp;搜&nbsp;索</a>
					</div>
				</div>
		</form>
	</div>
	<hr class="simple simple-line">
	<div class="row">
		<div id="grid-pager-system-role-choose"></div>
	</div>
</div>

