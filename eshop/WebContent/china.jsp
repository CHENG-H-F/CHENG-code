<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<title>Welcome!</title>
<link rel="stylesheet" href="resources/css/index.css" />
</head>
<body>
    <header>
      <div class="head12">
      	<a href="/eshop/cart.jsp">
      		<img src="resources/img/head12.png"/>
      	</a>
      </div>
      <div class="showTime">当前时间：2020年3月17-0时54分14秒</div>
      <script>
        var t = null;
        t = setTimeout(time, 1000); //開始运行
        function time() {
          clearTimeout(t); //清除定时器
          dt = new Date();
          var y = dt.getFullYear();
          var mt = dt.getMonth() + 1;
          var day = dt.getDate();
          var h = dt.getHours(); //获取时
          var m = dt.getMinutes(); //获取分
          var s = dt.getSeconds(); //获取秒
          document.querySelector(".showTime").innerHTML =
            "当前时间：" +
            y +
            "年" +
            mt +
            "月" +
            day +
            "-" +
            h +
            "时" +
            m +
            "分" +
            s +
            "秒";
          t = setTimeout(time, 1000); //设定定时器，循环运行
        }
      </script>
    </header>
    <section class="mainbox">
      <div class="column">
        <div class="panel bar">
          <h2>部分地区门店数目</h2>
          <div class="chart"></div>
          <div class="panel-footer"></div>
        </div>
        <div class="panel line">
          <h2>线上、线下顾客人数/万</h2>
          <div class="chart"></div>
          <div class="panel-footer"></div>
        </div>
        <div class="panel pie">
          <h2>顾客年龄分布</h2>
          <div class="chart"></div>
          <div class="panel-footer"></div>
        </div>
      </div>
      <div class="column">
        <div class="no">
          <div class="no-hd">
            <ul>
              <li>422</li>
              <li>24</li>
            </ul>
          </div>
          <div class="no-bd">
            <ul>
              <li>全国门店总数</li>
              <li>涉及省市总数量</li>
            </ul>
          </div>
        </div>
        <div class="map">
          <div class="chart"></div>
         <!-- <div class="map1"></div>-->
          <!--<div class="map2"></div>
          <div class="map3"></div>-->
        </div>
      </div>
      <div class="column">
        <div class="panel bar1">
          <h2>主要商品销量/周/万元</h2>
          <div class="chart"></div>
          <div class="panel-footer"></div>
        </div>
        <div class="panel line1">
          <h2>分时段浏览量/转发量</h2>
          <div class="chart"></div>
          <div class="panel-footer"></div>
        </div>
        <div class="panel pie1">
          <h2>所在地区分布</h2>
          <div class="chart"></div>
          <div class="panel-footer"></div>
        </div>
      </div>
    </section>
    <script src="resources/js/flexible.js"></script>
    <script src="resources/js/echarts.min.js"></script>
    <script src="resources/js/jquery.js"></script>
    <script src="resources/js/china.js"></script>
    <script src="resources/js/index.js"></script>
    
</body>
</html>