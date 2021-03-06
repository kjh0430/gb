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

<title>잠재고객 상세페이지</title>

<!-- Bootstrap -->
<link href="resources/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="resources/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link href="resources/vendors/nprogress/nprogress.css" rel="stylesheet">
<!-- iCheck -->
<link href="resources/vendors/iCheck/skins/flat/green.css"
	rel="stylesheet">

<!-- bootstrap-progressbar -->
<link
	href="resources/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet">
<!-- JQVMap -->
<link href="resources/vendors/jqvmap/dist/jqvmap.min.css"
	rel="stylesheet" />
<!-- bootstrap-daterangepicker -->
<link
	href="resources/vendors/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="resources/build/css/custom.min.css" rel="stylesheet">
<link href="resources/css/main.css" rel="stylesheet">

<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $('#table_cl').dataTable( {
        ordering:false,
        lengthChange:false,
        pageLength:15
    } );
} );


</script>

<script type="text/javascript">
	$(function(){
		/* 고객삭제 확인 */
		function deleteClient() {
			if((confirm("해당 고객정보를 삭제하시겠습니까?") == true)) {
				location.href="deleteClient.do?client_no="+""+${ deleteClient.client_no }+"";
			}else{
				return false;
			}
	});
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
								잠재고객
							</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<font style="font-size:18px;">${ detailClient.client_name }</font>
									<font style="float:right; font-size:15px;">
										<a href="#">수정</a>&nbsp; &nbsp;
										<a href="#">삭제</a>
									</font>
									
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									
									<table id="table_cl" class="table table-striped table-bordered" style="min-width:650px;">
										
										<tbody>
											<tr>
												<th width="100px;">고객명</th>
												<td>${ detailClient.client_name }</td>
											</tr>
											<tr>
												<th width="100px;">회사명</th>
												<td>${ detailClient.client_company }</td>
											</tr>
											<tr>
												<th width="100px;">직책/직위</th>
												<td>${ detailClient.client_job }</td>
											</tr>
											<tr>
												<th width="100px;">이메일</th>
												<td>${ detailClient.client_email }</td>
											</tr>
											<tr>
												<th width="100px;">연락처</th>
												<td>${ detailClient.client_phone }</td>
											</tr>
											<tr>
												<th width="100px;">주소</th>
												<td>${ detailClient.client_addr }</td>
											</tr>
											<tr>
												<th width="100px;">회사 전화번호</th>
												<td>${ detailClient.client_com_tel }</td>
											</tr>
											<tr>
												<th width="100px;">계약여부</th>
												<td>${ detailClient.client_contract }</td>
											</tr>
											<tr>
												<th width="100px;">비고</th>
												<td>${ detailClient.client_comment }</td>
											</tr>

										<tbody>
									</table>
									
									<br>
									
									<div class="x_title">
										<h2>
											접촉이력
										</h2>
										<div class="clearfix"></div>
									</div>
									
									
									<table id="table_cl" class="table table-striped table-bordered" style="min-width:650px;">
										
										<thead>
											<tr>
												<th width="150px;">접촉일</th>
												<th>접촉내용</th>
											</tr>
										</thead>
										
										<tbody>
											<tr>
												<td></td>
												<td></td>
											</tr>

										<tbody>
									</table>
									
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- /page content -->

	
	</div>
	</div>

	<!-- jQuery -->
	<script src="resources/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script src="resources/vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script src="resources/vendors/nprogress/nprogress.js"></script>
	<!-- iCheck -->
	<script src="resources/vendors/iCheck/icheck.min.js"></script>
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
	<script src="resources/vendors/jszip/dist/jszip.min.js"></script>
	<script src="resources/vendors/pdfmake/build/pdfmake.min.js"></script>
	<script src="resources/vendors/pdfmake/build/vfs_fonts.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="resources/build/js/custom.min.js"></script>

</body>
</html>