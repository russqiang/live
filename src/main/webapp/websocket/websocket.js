var ws;
var index = 0;
var socketCreated = false;
var isLogout = false;
var liveCode = "${liveCode}";
// 页面一加载就执行
$(function() {
	// 判断浏览器是否支持WebSocket
	if (!window.WebSocket || window.MozWebSocket) {
		$(".d_mask").append(
				"<span style='color:red;'>浏览器不支持WebSocket，请更换浏览器！</span><br/>");
	}
	
	// 绑定消息发送事件
	$("#btn").click(function() {
		var msg = $(".s_text").val().trim();
		if (msg != "") {
			ws.send("客户端说:" + msg + "<br/>");
		}
		$(".s_text").val("");
	});

	// 给连接按钮绑定点击事件
	$(function() {
		// 0：正在连接 1：已连接 2：正在关闭连接 3：已关闭连接
		
		if (socketCreated && (ws.readyState == 0 || ws.readyState == 1)) {// 已经连接了
			ws.send("<span style='color:blue;font-weight:bold'>[" + "localhost"
					+ "]离开了聊天室...</span><br/>")
			socketCreated = false;
			isLogout = true;
			ws.close();// 关闭连接
		} else {// 还没连接
			// 申请WebSocket对象
			if ("WebSocket" in window) {
				alert(liveCode);
				ws = new WebSocket("ws://192.168.0.146/live/websocket/"+liveCode);
				alert("newhou");
			} else if ("MozWebSocket" in window) {
				ws = new MozWebSocket("ws://192.168.0.146/live/websocket");
			}
			socketCreated = true;
			isLogout = false;
			// 注册事件
			
			ws.onopen = wsOnOpen;// 获得连接时
			ws.onmessage = wsOnMessage;// 接收消息时
			ws.onclose = wsOnClose;// 关闭连接时
			ws.onerror = wsOnError;// 处理发生错误时(消息发送错误、连接错误)
		}
	});

})

function wsOnOpen() {
	ws.send("<span style='color:red;font-weight:bold'>[" + "localhost"
			+ "]进入了聊天室...</span><br/>");
}

function wsOnMessage(event) {
	var str = event.data;
	var use_mes = "";
	$(".d_mask").append(str);
	var str1 = str.substring(0, str.length - 5);
	var s = str1.split("说:");
	for (var i = 0; i < s.length; i++) {
		use_mes = s[1];
	}
	if (use_mes) {
		$("#d_show").append("<div id='" + index + "'>" + use_mes + "</div>");
		launch();
	}
	scollText();
}
/* 消息滚动到可见区域 */
function scollText() {
	var scrollTop = $(".d_mask")[0].scrollHeight;
	$(".d_mask").scrollTop(scrollTop);
}

/*
 * function demo() { return ("你看，直接返回了"); } var a = demo() + ",返回第一次"; var b =
 * demo() + ",返回第两次"; alert(a); alert(b);
 */

function wsOnClose() {
	ws.close();
}

function wsOnError() {
	$(".d_mask").append("连接错误，请检查...<br/>");
}
$(document).keydown(function(event) {
	if (event.keyCode == 13) {
		$("#btn").click();
	}
})


// 发送消息
function send() {
	// var message = document.getElementById('text').value;
	var message = $(".s_text").val();
	$(".s_text").val("");
	websocket.send(message);
}