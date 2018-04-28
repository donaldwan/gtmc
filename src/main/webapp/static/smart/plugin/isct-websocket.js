/**
 * websocket相关js接口API
 */
$.namespace('websocket');

/**
 * 判断是否是处于连接状态,默认false
 */
$.websocket.isConnect = false;

/**
 * socket对象
 */
$.websocket.socketClient = null;


$.websocket.openEvents = {};
$.websocket.errorEvents = {};
$.websocket.closeEvents = {};
$.websocket.messageEvents = {};

/**
 * 注册业务事件
 * o.code:业务标示
 * o.onopen:连接接通事件
 * o.onerror:连接失败事件
 * o.onclose:连接关闭事件
 * o.onmessage:接收到消息事件
 */
$.websocket.regsiter = function(o){
	if(!o['code']){
		throw "the code has not value!";
	}
	
	if(o.onopen){
		$.websocket.openEvents[o['code']] = o.onopen;
	}
	if(o.onerror){
		$.websocket.errorEvents[o['code']] = o.onerror;
	}
	if(o.onclose){
		$.websocket.closeEvents[o['code']] = o.onclose;
	}
	if(o.onmessage){
		$.websocket.messageEvents[o['code']] = o.onmessage;
	}
};

/**
 * 删除注册
 */
$.websocket.unRegsiter = function(code){
	var array = new Array();
	$.each($.websocket.events,function(i,n){
		if(!n['code'] == code){
			array.push(n);
		}
	});
	$.websocket.events = array;
};

/**
 * 发送消息
 * @param:code:业务代码
 * @param:data:业务数据
 */
$.websocket.send = function(code,data){
	var sendData = {code:code,data:data};
	if($.websocket.socketClient == null || !$.websocket.isConnect){
		$.websocket.init({success:function(){
			$.websocket.socketClient.send(JSON.stringify(sendData));
		}});
	}else{
		$.websocket.socketClient.send(JSON.stringify(sendData));
	}
};

/**
 * 初始化socket对象
 */
$.websocket.init = function(o){
	 if($.websocket.isConnect){
		 if(o && o['success'] && $.isFunction(o['success'])){
			 o.success();
		 }
		 return;
	 }
	 
	 /*
	 for(var a in window.location){
		 console.log(a + ':===>' + window.location[a]);
	 }
	 */
	 var curWwwPath = window.document.location.href;
    var pathName = window.document.location.pathname;
    var pos = curWwwPath.indexOf(pathName);
    var localhostPaht = curWwwPath.substring(0, pos);
    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
    var url = localhostPaht + projectName + '/ws';
     
    var protocol = window.location.protocol;
    url = url.replace(protocol,'ws:');
    
    //var url = 'ws://localhost:8080/isct-web/ws'
    
    console.log('url:::' + url);
    if ('WebSocket' in window) {  
    	$.websocket.socketClient = new WebSocket(url);  
    } else if ('MozWebSocket' in window) {  
    	$.websocket.socketClient = new MozWebSocket(url);  
    } else {  
    	throw '浏览器不支持WebSocket!';
     } 
     //连同事件
    $.websocket.socketClient.onopen = function(event){
    	$.websocket.isConnect = true;
    	if(o && o['success'] && $.isFunction(o['success'])){
			 o.success();
		}
    	for(var k in $.websocket.openEvents){
    		$.websocket.openEvents[k](event);
    	}
     };
     
     //连接失败
    $.websocket.socketClient.onerror = function(event){
    	$.websocket.isConnect = false;
    	for(var k in $.websocket.errorEvents){
    		$.websocket.errorEvents[k](event);
    	}
     };
     
	 //连接关闭
    $.websocket.socketClient.onclose = function(event){
    	$.websocket.isConnect = false;
    	for(var k in $.websocket.closeEvents){
    		$.websocket.closeEvents[k](event);
    	}
     };
     
     //收到消息
    $.websocket.socketClient.onmessage = function(event){
    	for(var k in $.websocket.messageEvents){
    		$.websocket.messageEvents[k](event);
    	}
     };
}
/**
 * 关闭连接
 */
$.websocket.disconnect = function(){
	if ($.websocket.socketClient != null) {
		$.websocket.socketClient.close();
		$.websocket.socketClient = null;
    }
}