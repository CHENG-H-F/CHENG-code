<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		
			.header{
				width: 100%;
				height: 100px;
				position: fixed;
				top: 0;
				z-index: 9999;
				background-color: rgba(4,30,66);
			}
			.header a{
				color: white;
			}
			.header div{
				position: absolute;
			}
		</style>
</head>
<body>
    <!--头部固定导航栏-->
		<div class="header">
			<a href="#"><img src="resources/img/logo1.png" style="width: 100px; margin-left: 40px; margin-top: 5px;"></a>
		
			<div style="right: 20px; bottom: 20px;">
				<img src="resources/img/shopcar.png" style="width: 60px;">
				<img src="${photo_url}" style="width: 30px; border-radius: 10px;margin-left: 20px;" />
				<span style="">|</span>
				<a href="/eshop/login.jsp">退出</a>
			</div>
		</div>
		
		<!--中间-->
		<div class="container">
			<div class="row" style="margin-top: 150px;">
		
				<!--左边菜单栏-->
				<div class="col-3">
					<div class="list-group">
						<a class="list-group-item list-group-item-action" id="option1">添加超市</a>
						<a onclick="showAllShop()" class="list-group-item list-group-item-action" id="option2">管理超市</a>
						<a onclick="unverify()" class="list-group-item list-group-item-action" id="option3">审核公告</a>
						<a onclick="unverifyUser()" class="list-group-item list-group-item-action" id="option4">审核超市用户注册</a>
					</div>
				</div>
				
				<!--添加超市-->
				<div class="col-9" id="div1">
					<div class="offset-4">
						<h3>请填写超市以下有关信息</h3>
					</div>
					<hr>
					<form action="${pageContext.request.contextPath}/shopServlet" method="post" >
						<div class="row">
							<div class="col-2 offset-2">超市名称</div>
							<div class="col-6">
								<input type="text" class="form-control" placeholder="超市名称" name="shop_name" />
							</div>
						</div>
						
						<div class="row">
							<div class="col-2 offset-2">超市省份</div>
							<div class="col-6">
								<input type="text" class="form-control" placeholder="超市省份" name="shop_province" />
							</div>
						</div>
						<div class="row">
							<div class="col-2 offset-2">超市城市</div>
							<div class="col-6">
								<input type="text" class="form-control" placeholder="超市城市" name="shop_city" />
							</div>
						</div>
						<div class="row">
							<div class="col-2 offset-2">店面简称</div>
							<div class="col-6">
								<input type="text" class="form-control" placeholder="店面简称" name="shop_title" />
							</div>
						</div>
						<div class="row">
							<div class="col-2 offset-2">地址</div>
							<div class="col-6">
								<input type="text" class="form-control" placeholder="地址" name="shop_address" />
							</div>
						</div>
						<div class="row">
							<div class="col-2 offset-2">联系电话</div>
							<div class="col-6">
								<input type="text" class="form-control" placeholder="联系电话" name="shop_tel" />
							</div>
						</div>
						<div class="row">
							<div class="col-2 offset-2">营业时间</div>
							<div class="col-6">
								<input type="text" class="form-control" placeholder="营业时间" name="shop_time" />
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="offset-6">
							<button class="btn btn-secondary" type="submit" >提交</button>
							</div>
						</div>
					</form>
					
					
				</div>
				
				
				<!--管理超市-->
				
				<div class="col-9" id="div2">
				<h4>
						<div class="row">
							<div class="col-5 ">超市简称</div>
							<div class="col-2 ">超市省份</div>
							<div class="col-2 ">超市城市</div>
							<div class="col-3 ">操作</div>
						</div>
				</h4>
						<hr>
							<div id="showAllShop"></div>
								
							
					</div>

				
				
				<!-- 模态框 -->
				<div class="modal fade" id="myModal" style="margin-top: 100px;">
					<div class="modal-dialog">
						<div class="modal-content">
							<br>
							<form action="${pageContext.request.contextPath}/updateshopServlet" method="post" >
								<div class="row">
									<div class="col-3 offset-2">超市名称</div>
									<div class="col-6">
										<input type="text" name="shop_name" class="form-control" placeholder="超市名称" />
									</div>
								</div>
								
								<div class="row">
									<div class="col-3 offset-2">超市省份</div>
									<div class="col-6">
										<input type="text" name="shop_province" class="form-control" placeholder="超市省份" />
									</div>
								</div>
								<div class="row">
									<div class="col-3 offset-2">超市城市</div>
									<div class="col-6">
										<input type="text" name="shop_city" class="form-control" placeholder="超市城市" />
									</div>
								</div>
								<div class="row">
									<div class="col-3 offset-2">店面简称</div>
									<div class="col-6">
										<input type="text" name="shop_title" class="form-control" placeholder="店面简称" />
									</div>
								</div>
								<div class="row">
									<div class="col-3 offset-2">地址</div>
									<div class="col-6">
										<input type="text" name="shop_address" class="form-control" placeholder="地址" />
									</div>
								</div>
								<div class="row">
									<div class="col-3 offset-2">联系电话</div>
									<div class="col-6">
										<input type="text" name="shop_tel" class="form-control" placeholder="联系电话" />
									</div>
								</div>
								<div class="row">
									<div class="col-3 offset-2">营业时间</div>
									<div class="col-6">
										<input type="text" name="shop_time" class="form-control" placeholder="营业时间" />
									</div>
								</div>
								
								<hr>
								
							
							
				<div class="modal-footer">
					<button type="submit" class="btn btn-secondary" >修改</button>
				</div>
				  
				  </form>
				
						</div>
					</div>
				</div>
				<!--审核公告-->
				<div class="col-9" id="div3">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>公告编号</th>
									<th>公告标题</th>
									<th>公告发布者</th>
									<th>操作</th>
					
								</tr>
							</thead>
							<tbody id="shownotice">
								
								
							</tbody>
						</table>
					</div>
				</div>
				
				<!--审核超市用户-->
				<div class="col-9" id="div4">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>用户姓名</th>
									<th>用户密码</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody id="showUnverifyUser">
								
							</tbody>
						</table>
					</div>
				</div>
				
				
				
		     </div>
		</div>
		
		<!--bottom-->
		
		<div class="jumbotron text-center container-fluid" style="margin-bottom: 0px; width:100% ;margin-top: 300px; background-color: rgba(4,30,66);">
			<center style="color:white ;"><small>江西财经大学 </small>@2019-2020</center>
		</div>
		
		<!--js-->
		<script>
			$("#div2").hide();
			$("#div3").hide();
			$("#div4").hide();
		
			$(document).ready(function() {
				$("#option1").click(function() {
					$("#div1").show();
					$("#div2").hide();
					$("#div3").hide();
					$("#div4").hide();
				});
			});
		
			$(document).ready(function() {
				$("#option2").click(function() {
					$("#div2").show();
					$("#div1").hide();
					$("#div3").hide();
					$("#div4").hide();
				});
			});
		
			$(document).ready(function() {
				$("#option3").click(function() {
					$("#div3").show();
					$("#div1").hide();
					$("#div2").hide();
					$("#div4").hide();
				});
			});
			
			$(document).ready(function() {
				$("#option4").click(function() {
					$("#div4").show();
					$("#div1").hide();
					$("#div2").hide();
					$("#div3").hide();
				});
			});
					
		
			
		</script>
		<script type="text/javascript">
			// 显示全部待审核的公告	
			function unverify() {
				$.ajax({
					type:"post",
					url:"eshop/unverifyServlet",
					dataType:"json",
					success:function(data){
						var text ="";
						for(var i=0;i<data.length;i++){
							text = text+"<tr><td>"+data[i].notice_id+"</td><td>"+data[i].notice_title+"</td><td>"+data[i].username+"</td><td><button onclick='pass(\""+data[i].notice_id+"\")' class='btn btn-secondary' >通过"+"</button>&nbsp;&nbsp;&nbsp;<button onclick='unpass(\""+data[i].notice_id+"\")' class='btn btn-secondary' >不通过"+"</button></td></tr>";
						}
						$("#shownotice").html(text);
					}
				});
			}
			//通过公告，notice_id传id到后端
			function pass(notice_id) {
				var data={"notice_id":notice_id};
				$.ajax({
					type:"post",
					data:data,
					url:"eshop/passNoticeServlet",
					dataType:"text",
					success:function(data){
						alert("编号为 "+data+" 的公告已通过！");
						unverify();
					}
				});
			} 
			//不通过公告
			function unpass(notice_id) {
				var data={"notice_id":notice_id};
				$.ajax({
					type:"post",
					data:data,
					url:"eshop/unpassNoticeServlet",
					dataType:"text",
					success:function(data){
						alert("编号为 "+data+" 的公告未通过！");
						unverify();
					}
				});
			}
			// 显示全部待审核的超市用户
			function unverifyUser() {
				$.ajax({
					type:"post",
					url:"eshop/unverifySuperUserServlet",
					dataType:"json",
					success:function(data){
						var text ="";
						for(var i=0;i<data.length;i++){
							text = text+"<tr><td>"+data[i].username+"</td><td>"+data[i].password+"</td><td><input type='button' onclick='passUser(\""+data[i].username+"\")' class='btn btn-secondary' value='通过'>&nbsp;&nbsp;&nbsp;&nbsp;<input type='button' onclick='unPassUser(\""+data[i].username+"\")' class='btn btn-secondary' value='不通过'></td></tr>";
						}
						$("#showUnverifyUser").html(text);
					}
				});
			}
			//通过用户，username传到后端
			function passUser(username) {
				var data={"username":username};
				$.ajax({
					type:"post",
					data:data,
					url:"eshop/passUserServlet",
					dataType:"text",
					success:function(data){
						alert("用户名为 "+data+" 的用户已通过！");
						unverifyUser();
					}
				});
			} 
			//不通过用户，username传到后端
			function unPassUser(username) {
				var data={"username":username};
				$.ajax({
					type:"post",
					data:data,
					url:"eshop/unpassUserServlet",
					dataType:"text",
					success:function(data){
						alert("用户名为 "+data+" 的用户未通过！");
						unverifyUser();
					}
				});
			} 
			
			function deleteSuperMarket(shop_title) {
				var data = {"shop_title":shop_title};
				$.ajax({
					type:"post",
					data:data,
					url:"eshop/deleteShopServlet",
					dataType:"text",
					success:function(data){
						alert("超市名称为 "+data+" 的超市已删除！");
						showAllShop();
					}
				});
			}
			// 显示全部超市	
			function showAllShop() {
				$.ajax({
					type:"post",
					url:"eshop/showAllShopServlet",
					dataType:"json",
					success:function(data){
						var text ="";
						for(var i=0;i<data.length;i++){
							text = text+"<div class=\"row\"><div class=\"col-5 \">"+data[i].shop_title+"</div><div class=\"col-2 \">"+data[i].shop_province+"</div><div class=\"col-2 \">"+data[i].shop_city+"</div><div class=\"col-3 \"><button class=\"btn btn-secondary\" data-toggle=\"modal\" data-target=\"#myModal\">修改</button>&nbsp;&nbsp;&nbsp;<button class=\"btn btn-secondary\" "+"onclick='deleteSuperMarket(\""+data[i].shop_title+"\")'>删除</button></div></div><hr>";
						}
						$("#showAllShop").html(text);
					}
				});
			}

			
			
		</script>
</body>
</html>