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

<style type="text/css">

#table_rm tr:last-child {
   border-bottom: 1px solid #ddd;
}

#getvalues th:nth-child(5), td:nth-child(5) {
   display: none;
}

#table_rec th:nth-child(4){
   display: none;
}
#table_rec td:nth-child(4){
display:none;
}

#table_rec th:nth-child(5){
display: none;
}

#table_rec td:nth-child(5){
display: none;
}
#table_rec th:nth-child(6){
display:none;
}

#table_rec td:nth-child(6){
display:none;
}

#table_sm th:nth-child(4){
display:none;
}

#table_sm td:nth-child(4){
display:none;
}
</style>

<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    $('#table_order').dataTable( {
        ordering:false,
        lengthChange:false,
        paging: false,
        searching: false,
        info: false
    } );

} );


function list(page,word){
	
	if(word==""){
		location.href="orderList.do?client_company=null&page="+page;

	}else{
		location.href="orderList.do?client_company="+word+"&page="+page;

	}
}

function searchCondition(){
	
	client_company=$('#clientCondition').val();
	if(client_company==""){
		 location.href="orderList.do?page=1&client_company=null"
	}else{
	 	location.href="orderList.do?page=1&client_company="+client_company
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
			<%@ include file="../etc/topnav.jsp"%>
			<!-- top navigation -->

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>
								매출현황
							</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										발주 목록
									</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
								<div style="text-align:right">
                                   <input id='clientCondition' class="form-control" style="width:130px;display:inline-block;margin-right:3px;" type="text" placeholder="회사명">
                                   <button class="btn btn-dark" style="margin:0 0 3px 0" onclick="searchCondition();">검색</button>
                                   </div>	
									<table id="table_order" class="table table-striped table-bordered" style="min-width:650px;">
										<thead>
											<tr>
												<th>주문번호</th>
												<th>회사명</th>
												<th>합계</th>
												<th>발주날짜</th>
											</tr>
										</thead>
										<tbody>
										
											
											<c:forEach var="list" items="${orderList }"> 
												<tr>												
													<td>${list.order_no }</td>										
													<td><a href="orderdetail.do?order_no=${list.order_no}" style="font-weight: bold">${list.client_company }</td>
													<td>${list.total }</td>
													<td>${list.order_date }</td>
												</tr>
											</c:forEach>	
											
																
											

										<tbody>
									</table>
								</div>
								<nav aria-label="Page navigation example">
								
									<ul class="pagination">
									<!-- if문 -->
									 <c:if test="${curBlock>1}">
									 	<c:if test="${searchCom != null }">
											<li class="page-item"><a class="page-link" href="orderList.do?client_company=${searchCom}&page=1"><<</a></li>
										</c:if>
										<c:if test="${searchCom == null }">
											<li class="page-item"><a class="page-link" href="orderList.do?client_company=null&page=1"><<</a></li>
										</c:if>
									</c:if> 
									
									<!--첫페이지로 이동  -->
									<!--if else문 형식임  -->
								
									 <c:if test="${curBlock>1}">
										 <c:if test="${searchCom != null }">
											<li class="page-item"><a class="page-link" href="orderList.do?client_company=${searchCom}&page=${blockBegin-1}">prev</a></li>
										</c:if>
										<c:if test="${searchCom == null }">
											<li class="page-item"><a class="page-link" href="orderList.do?client_company=null&page=${blockBegin-1}">prev</a></li>
										</c:if>
									
									</c:if> 
									
									
									
									<!-- 페이지 리스트var="page"   -->
									 <c:forEach var ="page" begin="${blockBegin}" end="${blockEnd}">
									 	
										  <c:choose>
											<c:when test="${page==currentPage}">
												<li class="page-item" class="page-link" ><a class="page-link" style="font-weight: bold">${page}</a></li>
											</c:when> 
										
											<c:otherwise> 
												<li class="page-item"><a class="page-link" href="#" onclick="list('${page}','${ searchCom}')"  >${page}</a></li>	
											</c:otherwise> 
										
										  </c:choose> 
									
									</c:forEach>  
									
								
									
									 <c:if test="${curBlock!=totBlock}">
									 <c:if test="${searchCom != null }">
										<li class="page-item"><a class="page-link" href="orderList.do?client_company=${searchCom}&page=${blockEnd+1}">next</a></li>
									 </c:if>
									 <c:if test="${searchCom == null }">
										<li class="page-item"><a class="page-link" href="orderList.do?client_company=null&page=${blockEnd+1}">next</a></li>
									 </c:if>	
									 </c:if> 
									
									
									<!-- 다음페이지 next -->
									
									<c:if test="${curBlock < endPage}">
										<c:if test="${searchCom == null }">
											<c:if test="${currentPage != maxPage}">
											<li class="page-item"><a class="page-link" href="orderList.do?client_company=null&page=${maxPage}">>></a></li>
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
			<!-- footer content -->
			<%@ include file="../etc/footer.jsp"%>
			<!-- /footer content -->
		</div>
	</div>

	<!-- /page content -->


	<!-- jQuery -->
	<script src="resources/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	
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