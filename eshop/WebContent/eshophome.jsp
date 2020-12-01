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

		<!--中部-->
		<div class="container">
			<div class="row" style="margin-top: 150px;">

				<!--左边菜单栏-->
				<div class="col-3">
					<div class="list-group">
						<a onclick="showAllNoticeByUsername()" class="list-group-item list-group-item-action" id="option1">管理公告</a>
						<a class="list-group-item list-group-item-action" id="option2">添加商品</a>
						<a onclick="showAllGoods()" class="list-group-item list-group-item-action" id="option3">管理商品</a>
					</div>
				</div>


				<div class="col-9" id="div1">

					<!--查看历史公告记录-->
					<hr>

					<div class="row">
						<div class="offset-5">
							<h4>历史公告记录</h4>
						</div>
					</div>
					<br>
					<hr>
					<br>
					<div id="showAllNotice">
						
					</div>
						

					<!--发布新公告-->
					<div class="row">
						<div class="offset-6">
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
								发布新公告
							</button>
						</div>

						<!-- 模态框 -->
						
						<div class="modal fade" id="myModal" style="margin-top: 100px;">
							<div class="modal-dialog">
								<div class="modal-content">
									
									<!--新公告内容-->
									<br>
									<div class="row">
										<div class="col-10 offset-1">
										
												<div class="form-group">
													<form action="${pageContext.request.contextPath}/noticeServlet" method="post" >
													    <input class="text form-control" placeholder="请输入编号" name="notice_id"/>
														<input class="text form-control" placeholder="请输入新公告标题" name="title"/>
														<textarea class="form-control" rows="5" name="content" placeholder="请输入新公告内容"></textarea>
														<button type="submit" class="btn btn-primary" >发布</button>
													</form>
												</div>
											<!-- 模态框底部 -->
												
										
									
										</div>
									</div>
								</div>
							</div>
						</div>
                        
					</div>
				</div>

				<!--增加商品-->
				<div class="col-9" id="div2">
					<form action="${pageContext.request.contextPath}/goodsServlet" method="post" enctype="multipart/form-data">
						<!--标题-->
						<hr>
						<div class="row">
							<div class="offset-5">
								<h4>填加商品</h4>
							</div>
						</div>
						<br>
						<hr>
						<br>

						<div class="row">

							<div class="col-4">商品编号</div>
							<div class="col-8">
								<input type="text" name="goods_id" class="form-control" placeholder="编号" />
							</div>
							<br>
							<div class="col-4">商品名称</div>
							<div class="col-8">
								<input type="text" name="goods_title" class="form-control" placeholder="名称" />
							</div>

							<div class="col-4">商品价格</div>
							<div class="col-8">
								<input type="text" name="goods_price" class="form-control" placeholder="价格" />
							</div>

							<div class="col-4">
								商品分类
							</div>
							<div class="col-8">
								<select class="btn form-control" name="goods_classify" style="margin-bottom: 15px;">
									<option value="大家电/生活电器">大家电/生活电器</option>
									<option value="手机/数码">手机/数码</option>
									<option value="生活用品/日用品">生活用品/日用品</option>
									<option value="生鲜蔬菜/进口水果">生鲜蔬菜/进口水果</option>
									<option value="零食/酒水/进口食品">零食/酒水/进口食品</option>
									<option value="家居摆件/床上用品">家居摆件/床上用品</option>
									<option value="办公/运动器具/户外用品">办公/运动器具/户外用品</option>
									<option value="五金/厨具">五金/厨具</option>
									<option value="玩具/图书音像">玩具/图书音像</option>
								</select>
							</div>

							<div class="col-4">商品图像</div>
							<div class="col-8">
								<div class="custom-file mb-3">
									<input type="file" class="custom-file-input" id="customFile" name="filename">
									<label class="custom-file-label" for="customFile">选择文件</label>
								</div>
							</div>
						</div>
						<hr>
						<button  type="submit" class="col-2 offset-10 btn btn-secondary">确认提交</button>
						
					</form>


				</div>


				<!--管理商品-->
				<div class="col-9" id="div3">
					<!--标题-->
					<hr>
					<div class="row">
						<div class="offset-5">
							<h4>管理商品</h4>
						</div>
					</div>
					<br>
					<hr>

					<br>
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th>商品编号</th>
									<th>商品分类</th>
									<th>商品名称</th>
									<th>商品价格</th>
									<th>操作</th>

								</tr>
							</thead>
							<tbody id="showAllGoods">
							
							</tbody>
                        </table>
						<!-- 模态框 -->
						<div class="modal fade" id="myModal2" style="margin-top: 100px;">
							<div class="modal-dialog">
								<div class="modal-content">

									<br>
									<div class="row">
										
										<div class="col-10 offset-1">
										<form action="${pageContext.request.contextPath}/updategoodsServlet" method="post" enctype="multipart/form-data" >
										    <div class="row">
										    
										    	<div class="col-4">商品编号</div>
										    	<div class="col-8">
										    		<input type="text" class="form-control" placeholder="编号" name="goods_id" />
										    	</div>
										    	<br>
										    	<div class="col-4">商品名称</div>
										    	<div class="col-8">
										    		<input type="text" class="form-control" placeholder="名称" name="goods_title" />
										    	</div>
										    
										    	<div class="col-4">商品价格</div>
										    	<div class="col-8">
										    		<input type="text" class="form-control" placeholder="价格" name="goods_price" />
										    	</div>
										    
										    	<div class="col-4">
										    		商品分类
										    	</div>
										    	<div class="col-8">
										    		<select class="btn form-control" style="margin-bottom: 15px;" name="goods_classify">
										    			<option value="大家电/生活电器">大家电/生活电器</option>
										    			<option value="手机/数码">手机/数码</option>
										    			<option value="生活用品/日用品">生活用品/日用品</option>
										    			<option value="生鲜蔬菜/进口水果">生鲜蔬菜/进口水果</option>
										    			<option value="零食/酒水/进口食品">零食/酒水/进口食品</option>
										    			<option value="家居摆件/床上用品">家居摆件/床上用品</option>
										    			<option value="办公/运动器具/户外用品">办公/运动器具/户外用品</option>
										    			<option value="五金/厨具">五金/厨具</option>
										    			<option value="玩具/图书音像">玩具/图书音像</option>
										    		</select>
										    	</div>
										    
										    	<div class="col-4">商品图像</div>
										    	<div class="col-8">
										    		<div class="custom-file mb-3">
										    			<input type="file" class="custom-file-input" id="customFile" name="filename">
										    			<label class="custom-file-label" for="customFile">选择文件</label>
										    		</div>
										    	</div>
										    </div>
										  
										  <!-- 模态框底部 -->
										  <div class="modal-footer">
										  	<button type="submit" class="btn btn-secondary">修改</button>
										  </div>
									</form>
									</div>
								</div>
							</div>
						</div>
				    </div>
				</div>
			</div>
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
					$("#div5").hide();
				});
			});

			$(document).ready(function() {
				$("#option2").click(function() {
					$("#div2").show();
					$("#div4").hide();
					$("#div1").hide();
					$("#div3").hide();
					$("#div5").hide();
				});
			});

			$(document).ready(function() {
				$("#option3").click(function() {
					$("#div3").show();
					$("#div1").hide();
					$("#div2").hide();
					$("#div4").hide();
					$("#div5").hide();
				});
			});

			$(document).ready(function() {
				$("#option4").click(function() {
					$("#div4").show();
					$("#div1").hide();
					$("#div2").hide();
					$("#div3").hide();
					$("#div5").hide();
				});
			});
		</script>
		<script type="text/javascript">
		// 显示全部已发布的公告	
		function showAllNoticeByUsername() {
			$.ajax({
				type:"post",
				url:"eshop/showAllPassNoticeByUsernameServlet",
				dataType:"json",
				success:function(data){
					var text ="";
					for(var i=0;i<data.length;i++){
						text = text+"<div class=\"row\"><div class=\"col-10\"><div class=\"card\"><div class=\"card-header\">"+data[i].notice_title+"</div><div class=\"card-body\"><div class=\"col-12\">"+data[i].notice_content+"</div><br><div class=\"col-4 offset-8\" >"+data[i].notice_time+"</div></div></div></div><div class=\"col-2\"><button class=\"btn btn-secondary\" onclick=\"deleteNotice('"+data[i].notice_id+"')\">删除公告</button></div></div><br>";
					}
					$("#showAllNotice").html(text);
				}
			});
		}
		//删除公告
			function deleteNotice(notice_id) {
				var data={"notice_id":notice_id};
				$.ajax({
					type:"post",
					data:data,
					url:"eshop/unpassNoticeServlet",
					dataType:"text",
					success:function(data){
						alert("标题为 "+data+" 的公告已删除！");
						showAllNoticeByUsername();
					}
				});
			} 
		
			// 显示全部商品	
			function showAllGoods() {
				$.ajax({
					type:"post",
					url:"eshop/showAllGoodsItemServlet",
					dataType:"json",
					success:function(data){
						var text ="";
						for(var i=0;i<data.length;i++){
							text = text+"<tr><td>"+data[i].goods_id+"</td><td>"+data[i].goods_classify+"</td><td>"+data[i].goods_title+"</td><td>"+data[i].goods_price+"</td><td><button class=\"btn btn-secondary\" data-toggle=\"modal\" data-target=\"#myModal2\">修改</button>&nbsp;&nbsp;&nbsp;<button class=\"btn btn-secondary\" onclick=\"deleteGoods('"+data[i].goods_id+"')\">删除</button></td></tr>";
						}
						$("#showAllGoods").html(text);
					}
				});
			}
			//删除商品
				function deleteGoods(goods_id) {
					var data={"goods_id":goods_id};
					$.ajax({
						type:"post",
						data:data,
						url:"eshop/deleteGoodsServlet",
						dataType:"text",
						success:function(data){
							alert("id为 "+data+" 的商品已删除！");
							showAllGoods();
						}
					});
				} 
		
		
		</script>
		<!--bottom-->
</div>
		<div class="jumbotron text-center container-fluid" style="margin-bottom: 0px; width:100% ;margin-top: 300px; background-color: rgba(4,30,66);">
			<center style="color:white ;"><small >江西财经大学 </small>@2019-2020</center>
		</div>
</body>
</html>