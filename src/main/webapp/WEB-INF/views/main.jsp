<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="icon" href="images/favicon.ico" type="image/ico" />

    <title>GROUP BEAN | </title>

    <!-- Bootstrap -->
    <link href="resources/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="resources/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="resources/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
	
    <!-- Custom Theme Style -->
    <link href="resources/build/css/custom.min.css" rel="stylesheet">
    <link href="resources/css/main.css" rel="stylesheet">
    
    <script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript">
	
    /*
    $(function(){
    	
    	var city = '${loginEmp.getCity()}';
		var county = '${loginEmp.getCounty()}';
		var village = '${loginEmp.getVillage()}';

		var headers = {};
		headers["Accept"]="application/json";
		headers["Content-Type"]="application/json; charset=UTF-8";
		headers["appKey"]="c73d9878-1921-4214-b7a2-1a0653b6c0a1";
		
		$.ajax({
			type:'get',
			headers:headers,
			data:{city:city,county:county,village:village},
			url:'https://api2.sktelecom.com/weather/current/hourly?version=1&callback=result',
			async:false,
			success : function(data){
				console.log(data);
				var todayDate = data["weather"]["hourly"][0]['timeRelease'];
				var todayTemp = Math.round(data["weather"]["hourly"][0]['temperature']['tc']);
				var todayMinTemp = Math.round(data["weather"]["hourly"][0]['temperature']['tmin']);
				var todayMaxTemp = Math.round(data["weather"]["hourly"][0]['temperature']['tmax']);
				var todayDesc = data["weather"]["hourly"][0]['sky']['name'];
				var todayIcon = data["weather"]["hourly"][0]['sky']['code'];
				var todayTimeRelease = data["weather"]["hourly"][0]['timeRelease'];
										
					$(".todayMinTemp").append(todayMinTemp);		
					$(".todayMaxTemp").append(todayMaxTemp);		
					$(".todayTemp").append(todayTemp);
					$(".todayDesc").html(todayDesc);
				var icon;
				switch(todayIcon){
					case "SKY_O01" : icon = "<img src='resources/images/weather/SKY_O01.png'/>";break;
					case "SKY_O02" : icon = "<img src='resources/images/weather/SKY_O02.png'/>";break;
					case "SKY_O03" : icon = "<img src='resources/images/weather/SKY_O03.png'/>";break;
					case "SKY_O04" : icon = "<img src='resources/images/weather/SKY_O04.png'/>";break;
					case "SKY_O05" : icon = "<img src='resources/images/weather/SKY_O05.png'/>";break;
					case "SKY_O06" : icon = "<img src='resources/images/weather/SKY_O06.png'/>";break;
					case "SKY_O07" : icon = "<img src='resources/images/weather/SKY_O07.png'/>";break;
					case "SKY_O08" : icon = "<img src='resources/images/weather/SKY_O08.png'/>";break;
					case "SKY_O09" : icon = "<img src='resources/images/weather/SKY_O09.png'/>";break;
					case "SKY_O10" : icon = "<img src='resources/images/weather/SKY_O10.png'/>";break;
					case "SKY_O11" : icon = "<img src='resources/images/weather/SKY_O11.png'/>";break;
					case "SKY_O12" : icon = "<img src='resources/images/weather/SKY_O12.png'/>";break;
					case "SKY_O13" : icon = "<img src='resources/images/weather/SKY_O13.png'/>";break;
					case "SKY_O14" : icon = "<img src='resources/images/weather/SKY_O14.png'/>";break;				
				}
				$(".weather-icon").append(icon);
				},
				complete: function(){
				},
				error	: function(xhr, status, error){
					console.log(error);
				}
			
		}); //end of ajax
		
	}); 
    */
	
	</script>	
    
    
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="Movemain.do" class="site_title"><i class="fa fa-google"></i> <span>GROUP BEAN</span></a>
            </div>

            <div class="clearfix"></div>
            
            <c:choose>
            	<c:when test="${ loginEmp.job_no == 3 }">
		            <!-- sidebar menu -->
		            <%@ include file="etc/adminsidebar.jsp" %>
		            <!-- /sidebar menu -->
            	</c:when>
            	<c:otherwise>
					<!-- sidebar menu -->
		            <%@ include file="etc/sidebar.jsp" %>
		            <!-- /sidebar menu --> 
            	</c:otherwise>
            </c:choose>
            
          </div>
        </div>

     	 	<!-- top navigation -->
			<c:import url="etc/topnav.jsp"></c:import>
			<!-- /top navigation -->

        <!-- page content -->
        <div class="right_col" role="main">
          <!-- top tiles -->
          <div class="row tile_count">
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 매출현황</span>
              <div class="count">2500</div>
              <span class="count_bottom"><i class="green">4% </i> From last Week</span>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 tile_stats_count">
              <span class="count_top"><i class="fa fa-clock-o"></i> 목표달성현황</span>
              <div class="count">123.50</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>3% </i> From last Week</span>
            </div>   
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 평균 주문액</span>
              <div class="count">4,567</div>
              <span class="count_bottom"><i class="red"><i class="fa fa-sort-desc"></i>12% </i> From last Week</span>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 신규거래처수</span>
              <div class="count">2,315</div>
              <span class="count_bottom"><i class="green"><i class="fa fa-sort-asc"></i>34% </i> From last Week</span>
            </div>
          </div>
          <!-- /top tiles -->
          <div class="row">          	
                <!-- Start to do list -->
                <div class="col-md-6 col-sm-6 col-xs-12">
                  <div class="x_panel">
                    <div class="x_title">
                      <h2>To Do List <small>Sample tasks</small></h2>
                      <ul class="nav navbar-right panel_toolbox">
                        <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                        </li>
                        <li class="dropdown">
                          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                          <ul class="dropdown-menu" role="menu">
                            <li><a href="#">Settings 1</a>
                            </li>
                            <li><a href="#">Settings 2</a>
                            </li>
                          </ul>
                        </li>
                        <li><a class="close-link"><i class="fa fa-close"></i></a>
                        </li>
                      </ul>
                      <div class="clearfix"></div>
                    </div>
                    <div class="x_content">

                      <div class="">
                        <ul class="to_do">
                          <li>
                            <p>
                              <input type="checkbox" class="flat"> Schedule meeting with new client </p>
                          </li>
                          <li>
                            <p>
                              <input type="checkbox" class="flat"> Create email address for new intern</p>
                          </li>
                          <li>
                            <p>
                              <input type="checkbox" class="flat"> Have IT fix the network printer</p>
                          </li>
                          <li>
                            <p>
                              <input type="checkbox" class="flat"> Copy backups to offsite location</p>
                          </li>
                          <li>
                            <p>
                              <input type="checkbox" class="flat"> Food truck fixie locavors mcsweeney</p>
                          </li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- End to do list -->
                
				<!-- start of weather widget -->
	          <div class="col-md-6 col-sm-6 col-xs-12">
	            <div class="x_panel">
	              <div class="x_title">
	                <h2>오늘의 날씨</h2>
	                <div class="clearfix"></div>
	              </div>
	              <div class="x_content">
	                <div class="row">
	                  <div class="col-sm-12">
	                    <div class="temperature" style="margin-bottom:5px;"><b>현재날짜들어갈 부분</b>, 지역들어갈 부분
	                      <span>F</span>
	                      <span><b>C</b></span>
	                    </div>
	                  </div>
	                </div>
	                <div class="row">
	                  <div class="col-sm-4">
	                    <div class="weather-icon" style="padding-left:10px;">
	                      
	                    </div>
	                  </div>
	                  <div class="col-sm-8">
	                    <div class="weather-text">
	                      <h2 class="degrees todayTemp">현재기온 : </h2>
	                      <h2 class="todayDesc"></h2>
	                    </div>
	                  </div>
	                </div>
	                <div class="col-sm-12">
	                  <div class="weather-text pull-right">
	                  	<img src="resources/images/weather/thermo.png" style="width:12px;"/>&nbsp;&nbsp;&nbsp; 
	                    <h4 class="degrees todayMinTemp" style="display:inline-block">최저기온 : </h4> /
	                    <h4 class="degrees todayMaxTemp" style="display:inline-block">최고기온 : </h4>
	                  </div>
	                </div>	
	                <div class="clearfix"></div>
	              </div>
	            </div>	
	          </div>
	          <!-- end of weather widget -->
	          <!-- start of notice widget -->
	          
	          <div class="col-md-6 col-sm-6 col-xs-12">
	            <div class="x_panel">
	              <div class="x_title">
	                <h2>Notice </h2> 
	                <ul class="nav navbar-right panel_toolbox">	                 
	                  <li><a class="#"><i class="fa fa-plus"></i> 더보기</a>
	                  </li>
	                </ul>
	                
	                <div class="clearfix"></div> 
	              </div>
	              <div class="x_content">
	              	<ul class="notice_list">
	              		<li><span>2018.04.30</span>&nbsp;&nbsp;<a href="">공지사항 들어갈 자리입니다.</a></li>
	              		<li><span>2018.04.30</span>&nbsp;&nbsp;<a href="">GROUP BEAN 서비스 점검 일정입니다.</a></li>
	              		<li><span>2018.04.30</span>&nbsp;&nbsp;<a href="">2018년 5월 1일 개최예정이었던 영업회의는 연기되었습니다.</a></li>
	              		<li><span>2018.04.30</span>&nbsp;&nbsp;<a href="">공지사항 들어갈 자리입니다.</a></li>
	              		<li><span>2018.04.30</span>&nbsp;&nbsp;<a href="">GROUP BEAN 서비스 점검 일정입니다.</a></li>
	              	</ul>
	               
	                <div class="clearfix"></div>
	              </div>
	            </div>	
	          </div>
	           <!-- end of notice widget -->
          </div>

          <div class="row">

            <div class="col-md-6 col-sm-6 col-xs-12">
              <div class="x_panel tile fixed_height_320">
                <div class="x_title">
                  <h2>App Versions</h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">

                </div>
              </div>
            </div>

            <div class="col-md-6 col-sm-6 col-xs-12">
              <div class="x_panel tile fixed_height_320 overflow_hidden">
                <div class="x_title">
                  <h2>Device Usage</h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                  <table class="" style="width:100%">
                    <tr>
                      <th style="width:37%;">
                        <p>Top 5</p>
                      </th>
                      <th>
                        <div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
                          <p class="">Device</p>
                        </div>
                        <div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
                          <p class="">Progress</p>
                        </div>
                      </th>
                    </tr>
                    <tr>
                      <td>
                        <canvas class="canvasDoughnut" height="140" width="140" style="margin: 15px 10px 10px 0"></canvas>
                      </td>
                      <td>
                        <table class="tile_info">
                          <tr>
                            <td>
                              <p><i class="fa fa-square blue"></i>IOS </p>
                            </td>
                            <td>30%</td>
                          </tr>
                          <tr>
                            <td>
                              <p><i class="fa fa-square green"></i>Android </p>
                            </td>
                            <td>10%</td>
                          </tr>
                          <tr>
                            <td>
                              <p><i class="fa fa-square purple"></i>Blackberry </p>
                            </td>
                            <td>20%</td>
                          </tr>
                          <tr>
                            <td>
                              <p><i class="fa fa-square aero"></i>Symbian </p>
                            </td>
                            <td>15%</td>
                          </tr>
                          <tr>
                            <td>
                              <p><i class="fa fa-square red"></i>Others </p>
                            </td>
                            <td>30%</td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </div>
              </div>
            </div>
          </div>
		
         </div>
        <!-- /page content -->
      </div>
      <!-- footer content -->
		 <%@ include file="etc/footer.jsp" %>
      <!-- /footer content -->
      
    </div>

    <!-- jQuery -->
    <script src="resources/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
   
    <!-- iCheck -->
    <script src="resources/vendors/iCheck/icheck.min.js"></script>
  
    <!-- Custom Theme Scripts -->
    <script src="resources/build/js/custom.min.js"></script>
	
  </body>
  
</html>