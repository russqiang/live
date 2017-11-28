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
							<h4 class="personcenter">我的订阅</h4>
							<hr
								style="height: 1px; border: none; border-top: 1px solid grey;" />
						</div>
					</div>
					<div>
						<div class="allsubscript">
							<div>
								<img src="moban/images/user.jpg" />
							</div>
							<div class="description">
								<span>我去前面探探路</span>
							</div>
							<div class="watchnum">
								<span>观看人数:#####</span>
							</div>
							<div class="subscriptuser">
								<span>用户名</span>
							</div>
							<div class="subscriptlabel">
								<span>标签</span>
							</div>
							<form>
								<input type="submit" id="canclesubscription" value="取消订阅" />
							</form>
						</div>
						<div class="allsubscript">
							<div>
								<img src="moban/images/user.jpg" />
							</div>
							<div class="description">
								<span>我去前面探探路</span>
							</div>
							<div class="watchnum">
								<span>观看人数:#####</span>
							</div>
							<div class="subscriptuser">
								<span>用户名</span>
							</div>
							<div class="subscriptlabel">
								<span>标签</span>
							</div>
							<form>
								<input type="submit" id="canclesubscription" value="取消订阅" />
							</form>
						</div>
						<div class="allsubscript">
							<div>
								<img src="moban/images/user.jpg" />
							</div>
							<div class="description">
								<span>我去前面探探路</span>
							</div>
							<div class="watchnum">
								<span>观看人数:#####</span>
							</div>
							<div class="subscriptuser">
								<span>用户名</span>
							</div>
							<div class="subscriptlabel">
								<span>标签</span>
							</div>
							<form>
								<input type="submit" id="canclesubscription" value="取消订阅" />
							</form>
						</div>
						<div class="allsubscript">
							<div>
								<img src="moban/images/user.jpg" />
							</div>
							<div class="description">
								<span>我去前面探探路</span>
							</div>
							<div class="watchnum">
								<span>观看人数:#####</span>
							</div>
							<div class="subscriptuser">
								<span>用户名</span>
							</div>
							<div class="subscriptlabel">
								<span>标签</span>
							</div>
							<form>
								<input type="submit" id="canclesubscription" value="取消订阅" />
							</form>
						</div>
						<div class="allsubscript">
							<div>
								<img src="moban/images/user.jpg" />
							</div>
							<div class="description">
								<span>我去前面探探路</span>
							</div>
							<div class="watchnum">
								<span>观看人数:#####</span>
							</div>
							<div class="subscriptuser">
								<span>用户名</span>
							</div>
							<div class="subscriptlabel">
								<span>标签</span>
							</div>
							<form>
								<input type="submit" id="canclesubscription" value="取消订阅" />
							</form>
						</div>
						<div class="allsubscript">
							<div>
								<img src="moban/images/user.jpg" />
							</div>
							<div class="description">
								<span>我去前面探探路</span>
							</div>
							<div class="watchnum">
								<span>观看人数:#####</span>
							</div>
							<div class="subscriptuser">
								<span>用户名</span>
							</div>
							<div class="subscriptlabel">
								<span>标签</span>
							</div>
							<form>
								<input type="submit" id="canclesubscription" value="取消订阅" />
							</form>
						</div>
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