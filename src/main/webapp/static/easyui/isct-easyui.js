$.extend({
	/**
	 *无阻碍消息提醒 
	*/
	toast:function(msg){
		top.showMsg(msg);
	},
	
	win:function(o){
		var winId = o['winId']?o['winId']:'win_' + new Date().getTime();
		
		var html = '<div style="padding:5px;" id="' + winId + '"></div>';
		var buttons = '';
		if(o.buttons){
			for(var i=0;i<o.buttons.length;i++){
				var bt = o.buttons[i];
				buttons += '&nbsp;<a id="win-bt-' + i +'" href="#">' + bt['text'] + '</a>';
			}
		}
		
		html += '<div id="footer" style="padding:5px;text-align:right;">' + buttons + '</div>';
		$(document.body).append(html);
		
		if(o.buttons){
			for(var i=0;i<o.buttons.length;i++){
				var bt = o.buttons[i];
				$('#win-bt-' + i).linkbutton({
					iconCls:bt['iconCls']
				});
				$('#win-bt-' + i).click(bt.handler);
			}
		}
		
		var fun = null;
		if(o['onClose']){
			fun = o['close'];
		}
		
		o['onClose'] = function(ev,ui){
			if(fun != null){
				fun();
			}
			$(this).window("destroy");
		};
		
		if(!o['width'])o['width'] = $(window).width() * 0.8;
		if(!o['height'])o['height'] = $(window).height() * 0.8;
		
		o['modal'] = o['modal'] != undefined?o['modal']:true;
		o['minimizable'] = false;
		o['collapsible'] = false;
		o['title'] = o['title']?o['title']:' ';
		o['href'] = o.href;
		o['footer'] = '#footer';
		o['closable'] = false;
//		o['onLoad'] = function(){
//			
//		};
		$('#' + winId).window(o);
		return winId;
	}
});

/**
 * 对Ajax提交进行全局的设置
 */
$.ajaxSetup({
	headers:{
		'Author':'isct.com.cn'
	},
	beforeSend:function(xhr){
		var url = this['url'];
		console.log(url);
		if(this['sync']){
			if(!window.sendUrls){
				window.sendUrls = {};
			}
			if(window.sendUrls[url]){
				var sendTime = window.sendUrls[url];
				var now = new Date();
				if(now.getTime() - sendTime.getTime()<1000){
					$.toast('数据提交过于频繁!');
					return false;
				}
			}
			window.sendUrls[url] = new Date();
		}
		console.log(url);
		if(url.indexOf('?')>-1){
			this['url'] = url + '&_date=' + new Date().getTime();
		}else{
			this['url'] = url + '?_date=' + new Date().getTime(); 
		}
		return true;
	},
	complete:function(xhr,ts){
		if(xhr['status'] == 200 && $.trim(xhr['responseText']) == 'timeout'){
			window.top.location = 'login';
			return;
		}
		if(this['sync']){
		}
		
	}
});