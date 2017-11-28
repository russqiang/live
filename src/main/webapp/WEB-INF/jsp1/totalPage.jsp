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
		<div class="gallery">
			<!-- Page Starts Here -->
			<div class="content">
				<div class="container">
					<div class="gallery">
						<h3>全部直播</h3>
						<div class="gallery-top">
							<c:forEach var="anchor" items="${liveAnchor}">
								<div class="view view-tenth">
									<a href="livePage.do?liveCode=${anchor.liveCode }" alt="${anchor.title }">
										<img src="http://192.168.0.112/images/${anchor.liveCode }.jpg" />
									</a>
									<br>
									<span>${anchor.title }</span>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<span style="color:#f60">${anchor.liveType }</span><br>
									<span style="color:#999;">${anchor.nickName}</span>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<span>观看人数：${anchor.liveCount }人</span>
								</div>
							</c:forEach>
							<div class="view view-tenth">
								<a href="index.do" alt="足球小王子">
									<img src="moban/images/g2.jpg" />
								<!-- 	<div class="mask">
										<h2>Our Gallery</h2>
										<p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings</p>
										<a  class="info">Read More</a>
									</div> -->
								</a>
								<div>足球小王子</div>
							</div>
							<div class="view view-tenth">
								<img src="moban/images/g4.jpg" />
								<div class="mask">
									<h2>Our Gallery</h2>
									<p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings</p>
									<a href="single.html" class="info">Read More</a>
								</div>
							</div>
							<div class="view view-tenth">
								<img src="moban/images/g5.jpg" />
								<div class="mask">
									<h2>Our Gallery</h2>
									<p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings</p>
									<a href="single.html" class="info">Read More</a>
								</div>
							</div>
							<div class="view view-tenth">
								<img src="moban/images/g6.jpg" />
								<div class="mask">
									<h2>Our Gallery</h2>
									<p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings</p>
									<a href="single.html" class="info">Read More</a>
								</div>
							</div>
							<div class="view view-tenth">
								<img src="moban/images/g7.jpg" />
								<div class="mask">
									<h2>Our Gallery</h2>
									<p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings</p>
									<a href="single.html" class="info">Read More</a>
								</div>
							</div>
							<div class="view view-tenth">
								<img src="moban/images/g8.jpg" />
								<div class="mask">
									<h2>Our Gallery</h2>
									<p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings</p>
									<a href="single.html" class="info">Read More</a>
								</div>
							</div>
							<div class="view view-tenth">
								<img src="moban/images/g2.jpg" />
								<div class="mask">
									<h2>Our Gallery</h2>
									<p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings</p>
									<a href="single.html" class="info">Read More</a>
								</div>
							</div>
							<div class="view view-tenth">
								<img src="moban/images/g7.jpg" />
								<div class="mask">
									<h2>Our Gallery</h2>
									<p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings</p>
									<a href="single.html" class="info">Read More</a>
								</div>
							</div>
							<div class="view view-tenth">
								<img src="moban/images/g6.jpg" />
								<div class="mask">
									<h2>Our Gallery</h2>
									<p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings</p>
									<a href="single.html" class="info">Read More</a>
								</div>
							</div>
							<div class="view view-tenth">
								<img src="moban/images/g4.jpg" />
								<div class="mask">
									<h2>Our Gallery</h2>
									<p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings</p>
									<a href="single.html" class="info">Read More</a>
								</div>
							</div>
							<div class="view view-tenth">
								<img src="moban/images/g8.jpg" />
								<div class="mask">
									<h2>Our Gallery</h2>
									<p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings</p>
									<a href="single.html" class="info">Read More</a>
								</div>
							</div>
							<div class="view view-tenth">
								<img src="moban/images/g2.jpg" />
								<div class="mask">
									<h2>Our Gallery</h2>
									<p>A wonderful serenity has taken possession of my entire soul, like these sweet mornings</p>
									<a href="single.html" class="info">Read More</a>
								</div>
							</div>
							<div class="clearfix"></div>
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
			<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
	<!-- content-Get-in-touch -->
	</body>
</html>