<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="true" %>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="images/favicon.ico" type="image/ico" />

<!-- 지도 스크립트 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9b9e69b801fea9fcd5736922a07d3042&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9b9e69b801fea9fcd5736922a07d3042"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f99f3844ac8886eed3b0155cb0041a70"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f99f3844ac8886eed3b0155cb0041a70&libraries=services,clusterer,drawing"></script>

<title>고객등록</title>

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
	
	
	function addFile(){
		var index=1;		
		var value="<li id='cFile-"+index+"' class='added'><input type='file' class='form-control' name='client_file'>"
		+"<a href='javascript:delFile(\"cFile-"+index+"\")' title='삭제'>&nbsp;&nbsp;<i class='fa fa-times'></i></a></li>";
		$(".c_file").append(value);
		var firstFile = $("#firstFile").val(); 
		console.log(firstFile +"," + typeof(firstFile));
		if(index==1 && firstFile==("")){
			$(".fileSpan").html("");
			index++;
		}else{
			index++;
		}		
	};
	
	function delFile(idx){
		var firstFile = $("#firstFile").val(); 
		console.log(firstFile +"," + typeof(firstFile));
		if(idx==1 && firstFile !=("")){
			$(".fileSpan").html("<a href='javascript:resetFile()' title='삭제'>&nbsp;<i class='fa fa-times'></i></a>");
			$("#"+idx).remove();
		}else{
			$("#"+idx).remove();
		}		
	}
	
	function resetFile(){
		$("#firstFile").val("");
		$(".fileSpan").html("");		
	}
	
	function firstChange(){
		var firstFile = $("#firstFile").val(); 
		if(firstFile!=""){
			$(".fileSpan").html("<a href='javascript:resetFile()' title='삭제'>&nbsp;<i class='fa fa-times'></i></a>");
		}
	}

</script>
<style type="text/css">
	.c_file{
		list-style:none;
		padding-left:0px;
	}
	.added{
		margin-top:10px;
	}
	input[type=file]{
		display:inline-block;
		width:75%;
	}
	.add_btn{
		margin-bottom:0px;
		float:right;
		display:inline-block;
	}
	
    .bAddr {
    	padding: 5px;
    	text-overflow: ellipsis;
    	overflow: hidden;
    	white-space: nowrap;
    }
	
</style>

	<!-- 다음지도 -->
							   				
	<script>
		$(function(){
			var loc_y="";	//위도정보
			var loc_x="";	//경도정보
			var getAddr="";	//클릭한 주소명
			
				$('#searchMap').on('click', function(){
					var container = document.getElementById('searchAddr');
					var options = {
						center: new daum.maps.LatLng(37.4990734,127.0317662),
						level: 2
					};
					
					$("#myModal").on('shown.bs.modal', function () {
						//지도를 생성합니다
						var map = new daum.maps.Map(container, options);
						
						// 주소-좌표 변환 객체를 생성합니다
			   		  	 var geocoder = new daum.maps.services.Geocoder();


						// 마커가 표시될 위치입니다 
						//var markerPosition  = new daum.maps.LatLng(37.4989885, 127.0306385); 
						// 마커를 생성합니다
						var marker = new daum.maps.Marker();
						 infowindow = new daum.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
						
							//marker.setMap(map);
						
						// 지도에 클릭 이벤트를 등록합니다
						// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
							// 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
							daum.maps.event.addListener(map, 'click', function(mouseEvent) {
							    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
							    	
							    	// 클릭한 위도, 경도 정보를 가져옵니다 
									loc_x = mouseEvent.latLng.getLat();
									loc_y = mouseEvent.latLng.getLng();
									
									//alert(loc_y + "\n" + loc_x);
							    	
							        if (status === daum.maps.services.Status.OK) {
							            var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
							            detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
							            
							            getAddr = result[0].address.address_name;
							            //alert("받아온 지번주소 : "+getAddr);
							            var content = '<div class="bAddr">' +
							                            detailAddr + 
							                        '</div>';

							            // 마커를 클릭한 위치에 표시합니다 
							            marker.setPosition(mouseEvent.latLng);
							            marker.setMap(map);
			
							            // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
							            infowindow.setContent(content);
							            infowindow.open(map, marker);
							        }   
							    });
							});//지도에 마우스 클릭

				   		         
				$('#searchKeywordText').keyup(function(){
					//alert($('#searchKeywordText').val());
					
			   		// 장소 검색 객체를 생성합니다
			   		var ps = new daum.maps.services.Places(); 
			   	
			   		// 키워드로 장소를 검색합니다
			   		ps.keywordSearch(""+$('#searchKeywordText').val()+"", placesSearchCB); 

			   		// 키워드 검색 완료 시 호출되는 콜백함수 입니다
			   		function placesSearchCB (data, status, pagination) {
			   		    if (status === daum.maps.services.Status.OK) {

			   		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			   		        // LatLngBounds 객체에 좌표를 추가합니다
			   		        var bounds = new daum.maps.LatLngBounds();

			   		        for (var i=0; i<data.length; i++) {
			   		            bounds.extend(new daum.maps.LatLng(data[i].y, data[i].x));
			   		        }       

			   		        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			   		        map.setBounds(bounds);
			   		        
			   		    } 
			   		}
				});	// 검색하기 버튼클릭
				
				//검색완료 확인버튼 클릭시 실행될 메소드
				$('#searchConfirm').on('click', function(){
					$('#search_client_addr').val(getAddr);
					$('input[name=client_loc_x]').val(loc_x);
					$('input[name=client_loc_y]').val(loc_y);
					
				});
				//검색창 취소시 실행메소드
				$('#searchCancel').on('click', function(){
					$('#search_client_addr').val("");
					$('input[name=client_loc_x]').val("");
					$('input[name=client_loc_y]').val("");
				});
				
				function searchAddrFromCoords(coords, callback) {
				    // 좌표로 행정동 주소 정보를 요청합니다
				    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
				}
				
				function searchDetailAddrFromCoords(coords, callback) {
				    // 좌표로 법정동 상세 주소 정보를 요청합니다
				    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
				}
				
						
				}); //모달창에서 지도보여주기
		}); // 주소검색을 누름
	});	//onload
	
	</script>

	<!-- 고객등록 유효성검사 -->
	<script type="text/javascript">
		function nameCheck(){
			if($('#client_name').val() == ""){
				$('#infoNameCheck').text("고객명을 입력하세요!");
			}else{
				$('#infoNameCheck').text("");
			}
		}
		function companyCheck(){
			if($('#client_company').val() == ""){
				$('#infoCompanyCheck').text("회사명을 입력하세요!");
			}else{
				$('#infoCompanyCheck').text("");
			}
		}
		
	</script>

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
						<c:choose>
			            	<c:when test="${ loginEmp.job_no == 3}">
					            <!-- sidebar menu -->
					            <%@ include file="../etc/adminsidebar.jsp" %>
					            <!-- /sidebar menu -->
			            	</c:when>
			            	<c:when test="${ loginEmp.job_no == 2}">
			            	<%@ include file="../etc/adminsidebar.jsp" %>
			            	
			            	</c:when>
			            	<c:otherwise>
								<!-- sidebar menu -->
					            <%@ include file="../etc/sidebar.jsp" %>
					            <!-- /sidebar menu --> 
			            	</c:otherwise>
			            </c:choose>
					<!-- /sidebar menu -->

				</div>
			</div>

			<!-- top navigation -->
			<c:import url="../etc/topnav.jsp"></c:import>
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>
								고객등록
							</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_content">
									 <br />
									<form action="insertClient.do" method="post" ata-parsley-validate
										class="form-horizontal form-label-left" enctype="multipart/form-data">
									
										<input type="hidden" name="emp_no" value="${ loginEmp.emp_no }">
										<input type="hidden" name="client_loc_x" value="$('input[name=client_loc_y]').val()">
										<input type="hidden" name="client_loc_y" value="$('input[name=client_loc_y]').val()">
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="client_name">고객명 *
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input name="client_name" type="text" id="client_name" required="required"
													class="form-control col-md-7 col-xs-12" onkeydown="nameCheck()" >
												<div id="infoNameCheck" style="color:red;text-align:center;"></div>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="client_company">회사명 *
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input name="client_company" type="text" id="client_company" required="required"
													class="form-control col-md-7 col-xs-12" onkeydown="companyCheck()" onmousedown="nameCheck()">
												<div id="infoCompanyCheck" style="color:red;text-align:center;"></div>	
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="client_job">직책/직위
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input name="client_job" type="text" id="client_job"
													class="form-control col-md-7 col-xs-12" >
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="client_email">이메일 *
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input name="client_email" type="email" id="client_email"
													class="form-control col-md-7 col-xs-12" required>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="client_phone">연락처 *
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input name="client_phone" type="tel" id="client_phone"
													class="form-control col-md-7 col-xs-12" required>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="client_addr">주소 *
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input name="client_addr" type="text" id="search_client_addr" 
													style="width:75%"
													class="form-control col-md-7 col-xs-12" required>
												<button id="searchMap" type="button" class="btn btn-primary" style="margin-left:10px;float:right" data-toggle="modal" data-target="#myModal">검색</button>	
													
											</div>
										</div>										
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="client_com_tel">회사 전화번호 
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input name="client_com_tel" type="tel" id="client_com_tel"
													class="form-control col-md-7 col-xs-12">
											</div>
										</div>
										<!-- <div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												계약여부
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12" style="height:34px;padding:6px 12px">												
													<input class="form-check-input" type="radio" name="client_contract" id="Y" value="Y">
													<label class="form-check-label" for="sale_yn">계약 </label>
													<input class="form-check-input" type="radio" name="client_contract" id="N" value="N" checked>
													<label class="form-check-label" for="sale_n">미계약 </label>
											</div>
										</div> -->
																				
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="client_comment">비고
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<textarea class="form-control col-md-7 col-xs-12" name="client_comment" rows="3"></textarea>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												첨부파일
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12" >
											<ul class="c_file">
												<li id="cFile-0">
													<input type="file" id="firstFile" name="client_file" onchange="firstChange()" class="form-control">
													<span class="fileSpan"></span>	
													<input type="button" class="btn btn-dark add_btn" onclick="addFile()" value="추가"/>
												</li>
											</ul>								
											</div>
										</div>
										
										<div class="ln_solid"></div>
										<div class="form-group">
											<!-- <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
												<button type="submit" class="btn btn-primary">정보수정</button>
												<button class="btn btn-danger" type="button">제품삭제</button>
											</div> -->
											
											<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
												<button type="submit" class="btn btn-primary">등록</button>
											</div>
										</div>
									
								</form>
									<!-- 모달의 시작 -->
										<!-- Modal -->
										<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
										  <div class="modal-dialog">
										    <div class="modal-content">
										      <div class="modal-header">
										        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
										        <h4 class="modal-title" id="myModalLabel">주소검색</h4>
										        
										      <!-- 검색창 -->	
										      	<input id="searchKeywordText" type="text">
										      	<button id="searchKeywordBtn" type="button" class="btn btn-primary" style="margin-left:10px">검색</button>
										      	<span id="centerAddr"></span>
										      </div><!-- modal heder end div -->	
										      
										      <div class="modal-body">
										      
										      <!-- 지도부분 시작 -->
										     	<div id="searchAddr" style="width:100%;height:400px;"></div>
										     	
										       <!-- 지도부분 끝 -->
										       
										      </div>
										      <div class="modal-footer">
										        <button id="searchCancel" type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
										        <button id="searchConfirm" type="submit" class="btn btn-primary" data-dismiss="modal">확인</button>
										      </div>
										    </div>
										  </div>
										</div>
										<!-- 모달의 끝 -->
									
									
									
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			
			<!-- start footer -->
				<c:import url="../etc/footer.jsp"></c:import>
			<!-- end footer -->
			
		</div>
	</div>
	<!-- /page content -->



	<!-- jQuery -->
	<script src="resources/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Datatables -->
	<script
		src="resources/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
	<script
		src="resources/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	<script
		src="resources/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
	<script
		src="resources/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
	<script
		src="resources/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
	<script
		src="resources/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
	<script
		src="resources/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
	<script
		src="resources/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
	<script
		src="resources/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
	<script
		src="resources/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="resources/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
	<script
		src="resources/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
	

	<!-- Custom Theme Scripts -->
	<script src="resources/build/js/custom.min.js"></script>
	

</body>
</html>