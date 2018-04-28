<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/common/taglibs.jsp" %>

<div id="system-role-manager">
    <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <div class="jarviswidget jarviswidget-color-lightblue" data-widget-editbutton="false"
             data-widget-togglebutton="false" data-widget-deletebutton="false">
            <header>
                <h2><strong>角色管理</strong> <i></i></h2>
            </header>
            <div class="widget-body">
                <div class="well">
                    <form class="form-horizontal" id="form-search-system-role">
                        <div class="form-group">
                            <label class="control-label" style='float:left'>角色名称:</label>
                            <div class="col-sm-4 col-md-4 col-lg-4">
                                <input class="form-control" name="roleName" placeholder="请输入角色名称..." type="text">
                            </div>
                            <div class="col-sm-4 col-md-4 col-lg-4">
                                <a id="bt-search" class="btn btn-primary btn-sm" href="javascript:void(0);"><i
                                        class="fa fa-search"></i>&nbsp;搜&nbsp;索</a>
                                <a id="bt-reset" class="btn btn-default btn-sm" href="javascript:void(0);"><i
                                        class="fa fa-reply "></i>&nbsp;重&nbsp;置</a>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="alert alert-info alert-block group-bts" style="padding:5px;">
                    <a id="bt-add" class="btn btn-success btn-sm" href="javascript:void(0);"><i class="fa fa-plus"></i>&nbsp;新&nbsp;增</a>
                    <a id="bt-edit" class="btn btn-success btn-sm" href="javascript:void(0);"><i class="fa fa-edit"></i>&nbsp;编&nbsp;辑</a>
                    <a id="bt-detail" class="btn btn-primary btn-sm" href="javascript:void(0);"><i
                            class="fa fa-edit"></i>&nbsp;明&nbsp;细</a>
                    <a id="bt-delete" class="btn btn-danger btn-sm" href="javascript:void(0);"><i
                            class="fa fa-times"></i>&nbsp;删&nbsp;除</a>
                    <a id="bt-auth" class="btn btn-info btn-sm" href="javascript:void(0);"><i class="fa fa-gear"></i>&nbsp;权限配置</a>
                </div>
                <div id="grid-system-role"></div>
            </div>
        </div>
    </article>
</div>
<script type="text/javascript">
    loadScript("${ctx}/static/modules/system/role/manager.js", function () {
        $.system.role.init();
    });
</script>
