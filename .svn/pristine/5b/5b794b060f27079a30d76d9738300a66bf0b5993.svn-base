<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ include file="/common/taglibs.jsp" %>


<!-- row -->
<div id="plugins-schedule-job-manager">

    <!-- NEW WIDGET START -->
    <article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

        <div class="jarviswidget jarviswidget-color-lightblue" data-widget-editbutton="false"
             data-widget-togglebutton="false" data-widget-deletebutton="false">

            <header>
                <h2><strong>Job管理</strong> <i></i></h2>
            </header>

            <!-- widget div-->
            <div>
                <!-- widget content -->
                <div class="widget-body ">

                    <!-- buttons begin -->
                    <div class="alert alert-info alert-block group-bts" style="padding:5px;">
                        <a id="bt-add" class="btn btn-success btn-sm" href="javascript:void(0);"><i
                                class="fa fa-plus"></i>&nbsp;新&nbsp;增</a>
                        <a id="bt-edit" class="btn btn-success btn-sm" href="javascript:void(0);"><i
                                class="fa fa-edit"></i>&nbsp;编&nbsp;辑</a>
                        <a id="bt-refresh" class="btn btn-primary btn-sm" href="javascript:void(0);"><i
                                class="fa fa-refresh"></i>&nbsp;刷&nbsp;新</a>
                    </div>
                    <!-- buttons end -->

                    <!-- grid begin -->

                    <div id="grid-plugins-schedule-job-manager"></div>

                    <!-- grid end -->
                </div>
                <!-- end widget content -->

            </div>
            <!-- end widget div -->

        </div>
    </article>
    <!-- WIDGET END -->
</div>

<script type="text/javascript">
    loadScript("${ctx}/static/modules/plugins/schedule-job/manager.js", function () {
        $.plugins.job.manager.init();
    });
</script>
