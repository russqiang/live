<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="header">
	<div class="header-top">
		<!-- container -->
		<div class="container">
			<div class="header-top-left">
				<ul>
					<li><a href="index.do">首页</a><li>
					<li><a href="totalPage.do">全部</a><li>
					<li><a href="classifyPage.do">分类</a><li>
					<li><a href="blog.do">博客</a><li>
						<!-- <li><a href="typo.jsp">bootstrap样式</a><li>   -->
					<!-- <li><a href="about.jsp">关于我们</a><li> -->
					<!-- <li><a href="contact.jsp">联系我们</a></li> -->
					<li>
						<form method="post" action="searchAnchor.do">
							<input type="text" name="keyWords" placeholder="主播/游戏"> 
							<input type="submit" value="">
						</form>	
					</li>
					
					<c:if test="${empty exitsUser }">
						<li><input type="button" name="" value="登录" class="loginAndregister"
							data-toggle="modal" data-target="#myModal" id="loginModal"></li>
							
						<li><input type="button" name="" value="注册" class="loginAndregister"
							data-toggle="modal" data-target="#myModal"></li>
					</c:if>
					
					<!-- 登录成功 -->
					<c:if test="${!empty exitsUser }">
						<li>
						<img alt="" src="${exitsUser.imgUrl }" class="userimg">
						<div id="userinfo">
							<div>
								<div class="userleft">
									<img alt="" src="${exitsUser.imgUrl }"  id="uservia">
								</div>
								<div class="userleft">
									<ul class="userhead">
										<li>${exitsUser.nickName}</li>
									</ul>
								</div>
							</div>
							<div>
								<ul id="userul">
									<li><a href="personCenter.do">个人中心</a></li>
									<li><a onclick="exitlogin()">退出</a></li>
								</ul>
							</div>
						</div>
						</li>
					</c:if>
					<div class="clearfix"></div>
				</ul>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
<!--
	
//-->
</script>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myLargeModalLabel">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">Don't Wait, Login
					now!</h4>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-8"
						style="border-right: 1px dotted #C2C2C2; padding-right: 30px;">
						<!-- Nav tabs -->
						<ul class="nav nav-tabs">
							<li class="active"><a href="#Login" data-toggle="tab">登录</a></li>
							<li><a href="#Registration" data-toggle="tab">注册</a></li>
						</ul>
						<!-- Tab panes -->
						<div class="tab-content">
							<div class="tab-pane active" id="Login">
								<form role="form" class="form-horizontal" action="login.do"
									method="post">
									<div class="form-group">
										<label for="mobile" class="col-sm-2 control-label">手机</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="mobile"
												placeholder="请输入手机号" />
										</div>
									</div>
									<div class="form-group">
										<label for="exampleInputPassword1"
											class="col-sm-2 control-label"> 密码</label>
										<div class="col-sm-10">
											<input type="password" class="form-control" id="password"
												placeholder="请输入密码" />
										</div>
									</div>
									<div class="row">
										<div class="col-sm-2"></div>
										<div class="col-sm-10">
											<button type="button" class="btn btn-primary btn-sm"
												id="loginbt">登录</button>
											<a href="javascript:;">忘记密码</a>
										</div>
									</div>
								</form>
							</div>
							<div class="tab-pane" id="Registration">
								<form role="form" class="form-horizontal">
									<div class="form-group">
										<label for="mobile" class="col-sm-2 control-label">手机号</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="phone"
												placeholder="请输入手机号" />
										</div>
									</div>
									<div class="form-group">
										<label for="password" class="col-sm-2 control-label">密码</label>
										<div class="col-sm-10">
											<input type="password" class="form-control"
												id="registerpassword" placeholder="请输入密码" />
										</div>
									</div>
									<div class="form-group">
										<label for="mobile" class="col-sm-2 control-label">昵称</label>
										<div class="col-sm-10">
											<input type="text" class="form-control" id="nikeName"
												placeholder="请输入昵称" />
										</div>
									</div>

									<div class="form-group">
										<label for="email" class="col-sm-2 control-label">验证码</label>
										<div class="col-sm-10">
											<input type="email" class="form-control" id="vericode"
												placeholder="验证码" />
										</div>
									</div>

									<div class="row">
										<div class="col-sm-2"></div>
										<div class="col-sm-10">
											<button type="button" class="btn btn-primary btn-sm"
												id="register">注册</button>
											<button type="button" class="btn btn-default"
												data-dismiss="modal">取消</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="row text-center sign-with">
							<div class="col-md-12">
								<h3 class="other-nw">Sign in with</h3>
							</div>
							<div class="col-md-12">
								<div class="btn-group btn-group-justified">
									<a href="#" class="btn btn-primary">Facebook</a> <a href="#"
										class="btn btn-danger"> Google +</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- 登录验证 -->
<script type="text/javascript">
	var phone = false;
	$("#mobile").blur(function() {
		if ((/^1[3|4|5|8][0-9]\d{4,8}$/.test($("#mobile").val()))) {
			phone = true;
			return true;
		} else {
			$("#mobile").html("");
			$("#mobile").attr('placeholder', "请输入有效的手机号");
		}
	});
	var password = false;
	$("#password").blur(function() {
		if ($("#password").val() != "") {
			password = true;
			return true;
		}
	});

	$("#loginbt").click(function() {
		var phone = $("#mobile").val();
		var password = $("#password").val();
		var url = window.location.href;
		if (phone && password && phone != "" && password != "") {
			$.ajax({
				type : "POST",
				async : true,//异步提交
				url : "login.do",//提交到login.do
				data : {
					phone : phone,
					password : password,
				},
				success : function(msg) {
					if (msg == "1") {
						$(".close").click();
						window.location.reload();
						alert("登录成功");
					} else if (msg == "0") {
						alert("登录失败");
						window.location.href = url;
					}
				}
			});
		}
	});
</script>
<!-- 验证注册 -->
<script type="text/javascript">
	$("#phone").focus(function() {
		$("#phone").val("");
	});
	$("#registerpassword").focus(function() {
		$("#registerpassword").val("");
	});
	$("#nickName").focus(function() {
		$("#nickName").val("");
	});
	$("#vericode").focus(function() {
		$("#vericode").val("");
	});

	var phone = false;
	$("#phone").blur(function() {
		if ((/^1[3|4|5|8][0-9]\d{4,8}$/.test($("#phone").val()))) {
			phone = true;
			return true;
		} else {
			$("#phone").attr('placeholder', "请输入有效的手机号");
		}
	});
	var password = false;
	$("#registerpassword").blur(function() {
		if ($("#registerpassword").val() != "") {
			password = true;
			return true;
		}
	});

	var username = false;
	$("#nikeName").blur(function() {
		if ($("#nikeName").val() != "") {
			phone = true;
			return true;
		} else {
			$("#nikeName").attr('placeholder', "请输入昵称");
		}
	});
	var vericode = vericode;
	$("#vericode").blur(function() {
		if ($("#vericode").val() != "") {
			phone = true;
			return true;
		} else {
			$("#vericode").attr('placeholder', "请输入验证码");
		}
	});

	$("#register").click(
			function() {
				var phone = $("#phone").val();
				var password = $("#registerpassword").val();
				var username = $("#nikeName").val();
				var vericode = $("#vericode").val();
				var url = window.location.href;
				
				if (phone && password && username && vericode && phone != ""
						&& password != "" && username != "" && vericode != "") {
					$.ajax({
						type : "POST",
						async : true,//异步提交
						url : "register.do",/* //提交到register.do */
						data : {
							phone : phone,
							password : password,
						},
						success : function(msg) {
							if (msg == "1") {
								$(".close").click();
								window.location.reload();
								alert("注册成功");
							} else if (msg == "0") {
								alert("注册失败");
								window.location.href = url;
							}
						}
					});
				}
			});
</script>
<!-- 用户信息 -->
<script type="text/javascript">
	$(".userimg").click(function() {
		//$("#userinfo").toggle();
		$("#userinfo").css("display","block");
	});
	$("#userinfo").click(function() {
		$("#userinfo").css("display","none");
	}) 
</script>
<!-- 退出 -->
<script type="text/javascript">

	function exitlogin() {
		var r = confirm("确定要退出吗？");
		var pageUrl = window.location.href;
		
		if (r == true) {
			$.ajax({
				type : "POST",
				async : true,//异步提交
				url : "logout.do",//提交到login.do
				data:{
					pageUrl:pageUrl,
				},
					
				success : function(msg) {
					window.location.href="index.do";
				}
			});
		} else {
			return false;
		} 
	}
</script>


