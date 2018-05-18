<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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


<!-- bootstrap-progressbar -->
<link
	href="resources/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet">



<!-- Custom Theme Style -->
<link href="resources/build/css/custom.min.css" rel="stylesheet">
<link href="resources/css/main.css" rel="stylesheet">

<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

	});
</script>
<style type="text/css">
#table_cl tr td:nth-child(2) {
	width: 55px;
}
</style>
</head>


<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a href="main.html" class="site_title"><i class="fa fa-google"></i>
							<span>GROUP BEAN</span></a>
					</div>

					<div class="clearfix"></div>

					<!-- sidebar menu -->
					<%@ include file="../etc/sidebar.jsp"%>
					<!-- /sidebar menu -->

				</div>
			</div>

			<!-- top navigation -->
			<div class="top_nav">
				<div class="nav_menu">
					<nav>
						<div class="nav toggle">
							<a id="menu_toggle"><i class="fa fa-bars"></i></a>
						</div>

						<ul class="nav navbar-nav navbar-right">
							<li class=""><a href="javascript:;"
								class="user-profile dropdown-toggle" data-toggle="dropdown"
								aria-expanded="false"> <img src="images/img.jpg" alt="">John
									Doe <span class=" fa fa-angle-down"></span>
							</a>
								<ul class="dropdown-menu dropdown-usermenu pull-right">
									<li><a href="javascript:;"> Profile</a></li>
									<li><a href="javascript:;"> <span
											class="badge bg-red pull-right">50%</span> <span>Settings</span>
									</a></li>
									<li><a href="javascript:;">Help</a></li>
									<li><a href="login.html"><i
											class="fa fa-sign-out pull-right"></i> Log Out</a></li>
								</ul></li>

							<li role="presentation" class="dropdown"><a
								href="javascript:;" class="dropdown-toggle info-number"
								data-toggle="dropdown" aria-expanded="false"> <i
									class="fa fa-envelope-o"></i> <span class="badge bg-green">6</span>
							</a>
								<ul id="menu1" class="dropdown-menu list-unstyled msg_list"
									role="menu">
									<li><a> <span class="image"><img
												src="images/img.jpg" alt="Profile Image" /></span> <span> <span>John
													Smith</span> <span class="time">3 mins ago</span>
										</span> <span class="message"> Film festivals used to be
												do-or-die moments for movie makers. They were where... </span>
									</a></li>
									<li><a> <span class="image"><img
												src="images/img.jpg" alt="Profile Image" /></span> <span> <span>John
													Smith</span> <span class="time">3 mins ago</span>
										</span> <span class="message"> Film festivals used to be
												do-or-die moments for movie makers. They were where... </span>
									</a></li>
									<li><a> <span class="image"><img
												src="images/img.jpg" alt="Profile Image" /></span> <span> <span>John
													Smith</span> <span class="time">3 mins ago</span>
										</span> <span class="message"> Film festivals used to be
												do-or-die moments for movie makers. They were where... </span>
									</a></li>
									<li><a> <span class="image"><img
												src="images/img.jpg" alt="Profile Image" /></span> <span> <span>John
													Smith</span> <span class="time">3 mins ago</span>
										</span> <span class="message"> Film festivals used to be
												do-or-die moments for movie makers. They were where... </span>
									</a></li>
									<li>
										<div class="text-center">
											<a> <strong>See All Alerts</strong> <i
												class="fa fa-angle-right"></i>
											</a>
										</div>
									</li>
								</ul></li>
						</ul>
					</nav>
				</div>
			</div>
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>방문일지</h3>
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
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h5>
										방문처 상세내역 &nbsp;&nbsp;&nbsp;<small>* 방문일지 작성 전 거래처 등록은
											필수입니다.</small>
									</h5>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<br />
									<form class="form-horizontal form-label-left input_mask">

										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">거래처명</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input type="text" class="form-control" id="client_com_name" placeholder="거래처를 선택해 주세요" readonly>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">방문시간</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input type="date" class="form-control" readonly="readonly">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">방문내용</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<textarea class="form-control" rows="3"> </textarea>
											</div>
										</div>
										<div class="ln_solid"></div>
										<div class="form-group">
											<div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
												<button type="button" class="btn btn-primary">Cancel</button>
												<button class="btn btn-primary" type="reset">Reset</button>
												<button type="submit" class="btn btn-success">Submit</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
					<!-- row -->
				</div>
			</div>
		</div>
	</div>


	<!-- jQuery -->
	<script src="resources/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>




	<!-- Custom Theme Scripts -->
	<script src="resources/build/js/custom.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9847a2e4326a2ca39c99b754b2d4e80c"></script>
	<script type="text/javascript">
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
			mapOption = {
					center : new daum.maps.LatLng(37.503416, 127.034337), // 지도의 중심좌표
					level :4
		// 지도의 확대 레벨
		};

		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

		// 마커를 표시할 위치와 title 객체 배열입니다 

		$(function() {
			$.ajax({
						url : "accountlist.do",
						type : "post",
						data : {
							emp_no : "${loginEmp.emp_no}"
						},
						dataType : "json",
						success : function(obj) {
							//alert("성공!!!!!!!!!");
							console.log(obj);
							var objStr = JSON.stringify(obj);
							var jsonObj = JSON.parse(objStr);
							//중심좌표 재설정에 필요한 배열 객체
							var points =new Array();
							
							//마크 표시에 필요한 배열 객체 
							var loc = new Array(); 
							var c_com_name = new Array();
							
							for ( var i in jsonObj.accountlist) {
								loc[i] = {
										title : jsonObj.accountlist[i].client_company,
										latlng : new daum.maps.LatLng(
												jsonObj.accountlist[i].client_loc_x
												,jsonObj.accountlist[i].client_loc_y)
										};
								
								 points[i] = new daum.maps.LatLng(jsonObj.accountlist[i].client_loc_x
										,jsonObj.accountlist[i].client_loc_y);  
								 c_com_name[i] = jsonObj.accountlist[i].client_company;
						
							}
							
							var positions = new Array();
							
							for( var i in loc){
								 positions[i]= loc[i];
							}
							
							//지도 중심 좌표 재설정 
							// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
							var bounds = new daum.maps.LatLngBounds();    
							
							
							for (var i = 0; i < points.length; i++) {
							    // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다							    
							    // LatLngBounds 객체에 좌표를 추가합니다
							    bounds.extend(points[i]);
							}
							
							    // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
							    // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다						
							 map.setBounds(bounds);
							
							
							var imageSrc = "http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
							
							

							//for (var i = 0; i < positions.length; i++) {
	
								// 마커 이미지의 이미지 크기 입니다
								var imageSize = new daum.maps.Size(24, 35);

								// 마커 이미지를 생성합니다    
								var markerImage = new daum.maps.MarkerImage(
										imageSrc, imageSize);

								
								
								// 마커를 생성합니다
								for (var i = 0; i < positions.length; i++) {
								
									
									
									var marker = new daum.maps.Marker({
										map : map,
									    position:  positions[i].latlng,
									    //title : positions[j].title,
									    clickable: true // 마커를 클릭했을 때 지도의 클릭 이벤트가 발생하지 않도록 설정합니다
									},);
										makeMark(i);
									// 마커에 클릭이벤트를 등록합니다
									 	 // 마커에 클릭이벤트를 등록합니다
								 							
							
									marker.setMap(map);
							
								
									
									//마커위에 인포윈도우 생성
									var iwContent = '<div style="padding:5px;">'+positions[i].title+'</div>';// 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
							  		var iwPosition = positions[i].latlng; //인포윈도우 표시 위치입니다
							  		//var p = positions[i].title;
									var infowindow = new daum.maps.InfoWindow({
									    position : iwPosition, 
									    content : iwContent 
									});
								  
								 
									// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
									infowindow.open(map, marker); 
								}
								function makeMark(i){
								 	daum.maps.event.addListener(marker, 'click', function() {
								      // 마커 위에 인포윈도우를 표시합니다							     
								     $('#client_com_name').val(positions[i].title);
								     
								});
							}
						}
					});

			

			// 마커 이미지의 이미지 주소입니다
		});
	</script>

</body>
</html>