<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>	
	
<!DOCTYPE html>
<head>
<title>Home</title>
<link href="moban/css/barrage.css" rel="stylesheet" type="text/css" />
<jsp:include page="link.jsp" />
<style type="text/css">
.show_massage {
	height: 100px;
	width: 100%;
	background-color: rgb(231, 231, 231);
}

#liphoneCode {
	position: absolute;
	bottom: 0;
	width: 80%;
	height: 34px;
	left: 0;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.sendMessage {
	width: 100%;
}

#ligetCode {
	position: absolute;
	bottom: 0;
	width: 20%;
	height: 34px;
	right: 0;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 1px solid #ccc;
	border-radius: 4px;
}

/* 房间头部信息 */
.roomBox {
	width: 65%;
	height: 100%;
	margin: 0 auto;
	margin: 0 auto;
}

.roomNum {
	width: 374px;
	height: 100%;
	margin: 0;
	padding: 0;
	padding: 0;
	float: left;
}

.roomHead {
	width: 150px;
	height: 100%;
	float: left;
}

.roomInner {
	margin: 30px;
}

.roomFoucs {
	width: 250px;
	height: 100%;
	float: right;
}

.roomFoucsInner {
	margin-top: 15px;
}

#foucs {
	position: absolute;
	width: 150px;
	height: 34px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 0px solid #ccc;
	border-radius: 4px;
	background-color: rgb(158, 234, 106);
	width: 60px;
}

#no_foucs {
	position: absolute;
	width: 150px;
	height: 34px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 0px solid #ccc;
	border-radius: 4px;
	background-color: rgb(158, 234, 106);
	width: 60px;
}

#focusCount {
	text-align: right;
	height: 34px;
	font-size: 14px;
	line-height: 1.42857143;
	color: #555;
	background-color: #fff;
	background-image: none;
	border: 0px solid #ccc;
	border-radius: 4px;
	background-color: rgb(158, 234, 106);
	width: 150px;
}
</style>
</head>
<body>
	<!-- header -->
	<jsp:include page="header.jsp" />
	<div id="d_show"></div>
	<div class="mask_left"></div>
	<div class="mask_right">
		<!-- 评论显示区 -->
		<div id="chatRoom">
			<div class="barrage"></div>
			<!-- 显示弹幕区域 -->
			<div class="sendMessage">
			<c:if test="${empty exitsUser }">
				<button value="登录" class="loginAndregister" style="border-radius:5px;position:absolute;top:750px;background-color:#1CD5B5;width:100%;height:50px;color:white"
							data-toggle="modal" data-target="#myModal" id="loginModal">登录</button>
			</c:if>
			
			<c:if test="${!empty exitsUser }">
					<input type="text" id="liphoneCode">
					<button id="ligetCode" type="button">发送</button>
			</c:if>
			</div>
		</div>
	</div>
	<div class="show_massage">
		<!-- 房间号模块 -->
		<div class="roomBox">
			<!-- 头像房间号 -->
			<div class="roomNum">
				<div class="roomHead">
					<img src="moban/via/${anchor.imgUrl }">
				</div>
				<div class="roomInner">
					<h5>${anchor.title }</h5>
					<br> <span>${anchor.nickName }</span> <a href="#">${anchor.liveType }</a>
				</div>
			</div>
			<!-- 举报,分享,下载 订阅 -->
			<div class="roomFoucs">
				<div class="roomFoucsInner">
					<input type="button" id="foucs" value="订阅" /> 
					<input type="submit" id="focusCount" value="${anchor.focusCount }" />
					<div>
						<span>观看人数${anchor.liveCount }人</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="ckplayer2.jsp" />
	<!-- how -->
	<div class="how">
		<!-- container -->
		<div class="container"></div>
		<!-- //container -->
	</div>
	<!-- //how -->
	<div class="banner-bottom">
		<!-- container -->
		<div class="container">
			<div class="banner-bottom-info">
				<h3>Expert Opinion</h3>
			</div>
			<div class="banner-bottom-grids">
				<div class="col-md-4 banner-bottom-grid">
					<span>Mortyn tim<label>[ 24 articles ]</label></span> <img
						src="moban/images/c3.jpg" alt="" />
					<h4>Marty luthar Tim Break</h4>
					<p>Lorem Ipsum is simply dummy text of the printing and
						typesetting industry. Lorem Ipsum has been the industry's dummy
						text ever since the 1500s, including versions of Lorem Ipsum.</p>
				</div>
				<div class="col-md-4 banner-bottom-grid">
					<span>Mortyn tim<label>[ 24 articles ]</label></span> <img
						src="moban/images/c1.jpg" alt="" />
					<h4>Marty luthar Tim Break</h4>
					<p>Lorem Ipsum is simply dummy text of the printing and
						typesetting industry. Lorem Ipsum has been the industry's dummy
						text ever since the 1500s, including versions of Lorem Ipsum.</p>
				</div>
				<div class="col-md-4 banner-bottom-grid">
					<span>Mortyn tim<label>[ 24 articles ]</label></span> <img
						src="moban/images/c2.jpg" alt="" />
					<h4>Marty luthar Tim Break</h4>
					<p>Lorem Ipsum is simply dummy text of the printing and
						typesetting industry. Lorem Ipsum has been the industry's dummy
						text ever since the 1500s, including versions of Lorem Ipsum.</p>
				</div>
				<div class="clearfix"></div>
			</div>
		</div>
		<!-- //container -->
	</div>
	<!-- //banner-bottom -->
	<!-- footer -->
	<jsp:include page="footer.jsp" />
	<!-- //footer -->
	
	<!-- content-Get-in-touch -->
	<script type="text/javascript">
		var exitsUser = "${exitsUser}";
		if(exitsUser==""){
			//评论输入控制
			$("#ligetCode").val("登录");
			$("#ligetCode").click(function() {
				$("#loginModal").click();
			});
			$("#foucs").click(function() {
				$("#loginModal").click();			
			});
		}else{
			/* 进入房间在缓存中查询关注列表判断订阅or退订 */
			var this_liveCode = ${anchor.liveCode};
			/* 从session中取 */
			var focusList = "${exitsUser.focusList}";
			/* 判断是否关注该主播 */
			var focus_list = focusList.split(",");
			for (var i = 0; i < focus_list.length; i++) {
				if (this_liveCode == focus_list[i]) {
					$("#foucs").val("退订");
					break;
				}
			}
		
		$("#foucs").click(function() {
			var focusCount = "";
			var foucs_state = $("#foucs").val();
			if (foucs_state == "订阅") {
				focusCount = 1;
				$("#foucs").val("退订");
				$("#focusCount").val(parseInt($("#focusCount").val()) + 1);
			} else {
				focusCount = -1;
				$("#foucs").val("订阅");
				$("#focusCount").val(parseInt($("#focusCount").val()) - 1);
			}
			var id = ${anchor.id};
			var uid = "${exitsUser.uid}";
			var liveCode = ${anchor.liveCode};
			$.ajax({
				type : "POST",
				async : true, //是否为异步请求
				url : "focus.do",
				data : {
					uid : uid,
					id : id,
					focusCount : focusCount,
					liveCode : liveCode
				},
				success : function(msg) {
				}
			});
		});
	}
 </script>
	
	<script type="text/javascript" src="js/barrage.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			$().UItoTop({ easingType: 'easeOutQuart' });
		});
	</script>
	<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"></span></a>
	
</body>
</html>