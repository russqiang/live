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
							<h4 class="personcenter">我要直播</h4>
							<hr
								style="height: 1px; border: none; border-top: 1px solid grey; margin: 0;" />
						</div>
					</div>
					<div>
						<form action="" method="">
							<div class="ul1">
								<ul class="ulstyle">
									<p>
									<li><span>手机号</span></li>
									</p>
									<p>
									<li><span>验证码</span></li>
									</p>
									<p>
									<li><span>真实姓名</span></li>
									</p>
									<p>
									<li><span>身份证号</span></li>
									</p>
									<p>
									<li><span>直播类别</span></li>
									</p>
									<p>
									<li><span>主播风格</span></li>
									</p>
									<p>
									<li><span>选择银行</span></li>
									</p>
									<p>
									<li><span>银行卡号</span></li>
									</p>
									<!--信息提交模块-->
								</ul>
							</div>
							<div class="ul2">
								<ul class="ulstyle">
									<p>
									<li><input type="text " id="liphoneCheck" value="${exitsUser.phone}"></li>
									</p>
									<p>
									<li><input type="text " id="liphoneCode">
										<button id="ligetCode" type="button" onclick="sendCode()">验证码</button>
									</li>
									</p>
									<p>
									<li><input type="text " id="realName"></li>
									</p>
									<p>
									<li><input type="text " id="idCard"></li>
									</p>
									<p>
									<li><select name="category" id="category">
										<c:forEach var="classify" items="${allClassify }">
											<option value="${classify.id }">${classify.liveType }</option>
										</c:forEach>
											
									</select></li>
									</p>
									<p>
									<li><input type="text" id="style"></li>
									</p>
									<p>
									<li><select name="selectBank" id="selectBank">
											<option value="建设银行">建设银行</option>
											<option value="中国银行">中国银行</option>
											<option value="农业银行">农业银行</option>
											<option value="工商银行">工商银行</option>
									</select></li>
									</p>
									<p>
									<li><input type="text" id="bankCard"></li>
									</p>

								</ul>
								<div>
									<h5>
										<input type="button" id="registernext" value="下一步">
									</h5>
								</div>
							</div>
							<div class="applay">
								<div class="info_list" style="border-bottom: none;">
									<div class="list_left2">
										身份证上传<span>(请上传身份证正反面，图片保持清晰，大小2M以内)</span>
									</div>
								</div>

								<div class="id_img_wp">
									<input type="file" accept="image/*" onchange="getzImg(this)"
										style="display: none" value="" id="img_z" /> <input
										type="file" accept="image/*" onchange="getfImg(this)" value=""
										id="img_f" style="display: none" /> <input type="file"
										accept="image/*" onchange="getsImg(this)" value="" id="img_s"
										style="display: none" />
									<div class="img_wp" onclick="selftimer()">
										<img src="moban/images/Self-timer.png" id="fms" />
										<p class="img_intro">点击图片添加手持身份证正面照</p>
									</div>

									<div class="img_wp">
										<img src="moban/images/demo-Self-timer.png" />
										<p class="img_intro">手持身份证正面照示例</p>
									</div>
									<div class="img_wp" onclick="zhengmian()">
										<img src="moban/images/before.png" id="zmz" />
										<p class="img_intro">点击图片添加身份证正面照</p>
									</div>

									<div class="img_wp">
										<img src="moban/images/demo-before.png" />
										<p class="img_intro">身份证正面照示例</p>
									</div>
									<div class="img_wp" onclick="fanmian()">
										<img src="moban/images/after.png" id="fmz" />
										<p class="img_intro">点击图片添加身份证反面照</p>
									</div>
									<div class="img_wp">
										<img src="moban/images/demo-after.png" />
										<p class="img_intro">身份证反面照示例</p>
									</div>
									<div class="cf"></div>
								</div>
								<p style="text-align: center;">
									<input type="submit" value="确认申请" class="save_btn" />
								</p>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
		<script>
			//正面
			function zhengmian() {
				$('#img_z').click();
			}

			function getzImg(imgFile) {

				var file = imgFile.files[0];

				var reader = new FileReader();
				reader.readAsDataURL(file); //将文件读取为Data URL小文件   这里的小文件通常是指图像与 html 等格式的文件
				reader.onload = function(e) {
					$("#zmz").attr("src", e.target.result);
				}
			}

			//反面
			function fanmian() {
				$('#img_f').click();
			}

			function getfImg(imgFile) {

				var file = imgFile.files[0];

				var reader = new FileReader();
				reader.readAsDataURL(file);
				reader.onload = function(e) {
					$("#fmz").attr("src", e.target.result);
				}
			}
			//手持正面
			function selftimer() {
				$('#img_s').click();
			}

			function getsImg(imgFile) {
				var file = imgFile.files[0];

				var reader = new FileReader();
				reader.readAsDataURL(file);
				reader.onload = function(e) {
					$("#fms").attr("src", e.target.result);
				}
			}
		</script>
		<script type="text/javascript" src="moban/js/join.js"></script>
	</div>
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