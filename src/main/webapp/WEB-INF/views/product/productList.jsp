<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="images/favicon.ico" type="image/ico" />

<title>GROUP BEAN |</title>

<!-- jquery	 -->
<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<!-- Bootstrap -->
<link href="resources/vendors/bootstrap/dist/css/bootstrap.min.css"	rel="stylesheet">
<!-- Font Awesome -->
<link href="resources/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">

<!-- iCheck -->
<link href="resources/vendors/iCheck/skins/flat/green.css" rel="stylesheet">

<!-- Custom Theme Style -->
<link href="resources/build/css/custom.min.css" rel="stylesheet">
<link href="resources/css/main.css" rel="stylesheet">

<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
 $(document).ready(function() {
$('#table_pl').dataTable({
			ordering : false,
			lengthChange : false,
			paging : false,
			searching : false,
			info : false
	});
});
 
////버튼 클릭시
/* $(function(){
	$("#button1").click(function(){
			alert("제발 좀 되라");
			$.ajax({
						 url: "searchProduct2.do",
						 type: "post",
						 data: {
							 product_name: $('#keykey').val()
						 },
						 dataType: "json",
						 success: function(data){
							var obj = JSON.stringify(data);
							var json = JSON.parse(obj);
							var list = "";
							for(var i in json.list){
								list += 
								"<tr>"+
									"<td>"+${json.list.product_no}+"</td>"+
									"<td><a href=moveproductDetail.do?data="+${json.list.product_no}+">"+${json.list.decodeURIComponent(product_name)}+"</a></td>"+
									"<td>"+${json.list.product_price}+"</td>"+
									"<td>"+${json.list.decodeURIComponent(product_availability)}+"</td>"+
								"</tr>";
								console.log(list);
							}
							$('body tbody').html(list);
						 }
					 });
				});
}); */
	
</script>

<script type="text/javascript">
//제픔 검색시 ajax or form
function searchItem2() {
	
		 $.ajax({
		 url: "searchProduct2.do",
		 type: "post",
		 data: {
			 product_name: $('#keykey').val()
		 },
		 dataType: "json",
		 success: function(data){
			 var obj = JSON.stringify(data);
			 var json = JSON.parse(obj);
			 var list = "";
			 for(var i in json.list){
				 list += 
						"<tr>"+
							"<td>"+json.list[i].product_no+"</td>"+
							"<td><a href=moveproductDetail.do?data="+json.list[i].product_no+">"+decodeURIComponent(json.list[i].product_name)+"</a></td>"+
							"<td>"+json.list[i].product_price+"</td>"+
							"<td>"+decodeURIComponent(json.list[i].product_availability)+"</td>"+
						"</tr>";
			 }
				 $('body tbody').html(list);
			 
		 }
	 });
}
</script>

</head>


<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a href="mainView.do" class="site_title"><i
							class="fa fa-google"></i> <span>GROUP BEAN</span></a>
					</div>

					<div class="clearfix"></div>

					<c:choose>
						<c:when test="${ loginEmp.job_no == 3}">
							<!-- sidebar menu -->
							<%@ include file="../etc/adminsidebar.jsp"%>
							<!-- /sidebar menu -->
						</c:when>
						<c:when test="${ loginEmp.job_no == 2}">
							<%@ include file="../etc/adminsidebar.jsp"%>

						</c:when>
						<c:otherwise>
							<!-- sidebar menu -->
							<%@ include file="../etc/sidebar.jsp"%>
							<!-- /sidebar menu -->
						</c:otherwise>
					</c:choose>

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
							<h3>제품목록</h3>
						</div>
						<c:if test="${ loginEmp.job_no == 3}">
						<div class="title_right" style="text-align:right">
							<button class="btn btn-primary"
								onclick="location.href='moveProductInsert.do'">제품등록</button>
							<div class="clearfix"></div>
						</div>
						</c:if>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								
								<div class="x_title" style="text-align: right">
									<form onsubmit="return false;">
										<div style="text-align: right">
											<input class="form-control"
												style="width: 130px; display: inline-block; margin-right: 3px;"
												type="text" placeholder="제품명 검색" id="keykey">
											<button id="button1" class="btn btn-dark"
												style="margin: 0 0 3px 0" onclick="searchItem2();">검색</button>
										</div>
									</form>
								</div>
								
								<!-- 검색 바 -->
								<!-- <form action="searchProduct.do" onsubmit ="return searchItem();"> -->
								
								<!-- <form onsubmit="return false;">
									<input id="keykey" class="form-control" style="float:right" "width:130px;display:inline-block;margin-right:3px;" type="text" name="keyword" placeholder="제품명으로 검색합니다."/>
									<input type ="button" id="button1" value="검색" />
									<button id="button1" class="btn btn-dark" style="float:right" "margin:0 0 3px 0" onclick="searchItem2();">검색</button>
									onclick="javascript:searchItem2()"
								</form> -->
							<!-- 	</form> -->
								<!-- 검색 바 종료 -->
								<div class="x_content">

									<table id="table_pl"
										class="table table-striped table-bordered table-responsive"
										style="min-width: 550px;">
										<thead>
											<tr>
												<th>제품번호</th>
												<th>제품명</th>
												<th>제품가격</th>
												<th>판매여부</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${pageList}" var="li">
												<tr>
													<td>${li.product_no}</td>
													<td><a style="font-weight:bold" href=moveproductDetail.do?data=${li.product_no}>${li.product_name}</a></td>
													<td>${li.product_price}</td>
													<td>${li.product_availability}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>

								<!-- <ul class='pagination'> -->



								<%--  <c:set var="startPage" value="${startPage}"/>
	        <c:choose>
	        <c:when test="${startPage>5}">
	          <li class='page-item'><a class='page-link' href='productListE.do?page=${startPage-1}'>PREV</a></li>
	        </c:when>
	        <c:otherwise>
	        <li class='page-item'><a class='page-link'>prev</a></li>
	        </c:otherwise>
	        </c:choose> 
	       
	        <c:forEach var="paging" begin="${startPage}" end="${endPage}">
	        <c:choose>
	        <c:when test="${paging==currentPage}">
	        <li class='page-item'><a style='color:black;' class='page-link'>${paging}</a></li>
	        </c:when>
	        <c:otherwise>
	        <li class='page-item'><a class='page-link' href='productListE.do?page=${paging}'>${paging}</a></li>
	        </c:otherwise>
	        </c:choose>
	        </c:forEach>
	        <c:set var="endPage" value="${endPage}"/>
	        <c:set var="maxPage" value="${maxPage}"/>
	        <c:choose>
	        <c:when test="${endPage<maxPage}">
	        <li class='page-item'><a class='page-link' href='productListE.do?page=${endPage+1}'>next</a></li>
	        </c:when>
	        <c:otherwise>
	        <li class='page-item'><a class='page-link'>next</a></li>
	        </c:otherwise>
	        </c:choose>
	        </ul> --%>

								<div style="text-align: center;">
									<c:forEach var="i" begin="${ startPage }" end="${ endPage }">
										<a id="listNumber" href="productListE2.do?startPage=${ i }">${ i }</a>
									</c:forEach>
								</div>

							
						</div>
					</div>
				</div>
			</div>
		</div>
		
			<%@ include file="../etc/footer.jsp"%>
	</div>
	<!-- /page content -->

	</div>


	<!-- jQuery -->
	<script src="resources/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>

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


	<!-- Custom Theme Scripts -->
	<script src="resources/build/js/custom.min.js"></script>

</body>
</html>