<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/common/taglibs.jsp"%>

<!-- 角色管理列表 -->
<section id="widget-grid" class="">

	<!-- row -->
	<div class="row">
		
		<!-- NEW WIDGET START -->
		<article class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

			<div class="jarviswidget jarviswidget-color-lightblue" data-widget-editbutton="false" data-widget-togglebutton="false" data-widget-deletebutton="false">
				
				<header>
					<h2><strong>角色管理</strong> <i></i></h2>		
				</header>

				<!-- widget div-->
				<div>
					<!-- widget content -->
					<div class="widget-body ">
						<!-- 搜索条件begin -->
						<div class="well">
							<form class="form-horizontal">
								<div class="form-group">
									<label class="col-md-1 control-label">角色名称</label>
									<div class="col-md-3">
										<input class="form-control" placeholder="Default Text Field" type="text">
									</div>
									
									<label class="col-md-1 control-label">角色名称</label>
									<div class="col-md-3">
										<input class="form-control" placeholder="Default Text Field" type="text">
									</div>
									
									<label class="col-md-1 control-label">角色名称</label>
									<div class="col-md-3">
										<input class="form-control" placeholder="Default Text Field" type="text">
									</div>
								</div>
								
								<div class="form-group">
									<label class="col-md-1 control-label">角色名称</label>
									<div class="col-md-3">
										<input class="form-control" placeholder="Default Text Field" type="text">
									</div>
									
									<label class="col-md-1 control-label">角色名称</label>
									<div class="col-md-3">
										<input class="form-control" placeholder="Default Text Field" type="text">
									</div>
									
									<label class="col-md-1 control-label"></label>
									<div class="col-md-3">
										<a class="btn btn-primary btn-sm" href="javascript:void(0);" ><i class="fa fa-search"></i>&nbsp;搜&nbsp;索</a>
										<a class="btn btn-default btn-sm" href="javascript:void(0);" ><i class="fa fa-reply "></i>&nbsp;重&nbsp;置</a>
										
									</div>
								</div>
								
							</form>
						</div>
						<!-- 搜索条件end -->
						<!-- grid begin -->
						<div class="alert alert-info alert-block group-bts">
							<a class="btn btn-success btn-sm" href="javascript:void(0);" ><i class="fa fa-plus"></i>&nbsp;新&nbsp;增</a>
							<a class="btn btn-primary btn-sm" href="javascript:void(0);" ><i class="fa fa-edit"></i>&nbsp;编&nbsp;辑</a>
							<a class="btn btn-danger btn-sm" href="javascript:void(0);" ><i class="fa fa-times"></i>&nbsp;删&nbsp;除</a>
							<a class="btn btn-info btn-sm" href="javascript:void(0);" ><i class="fa fa-file-excel-o"></i>&nbsp;Excel导出</a>
							<a class="btn btn-info btn-sm" href="javascript:void(0);" ><i class="fa fa-upload "></i>&nbsp;批量导入</a>
						</div>
						<div id="grid"></div>
						<!-- grid end -->
					</div>
					<!-- end widget content -->
					
				</div>
				<!-- end widget div -->
				
			</div>
		</article>
		<!-- WIDGET END -->
	</div>
	<!-- end row -->

</section>
<!-- end widget grid -->

<script type="text/javascript">
function run_jqgrid_function() {


	var jqgrid_data = [{
		id : "1",
		date : "2007-10-01",
		name : "test",
		note : "note",
		amount : "200.00",
		tax : "10.00",
		total : "210.00"
	}, {
		id : "2",
		date : "2007-10-02",
		name : "test2",
		note : "note2",
		amount : "300.00",
		tax : "20.00",
		total : "320.00"
	}, {
		id : "3",
		date : "2007-09-01",
		name : "test3",
		note : "note3",
		amount : "400.00",
		tax : "30.00",
		total : "430.00"
	}, {
		id : "4",
		date : "2007-10-04",
		name : "test",
		note : "note",
		amount : "200.00",
		tax : "10.00",
		total : "210.00"
	}, {
		id : "5",
		date : "2007-10-05",
		name : "test2",
		note : "note2",
		amount : "300.00",
		tax : "20.00",
		total : "320.00"
	}, {
		id : "6",
		date : "2007-09-06",
		name : "test3",
		note : "note3",
		amount : "400.00",
		tax : "30.00",
		total : "430.00"
	}, {
		id : "7",
		date : "2007-10-04",
		name : "test",
		note : "note",
		amount : "200.00",
		tax : "10.00",
		total : "210.00"
	}, {
		id : "8",
		date : "2007-10-03",
		name : "test2",
		note : "note2",
		amount : "300.00",
		tax : "20.00",
		total : "320.00"
	}, {
		id : "9",
		date : "2007-09-01",
		name : "test3",
		note : "note3",
		amount : "400.00",
		tax : "30.00",
		total : "430.00"
	}, {
		id : "10",
		date : "2007-10-01",
		name : "test",
		note : "note",
		amount : "200.00",
		tax : "10.00",
		total : "210.00"
	}, {
		id : "11",
		date : "2007-10-02",
		name : "test2",
		note : "note2",
		amount : "300.00",
		tax : "20.00",
		total : "320.00"
	}, {
		id : "12",
		date : "2007-09-01",
		name : "test3",
		note : "note3",
		amount : "400.00",
		tax : "30.00",
		total : "430.00"
	}, {
		id : "13",
		date : "2007-10-04",
		name : "test",
		note : "note",
		amount : "200.00",
		tax : "10.00",
		total : "210.00"
	}, {
		id : "14",
		date : "2007-10-05",
		name : "test2",
		note : "note2",
		amount : "300.00",
		tax : "20.00",
		total : "320.00"
	}, {
		id : "15",
		date : "2007-09-06",
		name : "test3",
		note : "note3",
		amount : "400.00",
		tax : "30.00",
		total : "430.00"
	}, {
		id : "16",
		date : "2007-10-04",
		name : "test",
		note : "note",
		amount : "200.00",
		tax : "10.00",
		total : "210.00"
	}, {
		id : "17",
		date : "2007-10-03",
		name : "test2",
		note : "note2",
		amount : "300.00",
		tax : "20.00",
		total : "320.00"
	}, {
		id : "18",
		date : "2007-09-01",
		name : "test3",
		note : "note3",
		amount : "400.00",
		tax : "30.00",
		total : "430.00"
	}];
	
	$.grid({
		container:$('#grid'),
		data : jqgrid_data,
		datatype : "local",
		height : 'auto',
		colNames : ['Actions', 'Inv No', 'Date', 'Client', 'Amount', 'Tax', 'Total', 'Notes'],
		colModel : [
			{ name : 'act', index:'act', sortable:false }, 
			{ name : 'id', index : 'id' }, 
			{ name : 'date', index : 'date', editable : true }, 
			{ name : 'name', index : 'name', editable : true }, 
			{ name : 'amount', index : 'amount', align : "right", editable : true }, 
			{ name : 'tax', index : 'tax', align : "right", editable : true }, 
			{ name : 'total', index : 'total', align : "right", editable : true }, 
			{ name : 'note', index : 'note', sortable : false, editable : true }],
		rowNum : 10,
		rowList : [10, 20, 30],
		sortname : 'id'
	});
	


} // end function
	loadScript("${ctx}/static/modules/system/role/manager.js",function(){
		pageSetUp();
		run_jqgrid_function();
	});
</script>
