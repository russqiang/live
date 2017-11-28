<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
body,td,th {
	font-size: 14px;
	line-height: 26px;
}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
p {
	margin-top: 5px;
	margin-right: 0px;
	margin-bottom: 0px;
	margin-left: 0px;
	padding-left: 10px;
}

.d_show {
	position: relative;
	z-index: 2;
}

.d_show div {
	width:auto;
	font-size: 26px;
	line-height: 36px;
	font-weight: 400;
	position: absolute;
	background-color:green;
	top: 76px;
	left: 10;
	color: #fff;
}

 .d_mask {
	/* position:relative;
	width:100%;
	 */
	
	/* width: 100%; */
	/* height: 50%; */
	/* background: #000; */
	width:100%;
	height: 90%;
	/* background: red; */
	position:absolute;
	top: 0px;
	left: 0px; 
	x:0;
	y:0;
	opacity: 0.6;
	filter: alpha(opacity = 60);
	z-index: 9999;
}
#screen_div{
	
	position:relative;
}

#a1{
	position:relative;
	width:100%;
	height:100%;
	/* z-index: 100; */
	/* width:900px; */
	/* height:700px; */
	/* overflow:hidden; */
}
	#a2{
		width:66%;
		height:640px;
	}
	
</style>
</head>
<body>
	
	<center>
		<div id="screen_div">
			<div id="a2">
				<!-- <div id="d_show" class="d_show"></div> -->
			</div>
			<div id="d_mask" class="d_mask"></div>
		</div>
	</center>
	<script type="text/javascript" src="moban/ckplayer/ckplayer.js" charset="utf-8"></script>

	<script type="text/javascript">
		var liveCode = "${anchor.liveCode}";
		var flashvars={
		    //f:'http://movie.ks.js.cn/flv/other/1_0.mp4',
		    f:'rtmp://192.168.0.112/hls/'+ liveCode,
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