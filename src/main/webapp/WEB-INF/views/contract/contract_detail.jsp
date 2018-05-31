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

<title>계약서 상세보기</title>

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
<!-- bootstrap-daterangepicker -->
<link
   href="resources/vendors/bootstrap-daterangepicker/daterangepicker.css"
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
						<a href="main.html" class="site_title"><i class="fa fa-google"></i>
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
								<h3>계약서</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>계약내용</h2>
									
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
                   					 <br />
									<form id="updateClientView" data-parsley-validate
										class="form-horizontal form-label-left" onsubmit="return false">
										
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="first-name">고객명
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" required="required"
													class="form-control col-md-7 col-xs-12" 
													value="${ contractDetail.client.client_name }" readonly>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="last-name">회사명
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text"
													required="required" class="form-control col-md-7 col-xs-12" 
													value="${ contractDetail.client.client_company }" readonly>
											</div>
										</div>
										<div class="form-group">
											<label for="middle-name"
												class="control-label col-md-3 col-sm-3 col-xs-12">
												직책
												</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input 
													class="form-control col-md-7 col-xs-12" type="text"
													value="${ contractDetail.client.client_job }" readonly>
											</div>
										</div>
										
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												주소
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input 
													class="date-picker form-control col-md-7 col-xs-12"
													required="required" type="text" 
													value="${ contractDetail.client.client_addr }" readonly>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												연락처
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input 
													class="date-picker form-control col-md-7 col-xs-12"
													required="required" type="text" 
													value="${ contractDetail.client.client_phone }" readonly>
											</div>
										</div>
										<hr>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												계약금
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input 
													class="date-picker form-control col-md-7 col-xs-12"
													required="required" type="text" 
													value="${ contractDetail.contract_money }" readonly>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												할인률
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input 
													class="date-picker form-control col-md-7 col-xs-12"
													required="required" type="text" 
													value="${ contractDetail.contract_discount }" readonly>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												계약시작일
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input 
													class="date-picker form-control col-md-7 col-xs-12"
													required="required" type="text" 
													value="${ contractDetail.contract_date_start }" readonly>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												계약종료일
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input 
													class="date-picker form-control col-md-7 col-xs-12"
													required="required" type="text" 
													value="${ contractDetail.contract_date_end }" readonly>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												사업자등록번호
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input 
													class="date-picker form-control col-md-7 col-xs-12"
													required="required" type="text" 
													value="${ contractDetail.business_no }" readonly>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												주문자 서명
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<div id="clientSignature"></div>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												납품자 서명
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<div id="empSignature"></div>
											</div>
										</div>
										
										
										<div class="ln_solid"></div>
										<div class="form-group">
											<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
												<button id="confirmContract" class="btn btn-primary">확인</button>
											</div>
										</div>

									</form>
									
                                					
								</div>
							</div>
						</div>
					</div><!-- row -->
					
				</div>
			</div>
			
			<!-- start footer -->
				<c:import url="../etc/footer.jsp"></c:import>
			<!-- end footer -->
			
			
		</div>
	</div>

	<!-- /page content -->
	
	<!-- 서명관련 스크립트 시작-->
	   <script type="text/javascript" src="resources/jSignature/jSignature.min.js"></script>
		<script>
		    $(document).ready(function() {
			       		
	        	var cimg = new Image();
	        	var eimg = new Image();
	        	var clientSign = "${contractDetail.client_sign}";
	        	var empSign = "${contractDetail.emp_sign}";
	        	
	        	cimg.src = "data:"+clientSign;
	        	eimg.src = "data:"+empSign;
	        	
	        	$(cimg).appendTo($('#clientSignature'));
	        	$(eimg).appendTo($('#empSignature'));
		       
		    })
		</script>
	<!-- 서명관련 스크립트 끝 -->
	
	<!-- 확인버튼 -->
	<script type="text/javascript">
		$('#confirmContract').on('click', function(){
			history.go(-1);
		});
	</script>
	
	<!-- Bootstrap -->
   <script src="resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
   
   <!-- Custom Theme Scripts -->
   <script src="resources/build/js/custom.min.js"></script>

</body>
</html>