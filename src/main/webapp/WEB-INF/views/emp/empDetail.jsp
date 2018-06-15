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
    $('#table_cl').dataTable( {
        ordering:false,
        lengthChange:false,
        pageLength:15
    } );
} );

$(function(){
	$.ajax({
		url : "mgrName.do",
		type: "post",
		dataType: "json",
		data: {
			emp_mgr : $('#emp_mgr').val()
		},
		success:function(obj){
			var objStr = JSON.stringify(obj);
			var jsonl = JSON.parse(objStr);
			
			var emp_mgar_name = jsonl.emp_name
			
			console.log("jsonl.emp_name : " + jsonl.emp_name);
			console.log("emp_mgar_name : " + emp_mgar_name);
			
			
			
			$('#style1_mgr').html('<input type="text" class="form-control" id="emp_mgr" name="emp_mgr" value="emp_mgar_name" readonly>');
			},
			error: function(){
				console.log("상사이름 가져오기 에러");
				$('#style1_mgr').html('<input type="text" class="form-control" id="emp_mgr" name="emp_mgr" value="" readonly>');
			}
		});
});

function empUp(){
	location.href="moveEmpUpdate.do?emp_no="+""+${ emp.emp_no }+"";
}

function empDe(){
	if(confirm("해당 사원을 삭제하시겠습니까?")==true) {
	location.href="updateEmpDelete.do?emp_no="+""+${ emp.emp_no }+"";
	alert("사원이 삭제 되었습니다.");
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
						<a href="main.html" class="site_title"><i class="fa fa-google"></i>
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
									<font style="font-size:18px;">상세정보</font>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
								
								
					<!-- 사원 상세폼 -->
					<form class="form-horizontal form-label-left">
					<div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">사원번호</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="emp_no" name="emp_no" type="text" value="${ emp.emp_no }" readonly>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">이름 </label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="emp_name" name="emp_name" type="text" value="${ emp.emp_name }" readonly>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">주소</label>
                        <div class="col-md-6 col-sm-6 col-xs-12" id="style1">
                          <input class="form-control" id="emp_addr" name="emp_addr" type="text" value="${ emp.emp_addr }" readonly>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">연락처</label>
                        <div class="col-md-6 col-sm-6 col-xs-12" id="style1">
                          <input class="form-control" id="emp_phone" name="emp_phone" type="tel" value="${ emp.emp_phone }" readonly>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">직급</label>
                        <div class="col-md-6 col-sm-6 col-xs-12" id="style1">
                         <c:choose>
            				<c:when test="${ emp.job_no == 1 }">
            					<select class="form-control" id="job_no" name="job_no" disabled>
                           	 		<option value="1" selected>사원</option>
                            		<option value="2">팀장</option>
                            		<option value="3">관리자</option>                         
                          		</select>		        		   
            				</c:when>
            				<c:when test="${ emp.job_no == 2 }">
            					<select class="form-control" id="job_no" name="job_no" disabled>
                           	 		<option value="1">사원</option>
                            		<option value="2" selected>팀장</option>
                            		<option value="3">관리자</option>                         
                          		</select>		        		   
            				</c:when>
            				<c:when test="${ emp.job_no == 3 }">
            					<select class="form-control" id="job_no" name="job_no" disabled>
                           	 		<option value="1">사원</option>
                            		<option value="2">팀장</option>
                            		<option value="3" selected>관리자</option>                         
                          		</select>					
            				</c:when>
            			</c:choose>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">이메일</label>
                        <div class="col-md-6 col-sm-6 col-xs-12" id="style1">
                          <input class="form-control" id="emp_email" name="emp_email" type="email" value="${ emp.emp_email }" readonly>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">상사</label>
                        <div class="col-md-6 col-sm-6 col-xs-12" id="style1_mgr">
                         <input type="hidden" id="emp_mgr" name="emp_mgr" value="${ emp.emp_mgr }">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">입사일</label>
                        <div class="col-md-6 col-sm-6 col-xs-12" id="style1">
                         <input class="form-control" id="emp_hiredate" name="emp_hiredate" type="date" value="${ emp.emp_hiredate }" readonly>
                        </div>
                      </div>
                      <%-- <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">퇴사일</label>
                        <div class="col-md-6 col-sm-6 col-xs-12" id="style1">
                         <input class="form-control" id="emp_firedate" name="emp_firedate" type="date" value="${ emp.emp_firedate }" readonly>
                        </div>
                      </div> --%>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">담당지역</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="city" name="city" type="text" value="${ emp.city }" readonly>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="county" name="county" type="text" value="${ emp.county }" readonly>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="village" name="village" type="text" value="${ emp.village }" readonly>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">부서</label>
                        <div class="col-md-6 col-sm-6 col-xs-12" id="style1">
                        <c:choose>
            				<c:when test="${ emp.dept_no == 1 }">
            					<select class="form-control" id="dept_no" name="dept_no" disabled>
                           			<option value="1" selected>영업1팀</option>
                            		<option value="2">영업2팀</option>
                            		<option value="3">관리자</option>                       
                          		</select>		        		   
            				</c:when>
            				<c:when test="${ emp.dept_no == 2 }">
            					<select class="form-control" id="dept_no" name="dept_no" disabled>
                           	 		<option value="1">영업1팀</option>
                            		<option value="2" selected>영업2팀</option>
                            		<option value="3">관리자</option>                         
                          		</select>		        		   
            				</c:when>
            				<c:when test="${ emp.dept_no == 3 }">
            					<select class="form-control" id="dept_no" name="dept_no" disabled>
                           	 		<option value="1">영업1팀</option>
                            		<option value="2">영업2팀</option>
                            		<option value="3" selected>관리자</option>                         
                          		</select>					
            				</c:when>
            			</c:choose>
                        </div>
                      </div>
                      </form>
                             
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                          <button class="btn btn-success" type="button" onclick="empUp()">정보수정</button>                    
                          <button class="btn btn-primary" type="button" onclick="empDe()">사원삭제</button>                     
                        </div>
                      </div>
                  </div>
                </div>
              </div>									
									
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