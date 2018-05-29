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

} );

</script>

<script type="text/javascript">
function list(page){
	
	location.href="noticeList.do?page="+page;
}


</script>

<style type="text/css">
	.btn-modify{
		padding:3px 6px;
		margin:0px;
		font-size:13px;
	}
	.table-bordered>tbody>tr>td{
		vertical-align:middle;
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
					 <%@ include file="../etc/adminsidebar.jsp" %>
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
							<h3>
								공지사항
							</h3>
						</div>
						
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_content table-responsive">	
									<button type="button" class="btn btn-default btn-sm" style="float:right;"><a href="noticeWrite.do">글쓰기</a></button>
										
									<table id="table_notice" class="table table-striped table-responsive table-bordered" style="min-width:600px;">
										<thead>
											<tr>
												<th>번호</th>
												<th>제목</th>
												<th>날짜</th>
												<th>조회수</th>
											</tr>
										</thead>
										<tbody>
											 <c:forEach var="notice" items="${ noticeList }">
												<tr>
													<th>${ notice.notice_no }</th>													
													<th><a href="noticeDetail.do?notice_no=${notice.notice_no}" >${ notice.notice_title }</a></th>
													<th>${ notice.notice_date }</th>
													<th>${ notice.notice_count }</th>
												</tr>
											</c:forEach>
											
											
											
											  <%-- <c:forEach items="${noticeList}" var="vo" varStatus="idx">
									 
									             <tr class="${idx.count % 2 == 1 ? 'trOdd' : 'trEven'}">
									              <td><c:choose>
									                  <c:when test="${listCount > pageSize}"> <!-- ex) count= 11, pageSize=10 -->
									                    <c:out
									                      value="${listCount - pageSize*(currentPage-1) - idx.count +1}" /> <!-- 11,10,9,8.......... -->
									                  </c:when>
									                  <c:otherwise>
									                    <c:out value="${listCount  - idx.count +1}" />
									                  </c:otherwise>
									 
									                </c:choose>
									              </td> 
									 
									              <td>
									              <a href="noticeDetail.do?notice_no=${vo.notice_no}" >${ vo.notice_title }</a>
									              </td>
									              <td><c:out value="${vo.notice_date}"/></td>									              
									              <td><c:out value="${vo.notice_count}"/></td>
									            </tr>
									         </c:forEach> --%>


										<tbody>
									</table>
								</div>
							<nav aria-label="Page navigation example">
								
									<ul class="pagination">
									<!-- if문 -->
									 <c:if test="${curBlock>1}">
										<li class="page-item"><a class="page-link" href="noticeList.do?page=1">처음으로</a></li>
									
									</c:if> 
									
									<!--첫페이지로 이동  -->
									<!--if else문 형식임  -->
								
									 <%-- <c:choose>
										if 
										<c:when test="${currentPage}<=1">
											<li class="page-item"><a class="page-link">처음으로</a></li>									
										</c:when>
										else
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="noticeList.do?page=1">처음으로</a></li>									
										</c:otherwise>
									</c:choose> --%>
									
									
									
									
									<%-- <c:choose>
										<c:when test="${(currentPage-5)<startPage && curentPage-5>1 }">
											<li class="page-item"><a class="page-link" href="noticeList.do?page=${startPage-5}">이전</a></li>
										</c:when>
											
										<c:otherwise>
											<li class="page-item"><a class="page-link">이전</a></li>
										
										</c:otherwise>
									</c:choose>  --%>
									
									 <c:if test="${curBlock>1}">
										<li class="page-item"><a class="page-link" href="noticeList.do?page=${blockBegin-1}">이전</a></li>
									
									</c:if> 
									
									
									
									<!-- 페이지 리스트var="page"   -->
									 <c:forEach var ="page" begin="${blockBegin}" end="${blockEnd}">
									 	
										  <c:choose>
											<c:when test="${page==currentPage}">
												
												 <li class="page-item" class="page-link" ><a class="page-link" style="color:red;">${page}</a></li>
											</c:when> 
										
											<c:otherwise> 
												<%-- <li class="page-item"><a class="page-link" href="noticeList.do?page=${page}">${page}</a></li> --%>	
									
													<li class="page-item"><a class="page-link" href="#" onclick="list('${page}')">${page}</a></li>	
													
											
											 </c:otherwise> 
										
										 </c:choose> 
									
									</c:forEach>  
									
										
									 <%-- <c:choose>
										<c:when test="${(currentPage-5)>endPage && curentPage-5> maxPage }">
											<li class="page-item"><a class="page-link" href="noticeList.do?page=${startPage+5}">다음</a></li>
										</c:when>
											
										<c:otherwise>
											<li class="page-item"><a class="page-link">다음</a></li>
										
										</c:otherwise>
									
									
									</c:choose> --%>
									
									 <c:if test="${curBlock!=totBlock}">
										<li class="page-item"><a class="page-link" href="noticeList.do?page=${blockEnd+1}">다음</a></li>
									
									</c:if> 
									
									
									<!-- 다음페이지 next -->
									<%-- <c:choose>
										if
										<c:when test="${currentPage}>=${maxPage} ">
											<li class="page-item"><a class="page-link">맨끝</a></li>									
										</c:when>
										else
										<c:otherwise>
											<li class="page-item"><a class="page-link" href="noticeList.do?page=${maxPage}">맨끝</a></li>									
										</c:otherwise>
									</c:choose>  --%>
									
									<c:if test="${curBlock!=totBlock}">
										<li class="page-item"><a class="page-link" href="noticeList.do?page=${maxPage}">맨끝</a></li>	
									
									</c:if> 										
										
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- /page content -->


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