<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Gallery</title>
<jsp:include page="link.jsp" />
<script type="text/javascript">
	function uploadPic(){
		var options = {
			url:"uploadPic.do",
			dataType:"json",
			type:"POST",
			success:function(data){
				$("#personleftimg").attr("src",data.url);
				$("#imgUrl").val(data.url);
			}
		}
		$("#jvForm").ajaxSubmit(options);
		
	}
</script>
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
						<li><a href="personCenter.do">我的信息</a></li>
						<li><a href="becomeAnchor.do">我要直播</a></li>
						<li><a href="subscription.do?focusList=${exitsUser.focusList}">我的订阅</a></li>
						<li><a href="changeinfo.do">修改信息</a></li>
					</ul>
				</div>
				<div class="homeright">
					<div>
						<div>
							<h3 class="personcenter">修改信息</h3>
							<hr style="height: 2px; border: none; border-top: 1px solid grey;" />
						</div>
					</div>
					<form id="jvForm" method="post" action="updateUser.do">
						<div class="userInfo">
							<div class="personleft">
								<img src="${exitsUser.imgUrl}" id="personleftimg" class="person" />
								<input type="hidden" name="imgUrl" id="imgUrl" value="${exitsUser.imgUrl}"/>
								<input type="file" name="pic" onchange="uploadPic()"/>
								<!-- <input id="changeButton" name="pic" class="person" onclick="uploadPic()"  type="button" value="更换头像"> -->
							</div>
							<div class="clearfix"></div>
							<div class="changInfo">
								<div class="changeulstyle">
									<ul>
										<li>用户名</li>
										<li>性别</li>
										<li>密码</li>
										<li>重复密码</li>
									</ul>
								</div>
								<div class="changeinput">
									<ul>
										<li><input type="text" name="nickName" value="${exitsUser.nickName}" /></li>
										<li>
											<input name="gender" type="radio" id="changeradio" value="男"/>男 
											<input name="gender" type="radio" id="changeradio" value="女"/>女 
											<input name="gender" type="radio" id="changeradio" value="保密" checked/>保密
										</li>
										<li><input type="password" name="password" placeholder="请输入修改的密码"/></li>
										<li><input type="password" placeholder="请确认修改的密码" /></li>
									</ul>
								</div>
							</div>	
							<div class="refer">
								<input type="submit" value="提交" id="changesubmit"/>
							</div>
							<input type="hidden" name="uid" value="${exitsUser.uid }"/>
						</div>
					</form>
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