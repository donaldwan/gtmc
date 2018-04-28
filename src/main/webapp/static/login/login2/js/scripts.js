
jQuery(document).ready(function() {
	
    /*
     *   FullScreen background
     *   设置图片背景
     */
    $.backstretch("static/login/login2/img/backgrounds/1.jpg");
    
    /*
     *	Form validation
     *	重新输入时去除错误信息
     */
    $('.login-form input[type="text"], .login-form input[type="password"], .login-form textarea').on('focus', function() {
    	$(this).removeClass('input-error');
    });
    
    /*
     *	 用户名密码空值检查
     */
    $('.login-form').on('submit', function(e) {
    	
    	$(this).find('input[type="text"], input[type="password"], textarea').each(function(){
    		if( $(this).val() == "" ) {
    			e.preventDefault();
    			$(this).addClass('input-error');
    		}
    		else {
    			$(this).removeClass('input-error');
    		}
    	});
    	
    });
    
    
});
