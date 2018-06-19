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

<script type="text/javascript">
function list(page){	
	location.href="empList.do?page="+page;
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
								인사관리
							</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										사원관리
									</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									
									<table id="table_cl" class="table table-striped table-bordered" style="min-width:650px;">
										<thead>
											<tr>
												<th>사원번호</th>
												<th>이름</th>
												<th>주소</th>
												<th>연락처</th>
												<th>이메일</th>
											</tr>											
										</thead>
										<tbody>
										<c:forEach items="${ empList }" var="empList">
											<tr>
												<td><a href="empDetail.do?emp_no=${ empList.emp_no }">${ empList.emp_no }</a></td>
												<td><a href="empDetail.do?emp_no=${ empList.emp_no }">${ empList.emp_name }</a></td>
												<td>${ empList.emp_addr }</td>
												<td>${ empList.emp_phone }</td>
												<td>${ empList.emp_email }</td>
											</tr>	
										</c:forEach>																	
										</tbody>
									</table>
									<div style="text-align:center;">
									
									 <c:if test="${curPage>1}">
										<a class="page-link" href="empList.do?page=1">처음</a>
									</c:if> 
									
									 <c:if test="${curPage>1}">
										<a class="page-link" href="empList.do?page=${beginPage-1}">Pre</a>
									</c:if>									
									
									 <c:forEach var ="page" begin="${beginPage}" end="${finalPage}">
										  <c:choose>
											<c:when test="${page==currentPage}">												
												 <a class="page-link" style="color:red;">${page}</a>
											</c:when>										
										  <c:otherwise> 
												 <a class="page-link" href="#" onclick="list('${page}')">${page}</a>	
										  </c:otherwise> 
										 </c:choose> 
									</c:forEach>  
									
									 <c:if test="${curPage!=totalPage}">
										<a class="page-link" href="empList.do?page=${finalPage+1}">Next</a>
									</c:if> 
									
									<c:if test="${curPage!=totalPage}">
										<a class="page-link" href="empList.do?page=${maxPage}">맨끝</a>
									</c:if>
									
								</div>
								</div>
							</div>
						</div>
					</div>
				
	</div>
	</div>
	<!-- /page content -->

		<%@ include file="../etc/footer.jsp" %>
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