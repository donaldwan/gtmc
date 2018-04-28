/******************修改人：高晓丹   start********************************/
//用户属性扩展匹配正则表达式
$.validator.addMethod("checkRegular", function(value, element) {
	 var regular = eval($(element).attr("regular"));
	 if(regular == '' || regular == null || regular == undefined){
		 return true;
	 }
	 return this.optional(element) ||regular.test(value);
}, "输入格式不正确！");
//电话（长度15,数字+‘-’）
$.validator.addMethod("checkTelepone", function(value, element) {
	var telephone = /^[0-9-]{0,15}$/;
	return this.optional(element) ||telephone.test(value);
}, "电话号码只能包含数字和'-'");

//邮箱
$.validator.addMethod("checkEmail", function(value, element) {
	return this.optional(element) || /^[_A-Za-z0-9]+@([_A-Za-z0-9]+\.)+[A-Za-z0-9]{2,3}$/.test(value);
}, "邮箱格式不正确");

//日期
$.validator.methods.compareDate = function(value, element, param){
	var endDate = $(param).val();
    var date1 = new Date(Date.parse(value.replace("-", "/")));
    var date2 = new Date(Date.parse(endDate.replace("-", "/")));
    if(endDate.trim()!='' && value !=''){
   	 return date1 <= date2;
    }else{
   	 return true;
    }
};
$.validator.methods.compareNowDate = function(value, element){
	var nowDate = new Date();
	var nowDateStr = nowDate.getFullYear()+"-"+(nowDate.getMonth()+1)+"-"+nowDate.getDate();
	var date1 = new Date(Date.parse(nowDateStr.replace("-", "/")));
	var date2 = new Date(Date.parse(value.replace("-", "/")));
	if(value.trim()!='' && nowDateStr !=''){
		return date1 <= date2;
	}else{
		return true;
	}
};
//不能与对应的输入值相同
$.validator.addMethod("equalNo", function(value, element,params) {
	return $(params,this.currentForm).val() != value;
}, "值不能相同");
/******************修改人：高晓丹   end********************************/


$.extend($.validator.messages, {
    required: "不能为空",
    remote: "请修正该字段",
    email: "请输入正确格式的电子邮件",
    url: "请输入合法的网址",
    date: "请输入合法的日期",
    dateISO: "请输入合法的日期 (ISO).",
    number: "请输入合法的数字",
    digits: "只能输入整数",
    creditcard: "请输入合法的信用卡号",
    equalTo: "请再次输入相同的值",
    accept: "请输入拥有合法后缀名的字符串",
    maxlength: $.validator.format("请输入一个长度最多是 {0} 的字符串"),
    minlength: $.validator.format("请输入一个长度最少是 {0} 的字符串"),
    rangelength: $.validator.format("请输入一个长度介于 {0} 和 {1} 之间的字符串"),
    range: $.validator.format("请输入一个介于 {0} 和 {1} 之间的值"),
    max: $.validator.format("请输入一个最大为 {0} 的值"),
    min: $.validator.format("请输入一个最小为 {0} 的值")
});
$.validator.setDefaults({
	highlight : function(element) {
		$(element).closest('div.form-group').removeClass('has-success').addClass('has-error');
	},
	unhighlight : function(element) {
		$(element).closest('div.form-group').removeClass('has-error').addClass('has-success');
	},
	errorElement : 'span',
	errorClass : 'help-block',
	errorPlacement : function(error, element) {
		if (element.parent('.input-group').length) {
			error.insertAfter(element.parent());
		} else {
			error.insertAfter(element);
		}
	}
});