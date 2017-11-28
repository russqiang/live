<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Contact</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Forward Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all">
<!-- js -->
<script src="js/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- js -->
<!-- start-smoth-scrolling -->
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
jQuery(document).ready(function($) {
	$(".scroll").click(function(event){		
		event.preventDefault();
	$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
});
});
</script>
<!-- start-smoth-scrolling -->
</head>
	<body>
		<!-- header -->
		<jsp:include page="header.jsp"/>
		<!-- //header -->
		<!-- contact -->
		<div class="contact">
			<!-- container -->
			<div class="container">
				<div class="contact-info">
					<h3 class="c-text">Get in Touch</h3>
				</div>
				<div class="map">
					<iframe src="images/contact.jpg" frameborder="0" style="border:0"></iframe>
				</div>
				<div class="contact-grids">
					<div class="col-md-4 contact-grid-left">
						<h3>Address :</h3>
						<p>The Company Name agi.
						<span>756 gt globel Place,</span>
							CD-Road,M 07 435.
						</p>
					</div>
					<div class="col-md-4 contact-grid-middle">
						<h3>Phones :</h3>
						<ul>
							<li>Ph 1: +1 123 456 7890</li>
							<li>Ph 2: +1 123 456 7890</li>
						</ul>
					</div>
					<div class="col-md-4 contact-grid-right">
						<h3>E-mail :</h3>
						<a href="mailto:info@example.com">mail@example.com</a>
					</div>
					<div class="clearfix"> </div>
					<div class="contact-info">
						<div class="contact-info-text">
							<h3>Miscellaneous information :</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus finibus orci eget fermentum sagittis. 
								Nullam non consequat ante, in interdum velit. Sed quis diam orci. Phasellus pulvinar hendrerit enim ut placerat. 
								Vivamus convallis mollis consectetur. Mauris gravida venenatis vehicula. In tempor enim in iaculis imperdiet.
							</p>
						</div>	
						<div class="contact-info-grids">
							<form>
								<input type="text" placeholder="Name" required="">
								<input type="text" placeholder="Email" required="">
								<input type="text" placeholder="Subject" required="">
								<textarea placeholder="Message" required=""></textarea>
								<input type="submit" value="SEND">
							</form>
						</div>
					</div>
				</div>
			</div>
			<!-- //container -->
		</div>
		<!-- //contact -->
		<!-- footer -->
		<jsp:include page="footer.jsp"/>
		<!-- //footer -->
		<script type="text/javascript">
									$(document).ready(function() {
										/*
										var defaults = {
								  			containerID: 'toTop', // fading element id
											containerHoverID: 'toTopHover', // fading element hover id
											scrollSpeed: 1200,
											easingType: 'linear' 
								 		};
										*/
										
										$().UItoTop({ easingType: 'easeOutQuart' });
										
									});
								</script>
									<a href="#" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
	<!-- content-Get-in-touch -->
	</body>
</html>