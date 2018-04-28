$.namespace('common.workCalendarAB');

/**
 * 页面初始化
 */
$.common.workCalendarAB.init = function(){
	
	//页面初始化查找日历数据
	$.common.workCalendarAB.initData();
	
	//下拉框-初始化生产线改变事件
	$('#common-calendar-produceLine').bind("change",function(){
		$.common.workCalendarAB.initData();
	});
	
	//下拉框-初始化年改变事件
	$('#common-calendar-year').bind("change",function(){
		$.common.workCalendarAB.initData();
	});
	
	//下拉框-初始化月改变事件
	$('#common-calendar-month').bind("change",function(){
		$.common.workCalendarAB.initData();
	});
	
	//保存为工作日A班
	$("#bt-save-workdayA").bind("click",function(){
		$.common.workCalendarAB.calendarsave(0,'A');
	});
	
	//保存为工作日B班
	$("#bt-save-workdayB").bind("click",function(){
		$.common.workCalendarAB.calendarsave(0,'B');
	});
	
	//保存为非工作日
	$("#bt-save-noworkday").bind("click",function(){
		$.common.workCalendarAB.calendarsave(1);
	});
	
	//
	$.common.workCalendarAB.calendarHeadCheckboxInit();
};

//查询数据
$.common.workCalendarAB.initData = function(){
	$.ajax({
		sync:true,
		url:'common/workCalendar/list',
		type:'post',
		cache: false,
		dateType:'json',
		data:$("#common-calendar-form").serialize(),
		success:function(data){
			console.log(data);
			//成功
			if(data.resultCode == 1){
				var daySize = data.object.daySize;
				var month = data.object.month;
				var year = data.object.year;
				var list = data.object.list;
				var map = data.object.map;
				$.common.workCalendarAB.yearSelectedInit(year);
				$.common.workCalendarAB.monthSelectedInit(month);
				$.common.workCalendarAB.calendartbodyInit(year,month,daySize,list);
			}else{
				$.toast(data['message']);
			}
		}
	});
};

//初始化年选择
$.common.workCalendarAB.yearSelectedInit = function(year){
	$('#common-calendar-yearValue').val(year)
	$('#common-calendar-year').empty();
	var today = new Date();
	for (var i = today.getFullYear() - 5; i <= today.getFullYear() + 3; i++) {
		$('#common-calendar-year').append("<option value='" + i + "'" + (year == i ? " selected = 'selected'":"") + ">" + i + "</option>");
	};
};

//初始化月选择
$.common.workCalendarAB.monthSelectedInit = function(month){
	$('#common-calendar-monthValue').val(month)
	$('#common-calendar-month').empty();
	for (var i = 1; i <= 12; i++) {
		$('#common-calendar-month').append("<option value='" + i + "'" + (month == i ? " selected = 'selected'":"") +  ">" + i + "</option>");
	}
};

//设置日历表头复选框
$.common.workCalendarAB.calendarHeadCheckboxInit = function(){
	var ths = $('#common-calendarTable thead tr th');
	for(var i = 0;i<ths.length;i++){
		(function(i){
			var obj = $(ths[i]).children("input[type=checkbox]");
			//复选框改变
			obj.click(function(){
				var v = !$(this).prop("checked");
				$(this).prop("checked",v);
				var trs = $("#common-calendar-tbody tr");
				for(var k = 0;k<trs.length;k++){
					$(($(trs[k]).children())[i]).children("input[type=checkbox]").prop("checked",v);
				}
			});
			//单元格单击事件
			$(ths[i]).click(function(){
				var me = $(this).children("input[type=checkbox]");
				var checked = !me.prop("checked");
				me.prop("checked",checked);
				var trs = $("#common-calendar-tbody tr");
				for(var k = 0;k<trs.length;k++){
					$(($(trs[k]).children())[i]).children("input[type=checkbox]").prop("checked",checked);
				}
			});
		})(i);
	}	
};

//初始化日历表格
$.common.workCalendarAB.calendartbodyInit = function(year,month,daySize,list){
	//根据时间获取星期几
	var s = new Date(year+"/" + month + "/1").getDay();
	var tbody = $("#common-calendar-tbody");
	tbody.empty();
	for(var r=0, i=0, d=0; r<6; r++){
		var t_tr =$("<tr></tr>"); 
    	for (var c=0; c<7; c++, i++) {
    		var t_td = $("<td id=''></td>");
    		var t_checkbox = $('<input style="cursor:pointer;"	type="checkbox">');
    		//格式化checkbox的单击事件
    		t_checkbox.click(function(){
    			if($(this).prop("checked")){
					$(this).prop("checked",false);
				}else{
					$(this).prop("checked",true);
				}
    		});
    		if (i>=s && d<daySize) {
				d++;
				t_td.append(t_checkbox);
				t_td.append("<span  style='font-size:14px;float:right;margin-right:4px;'>" + d + "</span>");
				//设置初始化日历单元格背景颜色
				for(var n = 0;n<list.length;n++){
					if(list[n].dayValue == d){
						t_td.prop("id",list[n].id);
						$.common.workCalendarAB.calendartBgColorInit(t_td,list[n].workdateType,list[n].morningShift);
					}
				}
				//单元格绑定单击事件改变复选框事件
				t_td.click(function(){
					if($(this).children("input[type=checkbox]").prop("checked")){
						$(this).children("input[type=checkbox]").prop("checked",false);
					}else{
						$(this).children("input[type=checkbox]").prop("checked",true);
					}
				});
    		}
    		//添加td
    		t_tr.append(t_td);
    	}
    	//添加tr
    	tbody.append(t_tr);
	}
};


//保存
$.common.workCalendarAB.calendarsave = function(workdateType,shift){
    var month = $('#common-calendar-month').val();
    var year = $('#common-calendar-year').val();
    var calendarType = $('#common-calendar-calendarType').val();
    var produceLine = $('#common-calendar-produceLine').val();
	var tds = $("#common-calendar-tbody td");
	var list = new Array();
	var morningShift = "";
	var nightShift = "";
	if(shift == "A"){
		morningShift = "A";
		nightShift = "B"
	}else if(shift == "B"){
		morningShift = "B";
		nightShift = "A"
	}
	for(var i = 0;i<tds.length;i++){
		if($(tds[i]).text()){
			var obj = $(tds[i]).children("input[type=checkbox]");
			if(obj.prop("checked")){
				list.push({"id":$(tds[i]).prop("id"),"dayValue":$(tds[i]).text(),"monthValue":month,"yearValue":year,"calendarType":calendarType,"produceLine":produceLine,"workdateType":workdateType,"morningShift":morningShift,"nightShift":nightShift});
			}
		}
	}
	console.log(list);
	if(list.length<1){
		$.toast('无选中日历');
		return;
	}
	var lists = JSON.stringify(list);
	$.ajax({
		url:'common/workCalendar/saveAll',
		sync:true,
		cache: false,
		type:'post',
		data:{
				list:lists
			},
		dataType:'json',
		success:function(json){
		if(json.resultCode == 1){
			//刷新页面
			$.common.workCalendarAB.initData();
			$.toast('保存成功');
		}else{
			$.toast(json['message']);
		}
		}
	});
};

//设置日历背景色颜色
$.common.workCalendarAB.calendartBgColorInit = function(obj,v1,v2){
	//无设置
	var backgroundColor = "";
	if(v1 == 1){
		//非工作日
		backgroundColor = '#cccccc';
	}else if(v1 == 0){
		if(v2 == "A"){
			//工作日 A班
			backgroundColor = '#0AF047';
		}else{
			//工作日 B班
			backgroundColor = '#F7EF02';
		}
	}
	obj.css('backgroundColor', backgroundColor);
}


