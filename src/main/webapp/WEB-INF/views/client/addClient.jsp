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
								<div class="x_title">
									<font style="font-size:18px;">고객등록</font>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
								
									<form action="insertClient.do" method="post" clear="both">
									<table id="table_cl" class="table table-striped table-bordered" style="min-width:650px;">
										<input type="hidden" name="emp_no" value="${ loginEmp.emp_no }">
										<tbody>
										
											<tr>
												<th width="100px;">고객명 *</th>
												<td><input style="width:300px;" type="text" name="client_name"></td>
											</tr>
											<tr>
												<th width="100px;">회사명 *</th>
												<td>
													<input style="width:300px;" type="text" name="client_company">
													<input type="button" name="" value="검색">
												</td>
											</tr>
											<tr>
												<th width="100px;">직책/직위</th>
												<td><input style="width:300px;" type="text" name="client_job"></td>
											</tr>
											<tr>
												<th width="100px;">이메일 *</th>
												<td><input style="width:300px;" type="email" name="client_email"></td>
											</tr>
											<tr>
												<th width="100px;">연락처 *</th>
												<td><input style="width:300px;" type="tel" name="client_phone"></td>
											</tr>
											<tr>
												<th width="100px;">주소</th>
												<td><input style="width:300px;" type="text" name="client_addr"></td>
											</tr>
											<tr>
												<th width="100px;">회사 전화번호</th>
												<td><input style="width:300px;" type="tel" name="client_com_tel"></td>
											</tr>
											<tr>
												<th width="100px;">계약여부</th>
												<td>
													<input type="radio" name="client_contract" value="Y">여
													<input type="radio" name="client_contract" value="N">부
												</td>
											</tr>
											<tr>
												<th width="100px;">비고</th>
												<td><input style="width:300px;" type="text" name="client_comment"></td>
											</tr>

										<tbody>
									</table>
									
									<div class="x_title">
										<font style="font-size:18px;">첨부파일</font> &nbsp;
										<a href="#">파일찾기</a>
									<div class="clearfix"></div>
									
									<br>
									
						              <span>첨부파일</span> &nbsp; 
						              <a href="#"><span style="color:black;">첨부파일명</span></a>
						              	
									</div>
									
									<div class="clearfix"></div>
									
									<input style="float:right;" type="submit" value="등록">
									
								</form>
								<!-- -------------------------------------- -->
								
									
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