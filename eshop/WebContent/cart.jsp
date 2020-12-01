<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome!</title>
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
			<a href="#"><img src="resources/img/welcome.png" style="width: 400px; position: absolute; top: 50%;left: 50%;transform: translate(-50%,-50%);"></a>
			<div style="right: 20px; bottom: 20px;">
				<a href="#" ><img src="resources/img/slogn.png" style="width: 300px;"></a>
			</div>
			
		</div>
		
		<!--中间-->
		
		<!--标题-->
		<div>
			<div class="container" style="margin-top: 150px;">
					<div class="list-group">
						
						<div class="row">
							<div class="col-8">
								<h4>店铺名称
							</div>
							<div class="col-2">
								省份
							</div>
							<div class="col-2">
								城市</h4>
							</div>
						</div>
					</div>
					   
				<!--内容-->
				<hr>
				
				<form>
				<c:forEach var="i" items="${shop}">
				<a href="/eshop/eshop.jsp" class="list-group-item list-group-item-light">
							<div class="row">
								<div class="col-8">
									${i.shop_title }
								</div>
								<div class="col-2">
									${i.shop_province}
								</div>
								<div class="col-2">
									${i.shop_city}
								</div>
							</div>
						</a>
				</c:forEach>
						
				</form>
				
					  </div>
				</div>
			</div>
			
		</div>
		
		<!--bottom-->
		
		<div class="jumbotron text-center container-fluid" style="margin-bottom: 0px; width:100% ;margin-top: 300px; background-color: rgba(4,30,66);">
			<center style="color:white ;"><small>江西财经大学 </small>@2019-2020</center>
		</div>
		
		
</body>
</html>