<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>ckplayer6.8</title>
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
#a1{
	/* position:relative; */
	/* z-index: 100; */
	width:600px;
	height:400px;
	/* float: left; */
}
</style>
<script type="text/javascript" src="js/offlights.js"></script>
</head>

<body>
<center>
<div id="a1"></div>
</center>
<!--
上面一行是播放器所在的容器名称，如果只调用flash播放器，可以只用<div id="a1"></div>
-->
<script type="text/javascript" src="js/ckplayer.js" charset="utf-8"></script>
<script type="text/javascript">
	//如果你不需要某项设置，可以直接删除，注意var flashvars的最后一个值后面不能有逗号
	function loadedHandler(){
		if(CKobject.getObjectById('ckplayer_a1').getType()){//说明使用html5播放器
			alert('播放器已加载，调用的是HTML5播放模块');
		}
		else{
			alert('播放器已加载，调用的是Flash播放模块');
		}
	}
	var flashvars={
		//f:'http://img.ksbbs.com/asset/Mon_1605/0ec8cc80112a2d6.mp4',//视频地址
		f:'rtmp://192.168.0.112/hls/1004',
		a:'',//调用时的参数，只有当s>0的时候有效
		s:'0',//调用方式，0=普通方法（f=视频地址），1=网址形式,2=xml形式，3=swf形式(s>0时f=网址，配合a来完成对地址的组装)
		c:'0',//是否读取文本配置,0不是，1是
		x:'',//调用配置文件路径，只有在c=1时使用。默认为空调用的是ckplayer.xml
		i:'http://www.ckplayer.com/static/images/cqdw.jpg',//初始图片地址
		d:'http://www.ckplayer.com/down/pause6.1_1.swf|http://www.ckplayer.com/down/pause6.1_2.swf',//暂停时播放的广告，swf/图片,多个用竖线隔开，图片要加链接地址，没有的时候留空就行
		u:'',//暂停时如果是图片的话，加个链接地址
		y:'',//这里是使用网址形式调用广告地址时使用，前提是要设置l的值为空
		v:'80',//默认音量，0-100之间
		p:'1',//视频默认0是暂停，1是播放，2是不加载视频
		h:'3',//播放http视频流时采用何种拖动方法，=0不使用任意拖动，=1是使用按关键帧，=2是按时间点，=3是自动判断按什么(如果视频格式是.mp4就按关键帧，.flv就按关键时间)，=4也是自动判断(只要包含字符mp4就按mp4来，只要包含字符flv就按flv来)
		q:'',//视频流拖动时参考函数，默认是start
		m:'',//让该参数为一个链接地址时，单击播放器将跳转到该地址
		o:'',//当p=2时，可以设置视频的时间，单位，秒
		w:'',//当p=2时，可以设置视频的总字节数
		g:'',//视频直接g秒开始播放
		j:'',//跳过片尾功能，j>0则从播放多少时间后跳到结束，<0则总总时间-该值的绝对值时跳到结束
		k:'32|63',//提示点时间，如 30|60鼠标经过进度栏30秒，60秒会提示n指定的相应的文字
		wh:'16:9',//宽高比，可以自己定义视频的宽高或宽高比如：wh:'4:3',或wh:'1080:720'
		lv:'1',//是否是直播流，=1则锁定进度栏
		loaded:'loadedHandler',//当播放器加载完成后发送该js函数loaded
		//调用播放器的所有参数列表结束
		//以下为自定义的播放器参数用来在插件里引用的
		my_title:'演示视频标题文字',
		my_url:encodeURIComponent(window.location.href)//本页面地址
		//调用自定义播放器参数结束
		};
	var params={bgcolor:'#FFF',allowFullScreen:true,allowScriptAccess:'always'};//这里定义播放器的其它参数如背景色（跟flashvars中的b不同），是否支持全屏，是否支持交互
	var video=['http://img.ksbbs.com/asset/Mon_1605/0ec8cc80112a2d6.mp4->video/mp4'];
	CKobject.embed('ckplayer/ckplayer.swf','a1','ckplayer_a1','100%','100%',false,flashvars,video,params);
	/*
		以上代码演示的兼容flash和html5环境的。如果只调用flash播放器或只调用html5请看其它示例
	*/

	var _nn=0;//用来计算实时监听的条数的，超过100条记录就要删除，不然会消耗内存
	
	function getstart(){
		var a=CKobject.getObjectById('ckplayer_a1').getStatus();
		var ss='';
		for (var k in a){
			ss+=k+":"+a[k]+'\n';
		}
		alert(ss);
	}
	function ckadjump(){
		alert('这里演示了点击跳过广告按钮后的执行的动作，如果注册会员可以做成直接跳过的效果。');
	}
	//开关灯
	var box = new LightBox();
	function closelights(){//关灯
		box.Show();
		CKobject._K_('a1').style.width='940px';
		CKobject._K_('a1').style.height='550px';
		CKobject.getObjectById('ckplayer_a1').width=940;
		CKobject.getObjectById('ckplayer_a1').height=550;
	}
	function openlights(){//开灯
		box.Close();
		CKobject._K_('a1').style.width='600px';
		CKobject._K_('a1').style.height='400px';
		CKobject.getObjectById('ckplayer_a1').width=600;
		CKobject.getObjectById('ckplayer_a1').height=400;
	}
	function changePrompt(){
		CKobject.getObjectById('ckplayer_a1').promptUnload();//卸载掉目前的
		CKobject.getObjectById('ckplayer_a1').changeFlashvars('{k->10|20|30}{n->重设提示点一|重设提示点二|重设提示点三}');
		CKobject.getObjectById('ckplayer_a1').promptLoad();//重新加载
	}

	function addhtml5(){
		if(CKobject.isHTML5()){
			support=['all'];
			CKobject._K_('a1').innerHTML='';
			CKobject.embedHTML5('a1','ckplayer_a1',600,400,video,flashvars,support);
		}
		else{
			alert('该环境不支持html5，无法切换');
		}
	}
	function addListener(){
		/*if(CKobject.getObjectById('ckplayer_a1').getType()){//说明使用html5播放器
			CKobject.getObjectById('ckplayer_a1').addListener('play',playHandler);
		}
		else{
			CKobject.getObjectById('ckplayer_a1').addListener('play','playHandler');
		}*/
		CKobject.getObjectById('ckplayer_a1').addListener('play','playHandler');
	}
	function playHandler(){
		alert('因为注册了监听播放，所以弹出此内容，删除监听将不再弹出');
	}
	function removeListener(){//删除监听事件
		if(CKobject.getObjectById('ckplayer_a1').getType()){//说明使用html5播放器
			CKobject.getObjectById('ckplayer_a1').removeListener('play',playHandler);
		}
		else{
			CKobject.getObjectById('ckplayer_a1').removeListener('play','playHandler');
		}
	}
	function textBoxShow(){//增加提示文字
		var o = {
			name: 'prompt', //该文本的名称，主要作用是关闭时需要用到
			coor: '0,2,-100,-100', //坐标
			text: '{a href="http://www.ckplayer.com" target="_blank"}{font color="#FFFFFF" size="12" face="Microsoft YaHei,微软雅黑"}这里是一个提示文字演示，6.8新增功能{/font}{/a}', //文字
			bgColor: '0x000000', //背景颜色
			borderColor: '0x000000', //边框颜色
			radius: 3, //圆角弧度
			alpha:0,//总体透明度
			bgAlpha: 50, //背景透明度
			xWidth: 20, //宽度修正
			xHeight: 5, //高度修正
			pic: ['temp/face.png'], //附加图片地址数组，可以增加多个图片
			pwh:[[30,30]],//图片绽放宽高
			pEvent:[['url','http://www.ckplayer.com']],//图片事件数组
			pCoor: ['0,0,-22,-3'], //图片坐标数组
			pRadius: [30], //附加图片的弧度
			tween:[['x',1,50,0.3],['alpha',1,100,0.3]]//缓动效果
		};
		var boxtemp=CKobject.getObjectById('ckplayer_a1').textBoxShow(o);
	}
	function textBoxClose(){
		var is=CKobject.getObjectById('ckplayer_a1').textBoxClose('prompt');
	}
	function textBoxTween(){
		CKobject.getObjectById('ckplayer_a1').textBoxTween('prompt',[['y',0,-30,0.3]]);
	}
</script>
<p style="color:#F00">
ckplayer6.8，<a href="help.htm" target="_blank">查看升级说明</a>,<strong><a href="http://www.ckplayer.com/" target="_blank">官网</a>，<a href="http://www.ckplayer.com/manual/" target="_blank">帮助手册</a></strong><br />
<strong>如果你是双击打开该页面，发现不能播放视频</strong>(原则上该播放器需要在网站环境中运行)，<a href="http://bbs.ckplayer.com/forum.php?mod=viewthread&amp;tid=942">请点击该链接查看设置方法</a></p>
<p>该页面只是一个展示播放器功能的页面，里面的代码请自行选择需要的。</p>
<p><a href="demo3.htm">简单播放代码演示(自行选择优先使用Flash播放器还是HTML5播放器)</a>，<a href="demo.htm">简单播放代码演示（已不推荐使用）</a>，<a href="demo1.htm">只调用Flash播放代码演示</a>，<a href="demo2.htm">只调用HTML5播放代码演示</a><br>
  <input type="button" name="button24" value="切换到html5播放器" onClick="addhtml5();" />
</p>

</body>
</html>
