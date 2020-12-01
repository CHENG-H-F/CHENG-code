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
    <style type="text/css">
		
		
		/* -------商品 -------- */
		#product
		{
			width: 1200px;
			/* height: 1000px; */
			position: relative;
			/* background: greenyellow; */
		}
		
		/* ------- 不空 -------- */
		#product > div:nth-of-type(1)
		{
			/* display: none; */
		}
		
		/* ------- 选中 -------- */
		.checked
		{
			width: 30px;
			height: 30px;
			border: 1px solid #9E9E9E;
			border-radius: 20px;
			-webkit-border-radius: 20px;
			-moz-border-radius: 20px;
			appearance: none;
			-webkit-appearance:none;
			-moz-appearance: none;
			outline: none;
			cursor: pointer;
		}
		
		.checked::after
		{
			width: 100%;
			height: 100%;
			background: #0457A9;
			color: #fff;
			text-align: center;
			line-height: 30px;
			border-radius: 20px;
			content: '✔';
			display: block;
			transition: all ease-in-out 300ms;
			opacity: 0;
		}
		
		.checked:checked::after
		{
		    border-radius: 20px;
		    opacity: 1;
		}
		
		/* ------- 加减 -------- */
		.AddAndSubtract
		{
			width: 160px;
			height: 30px;
			position: relative;
			margin: 0px auto;
			/* background: #008B8B; */
		}
		
		.AddAndSubtract input:nth-of-type(2)
		{
			width: 100px;
			height: 30px;
			position: absolute;
			left: 30px;
			padding: 0px 5px;
			font-size: 15px;
			border: 1px solid #ccc; 
			border-radius: 3px;
		}
		
		.AddAndSubtract input:nth-of-type(1)
		{
			width: 30px;
			height: 32px;
			position: absolute;
			left: 0px;
			background: white;
			font-size: 20px;
			border: 1px solid #ccc; 
			border-radius: 3px;
			outline-style: none;
			cursor: pointer;
		}
		
		.AddAndSubtract input:nth-of-type(3)
		{
			width: 30px;
			height: 32px;
			position: absolute;
			left: 142px;
			background: white;
			font-size: 20px;
			border: 1px solid #ccc; 
			border-radius: 3px;
			outline-style: none;
			cursor: pointer;
		}
		
		/* ------- 删除 -------- */
		.deleted
		{
			font-size: 30px;
			cursor: pointer;
		}
		
		/* ------- 表格 -------- */		
		#product table
		{
			position: relative;
			border-spacing: 0px;
			border-collapse: collapse;
		}
		
		#product tr
		{
			border: 1px solid #DBDBDB;
		}
		
		#product tr:hover
		{
			background: #F5FAFF;
		}
		
		#product th
		{
			height: 60px;
			background: #F8F8F8;
		}
		
		#product th:nth-of-type(1)
		{
			width: 85px;
			/* background: #008B8B; */
		}
		
		#product th:nth-of-type(2)
		{
			width: 415px;
			/* background: #0457A9; */
			text-align: left;
		}
		
		#product th:nth-of-type(3)
		{
			width: 200px;
			/* background: #557669; */
		}
		
		#product th:nth-of-type(4)
		{
			width: 280px;
		}
		
		#product th:nth-of-type(5)
		{
			width: 120px;
		}
		
		#product th:nth-of-type(6)
		{
			width: 100px;
		}
		
		#product td
		{
			height: 120px;
			/* background: darkcyan; */
			text-align: center;
		}
		
		#product td:nth-of-type(2)
		{
			text-align: left;
		}
		
		#product td:nth-of-type(2) img
		{
			width: 60px;
			margin: 25px 0px;
			float: left;
		}
		
		#product td:nth-of-type(2) span:nth-of-type(1)
		{
			width: 330px;
			/* background: #0457A9; */
			margin: 25px 0px 15px;
			float: right;
			display: block;
		}
		
		#product td:nth-of-type(2) span:nth-of-type(2)
		{
			width: 330px;
			margin: 0px 0px 10px;
			/* background: goldenrod; */
			font-size: 14px;
			float: right;
			display: block;
		}
		
		/* ------- 信息 -------- */
		#info
		{
			width: 1200px;
			height: 50px;
			position: relative;
			line-height: 50px;
		}
		
		#info div:nth-of-type(1)
		{
			position: absolute;
			top: 0px;
			left: 10px;
		}
		
		#info div:nth-of-type(2)
		{
			position: absolute;
			top: 0px;
			right: 10px;
		}
		
		#info div span
		{
			font-size: 25px;
			color: #0457A9;
		}
		
		/* ------- 按钮 -------- */
		#button
		{
			width: 525px;
			position: relative;
			margin: 50px auto 50px;
			/* background: darkblue; */
		}
		
		#button input
		{
		    width: 180px;
		    height: 45px;
			margin: 0px 40px;
		    background-color: #0457A9;
			font-size: 20px;
			color: white;
			border: 1px solid #ccc; 
			border-radius: 3px;
			outline-style: none;
			cursor: pointer;
		}
		
		/* ------- 空 -------- */
		#product > div:nth-of-type(2)
		{
			width: 1200px;
			height: 300px;
			/* background: firebrick; */
			font-size: 25px;
			line-height: 300px;
			text-align: center;
			/* display: none; */
		}
		
		#product > div:nth-of-type(2) a
		{
			margin: 0px 50px;
			background: darkcyan;
			font-size: 20px;
			color: #0457A9;
		}
		
				
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
    	.carousel-inner img {
		    width: 100%;
		    height: 100%;
		 }
		 .col-3{
			padding-left: 0px;;
			padding-right: 6%;
		}
		
		.add{
			float: right;
			margin-left: 0px;
		}
		
    </style>
</head>
<body>
    <!--头部固定导航栏-->
		<div class="header">
			<a href="#"><img src="resources/img/logo1.png" style="width: 100px; margin-left: 40px; margin-top: 5px;"></a>
			<div style="top: 50%;left: 50%;transform: translate(-50%,-50%);">
				<form class="form-check-inline">
					<input class="form-control" type="text" placeholder="Search" id="inputGoodsTitie">
					<button onclick="fuzzyQuery()" class="btn btn-success" type="button">Search</button>
				</form>
			</div>
			<div style="right: 20px; bottom: 20px;">
				<img src="resources/img/shopcar.png" style="width: 60px;" >
				<img src="${photo_url}" style="width: 30px; border-radius: 10px;margin-left: 20px;" id="userphoto" />
				<span style="">|</span>
				<a href="/eshop/login.jsp">退出</a>
			</div>
		</div>



		<div class="container">
			<div class="middle" style="margin-top: 150px;">
				<!-- Nav pills -->
				<ul class="nav nav-pills" role="tablist">
					<li class="nav-item">
						<a class="nav-link active" data-toggle="pill" href="#home">首页</a>
					</li>
					<li class="nav-item">
						<a onclick="showAllGoods()" class="nav-link" data-toggle="pill" href="#menu1">商品</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="pill" href="#menu2">购物车</a>
					</li>
					<li class="nav-item">
						<a onclick="orderFresh()" class="nav-link" data-toggle="pill" href="#menu3" >订单中心</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="pill" href="#menu4">帮助中心</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" data-toggle="pill" href="#menu5" onclick="refresh()">个人中心</a>
					</li>
				</ul>

				<!-- Tab panes -->
				<div class="tab-content">
					<div id="home" class="container tab-pane active"><br>
						<div id="demo" class="carousel slide" data-ride="carousel">

							<!-- 指示符 -->
							<ul class="carousel-indicators">
								<li data-target="#demo" data-slide-to="0" class="active"></li>
								<li data-target="#demo" data-slide-to="1"></li>
								<li data-target="#demo" data-slide-to="2"></li>
							</ul>

							<!-- 轮播图片 -->
							<div class="carousel-inner">
								<div class="carousel-item active">
									<img src="resources/img/1.png">
								</div>
								<div class="carousel-item">
									<img src="resources/img/2.png">
								</div>
								<div class="carousel-item">
									<img src="resources/img/3.png">
								</div>
							</div>

							<!-- 左右切换按钮 -->
							<a class="carousel-control-prev" href="#demo" data-slide="prev">
								<span class="carousel-control-prev-icon"></span>
							</a>
							<a class="carousel-control-next" href="#demo" data-slide="next">
								<span class="carousel-control-next-icon"></span>
							</a>

						</div>


					</div>


					<div id="menu1" class="container tab-pane fade"><br>
						<div class="container">
							<div class="row">


								<!--左边菜单栏-->
								<div class="col-3">
									<div class="list-group">
										<a onclick="showAllGoods()" href="#" class="list-group-item list-group-item-action" id="option1">全部</a>
										<a onclick="getJson('大家电/生活电器')" class="list-group-item list-group-item-action" id="option2">大家电/生活电器</a>
										<a onclick="getJson('手机/数码')" class="list-group-item list-group-item-action" id="option3">手机/数码</a>
										<a onclick="getJson('生活用品/日用品')" class="list-group-item list-group-item-action" id="option4">生活用品/日用品</a>
										<a onclick="getJson('生鲜蔬菜/进口水果')" class="list-group-item list-group-item-action" id="option5">生鲜蔬菜/进口水果</a>
										<a onclick="getJson('零食/酒水/进口食品')" class="list-group-item list-group-item-action" id="option6">零食/酒水/进口食品</a>
										<a onclick="getJson('家居摆件/床上用品')" class="list-group-item list-group-item-action" id="option7">家居摆件/床上用品</a>
										<a onclick="getJson('办公/运动器具/户外用品')" class="list-group-item list-group-item-action" id="option8">办公/运动器具/户外用品</a>
										<a onclick="getJson('五金/厨具')" class="list-group-item list-group-item-action" id="option9">五金/厨具</a>
										<a onclick="getJson('玩具/图书音像')" class="list-group-item list-group-item-action" id="option10">玩具/图书音像</a>
									</div>
								</div>
								<!--全部-->
								<div class="col-9" id="div1">
									<div class="row" id="row1">
										<div class="col-4" id="goodsRow1">
										</div>
										<div class="col-4" id="goodsRow2">	
										</div>
										<div class="col-4" id="goodsRow3">											
										</div>
									</div>
								</div>
								<!-- 大家电/生活电器 -->
								<div class="col-9" id="div2">
									<div class="row" id="row2">
										<div class="col-4" id="goodsRow1">
										</div>
										<div class="col-4" id="goodsRow2">	
										</div>
										<div class="col-4" id="goodsRow3">											
										</div>
									</div>
								</div>
								<!-- 手机/数码 -->
								<div class="col-9" id="div3">
									<div class="row" id="row3">
										<div class="col-4" id="goodsRow1">
										</div>
										<div class="col-4" id="goodsRow2">	
										</div>
										<div class="col-4" id="goodsRow3">											
										</div>
									</div>
								</div>
								<!-- 生活用品/日用品 -->
								<div class="col-9" id="div4">
									<div class="row" id="row4">
										<div class="col-4" id="goodsRow1">
										</div>
										<div class="col-4" id="goodsRow2">	
										</div>
										<div class="col-4" id="goodsRow3">											
										</div>
									</div>
								</div>
								<!-- 生鲜蔬菜/进口水果 -->
								<div class="col-9" id="div5">
									<div class="row" id="row5">
										<div class="col-4" id="goodsRow1">
										</div>
										<div class="col-4" id="goodsRow2">	
										</div>
										<div class="col-4" id="goodsRow3">											
										</div>
									</div>
								</div>
								<!-- 零食/酒水/进口食品 -->
								<div class="col-9" id="div6">
									<div class="row" id="row6">
										<div class="col-4" id="goodsRow1">
										</div>
										<div class="col-4" id="goodsRow2">	
										</div>
										<div class="col-4" id="goodsRow3">											
										</div>
									</div>
								</div>
								<!-- 家居摆件/床上用品 -->
								<div class="col-9" id="div7">
									<div class="row" id="row7">
										<div class="col-4" id="goodsRow1">
										</div>
										<div class="col-4" id="goodsRow2">	
										</div>
										<div class="col-4" id="goodsRow3">											
										</div>
									</div>
								</div>
								<!-- 办公/运动器具/户外用品 -->
								<div class="col-9" id="div8">
									<div class="row" id="row8">
										<div class="col-4" id="goodsRow1">
										</div>
										<div class="col-4" id="goodsRow2">	
										</div>
										<div class="col-4" id="goodsRow3">											
										</div>
									</div>
								</div>
								<!-- 五金/厨具 -->
								<div class="col-9" id="div9">
									<div class="row" id="row9">
										<div class="col-4" id="goodsRow1">
										</div>
										<div class="col-4" id="goodsRow2">	
										</div>
										<div class="col-4" id="goodsRow3">											
										</div>
									</div>
								</div>
								<!-- 玩具/图书音像 -->
								<div class="col-9" id="div10">
									<div class="row" id="row10">
										<div class="col-4" id="goodsRow1">
										</div>
										<div class="col-4" id="goodsRow2">	
										</div>
										<div class="col-4" id="goodsRow3">											
										</div>
									</div>
								</div>


							</div>
						</div>
					</div>
					<!--js-->
					<script>
					$("#div2").fadeOut();
					$("#div3").fadeOut();
					$("#div4").fadeOut();
					$("#div5").fadeOut();
					$("#div6").fadeOut();
					$("#div7").fadeOut();
					$("#div8").fadeOut();
					$("#div9").fadeOut();
					$("#div10").fadeOut();
					$(document).ready(function(){
					  $("#option1").click(function(){
					    $("#div1").fadeIn();
					    $("#div2").fadeOut();
					    $("#div3").fadeOut();
					    $("#div4").fadeOut();
						$("#div5").fadeOut();
						$("#div6").fadeOut();
						$("#div7").fadeOut();
						$("#div8").fadeOut();
						$("#div9").fadeOut();
						$("#div10").fadeOut();
					  });
					});
					
					$(document).ready(function(){
					  $("#option2").click(function(){
					    $("#div1").fadeOut();
					    $("#div3").fadeOut();
						$("#div2").fadeIn();
						$("#div4").fadeOut();
						$("#div5").fadeOut();
						$("#div6").fadeOut();
						$("#div7").fadeOut();
						$("#div8").fadeOut();
						$("#div9").fadeOut();
						$("#div10").fadeOut();
					  });
					});
					
					$(document).ready(function(){
					  $("#option3").click(function(){
					    $("#div3").fadeIn();
					    $("#div1").fadeOut();
					    $("#div2").fadeOut();
					    $("#div4").fadeOut();
						$("#div5").fadeOut();
						$("#div6").fadeOut();
						$("#div7").fadeOut();
						$("#div8").fadeOut();
						$("#div9").fadeOut();
						$("#div10").fadeOut();
					  });
					});
					
					$(document).ready(function(){
						  $("#option4").click(function(){
						    $("#div3").fadeOut();
						    $("#div1").fadeOut();
						    $("#div2").fadeOut();
						    $("#div4").fadeIn();
							$("#div5").fadeOut();
							$("#div6").fadeOut();
							$("#div7").fadeOut();
							$("#div8").fadeOut();
							$("#div9").fadeOut();
							$("#div10").fadeOut();
						  });
						});
					$(document).ready(function(){
						  $("#option5").click(function(){
						    $("#div3").fadeOut();
						    $("#div1").fadeOut();
						    $("#div2").fadeOut();
						    $("#div4").fadeOut();
							$("#div5").fadeIn();
							$("#div6").fadeOut();
							$("#div7").fadeOut();
							$("#div8").fadeOut();
							$("#div9").fadeOut();
							$("#div10").fadeOut();
						  });
						});
					$(document).ready(function(){
						  $("#option6").click(function(){
						    $("#div3").fadeOut();
						    $("#div1").fadeOut();
						    $("#div2").fadeOut();
						    $("#div4").fadeOut();
							$("#div5").fadeOut();
							$("#div6").fadeIn();
							$("#div7").fadeOut();
							$("#div8").fadeOut();
							$("#div9").fadeOut();
							$("#div10").fadeOut();
						  });
						});
					$(document).ready(function(){
						  $("#option7").click(function(){
						    $("#div3").fadeOut();
						    $("#div1").fadeOut();
						    $("#div2").fadeOut();
						    $("#div4").fadeOut();
							$("#div5").fadeOut();
							$("#div6").fadeOut();
							$("#div7").fadeIn();
							$("#div8").fadeOut();
							$("#div9").fadeOut();
							$("#div10").fadeOut();
						  });
						});
					$(document).ready(function(){
						  $("#option8").click(function(){
						    $("#div3").fadeOut();
						    $("#div1").fadeOut();
						    $("#div2").fadeOut();
						    $("#div4").fadeOut();
							$("#div5").fadeOut();
							$("#div6").fadeOut();
							$("#div7").fadeOut();
							$("#div8").fadeIn();
							$("#div9").fadeOut();
							$("#div10").fadeOut();
						  });
						});
					$(document).ready(function(){
						  $("#option9").click(function(){
						    $("#div3").fadeOut();
						    $("#div1").fadeOut();
						    $("#div2").fadeOut();
						    $("#div4").fadeOut();
							$("#div5").fadeOut();
							$("#div6").fadeOut();
							$("#div7").fadeOut();
							$("#div8").fadeOut();
							$("#div9").fadeIn();
							$("#div10").fadeOut();
						  });
						});
					$(document).ready(function(){
						  $("#option10").click(function(){
						    $("#div3").fadeOut();
						    $("#div1").fadeOut();
						    $("#div2").fadeOut();
						    $("#div4").fadeOut();
							$("#div5").fadeOut();
							$("#div6").fadeOut();
							$("#div7").fadeOut();
							$("#div8").fadeOut();
							$("#div9").fadeOut();
							$("#div10").fadeIn();
						  });
						});

					
					
				</script>


					<!--购物车-->
					<div id="menu2" class="container tab-pane fade"><br>
					<div id="content">
					
					
						<!------ 商品 ------->
						<div id="product">
							<div>
								<c:if test="${not empty cart}">
									<table>
										<tr>
											<th><input id="checkedAll" style="margin-left: 25px;"class="checked" type="checkbox" onclick='checkedAll()' /></th>
											<th>商品名称</th>
											<th>单价(元)</th>
											<th>数量</th>
											<th>总价(元)</th>
											<th>操作</th>
										</tr>
					
										<c:forEach items="${cart}" var="i" varStatus="status">
										<!--内容-->
										<tr>
											<td><input class="checked" name="checked${status.count}" type="checkbox" /></td>
											<td>
												<img src="${i.goods_photo}" />
												<span id="goods_title">${i.goods_title }</span>
											</td>
											<td>${i.goods_price }</td>
					
											<td>
												<div class="AddAndSubtract">
													<input type="button" value="-" />
													<input class="bookNumber" name="bookNumber${status.count}" type="text" value="1" />
													<input type="button" value="+" />
												</div>
											</td>
					
											<td>${i.goods_price }</td>
											<td>
												<a href="${pageContext.request.contextPath}/delgoodscartServlet?goods_id=${i.goods_id}"><span
													 class="deleted">×</span></a>
											</td>
					
										</tr>
										</c:forEach>
									</table>
					
									<div id="info">
										<div>共<span id="goods_num">0</span>件商品</div>
										<div>合计: <span id="goods_price">0</span> 元</div>
									</div>
					
									<div id="button">
										<a href="#"><input type="submit" value="下单" onclick="ordergoods()"></a>
										<a href="${pageContext.request.contextPath}/clearCartServlet"><input type="reset" value="清空购物车"></a>
									</div>
					
									<input style="display:none;" id="orderItemNumber" name="orderItemNumber" value="0" />
								</c:if>
							</div>
					
							<c:if test="${empty cart}">
							<div>
								<span>购物车是空的~</span>
							</div>
							</c:if>
						</div>
					</div>
					  </div>
					  
					  <!--js-->
					  <script>
					  function ordergoods(){						  
						  var data={
									"goods_title":$("#goods_title").html(),
									"goods_num":$("#goods_num").html(),
									"goods_price":$("#goods_price").html()
					       };
							$.ajax({
								type:"post",
								url:"eshop/ordergoodsServlet",
								data:data,
								success:function(){
						 			alert("下单成功！");
								}
							});
					  }
					  $(document).ready(function() {
					  
					  		// --------- 全选 ----------
					  		$("#checkedAll").prop("checked", true);
					  		$("input[class=checked]").prop("checked", true);
					  
					  		$("#checkedAll").click(function() {
					  			if ($("#checkedAll").prop("checked") == true) {
					  				$("input[class=checked]").prop("checked", true);
					  			} else {
					  				$("input[class=checked]").prop("checked", false);
					  			}
					  
					  			//商品数量
					  			var productTotalNumber = 0;
					  			$(".AddAndSubtract input:nth-of-type(2)").each(function() {
					  				if ($(this).parent().parent().parent().children("td:nth-of-type(1)").find(".checked").prop("checked") ==
					  					true) {
					  					productTotalNumber = productTotalNumber + parseInt($(this).val());
					  				}
					  			});
					  			$("#info div:nth-of-type(1) span").text(productTotalNumber);
					  
					  			//合计
					  			var productTotalPrice = 0;
					  			$("#product table tr:gt(0)").each(function() {
					  				if ($(this).find("td:nth-of-type(1)").find(".checked").prop("checked") == true) {
					  					productTotalPrice = productTotalPrice + parseFloat($(this).find("td:eq(4)").text());
					  				}
					  			});
					  			$("#info div:nth-of-type(2) span").text(productTotalPrice.toFixed(2));
					  		});
					  
					  		$("input[class=checked]").click(function() {
					  			$("input[class=checked]").each(function() {
					  				if ($(this).prop("checked") == false) {
					  					$("#checkedAll").prop("checked", false);
					  					return false;
					  				}
					  
					  				$("#checkedAll").prop("checked", true);
					  			});
					  
					  			//商品数量
					  			var productTotalNumber = 0;
					  			$(".AddAndSubtract input:nth-of-type(2)").each(function() {
					  				if ($(this).parent().parent().parent().children("td:nth-of-type(1)").find(".checked").prop("checked") ==
					  					true) {
					  					productTotalNumber = productTotalNumber + parseInt($(this).val());
					  				}
					  			});
					  			$("#info div:nth-of-type(1) span").text(productTotalNumber);
					  
					  			//合计
					  			var productTotalPrice = 0;
					  			$("#product table tr:gt(0)").each(function() {
					  				if ($(this).find("td:nth-of-type(1)").find(".checked").prop("checked") == true) {
					  					productTotalPrice = productTotalPrice + parseFloat($(this).find("td:eq(4)").text());
					  				}
					  			});
					  			$("#info div:nth-of-type(2) span").text(productTotalPrice.toFixed(2));
					  		});
					  
					  		// --------- 减少数量 ----------
					  		$(".AddAndSubtract input:nth-of-type(1)").click(function() {
					  			var productNumber = $(this).next().val();
					  
					  			if (productNumber <= 1) {
					  				alert('数量不能小于1');
					  			} else {
					  				productNumber = parseInt(productNumber) - 1;
					  				$(this).next().val(productNumber);
					  
					  				//小计
					  				var productPrice = $(this).parent().parent().prev().text();
					  				$(this).parent().parent().next().text((productNumber * productPrice).toFixed(2));
					  
					  				//商品数量
					  				var productTotalNumber = 0;
					  				$(".AddAndSubtract input:nth-of-type(2)").each(function() {
					  					if ($(this).parent().parent().parent().children("td:nth-of-type(1)").find(".checked").prop("checked") ==
					  						true) {
					  						productTotalNumber = productTotalNumber + parseInt($(this).val());
					  					}
					  				});
					  				$("#info div:nth-of-type(1) span").text(productTotalNumber);
					  
					  				//合计
					  				var productTotalPrice = 0;
					  				$("#product table tr:gt(0)").each(function() {
					  					if ($(this).find("td:nth-of-type(1)").find(".checked").prop("checked") == true) {
					  						productTotalPrice = productTotalPrice + parseFloat($(this).find("td:eq(4)").text());
					  					}
					  				});
					  				$("#info div:nth-of-type(2) span").text(productTotalPrice.toFixed(2));
					  			}
					  		});
					  
					  		// --------- 增加数量 ----------
					  		$(".AddAndSubtract input:nth-of-type(3)").click(function() {
					  			var productNumber = $(this).prev().val();
					  
					  			
					  				productNumber = parseInt(productNumber) + 1;
					  				$(this).prev().val(productNumber);
					  
					  				//小计
					  				var productPrice = $(this).parent().parent().prev().text();
					  				$(this).parent().parent().next().text((productNumber * productPrice).toFixed(2));
					  
					  				//商品数量
					  				var productTotalNumber = 0;
					  				$(".AddAndSubtract input:nth-of-type(2)").each(function() {
					  					if ($(this).parent().parent().parent().children("td:nth-of-type(1)").find(".checked").prop("checked") ==
					  						true) {
					  						productTotalNumber = productTotalNumber + parseInt($(this).val());
					  					}
					  				});
					  				$("#info div:nth-of-type(1) span").text(productTotalNumber);
					  
					  				//合计
					  				var productTotalPrice = 0;
					  				$("#product table tr:gt(0)").each(function() {
					  					if ($(this).find("td:nth-of-type(1)").find(".checked").prop("checked") == true) {
					  						productTotalPrice = productTotalPrice + parseFloat($(this).find("td:eq(4)").text());
					  					}
					  				});
					  				$("#info div:nth-of-type(2) span").text(productTotalPrice.toFixed(2));
					  			
					  		});
					  
					  		// --------- 键入数量 ----------
					  		$(".AddAndSubtract input:nth-of-type(2)").keyup(function() {
					  			var productNumber = $(this).val();
					  
					  			if (productNumber % 1 == 0) {
					  				if (productNumber < 1) {
					  					alert('数量不能小于1');
					  					productNumber = 1;
					  					$(this).val("1");
					  				} 
					  				 else {
					  
					  				}
					  			} else {
					  				productNumber = 1;
					  				$(this).val(parseInt("1"));
					  			}
					  
					  			//小计
					  			var productPrice = $(this).parent().parent().prev().text();
					  			$(this).parent().parent().next().text((productNumber * productPrice).toFixed(2));
					  
					  			//商品数量
					  			var productTotalNumber = 0;
					  			$(".AddAndSubtract input:nth-of-type(2)").each(function() {
					  				if ($(this).parent().parent().parent().children("td:nth-of-type(1)").find(".checked").prop("checked") ==
					  					true) {
					  					productTotalPrice = productTotalNumber + parseInt($(this).val());
					  				}
					  			});
					  			$("#info div:nth-of-type(1) span").text(productTotalNumber);
					  
					  			//合计
					  			var productTotalPrice = 0;
					  			$("#product table tr:gt(0)").each(function() {
					  				if ($(this).find("td:nth-of-type(1)").find(".checked").prop("checked") == true) {
					  					productTotalPrice = productTotalPrice + parseFloat($(this).find("td:eq(4)").text());
					  				}
					  			});
					  			$("#info div:nth-of-type(2) span").text(productTotalPrice.toFixed(2));
					  		});
					  
					  		// --------- 删除 ----------
					  		$(".deleted").click(function() {
					  			$(this).parent().parent().remove();
					  
					  			//商品数量
					  			var productTotalNumber = 0;
					  			$(".AddAndSubtract input:nth-of-type(2)").each(function() {
					  				if ($(this).parent().parent().parent().children("td:nth-of-type(1)").find(".checked").prop("checked") ==
					  					true) {
					  					productTotalNumber = productTotalNumber + parseInt($(this).val());
					  				}
					  			});
					  			$("#info div:nth-of-type(1) span").text(productTotalNumber);
					  
					  			//合计
					  			var productTotalPrice = 0;
					  			$("#product table tr:gt(0)").each(function() {
					  				if ($(this).find("td:nth-of-type(1)").find(".checked").prop("checked") == true) {
					  					productTotalPrice = productTotalPrice + parseFloat($(this).find("td:eq(4)").text());
					  				}
					  			});
					  			$("#info div:nth-of-type(2) span").text(productTotalPrice.toFixed(2));
					  		});
					  
					  		// --------- 结算 ----------
					  		$("#button a:nth-of-type(1) input").click(function() {
					  			alert("成功下单！");
					  		});
					  
					  		// --------- 商品数量 ----------
					  		var productTotalNumber = 0;
					  		$(".AddAndSubtract input:nth-of-type(2)").each(function() {
					  			if ($(this).parent().parent().parent().children("td:nth-of-type(1)").find(".checked").prop("checked") == true) {
					  				productTotalNumber = productTotalNumber + parseInt($(this).val());
					  			}
					  		});
					  		$("#info div:nth-of-type(1) span").text(productTotalNumber);
					  
					  		// --------- 单价、小计和合计 ----------
					  		var productTotalPrice = 0;
					  		$("#product table tr:gt(0)").each(function() {
					  			//单价
					  			var productPrice = parseFloat($(this).children("td:eq(2)").text());
					  			$(this).children("td:eq(2)").text((productPrice).toFixed(2));
					  
					  			//小计
					  			var productNumber = parseInt($(this).children("td:eq(3)").find("input:eq(1)").val());
					  			$(this).children("td:eq(4)").text((productNumber * productPrice).toFixed(2));
					  
					  			//合计
					  			if ($(this).find("td:nth-of-type(1)").find(".checked").prop("checked") == true) {
					  				productTotalPrice = productTotalPrice + parseFloat($(this).find("td:eq(4)").text());
					  			}
					  		});
					  		$("#info div:nth-of-type(2) span").text(productTotalPrice.toFixed(2));
					  
					  		// --------- 订单项数量 ----------
					  		$("#orderItemNumber").val($("#product table").find("tr").length - 1);
					  	});
					  </script>
					

 
 


					
 
					<!--订单中心-->
					<div id="menu3" class="container tab-pane fade">

						<br>
						<div class="card">
							<div class="card-header">
								<div class="row">
									<div class="col-2">订单编号</div>
									<div class="col-6">订单信息</div>
									<div class="col-3">总额</div>
								</div>
							</div>
							    <div class="card-body" id="order" >
							    
									
								</div>
							

						</div>
					</div>



					<!--帮助中心-->
					<div id="menu4" class="container tab-pane fade"><br>
						<div id="accordion">
							<div class="card">
								<div class="card-header">
									<a class="card-link" data-toggle="collapse" href="#collapseOne">
										公告
									</a>
								</div>
								<div id="collapseOne" class="collapse show" data-parent="#accordion">
									<c:forEach var="i" items="${notice}">
									   <div class="card-body">
											<ul>
												<div class="title">
													<h3>
														<center>${i.notice_title}</center>
													</h3>
												</div>
												<div class="body" style="margin-top: 50px;">${i.notice_content}</div>
												<div class="time" style="margin-top: 60px;;"><p style="text-align: right;">${i.notice_time}</p></div>
											</ul>
										</div>
										<hr>
									</c:forEach>
								</div>
								
								
							</div>

							<div class="card">
								<div class="card-header">
									<a class="card-link" data-toggle="collapse" href="#collapseTwo">
										支付问题
									</a>
								</div>
								<div id="collapseTwo" class="collapse" data-parent="#accordion">
									<div class="card-body">
										<ul>
											<a href="#">
												<li>支付失败怎么办？</li>
											</a>
											<a href="#">
												<li>如何更换其他支付方式？</li>
											</a>
											<a href="#">
												<li>支付账户信息有误是怎么回事？</li>
											</a>
										</ul>
									</div>
								</div>
							</div>
							<div class="card">
								<div class="card-header">
									<a class="collapsed card-link" data-toggle="collapse" href="#collapseThree">
										订单问题
									</a>
								</div>
								<div id="collapseThree" class="collapse" data-parent="#accordion">
									<div class="card-body">
										<ul>
											<a href="#">
												<li>为什么订单被延迟？</li>
											</a>
											<a href="#">
												<li>订单出现问题怎么办?</li>
											</a>
											<a href="#">
												<li>如何取消订单？</li>
											</a>
											<a href="#">
												<li>如何追踪订单？</li>
											</a>
										</ul>
									</div>
								</div>
							</div>
							<div class="card">
								<div class="card-header">
									<a class="collapsed card-link" data-toggle="collapse" href="#collapseFour">
										历史记录
									</a>
								</div>
								<div id="collapseFour" class="collapse" data-parent="#accordion">
									<div class="card-body">
										<ul>
											<a href="#">
												<li>如何查找历史记录？</li>
											</a>
											<a href="#">
												<li>如何删除历史记录？</li>
											</a>
										</ul>

									</div>
								</div>
							</div>

							<div class="card">
								<div class="card-header">
									<a class="collapsed card-link" data-toggle="collapse" href="#collapseFive">
										隐私问题
									</a>
								</div>
								<div id="collapseFive" class="collapse" data-parent="#accordion">
									<div class="card-body">


										<ul>
											<a href="#">
												<li>收货人号码会不会被泄露？</li>
											</a>
											<a href="#">
												<li>接到超市骚扰电话？</li>
											</a>
										</ul>

									</div>
								</div>
							</div>

							<div class="card">
								<div class="card-header">
									<a class="collapsed card-link" data-toggle="collapse" href="#collapseSix">
										质量问题
									</a>
								</div>
								<div id="collapseSix" class="collapse" data-parent="#accordion">
									<div class="card-body">


										<ul>
											<a href="#">
												<li>商品过期了怎么办？</li>
											</a>
											<a href="#">
												<li>如何申请退款？</li>
											</a>
										</ul>

									</div>
								</div>
							</div>



						</div>
					</div>

					<!--个人中心-->
					<div id="menu5" class="container tab-pane fade"><br>
						<hr>
						<form action="eshop/updatePersonalServlet" method="post"  enctype="multipart/form-data">
							<div class="row">
								<div class="col-4">头像</div>
								<div class="col-6"><img src="resources/img/defaultuser1.png" id="showPhoto" style="width: 120px; border-radius: 10px;"></div>
								<div class="col-6 offset-4" style="margin-top: 10px;">
								<input type="file" name="fileName" id="file" style="width: 0;height: 0" accept="image/*" onchange="loadFile(this.files[0])"> 
								<label class="btn btn-info" for="file">上传文件</label>
								<label id="filePos" style="font-size: 14px; margin-left:5px; color:red;">未上传</label></div>
							</div>

							<hr>

							<div class="row">
								<div class="col-4">用户名：</div>
								<div class="col-6" id="showName" name="username"></div>
							</div><br>

							<div class="row">
								<div class="col-4">性别：</div>
								<div class="col-6">
									
										<label class="radio-inline"><input type="radio" id="man" name="sex" checked value="男" >男</label>
										<label class="radio-inline"><input type="radio" id="woman" name="sex" style="margin-left: 10px;" value="女">女</label>
								</div>
							</div><br>

							<div class="row">
								<div class="col-4">电话：</div>
								<div class="col-6">
									<input type="text" class="form-control" placeholder="Phone Number" id="phoneNumber" name="tel">
								</div>
							</div><br>

								<div class="row">
									<div class="col-4">生日：</div>
									<div class="col-6">
										<input type="date" class="form-control" placeholder="生日" name="birthday" />
									</div>
								</div>

							<br>

							<div class="row">
								<div class="col-4">收货地址：</div>
								<div class="col-8">
									<input type="text" class="form-control" placeholder="address" id="adress" name="address">
								</div>
							</div><br>

							<div class="row">
								<div class="col-4">邮箱：</div>
								<div class="col-8">
									<input type="text" class="form-control" placeholder="email" id="deemo" name="email">
									<div class="input-group-append">
									</div>
								</div>
						
					</div>
					
					<hr>
					<div class="row">
						<div class="col-6 offset-6">
							<button type="submit" class="btn btn-primary" >提交</button>
						</div>
					</div>
					</form>
				</div>

			</div>
			<hr>
		</div>
		</div>
		</div>
		</div>





		<div class="jumbotron text-center container-fluid" style="margin-bottom: 0px; width:100% ;margin-top: 300px; background-color: rgba(4,30,66);">
			<center style="color:white ;"><small>江西财经大学 </small>@2019-2020</center>
		</div>


		<script type="text/javascript">
			var wid = window.outerWidth;
			var searchwid = 0.3 * wid;
			$(".form-control").css("width", searchwid + "px");
			
			// 文件上传控件美化
			function loadFile(file){
	        	$("#filePos").html("ok").css("color", "green").css("font-size", "16px");
	    }
			// 显示个人信息
			function refresh() {
				$.ajax({
					type:"post",
					url:"eshop/showPersonalServlet",
					dataType:"json",
					error:function(){alert("提交地址url未发现");},
					success:function(data){
							$("#showPhoto").attr("src", data.photo);// 加载图片路径到src
							$("#userphoto").attr("src", data.photo);// 加载图片路径到src
						$("#showName").text(data.username); // 加载用户名
						
						if (data.sex == "女") {
							$("#man").attr("checked","false");
							$("#woman").attr("checked","true");
						} 
						
						$("#phoneNumber").val(data.tel); //加载电话号码
						
						$("input[type='date']").val(data.birthday);
						$("#deemo").val(data.email);
						
						$("#adress").val(data.address);
						
					}
				});
			}
			// 修改个人中心
// 				function sub() {
// 					var data={
// 							"photo":"",
// 							"sex":$("input[name='optradio']:checked").val(),
// 							"tel":$("#phoneNumber").val(),
// 							"birthday":$("input[type='date']").val(),
// 							"address":$("#adress").val(),
// 							"email":$("#deemo").val()
// 					};
// 					$.ajax({
// 						type:"post",
// 						url:"eshop/updatePersonalServlet",
// 						data:data,
// 						dataType:"text",
// 						error:function(){alert("提交地址url未发现");},
// 						success:function(msg){
// 							if (msg) {
// 								alert("修改成功！");
// 							}
								
								
// 						}
// 					});
// 				}
				//刷行订单中心
				function orderFresh() {
					
					$.ajax({
						type:"post",
						url:"eshop/orderFreshServlet",
						dataType:"json",
						success:function(data){
							var text="";
							for(var i=0;i<data.length;i++){
								text = text+"<hr><div class=\"row\"><div class=\"col-2\">"+data[i].order_id+"</div><div class=\"col-6\">"+data[i].order_goods+"</div><div class=\"col-1\">"+data[i].order_price+"</div><div class=\"col-3\"><small style=\"position:absolute; right:5px\">"+data[i].order_time+"</small></div></div>";
								console.log(text);
								$("#order").html(text);
							}
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
							$("#row1").children("#goodsRow1").html("");
							$("#row1").children("#goodsRow2").html("");
							$("#row1").children("#goodsRow3").html("");
							for(var i=0;i<data.length;i++){
								if (i%3==0) {
									text = "<div class=\"card\" style=\"margin: 5px;\"><img class=\"card-img-top\" src=\""+data[i].goods_photo+"\" alt=\"Card image\" style=\"width:100%\"><div class=\"card-body\"><h4 class=\"card-title\">"+data[i].goods_title+"</h4><p class=\"card-text\">"+data[i].goods_price+"<a><img src=\"resources/img/plus.png\" onclick=\"addShoppingCart('"+data[i].goods_id+"')\" style=\"width: 30px; position:absolute; right:20px\"></a></div></div>";
									$("#row1").children("#goodsRow1").append(text);
								}
								if (i%3==1) {
									text = "<div class=\"card\" style=\"margin: 5px;\"><img class=\"card-img-top\" src=\""+data[i].goods_photo+"\" alt=\"Card image\" style=\"width:100%\"><div class=\"card-body\"><h4 class=\"card-title\">"+data[i].goods_title+"</h4><p class=\"card-text\">"+data[i].goods_price+"<a><img src=\"resources/img/plus.png\" onclick=\"addShoppingCart('"+data[i].goods_id+"')\" style=\"width: 30px; position:absolute; right:20px\"></a></div></div>";
									$("#row1").children("#goodsRow2").append(text);
								}
								if(i%3==2){
									text = "<div class=\"card\" style=\"margin: 5px;\"><img class=\"card-img-top\" src=\""+data[i].goods_photo+"\" alt=\"Card image\" style=\"width:100%\"><div class=\"card-body\"><h4 class=\"card-title\">"+data[i].goods_title+"</h4><p class=\"card-text\">"+data[i].goods_price+"<a><img src=\"resources/img/plus.png\" onclick=\"addShoppingCart('"+data[i].goods_id+"')\" style=\"width: 30px; position:absolute; right:20px\"></a></div></div>";
									$("#row1").children("#goodsRow3").append(text);
								}
								
							}
							
						}
					});
				}
				//根据商品分类选择
				//通过传递data显示结果集
				function getJson(goods_classify) {
					var data={"goods_classify":goods_classify};
					$.ajax({
						type:"post",
						url:"eshop/showAllGoodsByClassifyServlet",
						data:data,
						dataType:"json",
						success:function(data){
							if (goods_classify=="大家电/生活电器") {
								row2(data);
							}
							if (goods_classify=="手机/数码") {
								row3(data);
							}
							if (goods_classify=="生活用品/日用品") {
								row4(data);
							}
							if (goods_classify=="生鲜蔬菜/进口水果") {
								row5(data);
							}
							if (goods_classify=="零食/酒水/进口食品") {
								row6(data);
							}
							if (goods_classify=="家居摆件/床上用品") {
								row7(data);
							}
							if (goods_classify=="办公/运动器具/户外用品") {
								row8(data);
							}
							if (goods_classify=="五金/厨具") {
								row9(data);
							}
							if (goods_classify=="玩具/图书音像") {
								row10(data);
							}
						}
					});
				}
				function row2(data) {
					var text ="";
					$("#row2").children("#goodsRow1").html("");
					$("#row2").children("#goodsRow2").html("");
					$("#row2").children("#goodsRow3").html("");
					for(var i=0;i<data.length;i++){
						if (i%3==0) {
							text = "<div class=\"card\" style=\"margin: 5px;\"><img class=\"card-img-top\" src=\""+data[i].goods_photo+"\" alt=\"Card image\" style=\"width:100%\"><div class=\"card-body\"><h4 class=\"card-title\">"+data[i].goods_title+"</h4><p class=\"card-text\">"+data[i].goods_price+"<a><img src=\"resources/img/plus.png\" onclick=\"addShoppingCart('"+data[i].goods_id+"')\" style=\"width: 30px; position:absolute; right:20px\"></a></div></div>";
							$("#row2").children("#goodsRow1").append(text);
						}
						if (i%3==1) {
							text = "<div class=\"card\" style=\"margin: 5px;\"><img class=\"card-img-top\" src=\""+data[i].goods_photo+"\" alt=\"Card image\" style=\"width:100%\"><div class=\"card-body\"><h4 class=\"card-title\">"+data[i].goods_title+"</h4><p class=\"card-text\">"+data[i].goods_price+"<a><img src=\"resources/img/plus.png\" onclick=\"addShoppingCart('"+data[i].goods_id+"')\" style=\"width: 30px; position:absolute; right:20px\"></a></div></div>";
							$("#row2").children("#goodsRow2").append(text);
						}
						if(i%3==2){
							text = "<div class=\"card\" style=\"margin: 5px;\"><img class=\"card-img-top\" src=\""+data[i].goods_photo+"\" alt=\"Card image\" style=\"width:100%\"><div class=\"card-body\"><h4 class=\"card-title\">"+data[i].goods_title+"</h4><p class=\"card-text\">"+data[i].goods_price+"<a><img src=\"resources/img/plus.png\" onclick=\"addShoppingCart('"+data[i].goods_id+"')\" style=\"width: 30px; position:absolute; right:20px\"></a></div></div>";
							$("#row2").children("#goodsRow3").append(text);
						}
						
					}
				}
				
				function row3(data) {
					var text ="";
					$("#row3").children("#goodsRow1").html("");
					$("#row3").children("#goodsRow2").html("");
					$("#row3").children("#goodsRow3").html("");
					for(var i=0;i<data.length;i++){
						if (i%3==0) {
							text = "<div class=\"card\" style=\"margin: 5px;\"><img class=\"card-img-top\" src=\""+data[i].goods_photo+"\" alt=\"Card image\" style=\"width:100%\"><div class=\"card-body\"><h4 class=\"card-title\">"+data[i].goods_title+"</h4><p class=\"card-text\">"+data[i].goods_price+"<a><img src=\"resources/img/plus.png\" onclick=\"addShoppingCart('"+data[i].goods_id+"')\" style=\"width: 30px; position:absolute; right:20px\"></a></div></div>";
							$("#row3").children("#goodsRow1").append(text);
						}
						if (i%3==1) {
							text = "<div class=\"card\" style=\"margin: 5px;\"><img class=\"card-img-top\" src=\""+data[i].goods_photo+"\" alt=\"Card image\" style=\"width:100%\"><div class=\"card-body\"><h4 class=\"card-title\">"+data[i].goods_title+"</h4><p class=\"card-text\">"+data[i].goods_price+"<a><img src=\"resources/img/plus.png\" onclick=\"addShoppingCart('"+data[i].goods_id+"')\" style=\"width: 30px; position:absolute; right:20px\"></a></div></div>";
							$("#row3").children("#goodsRow2").append(text);
						}
						if(i%3==2){
							text = "<div class=\"card\" style=\"margin: 5px;\"><img class=\"card-img-top\" src=\""+data[i].goods_photo+"\" alt=\"Card image\" style=\"width:100%\"><div class=\"card-body\"><h4 class=\"card-title\">"+data[i].goods_title+"</h4><p class=\"card-text\">"+data[i].goods_price+"<a><img src=\"resources/img/plus.png\" onclick=\"addShoppingCart('"+data[i].goods_id+"')\" style=\"width: 30px; position:absolute; right:20px\"></a></div></div>";
							$("#row3").children("#goodsRow3").append(text);
						}
						
					}
				}
				function row4(data) {
					var text ="";
					$("#row4").children("#goodsRow1").html("");
					$("#row4").children("#goodsRow2").html("");
					$("#row4").children("#goodsRow3").html("");
					for(var i=0;i<data.length;i++){
						if (i%3==0) {
							text = "<div class=\"card\" style=\"margin: 5px;\"><img class=\"card-img-top\" src=\""+data[i].goods_photo+"\" alt=\"Card image\" style=\"width:100%\"><div class=\"card-body\"><h4 class=\"card-title\">"+data[i].goods_title+"</h4><p class=\"card-text\">"+data[i].goods_price+"<a><img src=\"resources/img/plus.png\" onclick=\"addShoppingCart('"+data[i].goods_id+"')\" style=\"width: 30px; position:absolute; right:20px\"></a></div></div>";
							$("#row4").children("#goodsRow1").append(text);
						}
						if (i%3==1) {
							text = "<div class=\"card\" style=\"margin: 5px;\"><img class=\"card-img-top\" src=\""+data[i].goods_photo+"\" alt=\"Card image\" style=\"width:100%\"><div class=\"card-body\"><h4 class=\"card-title\">"+data[i].goods_title+"</h4><p class=\"card-text\">"+data[i].goods_price+"<a><img src=\"resources/img/plus.png\" onclick=\"addShoppingCart('"+data[i].goods_id+"')\" style=\"width: 30px; position:absolute; right:20px\"></a></div></div>";
							$("#row4").children("#goodsRow2").append(text);
						}
						if(i%3==2){
							text = "<div class=\"card\" style=\"margin: 5px;\"><img class=\"card-img-top\" src=\""+data[i].goods_photo+"\" alt=\"Card image\" style=\"width:100%\"><div class=\"card-body\"><h4 class=\"card-title\">"+data[i].goods_title+"</h4><p class=\"card-text\">"+data[i].goods_price+"<a><img src=\"resources/img/plus.png\" onclick=\"addShoppingCart('"+data[i].goods_id+"')\" style=\"width: 30px; position:absolute; right:20px\"></a></div></div>";
							$("#row4").children("#goodsRow3").append(text);
						}
						
					}
				}
				function row5(data) {
					var text ="";
					$("#row5").children("#goodsRow1").html("");
					$("#row5").children("#goodsRow2").html("");
					$("#row5").children("#goodsRow3").html("");
					for(var i=0;i<data.length;i++){
						if (i%3==0) {
							text = "<div class=\"card\" style=\"margin: 5px;\"><img class=\"card-img-top\" src=\""+data[i].goods_photo+"\" alt=\"Card image\" style=\"width:100%\"><div class=\"card-body\"><h4 class=\"card-title\">"+data[i].goods_title+"</h4><p class=\"card-text\">"+data[i].goods_price+"<a><img src=\"resources/img/plus.png\" onclick=\"addShoppingCart('"+data[i].goods_id+"')\" style=\"width: 30px; position:absolute; right:20px\"></a></div></div>";
							$("#row5").children("#goodsRow1").append(text);
						}
						if (i%3==1) {
							text = "<div class=\"card\" style=\"margin: 5px;\"><img class=\"card-img-top\" src=\""+data[i].goods_photo+"\" alt=\"Card image\" style=\"width:100%\"><div class=\"card-body\"><h4 class=\"card-title\">"+data[i].goods_title+"</h4><p class=\"card-text\">"+data[i].goods_price+"<a><img src=\"resources/img/plus.png\" onclick=\"addShoppingCart('"+data[i].goods_id+"')\" style=\"width: 30px; position:absolute; right:20px\"></a></div></div>";
							$("#row5").children("#goodsRow2").append(text);
						}
						if(i%3==2){
							text = "<div class=\"card\" style=\"margin: 5px;\"><img class=\"card-img-top\" src=\""+data[i].goods_photo+"\" alt=\"Card image\" style=\"width:100%\"><div class=\"card-body\"><h4 class=\"card-title\">"+data[i].goods_title+"</h4><p class=\"card-text\">"+data[i].goods_price+"<a><img src=\"resources/img/plus.png\" onclick=\"addShoppingCart('"+data[i].goods_id+"')\" style=\"width: 30px; position:absolute; right:20px\"></a></div></div>";
							$("#row5").children("#goodsRow3").append(text);
						}
						
					}
				}
				function row6(data) {
					var text ="";
					$("#row6").children("#goodsRow1").html("");
					$("#row6").children("#goodsRow2").html("");
					$("#row6").children("#goodsRow3").html("");
					for(var i=0;i<data.length;i++){
						if (i%3==0) {
							text = "<div class=\"card\" style=\"margin: 5px;\"><img class=\"card-img-top\" src=\""+data[i].goods_photo+"\" alt=\"Card image\" style=\"width:100%\"><div class=\"card-body\"><h4 class=\"card-title\">"+data[i].goods_title+"</h4><p class=\"card-text\">"+data[i].goods_price+"<a><img src=\"resources/img/plus.png\" onclick=\"addShoppingCart('"+data[i].goods_id+"')\" style=\"width: 30px; position:absolute; right:20px\"></a></div></div>";
							$("#row6").children("#goodsRow1").append(text);
						}
						if (i%3==1) {
							text = "<div class=\"card\" style=\"margin: 5px;\"><img class=\"card-img-top\" src=\""+data[i].goods_photo+"\" alt=\"Card image\" style=\"width:100%\"><div class=\"card-body\"><h4 class=\"card-title\">"+data[i].goods_title+"</h4><p class=\"card-text\">"+data[i].goods_price+"<a><img src=\"resources/img/plus.png\" onclick=\"addShoppingCart('"+data[i].goods_id+"')\" style=\"width: 30px; position:absolute; right:20px\"></a></div></div>";
							$("#row6").children("#goodsRow2").append(text);
						}
						if(i%3==2){
							text = "<div class=\"card\" style=\"margin: 5px;\"><img class=\"card-img-top\" src=\""+data[i].goods_photo+"\" alt=\"Card image\" style=\"width:100%\"><div class=\"card-body\"><h4 class=\"card-title\">"+data[i].goods_title+"</h4><p class=\"card-text\">"+data[i].goods_price+"<a><img src=\"resources/img/plus.png\" onclick=\"addShoppingCart('"+data[i].goods_id+"')\" style=\"width: 30px; position:absolute; right:20px\"></a></div></div>";
							$("#row6").children("#goodsRow3").append(text);
						}
						
					}
				}
				function row7(data) {
					var text ="";
					$("#row7").children("#goodsRow1").html("");
					$("#row7").children("#goodsRow2").html("");
					$("#row7").children("#goodsRow3").html("");
					for(var i=0;i<data.length;i++){
						if (i%3==0) {
							text = "<div class=\"card\" style=\"margin: 5px;\"><img class=\"card-img-top\" src=\""+data[i].goods_photo+"\" alt=\"Card image\" style=\"width:100%\"><div class=\"card-body\"><h4 class=\"card-title\">"+data[i].goods_title+"</h4><p class=\"card-text\">"+data[i].goods_price+"<a><img src=\"resources/img/plus.png\" onclick=\"addShoppingCart('"+data[i].goods_id+"')\" style=\"width: 30px; position:absolute; right:20px\"></a></div></div>";
							$("#row7").children("#goodsRow1").append(text);
						}
						if (i%3==1) {
							text = "<div class=\"card\" style=\"margin: 5px;\"><img class=\"card-img-top\" src=\""+data[i].goods_photo+"\" alt=\"Card image\" style=\"width:100%\"><div class=\"card-body\"><h4 class=\"card-title\">"+data[i].goods_title+"</h4><p class=\"card-text\">"+data[i].goods_price+"<a><img src=\"resources/img/plus.png\" onclick=\"addShoppingCart('"+data[i].goods_id+"')\" style=\"width: 30px; position:absolute; right:20px\"></a></div></div>";
							$("#row7").children("#goodsRow2").append(text);
						}
						if(i%3==2){
							text = "<div class=\"card\" style=\"margin: 5px;\"><img class=\"card-img-top\" src=\""+data[i].goods_photo+"\" alt=\"Card image\" style=\"width:100%\"><div class=\"card-body\"><h4 class=\"card-title\">"+data[i].goods_title+"</h4><p class=\"card-text\">"+data[i].goods_price+"<a><img src=\"resources/img/plus.png\" onclick=\"addShoppingCart('"+data[i].goods_id+"')\" style=\"width: 30px; position:absolute; right:20px\"></a></div></div>";
							$("#row7").children("#goodsRow3").append(text);
						}
						
					}
				}
				function row8(data) {
					var text ="";
					$("#row8").children("#goodsRow1").html("");
					$("#row8").children("#goodsRow2").html("");
					$("#row8").children("#goodsRow3").html("");
					for(var i=0;i<data.length;i++){
						if (i%3==0) {
							text = "<div class=\"card\" style=\"margin: 5px;\"><img class=\"card-img-top\" src=\""+data[i].goods_photo+"\" alt=\"Card image\" style=\"width:100%\"><div class=\"card-body\"><h4 class=\"card-title\">"+data[i].goods_title+"</h4><p class=\"card-text\">"+data[i].goods_price+"<a><img src=\"resources/img/plus.png\" onclick=\"addShoppingCart('"+data[i].goods_id+"')\" style=\"width: 30px; position:absolute; right:20px\"></a></div></div>";
							$("#row8").children("#goodsRow1").append(text);
						}
						if (i%3==1) {
							text = "<div class=\"card\" style=\"margin: 5px;\"><img class=\"card-img-top\" src=\""+data[i].goods_photo+"\" alt=\"Card image\" style=\"width:100%\"><div class=\"card-body\"><h4 class=\"card-title\">"+data[i].goods_title+"</h4><p class=\"card-text\">"+data[i].goods_price+"<a><img src=\"resources/img/plus.png\" onclick=\"addShoppingCart('"+data[i].goods_id+"')\" style=\"width: 30px; position:absolute; right:20px\"></a></div></div>";
							$("#row8").children("#goodsRow2").append(text);
						}
						if(i%3==2){
							text = "<div class=\"card\" style=\"margin: 5px;\"><img class=\"card-img-top\" src=\""+data[i].goods_photo+"\" alt=\"Card image\" style=\"width:100%\"><div class=\"card-body\"><h4 class=\"card-title\">"+data[i].goods_title+"</h4><p class=\"card-text\">"+data[i].goods_price+"<a><img src=\"resources/img/plus.png\" onclick=\"addShoppingCart('"+data[i].goods_id+"')\" style=\"width: 30px; position:absolute; right:20px\"></a></div></div>";
							$("#row8").children("#goodsRow3").append(text);
						}
						
					}
				}
				function row9(data) {
					var text ="";
					$("#row9").children("#goodsRow1").html("");
					$("#row9").children("#goodsRow2").html("");
					$("#row9").children("#goodsRow3").html("");
					for(var i=0;i<data.length;i++){
						if (i%3==0) {
							text = "<div class=\"card\" style=\"margin: 5px;\"><img class=\"card-img-top\" src=\""+data[i].goods_photo+"\" alt=\"Card image\" style=\"width:100%\"><div class=\"card-body\"><h4 class=\"card-title\">"+data[i].goods_title+"</h4><p class=\"card-text\">"+data[i].goods_price+"<a><img src=\"resources/img/plus.png\" onclick=\"addShoppingCart('"+data[i].goods_id+"')\" style=\"width: 30px; position:absolute; right:20px\"></a></div></div>";
							$("#row9").children("#goodsRow1").append(text);
						}
						if (i%3==1) {
							text = "<div class=\"card\" style=\"margin: 5px;\"><img class=\"card-img-top\" src=\""+data[i].goods_photo+"\" alt=\"Card image\" style=\"width:100%\"><div class=\"card-body\"><h4 class=\"card-title\">"+data[i].goods_title+"</h4><p class=\"card-text\">"+data[i].goods_price+"<a><img src=\"resources/img/plus.png\" onclick=\"addShoppingCart('"+data[i].goods_id+"')\" style=\"width: 30px; position:absolute; right:20px\"></a></div></div>";
							$("#row9").children("#goodsRow2").append(text);
						}
						if(i%3==2){
							text = "<div class=\"card\" style=\"margin: 5px;\"><img class=\"card-img-top\" src=\""+data[i].goods_photo+"\" alt=\"Card image\" style=\"width:100%\"><div class=\"card-body\"><h4 class=\"card-title\">"+data[i].goods_title+"</h4><p class=\"card-text\">"+data[i].goods_price+"<a><img src=\"resources/img/plus.png\" onclick=\"addShoppingCart('"+data[i].goods_id+"')\" style=\"width: 30px; position:absolute; right:20px\"></a></div></div>";
							$("#row9").children("#goodsRow3").append(text);
						}
						
					}
				}
				function row10(data) {
					var text ="";
					$("#row10").children("#goodsRow1").html("");
					$("#row10").children("#goodsRow2").html("");
					$("#row10").children("#goodsRow3").html("");
					for(var i=0;i<data.length;i++){
						if (i%3==0) {
							text = "<div class=\"card\" style=\"margin: 5px;\"><img class=\"card-img-top\" src=\""+data[i].goods_photo+"\" alt=\"Card image\" style=\"width:100%\"><div class=\"card-body\"><h4 class=\"card-title\">"+data[i].goods_title+"</h4><p class=\"card-text\">"+data[i].goods_price+"<a><img src=\"resources/img/plus.png\" onclick=\"addShoppingCart('"+data[i].goods_id+"')\" style=\"width: 30px; position:absolute; right:20px\"></a></div></div>";
							$("#row10").children("#goodsRow1").append(text);
						}
						if (i%3==1) {
							text = "<div class=\"card\" style=\"margin: 5px;\"><img class=\"card-img-top\" src=\""+data[i].goods_photo+"\" alt=\"Card image\" style=\"width:100%\"><div class=\"card-body\"><h4 class=\"card-title\">"+data[i].goods_title+"</h4><p class=\"card-text\">"+data[i].goods_price+"<a><img src=\"resources/img/plus.png\" onclick=\"addShoppingCart('"+data[i].goods_id+"')\" style=\"width: 30px; position:absolute; right:20px\"></a></div></div>";
							$("#row10").children("#goodsRow2").append(text);
						}
						if(i%3==2){
							text = "<div class=\"card\" style=\"margin: 5px;\"><img class=\"card-img-top\" src=\""+data[i].goods_photo+"\" alt=\"Card image\" style=\"width:100%\"><div class=\"card-body\"><h4 class=\"card-title\">"+data[i].goods_title+"</h4><p class=\"card-text\">"+data[i].goods_price+"<a><img src=\"resources/img/plus.png\" onclick=\"addShoppingCart('"+data[i].goods_id+"')\" style=\"width: 30px; position:absolute; right:20px\"></a></div></div>";
							$("#row10").children("#goodsRow3").append(text);
						}
						
					}
				}
				
				
				// 模糊查询
				function fuzzyQuery() {
					var goods_title = $("#inputGoodsTitie").val();
					var data={"goods_title":goods_title};
					$.ajax({
						type:"post",
						data:data,
						url:"eshop/searchGoodsServlet",
						dataType:"json",
						success:function(data){
							var text ="";
							$("#row1").children("#goodsRow1").html("");
							$("#row1").children("#goodsRow2").html("");
							$("#row1").children("#goodsRow3").html("");
							for(var i=0;i<data.length;i++){
								if (i%3==0) {
									text = "<div class=\"card\" style=\"margin: 5px;\"><img class=\"card-img-top\" src=\""+data[i].goods_photo+"\" alt=\"Card image\" style=\"width:100%\"><div class=\"card-body\"><h4 class=\"card-title\">"+data[i].goods_title+"</h4><p class=\"card-text\">"+data[i].goods_price+"<a><img src=\"resources/img/plus.png\" onclick=\"addShoppingCart('"+data[i].goods_id+"')\" style=\"width: 30px; position:absolute; right:20px\"></a></div></div>";
									$("#row1").children("#goodsRow1").append(text);
								}
								if (i%3==1) {
									text = "<div class=\"card\" style=\"margin: 5px;\"><img class=\"card-img-top\" src=\""+data[i].goods_photo+"\" alt=\"Card image\" style=\"width:100%\"><div class=\"card-body\"><h4 class=\"card-title\">"+data[i].goods_title+"</h4><p class=\"card-text\">"+data[i].goods_price+"<a><img src=\"resources/img/plus.png\" onclick=\"addShoppingCart('"+data[i].goods_id+"')\" style=\"width: 30px; position:absolute; right:20px\"></a></div></div>";
									$("#row1").children("#goodsRow2").append(text);
								}
								if(i%3==2){
									text = "<div class=\"card\" style=\"margin: 5px;\"><img class=\"card-img-top\" src=\""+data[i].goods_photo+"\" alt=\"Card image\" style=\"width:100%\"><div class=\"card-body\"><h4 class=\"card-title\">"+data[i].goods_title+"</h4><p class=\"card-text\">"+data[i].goods_price+"<a><img src=\"resources/img/plus.png\" onclick=\"addShoppingCart('"+data[i].goods_id+"')\" style=\"width: 30px; position:absolute; right:20px\"></a></div></div>";
									$("#row1").children("#goodsRow3").append(text);
								}
								
								row2(data);
								row3(data);
								row4(data);
								row5(data);
								row6(data);
								row7(data);
								row8(data);
								row9(data);
								row10(data);
								
							}
							
						}
					});
				} 
				function addShoppingCart(goods_id){
					var data={
							"goods_id":goods_id
					};
					$.ajax({
						type:"post",
						url:"eshop/addgoodscartServlet",
						data:data,
						success:function(){
							alert("添加至购物车成功！");
						}
					});
				}
		</script>
</body>
</html>