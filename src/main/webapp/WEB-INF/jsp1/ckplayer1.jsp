<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	#a2{
		position:absolute;
		width:66%;
		height:640px;
		z-index:5;
	}
	
</style>
</head>
<body>
	
	<div id="a2"></div>
	<script type="text/javascript" src="moban/ckplayer/ckplayer.js" charset="utf-8"></script>
	<script type="text/javascript">
		var width = $('#a2').width();
		var _top = $('.callbacks_container').offset().top;
		var left = ($(window).width() - width)/2 ;
		$("#a2").css("top",_top);
		$("#a2").css("left",left);
		$(window).resize(function(){ 
			var width = $('#a2').width();
			var _top = $('.callbacks_container').offset().top;
			var left = ($(window).width() - width)/2 ;
			$("#a2").css("top",_top);
			$("#a2").css("left",left);
		})
	</script>
	<script type="text/javascript">
		var liveCode = "${anchor.liveCode}";
		var flashvars={
		    //f:'http://movie.ks.js.cn/flv/other/1_0.mp4',
		    f:'rtmp://192.168.0.112/hls/'+liveCode,
		    lv:'1',//是否是直播流，=1则锁定进度栏
		    wh:'16:9',//宽高比
		    v:'80',//默认音量，0-100之间
		    p:'1',//视频默认0是暂停，1是播放，2是不加载视频
		    c:0
		};
		var params={bgcolor:'#FFF',allowFullScreen:true,allowScriptAccess:'always'};//这里定义播放器的其它参数如背景色（跟flashvars中的b不同），是否支持全屏，是否支持交互
		var video=['http://movie.ks.js.cn/flv/other/1_0.mp4->video/mp4'];
		CKobject.embed('moban/ckplayer/ckplayer.swf','a2','ckplayer_a1','100%','100%',false,flashvars,video,params);
	</script>
	
</body>
</html>