<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Gallery</title>
<jsp:include page="link.jsp" />
<!-- start-smoth-scrolling -->
</head>
<body>
	<!-- header -->
	<jsp:include page="header.jsp" />
	<!-- //header -->
	<!-- gallery -->
	<!-- Page Starts Here -->
	<div class="content">
		<div class="container">
			<div class="homelayout">
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
							<li><a href="subscription.do">我的订阅</a></li>
							</p>
							<p>
							<li><a href="changeinfo.do">修改信息</a></li>
							</p>
						</ul>
					</div>
					<div class="homeright">
						<div>
							<div>
								<h4 class="personcenter">修改信息</h4>
								<hr
									style="height: 1px; border: none; border-top: 1px solid grey;" />
							</div>
						</div>
						<form method="" action="">
							<div>
								<div class="personleft">
									<img src="moban/images/user.jpg" class="personleftimg" />
								</div>
								<div class="changeavatar">
									<ul class="avatar">
										<li><input type="file" value="更换头像"></li>
									</ul>
								</div>
							</div>
							<div>
								<ul class="changeulstyle">
									<p>
									<li>用户名</li>
									</p>
									<p>
									<li>性别</li>
									</p>
									<p>
									<li>电话号码</li>
									</p>
									<p>
									<li>用户姓名</li>
									</p>
									<p>
									<li>密码</li>
									</p>
									<p>
									<li>重复密码</li>
									</p>
								</ul>
								<ul class="changeinput">
									<p>
									<li><input type="text" value="${exitsUser.nickName}" /></li>
									</p>
									<p>
									<li>
										<input name="gender" type="radio" id="changeradio"/>男 
										<input name="gender" type="radio" id="changeradio"/>女 
										<input name="gender" type="radio" id="changeradio" checked/>保密
									</li>
									</p>
									<p>
									<li><input type="text" value="${exitsUser.phone}" /></li>
									</p>
									<p>
									<li><input type="text" placeholder="请输入要修改的用户姓名" /></li>
									</p>
									<p>
									<li><input type="text" placeholder="请输入修改的密码" /></li>
									</p>
									<p>
									<li><input type="text" placeholder="请再次输入修改的密码" /></li>
									</p>
								</ul>

							</div>

							<div class="refer">
								<p>
									<input type="submit" value="提交" id="changesubmit"/>
								</p>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- Page Ends Here -->
	</div>
	<!-- //gallery -->
	<!-- footer -->
	<jsp:include page="footer.jsp" />
	<!-- //footer -->
	<script type="text/javascript">
		$(document).ready(function() {
			$().UItoTop({
				easingType : 'easeOutQuart'
			});

		});
	</script>
	<a href="#" id="toTop" style="display: block;"> <span
		id="toTopHover" style="opacity: 1;"> </span></a>
	<!-- content-Get-in-touch -->
</body>
</html>