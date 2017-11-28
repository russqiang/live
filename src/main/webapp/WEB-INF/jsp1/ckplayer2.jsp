<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
body, td, th {
	font-size: 14px;
	line-height: 26px;
}

body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

#screen_div {
	position: relative;
}

#a2 {
	width: 66%;
	height: 640px;
}
</style>
</head>
<body>
	<center>
		<div id="screen_div">
			<div id="a2"></div>
		</div>
	</center>
	<script type="text/javascript" src="moban/ckplayer/ckplayer.js"
		charset="utf-8"></script>

	<script type="text/javascript">
		var liveCode = "${anchor.liveCode}";
		var flashvars = {
			f : 'rtmp://192.168.0.112/hls/' + liveCode,
			lv : '1',//是否是直播流，=1则锁定进度栏
			wh : '16:9',//宽高比
			v : '80',//默认音量，0-100之间
			p : '1',//视频默认0是暂停，1是播放，2是不加载视频
			c : 0
		};
		var params = {
			bgcolor : '#FFF',
			allowFullScreen : true,
			allowScriptAccess : 'always'
		};//这里定义播放器的其它参数如背景色（跟flashvars中的b不同），是否支持全屏，是否支持交互
		var video = [ 'http://movie.ks.js.cn/flv/other/1_0.mp4->video/mp4' ];
		CKobject.embed('moban/ckplayer/ckplayer.swf', 'a2', 'ckplayer_a1',
				'100%', '100%', false, flashvars, video, params);
	</script>
	<script type="text/javascript">
		var ws;
		var index = 0;
		var socketCreated = false;
		var isLogout = false;
		var liveCode = "${anchor.liveCode}";
		var existUserNickName = "${exitsUser.nickName }";
		if (existUserNickName == "") {
			existUserNickName = "游客";
		}
		// 页面一加载就执行
		var index = 0;
		$(function() {
			// 判断浏览器是否支持WebSocket
			if (!window.WebSocket || window.MozWebSocket) {
				$(".barrage")
						.append(
								"<span style='color:red;'>浏览器不支持WebSocket，请更换浏览器！</span><br/>");
			}
			// 绑定消息发送事件
			$("#ligetCode").click(function() {
				var msg = $("#liphoneCode").val().trim();
				if (msg != "") {
					ws.send(existUserNickName + "说:" + msg + "<br/>");
				}
			});

			// 给连接按钮绑定点击事件
			$(function() {
				// 0：正在连接 1：已连接 2：正在关闭连接 3：已关闭连接
				if (socketCreated && (ws.readyState == 0 || ws.readyState == 1)) {// 已经连接了
					ws.send("<span style='color:blue;font-weight:bold'>["
							+ existUserNickName + "]离开了聊天室...</span><br/>")
					socketCreated = false;
					isLogout = true;
					ws.close();// 关闭连接
				} else {// 还没连接
					// 申请WebSocket对象
					if ("WebSocket" in window) {
						ws = new WebSocket("ws://192.168.0.146/live/websocket/"+ liveCode);

					} else if ("MozWebSocket" in window) {
						ws = new MozWebSocket("ws://192.168.0.146/live/websocket/" + liveCode);
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
			ws.send("<span style='color:red;font-weight:bold'>["
					+ existUserNickName + "]进入了聊天室...</span><br/>");
		}
		var fuc = function() {
			return 1;
		}

		function wsOnMessage(event) {
			var str = event.data;
			var use_mes = "";
			$(".barrage").append(str);
			var str1 = str.substring(0, str.length - 5);
			var s = str1.split("说:");
			for (var i = 0; i < s.length; i++) {
				use_mes = s[1];
			}
			if (use_mes) {
				$("#d_show").append(
						"<div id='" + index + "'>" + use_mes + "</div>");
				launch();
			}
			scollText();
			$("#liphoneCode").val("");

		}
		/* 消息滚动到可见区域 */
		function scollText() {
			var scrollTop = $(".barrage")[0].scrollHeight;
			$(".barrage").scrollTop(scrollTop);
		}
		function wsOnClose() {

		}

		function wsOnError() {
			$(".barrage").append("连接错误，请检查...<br/>");
		}
		$(document).keydown(function(event) {
			if (event.keyCode == 13) {
				$("#ligetCode").click();
			}
		})

		// 发送消息
		function send() {
			// var message = document.getElementById('text').value;
			var message = $("#liphoneCode").val();
			$("#liphoneCode").val("");
			websocket.send(message);
		}
	</script>
</body>
</html>