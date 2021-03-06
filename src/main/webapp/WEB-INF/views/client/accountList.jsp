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

function searchClient(){
	
	
	client_company=$('#clientCondition').val();
	emp_no=${loginEmp.emp_no};
	job_no=${loginEmp.job_no};
	
	location.href="accountList.do?emp_no="+emp_no+"&job_no="+job_no+"&client_company="+client_company+"&page="+1
	
}

function list(page,word,empno,jobno){

	//alert("empp : " + empno+ " , jobno : " + jobno);
	if(word==""){
		location.href="accountList.do?client_company=null&page="+page+"&emp_no="+empno+"&job_no="+jobno;

	}else{
		location.href="accountList.do?client_company="+word+"&page="+page+"&emp_no="+empno+"&job_no="+jobno;

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
								고객 목록
							</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										거래처
									</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content" style="overflow:auto">
								<div style="text-align:right">
                                     <input id='clientCondition' class="form-control" style="width:130px;display:inline-block;margin-right:3px;" type="text" placeholder="회사명">
                                   <button class="btn btn-dark" style="margin:0 0 3px 0" onclick="searchClient();">검색</button>
                                  </div>
									
									<table id="table_cl" class="table table-striped table-bordered table-responsive" style="min-width:650px;">
										<thead>
											<tr>
												<th width="75">고객명</th>
												<th>회사명</th>
												<th width="70">직 급</th>
												<th>이메일</th>
												<th>연락처</th>
												<th>주 소</th>
											</tr>
										</thead>
										<tbody>
										
										<c:forEach var="list" items="${ accountClientList }">
										
											<tr>
												<td>${ list.client_name }</td>
												<td><a href="detailClient.do?client_no=${list.client_no }" style="font-weight: bold">${ list.client_company }</a></td>
												<td>${ list.client_job }</td>
												<td>${ list.client_email }</td>
												<td>${ list.client_phone }</td>
												<td>${ list.client_addr }</td>
											</tr>
											
										</c:forEach>

										<tbody>
									</table>
								</div>
								
								<nav aria-label="Page navigation example">
								<c:set var="client_company" value="${client_company}"/>
									<ul class="pagination">
									<!-- if문 -->
									<c:if test="${curBlock>1}">
									 	<c:if test="${client_company != null }">
											<li class="page-item"><a class="page-link" href="accountList.do?client_company=${client_company }&page=1&emp_no=${loginEmp.emp_no}&job_no=${loginEmp.job_no}"><<</a></li>
										</c:if>
										<c:if test="${client_company == null }">
											<li class="page-item"><a class="page-link" href="accountList.do?client_company=null&page=1&emp_no=${loginEmp.emp_no}&job_no=${loginEmp.job_no}"><<</a></li>
										</c:if>
									</c:if>  
									
									<!--첫페이지로 이동  -->
									<!--if else문 형식임  -->
								
								
									
									 <c:if test="${curBlock>1}">
										<c:if test="${client_company != null }">
											<li class="page-item"><a class="page-link" href="accountList.do?client_company=${client_company }&page=${blockBegin-1}&emp_no=${loginEmp.emp_no}&job_no=${loginEmp.job_no}">prev</a></li>
										</c:if>
										<c:if test="${client_company == null }">
											<li class="page-item"><a class="page-link" href="accountList.do?client_company=null&page=${blockBegin-1}&emp_no=${loginEmp.emp_no}&job_no=${loginEmp.job_no}">prev</a></li>
										</c:if>
									</c:if> 
									
									
									
									<!-- 페이지 리스트var="page"   -->
									 <c:forEach var ="page" begin="${blockBegin}" end="${blockEnd}">
									 	
										  <c:choose>
											<c:when test="${page==currentPage}">
												 <li class="page-item" class="page-link" ><a class="page-link" style="font-weight: bold">${page}</a></li>
											</c:when> 
										
											<c:otherwise> 
													<li class="page-item"><a class="page-link" href="#" onclick="list('${page}','${ client_company}','${loginEmp.emp_no}','${loginEmp.job_no}')">${page}</a></li>	
											 </c:otherwise> 
										
										 </c:choose> 
									
									</c:forEach>  
									
									
									 <c:if test="${curBlock!=totBlock}">
										 <c:if test="${client_company != null }">
											<li class="page-item"><a class="page-link" href="accountList.do?page=${blockEnd+1}&client_company=${client_company}&emp_no=${loginEmp.emp_no}&job_no=${loginEmp.job_no}">next</a></li>
										 </c:if>
										 <c:if test="${client_company == null }">
											<li class="page-item"><a class="page-link" href="accountList.do?page=${blockEnd+1}&client_company=null&emp_no=${loginEmp.emp_no}&job_no=${loginEmp.job_no}">next</a></li>
										 </c:if>
									</c:if> 
									
									
									<!-- 다음페이지 next -->
									
									
									<c:if test="${curBlock < endPage}">
										<%-- <c:if test="${client_company != null }">										
											<li class="page-item"><a class="page-link" href="accountList.do?page=${maxPage}&client_company=${client_company}&emp_no=${loginEmp.emp_no}&job_no=${loginEmp.job_no}">>></a></li>							
										</c:if> --%>
										<c:if test="${client_company == null }">
											<c:if test="${currentPage != maxPage }">
												<li class="page-item"><a class="page-link" href="accountList.do?page=${maxPage}&client_company=null&emp_no=${loginEmp.emp_no}&job_no=${loginEmp.job_no}">>></a></li>	
											</c:if>
										</c:if>
									</c:if> 										
										
									</ul>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
			




				<c:import url="../etc/footer.jsp"></c:import>
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