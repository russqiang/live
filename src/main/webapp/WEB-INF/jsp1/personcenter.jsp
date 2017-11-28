<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Gallery</title>
<jsp:include page="link.jsp"/>
<!-- start-smoth-scrolling -->
</head>
	<body>
		<!-- header -->
		<jsp:include page="header.jsp"/>
		<!-- //header -->
		<!-- gallery -->
			<!-- Page Starts Here -->
			<div class="content">
				<div class="container">
						<div class="homelayout">
							<div class="homeleft">
								<h3 style="text-align: center;">个人主页</h3>
								<ul class="ulstyle" id="navstyle">
									<p>
									<li><a href="personCenter.do">我的信息</a></li>
									</p>
									<!--<p><li>关注列表</li></p>-->
									<p>
									<li><a href="becomeAnchor.do">我要直播</a></li>
									</p>
									<p>
									<li><a href="subscription.do?focusList=${exitsUser.focusList}">我的订阅</a></li>
									</p>
									<p>
									<li><a href="changeinfo.do">修改信息</a></li>
									</p>
								</ul>
							</div>
							<div class="homeright">
								<div>
									<div>
										<h4 class="personcenter">我的个人中心</h4>
										<hr style="height:1px;border:none;border-top:1px solid grey;"/>
									</div>
								</div>
								<div>
									<div class="personleft">
										<img src="${exitsUser.imgUrl}" id="personleftimg"/>
									</div>
									<div class="personcenterul">
										<ul class="ulstyle">
											<li>昵称</li>
											<li>性别</li>
											<li>粉丝</li>
											<li>关注人数</li>
											<li>电话号码</li>
											<li>用户姓名</li>
										</ul>
									</div>
									<div class="percenterright">
										<ul class="ulstyle">
											<li>${exitsUser.nickName}</li>
											<li>####</li>
											<li>####</li>
											<li>####</li>
											<li>${exitsUser.phone}</li>
											<li>####</li>
										</ul>
									</div>
								</div>
							</div>
				</div>
			</div>
			<!-- Page Ends Here -->
		</div>
		<!-- //gallery -->
		<!-- footer -->
		<jsp:include page="footer.jsp"/>
		<!-- //footer -->
		<script type="text/javascript">
			$(document).ready(function() {
				$().UItoTop({ easingType: 'easeOutQuart' });
			});
		</script>
		<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"></span></a>
	<!-- content-Get-in-touch -->
	</body>
</html>