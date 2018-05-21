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
								<input type="date" class="form-control" id="daily_date" name="daily_date" style="width:200px;display:inline-block">
								<button class="btn btn-dark" onclick="selectVisit()"style="display:inline-block">확인</button>
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
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9847a2e4326a2ca39c99b754b2d4e80c&libraries=services"></script>		
	<script type="text/javascript">
	
	$(function(){
		document.getElementById("daily_date").valueAsDate = new Date();
		
		selectVisit();	
		
	});//onload
	
	
	//visitlist ajax
	function selectVisit(){
		$.ajax({
			url:"visitList.do",
			type:"post",
			dataType:"json",
			data:{emp_no:"${ loginEmp.emp_no }",daily_date:$("#daily_date").val()},
			success:function(obj){
				console.log(obj);
				
				var objStr =JSON.stringify(obj);
				var visit = JSON.parse(objStr);		
				var size =Object.keys(visit.list).length;
				
				if(size>0){
					
					var values="";
					var loc=new Array();
					var points=new Array();
					
					for(var i in visit.list){
						values+= "<li><div class='block'><div class='block_content'><h2 class='title'>"
						+visit.list[i].client_name+"</h2><div class='daily_time'><span>"+visit.list[i].daily_date
						+"</span></div><p class='expert'>"+visit.list[i].daily_comment+"</p></div></div></li>"
						
						loc[i]= {title:visit.list[i].client_name,
								 latlng: new daum.maps.LatLng(visit.list[i].client_loc_x,visit.list[i].client_loc_y)};
						points[i] = new daum.maps.LatLng(visit.list[i].client_loc_x,visit.list[i].client_loc_y);  
					}
					
					$("#visitList").html(values);
					
					//지도시작!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
				    mapOption = { 
				        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };
	
					var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성				 
					var bounds = new daum.maps.LatLngBounds();
				
					for (i = 0; i < points.length; i++) {				  
					    bounds.extend(points[i]);
					}
					map.setBounds(bounds);
					
					// 마커를 표시할 위치와 title 객체 배열입니다 
					var positions = new Array();
					
					for(var i in loc){
						positions[i] = loc[i];
					}
					
					for (var i = 0; i < positions.length; i ++) {
					    // 마커를 생성합니다
					    var marker = new daum.maps.Marker({
					        map: map, // 마커를 표시할 지도
					        position: positions[i].latlng, // 마커를 표시할 위치
					        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다				       
					    });
					    
					    var iwContent = '<div style="padding:5px;text-align:center;width:100%">'+positions[i].title+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
					    iwPosition = positions[i].latlng; //인포윈도우 표시 위치입니다
	
						// 인포윈도우를 생성합니다
						var infowindow = new daum.maps.InfoWindow({
						    position : iwPosition, 
						    content : iwContent 
						});
						infowindow.open(map, marker); 
					    
					}
									
					//선그리기
					var linePath = new Array();
					for (i = 0; i < points.length; i++) {					  
					    linePath[i] = points[i];
					}
	
					// 지도에 표시할 선을 생성합니다
					var polyline = new daum.maps.Polyline({
					    path: linePath, // 선을 구성하는 좌표배열 입니다
					    strokeWeight: 5, // 선의 두께 입니다
					    strokeColor: '#1ABB9C', // 선의 색깔입니다
					    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
					    strokeStyle: 'solid' // 선의 스타일입니다
					});
	
					// 지도에 선을 표시합니다 
					polyline.setMap(map); 

				}else{
					//리스트 사이즈가 0이면 담당지역의 지도를 뿌려줌					
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				        level: 4 // 지도의 확대 레벨
				    };  

					var map = new daum.maps.Map(mapContainer, mapOption); 
	
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new daum.maps.services.Geocoder();
					geocoder.addressSearch('${loginEmp.city} ${loginEmp.county}', function(result, status) {
	
					    // 정상적으로 검색이 완료됐으면 
					     if (status === daum.maps.services.Status.OK) {	
					        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
					        map.setCenter(coords);
					    } 
					});  
					
					$("#visitList").html("방문한 거래처가 없습니다.");
				} //else 끝
			},
			error:function(request,status,errorData){
				console.log("error data : " +request.status+"\n"
						+"message : "+request.responseText+"\n"
						+"error : "+errorData);
			}	
		});	
	}//visitlist ajax
	
	
	
	
	
	</script>

</body>
</html>