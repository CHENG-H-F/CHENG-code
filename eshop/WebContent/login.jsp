<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>welcome!</title>
<link rel="stylesheet" href="resources/css/bootstrap-grid.css" />
<link rel="stylesheet" href="resources/css/bootstrap-reboot.css" />
<link rel="stylesheet" href="resources/css/bootstrap.css" />
<script type="text/javascript" src="resources/js/jquery-1.12.0.js"></script>
<script type="text/javascript" src="resources/js/popper.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.js"></script>
<style>
			.header {
				width: 100%;
				height: 110px;
				position: fixed;
				top: 0;
				z-index: 9999;
				background-color: rgba(4,30,66);
			}
			
			.header a {
				color: white;
			}
			
			.header div {
				position: absolute;
			}
			
			.row {
				margin-bottom: 20px;
			}
			
			.row.row {
				margin-top: 10px;
				margin-bottom: 0;
			}
			
			[class*="col-"] {
				opacity: 70%;
				background-color: whitesmoke;
				border: 1px solid rgba(86, 61, 124, .2);
				border-width: 2px;
			}
			
			.psw {
				float: right;
			}
			
			.btn {
				float: right;
			}
			
			.rightNow {
				float: right;
			}
			
			.jumbotron {
				background-color: white;
				opacity: 80%;
				height: 15px;
				width: 100%;
			}
			
			.middle {
				height: 400px;
				background-color: rgb(255.66.0);
				z-index: 99999;
				position: relative;
			}
		</style>
		
</head>
<body>
    
    <div class="header">
			<a href="#"><img src="resources/img/logo1.png" style="width: 100px; margin-left: 40px; margin-top: 5px;"></a>
			<a href="#"><img src="resources/img/welcome.png" style="width: 400px; position: absolute; top: 50%;left: 50%;transform: translate(-50%,-50%);"></a>
			<div style="right: 20px; bottom: 20px;">
				<a href="#" ><img src="resources/img/slogn.png" style="width: 300px;"></a>
			</div>
		</div>
		<div class="middle">
			<div style="position: absolute; top: -50px;">
				<img src="resources/img/logo2.png" style="width: 700px;" />
			</div>
			<div class="container" style="margin-bottom: 50px;margin-top: 200px;">
				<div class="row">
					<div class="col-4 offset-8 ">
						<br />
						<p>
							<h1 class="modal-title" style="color:#138496 "><center><cite title="Source Title">Eshop</cite></center></h1></p><br />
						<form action="${pageContext.request.contextPath}/loginServlet" method="post">
							 <div class="form-group">
								<label class="sr-only" for="name">ID </label>
								<div class="col-12 form-inline " style="padding-left: 0px; padding-right: 0px; border: 0px;">
												<div class="col-10 offset-2 form-inline" style="padding-left: 0px; padding-right: 0px; border: 0px; ">
													<input type="text" class="form-control" name="username" id="name" placeholder=" user's name" onblur="onb()" style="padding-left: 0px; padding-right: 0px;margin: 0; width: 80%; text-indent:10px;"/>
													
													<div class="col-2" style="padding-left: 0px; padding-right: 0px; border: 0px;">
														<img src="" id="userInfo" style="width: 40%;padding-left: 0px; padding-right: 0px; ">
													</div>
												</div>
											</div>
								<div class="form-group">
									<label class="sr-only" for="name">password </label>
									<div class="col-8 offset-2 " style="padding-left: 0px; padding-right: 0px; padding-top: 10px; border: 0px;">
										<input type="password" id="inputPassword" class="form-control" placeholder="Password" required name="password" >
									</div>
								</div>
							</div>
							<div class="col-8 offset-2 " style="padding-left: 0px; padding-right: 0px; border: 0px;">
								<div class="checkbox">
									<label>
								<input type="checkbox"> 记住密码
							</label>
									<div class="psw" style="padding-left: 0px; padding-right: 0px; border: 0px;">
										<a href="#">忘记密码？</a>
									</div>
								</div>
							</div>
						
						<div class="col-8 offset-2" style="padding-left: 0px; padding-right: 0px; border: 0px; margin-bottom: 100px; margin-top: 10px;">
							<button class="btn btn-lg btn-info form-control " type="submit" name="login">login</button>
						</div>
						</form>
						<div class="col-8 offset-2 " style=" padding-bottom:50px; padding-left: 0px; padding-right: 0px; border: 0px;">
							<div class="sign" style="padding-left: 0px; padding-right: 0px; border: 0px;">
								<div style="width: 90px; margin-top: 7px; float: left;">没有账号?</div>
								<div class="rightNow" style="padding-left: 0px; padding-right: 0px; border: 0px;">
									<button type="button" class="btn" data-toggle="modal" data-target="#myModal">
					               立即注册
					             </button>
								</div>
							</div>
						</div>
						<div class="col-8 offset-2" style="padding-left: 0px; padding-right: 0px; border: 0px;">
							<br />
						</div>
					</div>
					<div class="container">
						<!-- 模态框 -->
						<div class="modal fade" id="myModal" style="margin-top: 100px;">
							<div class="modal-dialog">
								<div class="modal-content">
								<form  action="${pageContext.request.contextPath}/registServlet" method="post">
									<!-- 模态框头部 -->
									<div class="modal-header">
										<h4 class="modal-title">注册</h4>
									</div>
									<!-- 模态框主体 -->
									<div class="modal-body">
										<!--堆叠表单-->
										
											<div class="form-group">
												<label for="" class="sr-only">用户名:</label>
												<input type="text" class="form-control" id="" placeholder="输入用户名" name="username1">
											</div>
											<div class="form-group">
												<label for="pwd" class="sr-only">密码:</label>
												<input type="password" class="form-control" id="pwd" placeholder="输入密码" name="password1">
											</div>
											<select class="form-control" style="margin-bottom: 15px;" name="question1">
												<option value="1">您的生日？</option>
												<option value="2">您父亲的生日？</option>
												<option value="3">您母亲的生日？</option>
											</select>
											<div class="form-group" id="answer" >
												<label for="answer" class="sr-only">输入密保答案:</label>
												<input class="form-control" id="pwd" placeholder="输入密保答案" name="answer1">
											</div>
											<div class="form-group">
										    	<label class="radio-inline" style="margin-left: 15%;" ><input type="radio" name="optradio1" value="1" checked>普通用户</label>
					     						<label class="radio-inline" style="margin-left: 35%;"><input type="radio" name="optradio1" value="2">超市用户</label>
					     					</div>
									</div>
									<!-- 模态框底部 -->
									<div class="modal-footer">
										<button type="submit" class="btn btn-primary" name="regist">立即注册</button>
									</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="jumbotron text-center container-fluid" style="margin-bottom: 0px; width:100% ;margin-top: 300px; background-color: rgba(4,30,66);">
			<center style="color:white ;"><small >江西财经大学 </small>@2019-2020</center>
		</div>
		<script type="text/javascript">
		    window.onload = function(){		    	
		    	var login = document.getElementsByName('login')[0];
				login.onclick = function(e) 
				{
					e = e || window.event;
	
					var username = document.getElementsByName('username')[0].value;
					
					if(username.length <= 0) 
					{
						alert('请输入用户名');
						return false;
					}
	
					var password = document.getElementsByName('password')[0].value;
					if(password.length <= 0)
					{
						alert('请输入密码');
						return false;
					}
					
				};
				var regist = document.getElementsByName('regist')[0];
				regist.onclick = function(e) 
				{
					e = e || window.event;
					
					var username1 = document.getElementsByName('username1')[0].value;
					
					if(username1.length <= 0) 
					{
						alert('请输入用户名');
						return false;
					}
					
					var password1 = document.getElementsByName('password1')[0].value;
					if(password1.length <= 0)
					{
						alert('请输入密码');
						return false;
					}
					var answer1 = document.getElementsByName('answer1')[0].value;
					if(answer1.length <= 0)
					{
						alert('请输入密保答案');
						return false;
					}
				};
		    }
		    
		 
		</script>
		<script>
		// 自动验证
		function onb() {
			var data = $("#name").val();
			$.ajax({
				type: "post",
				url: "eshop/check_usernameServlet",
				data: {
					"name": data,
				},
				dataType: "text",
				success: function (data) {
					if (data == "ok") {
						$("#userInfo").attr("src","resources/img/gou.png");
					} else {
						$("#userInfo").attr("src", "resources/img/cha.png");
					}
					
				}
			});
		}
		</script>
</body>
</html>