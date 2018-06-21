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

function clientList(){
	$.ajax({
		url : "/classKing/clentlist",
		data : {empNo : ""},
		type : "get",
		datatype : "json",
		success : function(data){
			var jsonStr = JSON.stringfy
		}
	});
}
</script>

<!-- ----------------------스크립트관련 작업영역 시작------------------------ -->

<script type="text/javascript">

$(function(){
	
	$('#searchContractList').keyup(function() {
		
		$.ajax({
			url: "searchContractList.do",
			type: "post",
			data: {
				client_name: $('#searchContractList').val(),
				emp_no : '${loginEmp.emp_no}'
			},
			dataType: "json",
			success: function(data) {
				var obj = JSON.stringify(data);
				var json = JSON.parse(obj);
				var list = "";
				var maxPage = json.maxPage;
				var page = "";
					for(var i in json.list) {
						list += 
							"<tr>"+
								"<td>"+"<a href="+"contractDetail.do?client_no="+json.list[i].client_no+">"+decodeURIComponent(json.list[i].client_name)+"</a>"+"</td>"+
								"<td>"+decodeURIComponent(json.list[i].client_company.replace(/\+/g, " "))+"</td>"+
								"<td>"+json.list[i].client_phone+"</td>"+
								"<td>"+json.list[i].contract_discount+"</td>"+
								"<td>"+json.list[i].contract_money+"</td>"+
								"<td>"+json.list[i].contract_start+"</td>"+
								"<td>"+json.list[i].contract_end+"</td>"+
							"</tr>";	
					}
							
					for(var i=1; i<=maxPage; i++) {
						page += "<a style='cursor:pointer;' onclick='searchPageAjax("+i+")'>["+i+"]</a>";
					}
					
							$('table tbody').html(list);
							$('#showSearchContractNumber').html(page);
				}	//success
		});	//ajax
	});	//keyup	
});	//onload
</script>

<script type="text/javascript">
	function searchPageAjax(num){
		$.ajax({
			url: "searchContractList.do",
			type: "post",
			data: {
				client_name: $('#searchContractList').val(),
				emp_no : '${loginEmp.emp_no}',
				startPage: num
			},
			dataType: "json",
			success: function(data) {
				var obj = JSON.stringify(data);
				var json = JSON.parse(obj);
				var list = "";
				
					for(var i in json.list) {
						list += 
							"<tr>"+
								"<td>"+"<a href="+"contractDetail.do?client_no="+json.list[i].client_no+">"+decodeURIComponent(json.list[i].client_name)+"</a></td>"+
								"<td>"+decodeURIComponent(json.list[i].client_company.replace(/\+/g, " "))+"</td>"+
								"<td>"+json.list[i].client_phone+"</td>"+
								"<td>"+json.list[i].contract_discount+"</td>"+
								"<td>"+json.list[i].contract_money+"</td>"+
								"<td>"+json.list[i].contract_start+"</td>"+
								"<td>"+json.list[i].contract_end+"</td>"+
							"</tr>";	
					}
							
							$('table tbody').html(list);
				}	//success
		});	//ajax
	}
</script>

<!-- ----------------------스크립트관련 작업영역 끝------------------------ -->

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
								계약
							</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										계약리스트
									</h2>
										<form onsubmit="return false;">
											<input style="float:right;"
												type="text" id="searchContractList">
												<font style="float:right" id="conSearch">Search</font>
										</form>
									
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									
									<table id="table_cl" class="table table-striped table-bordered" style="min-width:650px;">
										<thead>
											<tr>
												<th>고객명</th>
												<th>회사명</th>
												<th>연락처</th>
												<th>할인률 (%)</th>
												<th>계약금</th>
												<th>계약시작일</th>
												<th>계약종료일</th>
											</tr>
										</thead>
										<tbody>
										
										<c:forEach var="list" items="${ contractPageList }">
											<tr>
												<td><a href="contractDetail.do?client_no=${ list.client.client_no }">${ list.client.client_name }</a></td>
												<td>${ list.client.client_company }</td>
												<td>${ list.client.client_phone }</td>
												<td>${ list.contract_discount }</td>
												<td>${ list.contract_money }</td>
												<td>${ list.contract_date_start }</td>
												<td>${ list.contract_date_end }</td>
											</tr>
											
										</c:forEach>

										</tbody>
									</table>
								</div>
								
								<!-- 페이징 처리 -->
								<div id="showSearchContractNumber" style="text-align:center;">
									<c:forEach var="i" begin="${ start }" end="${ end }" varStatus="num">
										<a id="listNumber${ num.index }" style="cursor:pointer;" onclick="searchPageAjax(${ num.index })">[${ i }]</a>
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