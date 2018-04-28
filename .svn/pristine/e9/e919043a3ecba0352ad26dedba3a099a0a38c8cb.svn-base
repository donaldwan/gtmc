<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<div id="common-calendar">
	<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
		<div class="jarviswidget jarviswidget-color-lightblue"
			data-widget-editbutton="false" data-widget-togglebutton="false"
			data-widget-deletebutton="false">
			<header>
				<h2>
					<strong>工作日历</strong> <i></i>
				</h2>
			</header>
			<div class="widget-body">
				<div class="well">
					<form id="common-calendar-form"  class="form-inline" method="post">
						<div>
								<input id = "common-calendar-calendarType" name="calendarType" value="0" type = "hidden"/>
								<input id = 'common-calendar-yearValue' name="yearValue" value="" type = "hidden"/>
								<input id = 'common-calendar-monthValue' name="monthValue" value="" type = "hidden"/>
								<label style = "display:none;">生产线：</label>
								<select id = 'common-calendar-produceLine' style = "display:none;" name="produceLine" value = "1">
										  <option value="1">1线</option>
										  <option value="2">2线</option>
										  <option value="3">3线</option>
								</select>
								
								<div class="row">
								    <select id = "common-calendar-year" style="margin-left:15px;" name="year"></select>- 
								    <select id = "common-calendar-month" name="month"></select>
									
									<span style="display:inline-block;border-radius: 4px;margin-top:5px;width:35px;height:15px;background-color:#cccccc;"></span>非工作日
									<span style="display:inline-block;border-radius: 4px;margin-top:5px;width:35px;height:15px;background-color:#0AF047;"></span>工作日
								</div>
							
						</div>
						<!-- 日历演示 -->
						<div>
							<table id = "common-calendarTable" class = "table table-bordered">
							  <thead>
							    <tr>
							        <th><input type="checkbox" style="cursor:pointer;float:left;"><span  style="float:right;margin-right:4px;">日</span></th>
							        <th><input type="checkbox" style="cursor:pointer;float:left;"><span  style="float:right;margin-right:4px;">一</span></th>
							        <th><input type="checkbox" style="cursor:pointer;float:left;"><span  style="float:right;margin-right:4px;">二</span></th>
							        <th><input type="checkbox" style="cursor:pointer;float:left;"><span  style="float:right;margin-right:4px;">三</span></th>
							        <th><input type="checkbox" style="cursor:pointer;float:left;"><span  style="float:right;margin-right:4px;">四</span></th>
							        <th><input type="checkbox" style="cursor:pointer;float:left;"><span  style="float:right;margin-right:4px;">五</span></th>
							        <th><input type="checkbox" style="cursor:pointer;float:left;"><span  style="float:right;margin-right:4px;">六</span></th>
							    </tr>
							  </thead>
							  <tbody id = "common-calendar-tbody">
							  </tbody>
							</table>
						</div>
						</form>	
						<div>
							<label>将已选日期设置为:</label>
							<a id="bt-save-noworkday" class="btn btn-success btn-sm" href="javascript:void(0);" style="background-color:#cccccc;border:1px solid #cccccc;"><i class="fa fa-plus" ></i>&nbsp;保存非工作日</a>
							<a id="bt-save-workday" class="btn btn-success btn-sm" href="javascript:void(0);" style="background-color:#0AF047;border:1px solid #0AF047;" ><i class="fa fa-plus" ></i>&nbsp;保存工作日</a>
							
						</div>
					
				</div>
	</article>

</div>

 <script type="text/javascript">
	loadScript("${ctx}/static/modules/common/workCalendar/workCalendar.js", function() {
		$.common.workCalendar.init();
	});
</script>

