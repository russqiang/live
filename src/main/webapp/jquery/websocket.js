var websocket=null;
var _top=80;
var index=0;
var host=window.location.host;
//判断当前浏览器是否支持WebSocket
if('WebSocket' in window){
var url = "ws://"+host+"/live/websocket";
//alert(url);
websocket=new WebSocket(url);
}
else{
alert("Not Support WebSocket!");
}

//弹幕开始
//按钮发送消息
$("#btn").click(function() {
	send();
});

//回车发送消息
$(".s_text").keydown(function() {
	var code = window.event.keyCode;

	if (code == 13)//回车键按下时，输出到弹幕

	{
		send();
	}
});




function launch() {

	var _height = $(window).height();
	var _left = $(window).width() - $("#" + index).width();
	var time = 10000;
	if (index % 2 == 0)
		time = 20000;
	_top += 40;
	if (_top > _height - 100)
		_top = 80;
	$("#" + index).css({
		left : _left,
		top : _top,
		color : getRandomColor()

	});
	$("#" + index).animate({
		left : "-" + _left + "px"
	}, time, function() {
		$("#" + index).remove();
	});
	index++;
}


/* //初始化弹幕
function init_screen() {
var _top = 0;
var _height = $(window).height();
$(".d_show").find("div").show().each(function() {
var _left = $(window).width() - $(this).width();
var time=10000;
if($(this).index()%2==0)
time=20000;
_top+=80;
if(_top>_height-100)
_top=80;
$(this).css({
left:_left,
top:_top,
color:getRandomColor()

});
$(this).animate({
left:"-"+_left+"px"},
time,
function(){});


});
} */

//随机获取颜色值
function getRandomColor() {
	return '#' + (function(h) {
		return new Array(7 - h.length).join("0") + h
	})((Math.random() * 0x1000000 << 0).toString(16))
}
//弹幕结束

//连接发生错误的回调方法
websocket.onerror = function(){
    setMessageInnerHTML("error");
};
 
//连接成功建立的回调方法
websocket.onopen = function(event){
    setMessageInnerHTML("open");
}
 
//接收到消息的回调方法
websocket.onmessage = function(){
    setMessageInnerHTML(event.data);
}
 
//连接关闭的回调方法
websocket.onclose = function(){
    setMessageInnerHTML("close");
}


//监听窗口关闭事件，当窗口关闭时，主动去关闭websocket连接，防止连接还没断开就关闭窗口，server端会抛异常。
window.onbeforeunload = function(){
    websocket.close();
}


//将消息显示在网页上
function setMessageInnerHTML(innerHTML){
$("#d_show").append("<div id='"+index+"'>"+ innerHTML + "</div>");
launch();
}


//发送消息
function send(){
    var message = $(".s_text").val();
    if(message==""){
    	return;
    }
    $(".s_text").val("");
    websocket.send(message);
}