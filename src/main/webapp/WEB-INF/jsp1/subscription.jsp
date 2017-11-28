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
								<h4 class="personcenter">我的订阅</h4>
								<hr
									style="height: 1px; border: none; border-top: 1px solid grey;" />
							</div>
						</div>
						<div>
						<c:forEach items="${anchorByLiveCode }" var="anchor">
							
							<div class="allsubscript" id="anchor${anchor.id }">
								<c:if test="${anchor.state == 1 }">
								<div id="liveState">
									<span>直播中</span>
								</div>
								</c:if>
								<c:if test="${anchor.state == 0 }">
								<div id="unLiveState">
									<span>休息中</span>
								</div>
								</c:if>
						
								<div>
								<a href="livePage.do?liveCode=${anchor.liveCode }" alt="${anchor.title }">
									<img src="http://192.168.0.112/images/${anchor.liveCode}.jpg" />
								</a>
								</div>
								<div class="description">
									<span>${anchor.title }</span>
								</div>
								<div class="watchnum">
									<span>观看人数:${anchor.liveCount }</span>
								</div>
								<div class="subscriptuser">
									<span></span>
								</div>
								<div class="description">
									<span>${anchor.nickName }</span>
								</div>
								<div class="subscriptlabel">
									<span>${anchor.liveType }</span>
								</div>
								<form>
									<input type="button" onclick="del('${anchor.id}','${exitsUser.uid}','${anchor.liveCode}')" id="canclesubscription" value="取消订阅" />
								</form>
							</div>
							
						</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<!-- Page Ends Here -->
		</div>
	<!-- //gallery -->
	<!-- footer -->
	<jsp:include page="footer.jsp" />
	<script type="text/javascript">
		function del(id,uid,liveCode){
			$("#anchor"+id).remove();
			var url = "cancelFocus.do";
			var params = {
					"id": id,
					"uid": uid,
					"liveCode": liveCode,
					"focusCount": -1
			};
			//异步保存数据到sku
			$.post(url,params,function(data){
				alert(data);
			},"json");

		}
		
	</script>
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