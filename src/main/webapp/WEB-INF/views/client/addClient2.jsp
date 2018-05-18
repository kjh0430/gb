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
		index++;
	};
	
	function delFile(idx){
		$("#"+idx).remove();
	}
	
	function resetFile(){
		$("#firstFile").val("");
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
										class="form-horizontal form-label-left">
									
										<input type="hidden" name="emp_no" value="${ loginEmp.emp_no }">
										<input type="hidden" name="client_loc_x" value="">
										<input type="hidden" name="client_loc_y" value="">
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="client_name">고객명 *
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input name="client_name" type="text" id="client_name" required="required"
													class="form-control col-md-7 col-xs-12" >
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="client_company">회사명 *
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input name="client_company" type="text" id="client_company" required="required"
													class="form-control col-md-7 col-xs-12" >
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
												<input name="client_addr" type="tel" id="client_addr" style="width:75%"
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
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												계약여부
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12" style="height:34px;padding:6px 12px">												
													<input class="form-check-input" type="radio" name="client_contract" id="Y" value="Y" checked>
													<label class="form-check-label" for="sale_yn">계약 </label>
													<input class="form-check-input" type="radio" name="client_contract" id="N" value="N">
													<label class="form-check-label" for="sale_n">미계약 </label>
											</div>
										</div>
																				
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
													<input type="file" id="firstFile" name="client_file" class="form-control">
													<a href="javascript:resetFile()" title="삭제">&nbsp;<i class='fa fa-times'></i></a>	
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
										      </div>
										      <div class="modal-body">
										      
										      <!-- 지도부분 시작 -->
										     
										     	<div id="searchAddr" style="width:100%;height:400px;"></div>
							   				  <!-- 지도 스크립트 -->
									     	 <!-- 다음지도 -->
										  	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f99f3844ac8886eed3b0155cb0041a70&libraries=services,clusterer,drawing"></script>
											<script>
												$(function(){
														
													var container = document.getElementById('searchAddr');
													var options = {
														center: new daum.maps.LatLng(33.450701, 126.570667),
														level: 3
													};
													
													var map = new daum.maps.Map(container, options);
														
													});
												
											</script>
										       <!-- 지도부분 끝 -->
										       
										      </div>
										      <div class="modal-footer">
										        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
										        <button id="" type="submit" class="btn btn-primary" data-dismiss="modal">확인</button>
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