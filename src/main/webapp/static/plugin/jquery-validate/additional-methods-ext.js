/**
 * form自定义验证
 * 格式如下
 */
(function($){
	/*
	 *value:验证的值 
	 *验证返回的信息，为自定义信息
	 * */
	$.validator.addMethod("test", function(value, element) {
		return this.optional(element) || /^90[2-5]\d\{2\}-\d{4}$/.test(value);
	}, "请输入正确的手机号码");
})(jQuery)

