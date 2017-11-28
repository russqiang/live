/*
 * var socketCreated = false; var isLogout = false; var host =
 * window.location.host; // 页面一加载就执行 $(function() { // $("#sendBox").hide(); //
 * 判断浏览器是否支持WebSocket if (window.WebSocket || window.MozWebSocket) {
 * $("#chatContainer") .append( "<span
 * style='color:green;'>您的浏览器支持WebSocket，您可以尝试连接到聊天服务器！</span><br/>");
 * $("#conUrl").val(host + "/mysocket/websocket"); } else {
 * $("#chatContainer").append( "<span
 * style='color:red;'>浏览器不支持WebSocket，请更换浏览器！</span><br/>"); } // 绑定消息发送事件
 * $("#sendMsgBtn").click(function() { var msg = $("#msgContent").val().trim();
 * if (msg != "") { ws.send($("#loginUser").val() + "说：" + msg + "<br/>"); }
 * $("#msgContent").val(""); });
 *  // 给连接按钮绑定点击事件
 * 
 * $(function() { // 0：正在连接 1：已连接 2：正在关闭连接 3：已关闭连接 if (socketCreated &&
 * (ws.readyState == 0 || ws.readyState == 1)) {// 已经连接了 ws.send("<span
 * style='color:blue;font-weight:bold'>[" + $("#loginUser").val() + "]离开了聊天室...</span><br/>")
 * socketCreated = false; isLogout = true; ws.close();// 关闭连接
 * 
 * $("#conBtn").html("连接");//修改按钮文字 $("#sendBox").hide(); } else {// 还没连接 //
 * 申请WebSocket对象 if ("WebSocket" in window) { ws = new WebSocket("ws://" +
 * $("#conUrl").val()); } else if ("MozWebSocket" in window) { ws = new
 * MozWebSocket("ws://" + $("#conUrl").val()); } socketCreated = true; isLogout =
 * false;
 * 
 * $("#conBtn").html("断开");//修改按钮文字 // 注册事件 ws.onopen = wsOnOpen;// 获得连接时
 * ws.onmessage = wsOnMessage;// 接收消息时 ws.onclose = wsOnClose;// 关闭连接时
 * ws.onerror = wsOnError;// 处理发生错误时(消息发送错误、连接错误) } }); });
 * 
 * function wsOnOpen() { ws.send("<span style='color:red;font-weight:bold'>[" +
 * $("#loginUser").val() + "]进入了聊天室...</span><br/>"); $("#sendBox").show(); }
 * 
 * function wsOnMessage(event) { $("#chatContainer").append(event.data);
 * scollText(); }
 * 
 * function wsOnClose() {
 *  }
 * 
 * function wsOnError() { $("#chatContainer").append("连接错误，请检查...<br/>"); }
 * $(document).keydown(function(event) { if (event.keyCode == 13) {
 * $("#sendMsgBtn").click(); } })
 * 
 * function scollText() { //
 * $("#msg_output").append("admin:"+$("#talk").val()+"\n"); var scrollTop =
 * $("#chatContainer")[0].scrollHeight;
 * $("#chatContainer").scrollTop(scrollTop); // $("#talk").val(""); }
 */