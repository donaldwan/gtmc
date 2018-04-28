<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/common/taglibs.jsp"/>

<div id="win-id-plugin-wf-usergroup-edit-choose" class="col-sm-12 col-md-12 col-lg-12">
    <form class="form-horizontal" id="id-edit-form-usergroup-choose">
		<div class="form-group">
			<input type="hidden" id="id-groupId" name="id" value="${model.id }">
			<input type="hidden" id="id-expression"  name="expression" value="${model.expression }"/>
			<input type="hidden" id="id-expressionText" name="expressionText" value="${model.expressionText }"/>
			<label class="col-sm-2 control-label no-padding-right"	for="groupName"><font color="red">*</font>用户组名称:</label>
			<div class="col-sm-10">
				<input type="text" name="groupName" id="id-groupName" placeholder="请输入用户组名称..." class="form-control" value="${model.groupName }" />
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label no-padding-right" for="expression"><font color="red">*</font>用户组脚本:</label>
			<div class="col-sm-10">
				<pre>def m=[:];  //申明map集合<br/>def list=[]; //申明list集合<br/>def sql //执行SQL语句变量</pre>
				<%-- <textarea rows="6" id="id-expression" name="expression" class="custom-scroll" style="width:100%;">${model.expression }</textarea> --%>
				<script type="text/plain" id="expressionEditor"style="width:99.9%;height:200px;"></script>
				<pre>return list; //返回集合   集合包含脚本最终返回人员信息</pre>
			</div>
		</div>		
		<div class="form-group">
			<label class="col-lg-2 col-md-2 col-sm-2 hidden-xs control-label"></label>
			<section class="col col-lg-10 col-md-10 col-sm-10 col-xs-10">
				<p class="alert alert-info no-margin">
				<!-- https://www.w3cschool.cn/groovy/groovy_decision_making.html -->
					参照文档：<a href="#" onclick="window.open('https://www.w3cschool.cn/groovy/groovy_decision_making.html')">Groovy文档</a>								
				</p>
			</section>
		</div>
		
		<div class="form-group">
			<label class="control-label col-sm-2 no-padding-right" for="status">状态:</label>
			<div class="col-sm-10">
				<select class="form-control" name="status" id="id-status">
					<option value="A" ${model.status eq 'A'?'selected':'' }>有效</option>
					<option value="D" ${model.status eq 'D'?'selected':'' }>无效</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-sm-3 no-padding-right" for="remark">备注:</label>
			<div class="col-sm-9">
				<input type="text" name="remark" id="id-remark" placeholder="请输入备注..." class="form-control" value="${model.remark}" />
			</div>
		</div>
    </form>
</div>

<script type="text/javascript">
loadScript("${ctx}/static/plugin/umeditor/third-party/template.min.js", function () {
    loadScript("${ctx}/static/plugin/umeditor/umeditor.config.js", function () {
        loadScript("${ctx}/static/plugin/umeditor/umeditor.config.js", function () {
            loadScript("${ctx}/static/plugin/umeditor/umeditor.min.js", function () {
                loadScript("${ctx}/static/plugin/umeditor/lang/zh-cn/zh-cn.js", function () {
                	loadScript("${ctx}/static/modules/plugins/wf/usergroup/choose/edit.js",function(){
                		$.plugins.wf.usergroup.choose.edit.init();
                    });
                });
            });
        });
    });
});

	/* loadScript("${ctx}/static/modules/plugins/wf/usergroup/edit.js",function(){
		$.plugins.wf.usergroup.edit.init();
	}); */
</script>

