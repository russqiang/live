<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="header">
	<div class="header-top">
		<!-- container -->
		<div class="container">
			<div class="header-top-left">
				<ul>
					<li><a href="index.do">首页</a><li> 
					<li><a href="totalPage.do">直播</a><li>               
					<li><a href="classifyPage.do">分类</a><li>               
					<li><a href="blog.do">博客</a><li>                   
					<!-- <li><a href="matches.jsp">比赛</a><li>   -->
					<!-- <li><a href="typo.jsp">bootstrap样式</a><li>   -->           
					<li><a href="about.jsp">关于我们</a><li>                        
					<!-- <li><a href="contact.jsp">联系我们</a></li> -->
					<div class="clearfix"> </div>
				</ul>
			</div>
			<div class="header-top-right">
				<form>
					<input type="text" placeholder="主播/游戏">
					<input type="submit" value="">
				</form>
				<ul>
					<li><a data-toggle="modal" data-target="#myModal" href="#">登录</a></li>
					<li><a data-toggle="modal" data-target="#myModal" href="#">注册</a></li>
				</ul>
				<div class="clearfix"></div>
			</div>
			<div class="clearfix"> </div>
		</div>
		<!-- //container -->
	</div>
	<!-- <div class="header-middle">
		container
		<div class="container">
			<div class="header-middle-logo">
				<a href="index.do">XQ Live</a>
			</div>
			<div class="header-middle-right">
				<div class="phone">
					<span> </span>
					<ul>
						<li class="gray">Phone</li>
						<li>+1 234 876 0987 (524 House)</li>
						<li>+1 234 876 0988 (254 Shop)</li>
					</ul>
					<div class="clearfix"> </div>
				</div>
				<div class="location">
					<span> </span>
					<ul>
						<li class="gray">Address<li>
						<li>cape town, georgia,</li>
						<li>Newyork</li>
					</ul>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="clearfix"> </div>
		</div>
		//container
	</div> -->
	<!-- <div class="blue"> </div> -->
</div>
<script type="text/javascript">
<!--

//-->
	

</script>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" 
	aria-labelledby="myLargeModalLabel" >
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;</button>
                <h4 class="modal-title" id="myModalLabel">
                    Don't Wait, Login now!</h4>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-8" style="border-right: 1px dotted #C2C2C2;padding-right: 30px;">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#Login" data-toggle="tab">登录</a></li>
                            <li><a href="#Registration" data-toggle="tab">注册</a></li>
                        </ul>
                        <!-- Tab panes -->
                        <div class="tab-content">
                            <div class="tab-pane active" id="Login">
                                <form role="form" class="form-horizontal" action="login.do" method="post">
	                                <div class="form-group">
	                                    <label for="mobile" class="col-sm-2 control-label">手机</label>
	                                    <div class="col-sm-10">
	                                        <input type="text" class="form-control" id="mobile" placeholder="请输入手机号" />
	                                    </div>
	                                </div>
	                                <div class="form-group">
	                                    <label for="exampleInputPassword1" class="col-sm-2 control-label">
	                                        	密码</label>
	                                    <div class="col-sm-10">
	                                        <input type="password" class="form-control" id="password" placeholder="请输入密码" />
	                                    </div>
	                                </div>
	                                <div class="row">
	                                    <div class="col-sm-2">
	                                    </div>
	                                    <div class="col-sm-10">
	                                        <button type="submit" class="btn btn-primary btn-sm">登录</button>
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
                                        <input type="text" class="form-control" id="mobile" placeholder="请输入手机号" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-sm-2 control-label">密码</label>
                                    <div class="col-sm-10">
                                        <input type="password" class="form-control" id="password" placeholder="请输入密码" />
                                    </div>
                                </div>
                               <div class="form-group">
                                    <label for="mobile" class="col-sm-2 control-label">昵称</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="nikeName" placeholder="请输入昵称" />
                                    </div>
                                </div>
                               
                                <div class="form-group">
                                    <label for="email" class="col-sm-2 control-label">邮箱</label>
                                    <div class="col-sm-10">
                                        <input type="email" class="form-control" id="email" placeholder="Email" />
                                    </div>
                                </div>
                                
                                <div class="row">
                                    <div class="col-sm-2">
                                    </div>
                                    <div class="col-sm-10">
                                        <button type="button" class="btn btn-primary btn-sm">注册</button>
                                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>    
                                    </div>
                                </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="row text-center sign-with">
                            <div class="col-md-12">
                                <h3 class="other-nw">
                                    Sign in with</h3>
                            </div>
                            <div class="col-md-12">
                                <div class="btn-group btn-group-justified">
                                    <a href="#" class="btn btn-primary">Facebook</a> <a href="#" class="btn btn-danger">
                                        Google +</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>		