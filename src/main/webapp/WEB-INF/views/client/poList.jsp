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

<title>잠재고객</title>

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
        paging: false,
        info: false,
        searching: false
    } );
} );

</script>

<!-- ---------------------- 고객리스트 검색 Ajax ------------------------ -->

	<script type="text/javascript">
		$(function(){
			
			$('#searchPoList').keyup(function() {
				
				$.ajax({
					url: "searchPoList.do",
					type: "post",
					data: {
						client_name: $('#searchPoList').val()
					},
					dataType: "json",
					success: function(data) {
						var obj = JSON.stringify(data);
						var json = JSON.parse(obj);
						var clientList = "";
						
							for(var i in json.searchList) {
								clientList += 
									"<tr>"+
										"<td>"+"<a href="+"detailClient.do?client_no="+json.searchList[i].client_no+">"+decodeURIComponent(json.searchList[i].client_name)+"</a>"+"</td>"+
										"<td>"+decodeURIComponent(json.searchList[i].client_company)+"</td>"+
										"<td>"+decodeURIComponent(json.searchList[i].client_job)+"</td>"+
										"<td>"+json.searchList[i].client_email+"</td>"+
										"<td>"+json.searchList[i].client_phone+"</td>"+
										"<td>"+decodeURIComponent(json.searchList[i].client_addr.replace(/\+/g, " "))+"</td>"+
									"</tr>";	
							}
									
									$('table tbody').html(clientList);
						}	//success
				});	//ajax
			});	//keyup				
		});	//onload
	</script>



<!-- ---------------------- 고객리스트 검색 Ajax ------------------------ -->

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
								잠재고객
							</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										거래예정 고객목록
									</h2>
								<form onsubmit="return false;">
									<input style="float:right;"
										type="text" id="searchPoList">
										<button style="float:right" id="poSearch">검색</button>
								</form>
									
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									
									<table id="table_cl" class="table table-striped table-bordered" style="min-width:650px;">
										<thead>
											<tr>
												<th>고객명</th>
												<th>회사명</th>
												<th>직 급</th>
												<th>이메일</th>
												<th>연락처</th>
												<th>주 소</th>
											</tr>
										</thead>
										<tbody>
										
										<c:forEach var="list" items="${ pageList }">
											<tr>
												<td><a href="detailClient.do?client_no=${ list.client_no }">${ list.client_name }</a></td>
												<td>${ list.client_company }</td>
												<td>${ list.client_job }</td>
												<td>${ list.client_email }</td>
												<td>${ list.client_phone }</td>
												<td>${ list.client_addr }</td>
											</tr>
											
										</c:forEach>

										</tbody>
									</table>
								</div>
								
								<!-- 페이징 처리 -->
								<div style="text-align:center;">
									<c:forEach var="i" begin="${ start }" end="${ end }">
										<a id="listNumber" href="poList.do?startPage=${ i }">${ i }</a>
									</c:forEach>
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