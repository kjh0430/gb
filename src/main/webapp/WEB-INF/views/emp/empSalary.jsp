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

<!-- 급여명세서 -->
<script type="text/javascript">

		function clickNames(empNo) {
			
			$.ajax({
				url: "empSalaryDetail.do",
				type: "post",
				data: {
					emp_no : empNo
				},
				dataType: "json",
				success: function(data) {
					var sal = (data.sal).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					var bonus = (data.bonus).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					var total = (data.toSal).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
					
					$('#emp_name').val(decodeURIComponent(data.name));
					$('#dept_name').val(decodeURIComponent(data.dept));
					$('#job_name').val(decodeURIComponent(data.job));
					$('#sal').val(sal+'원');
					$('#sal_bonus').val(bonus+'원');
					$('#toSal').val(total+'원');
				}
				
			});	//ajax
		}

</script>

<script type="text/javascript">
	$('#searchSalaryList').keyup(function() {
		$.ajax({
			url: "searchSalaryList.do",
			type: "post",
			dataType: "json",
			data: {
				emp_name: $('#searchSalaryList').val()
			},
			success: function(data) {
				var obj = JSON.stringify(data);
				var json = JSON.parse(obj);
				
			}
			
		});
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
								급여정보
							</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										사원목록
									</h2>
									
										<form onsubmit="return false;">
											<input style="float:right;"
												type="text" id="searchSalaryList">
												<font style="float:right" id="salSearch">Search</font>
										</form>
									
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									
									<table id="table_cl" class="table table-striped table-bordered" style="min-width:650px;">
										<thead>
											<tr>
												<th>사원명</th>
												<th>부서명</th>
												<th>연락처</th>
												<th>기본급</th>
												<th>급여일</th>
												<th>입사일</th>
											</tr>
										</thead>
										<tbody>
										
										<c:forEach items="${ salaryList }" var="list">
											<tr>
												<td>
												<a onclick="clickNames('${ list.emp.emp_no }')"
													class="showSalary"
													id="showSalary" 
													style="cursor:pointer;" 
													data-toggle="modal" 
													data-target="#myModal">
													${ list.emp.emp_name }</a></td>
													
												<td>${ list.dept.dept_name }</td>
												<td>${ list.emp.emp_phone }</td>
												<td>${ list.sal }</td>
												<td>${ list.sal_date }</td>
												<td>${ list.emp.emp_hiredate }</td>
											</tr>	
										</c:forEach>
										
										</tbody>
									</table>
								</div>
								
								<!-- 페이징 처리 -->
								<div style="text-align:center;">
									<c:forEach var="i" begin="${ start }" end="${ end }" varStatus="num">
										<a id="listNumber${ num.index }" href="empSalary.do?startPage=${ i }&emp_name=">[${ i }]</a>
									</c:forEach>
								</div>
								
							</div>
						</div>
					</div>
				</div>
			</div>
			
			<!-- 모달의 시작 -->
				<!-- Modal -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header" style="text-align:center;">
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
				        <h4 class="modal-title" id="myModalLabel">급여정보</h4>
				        
				      </div><!-- modal heder end div -->	
				      
				      <div class="modal-body" style="text-align:center;">
							<div class="form-group">
								<span>성명</span>
								<span>
									<input type="text" id="emp_name" readonly>
								</span>
							</div>				 	     
							<div class="form-group">
								<span>부서</span>
								<span>
									<input type="text" id="dept_name" readonly>
								</span>
							</div>				 	     
							<div class="form-group">
								<span>직책</span>
								<span>
									<input type="text" id="job_name" readonly>
								</span>
							</div>				 	     
							<div class="form-group">
								<span>기본급</span>
								<span>
									<input type="text" id="sal" readonly>
								</span>
							</div>				 	     
							<div class="form-group">
								<span>인센티브</span>
								<span>
									<input type="text" id="sal_bonus" readonly>
								</span>
							</div>				 	     
							<div class="form-group">
								<span>총지급액</span>
								<span>
									<input type="text" id="toSal" readonly>
								</span>
							</div>				 	     
									 	     
				      </div>
				      
				      <div class="modal-footer">
				        <button id="" type="submit" class="btn btn-primary" data-dismiss="modal">확인</button>
				      </div>
				    </div>
				  </div>
				</div>
				<!-- 모달의 끝 -->
			
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