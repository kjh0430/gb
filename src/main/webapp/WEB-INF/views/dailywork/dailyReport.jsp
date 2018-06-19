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

<title>GROUP BEAN |</title>

<!-- Bootstrap -->
<link href="resources/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="resources/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="resources/build/css/custom.min.css" rel="stylesheet">
<link href="resources/css/main.css" rel="stylesheet">

<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
</head>


<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a href="mainView.do" class="site_title"><i class="fa fa-google"></i>
							<span>GROUP BEAN</span></a>
					</div>

					<div class="clearfix"></div>

					<!-- sidebar menu -->
					<%@ include file="../etc/sidebar.jsp"%>
					<!-- /sidebar menu -->

				</div>
			</div>

			<!-- top navigation -->
			<%@ include file="../etc/topnav.jsp"%>
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main"  id="print-area">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>영업일지</h3>
						</div>
						<div class="title_right">
							<div class="control-group" style="float:right">
								<div class="controls">
								<input type="date" class="form-control" id="daily_date" name="daily_date" style="width:200px;display:inline-block">
								<button class="btn btn-dark" onclick="selectDailyreport()"style="display:inline-block">확인</button>
								</div>
							</div>

						</div>
					</div>
					<div class="clearfix"></div>
					<!-- map start -->
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div id="map" style="height: 400px"></div>

						</div>
					</div>
					<div class="clearfix"></div>
					<br>
					<div class="row">
						<div class="col-md-6 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title" style="margin-bottom:0px;">
									<h2>방문거래처</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<div class="dashboard-widget-content">
										<ul class="list-unstyled timeline widget" id="visitList">
											
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!-- visit end -->
						<div class="col-md-6 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title" style="margin-bottom:0px;">
									<h2>주문내역</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content" id="orderlist">
									<div class="dashboard-widget-content">
									<table class="table" id="table_ol" style="margin-bottom:10px;">
									
									
									</table>
									</div>
								</div>
							</div>
						</div>
						<!-- row -->
						
					</div>

				</div>
			</div>
			<!-- footer content -->
			<%@ include file="../etc/footer.jsp"%>
			<!-- /footer content -->
		</div>		
	</div>
	<!-- /page content -->

	<!-- jQuery -->
	<script src="resources/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	
	<!-- Custom Theme Scripts -->
	<script src="resources/build/js/custom.min.js"></script>
		
	<!-- daum map script -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9847a2e4326a2ca39c99b754b2d4e80c&libraries=services"></script>
		
	<script type="text/javascript" src="resources/js/map.js"></script>		
	<script type="text/javascript">
	var emp_no = ${loginEmp.emp_no};
	$(function(){
		document.getElementById("daily_date").valueAsDate = new Date();		
		selectVisit(emp_no);	
		selectOrder(emp_no);	
		
	});//onload

	function selectDailyreport(){		
		var date = $("#daily_date").val();
		if(date != ""){
			selectVisit(emp_no);	
			selectOrder(emp_no);
		}else{
			alert("날짜를 선택해주세요.");				
		}	
	}
	
	</script>

</body>
</html>