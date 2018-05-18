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
<script type="text/javascript">
	$(function(){
		
		
		$.ajax({
			url:"visitList.do",
			type:"post",
			dataType:"json",
			data:{emp_no:"${ loginEmp.emp_no }"},
			success:function(obj){
				console.log(obj);
			}
		});
		
		
		
		
		
	});//onload
	
</script>
<style type="text/css">
#table_sa tbody tr:last-child {
	border-top: solid #ddd 2px;
}
</style>
</head>


<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a href="Movemain.do" class="site_title"><i class="fa fa-google"></i>
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
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>영업일지</h3>
						</div>
						<div class="title_right">
							<div class="control-group" style="float:right">
								<div class="controls">
								<input type="date" class="form-control" id="daily_date" name="daily_date" style="width:260px"></div>
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
										<ul class="list-unstyled timeline widget">
											<li>
												<div class="block">
													<div class="block_content">
														<h2 class="title">스타벅스 석촌호수 서호</h2>
														<div class="daily_time">
															<span>10:34</span>
														</div>
														<p class="excerpt">방문일지에서 코멘트란에 쓴 내용들어갈 자리</p>
													</div>
												</div>
											</li>
											<li>
												<div class="block">
													<div class="block_content">
														<h2 class="title">프로젝트 413 역삼</h2>
														<div class="byline">
															<span>12:30</span>
														</div>
														<p class="excerpt"></p>
													</div>
												</div>
											</li>
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
								<div class="x_content">
									<table class="table" id="table_sa">
										<thead>
											<tr>
												<th>주문번호</th>
												<th>거래처명</th>
												<th>금액</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><a href="#">215487</a></td>
												<td>프로젝트 413 역삼</td>
												<td>245,000</td>
											</tr>
										</tbody>
									</table>
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
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9847a2e4326a2ca39c99b754b2d4e80c"></script>
	<script type="text/javascript">
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(37.498811, 127.038755), // 지도의 중심좌표
			level : 5
		// 지도의 확대 레벨
		};

		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new daum.maps.Map(mapContainer, mapOption);
		
		var linePath = [
		    new daum.maps.LatLng(37.498811, 127.038755),
		    new daum.maps.LatLng(37.503221, 127.027836),
		    new daum.maps.LatLng(37.503411, 127.038387),
		    new daum.maps.LatLng(37.505825, 127.041219)
		];

		// 지도에 표시할 선을 생성합니다
		var polyline = new daum.maps.Polyline({
		    path: linePath, // 선을 구성하는 좌표배열 입니다
		    strokeWeight: 5, // 선의 두께 입니다
		    strokeColor: '#75B8FA', // 선의 색깔입니다
		    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		    strokeStyle: 'solid' // 선의 스타일입니다
		});

		// 지도에 선을 표시합니다 
		polyline.setMap(map);  
	</script>

</body>
</html>