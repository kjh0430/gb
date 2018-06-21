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

<style type="text/css">
#mgrTable{
text-align:center;
}
</style>

</head>

<body class="nav-md">
<c:if test="${empty loginEmp}">
</c:if>
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
							<h3>급여관리</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>급여정보입력</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">									
									
					<!-- 급여 등록 -->
					<form class="form-horizontal form-label-left">
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">이름</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="emp_name" name="emp_name" type="text" 
                          value="${ emp.emp_name }" readonly>
                        </div>
                      </div>
                                          
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">부서명</label>
                        
                        <c:choose>
            				<c:when test="${ emp.dept_no == 1 }">
            					<div class="col-md-6 col-sm-6 col-xs-12">
		                         <input class="form-control" id="emp_phone" name="dept_name" type="text"
		                         value="영업1팀" readonly>
		                        </div>	        		   
            				</c:when>
            				<c:when test="${ emp.dept_no == 2 }">
            					<div class="col-md-6 col-sm-6 col-xs-12">
		                         <input class="form-control" id="emp_phone" name="dept_name" type="text"
		                         value="영업2팀" readonly>
		                        </div>		        		   
            				</c:when>
            				<c:when test="${ emp.dept_no == 3 }">
            					<div class="col-md-6 col-sm-6 col-xs-12">
		                         <input class="form-control" id="emp_phone" name="dept_name" type="text"
		                         value="관리자" readonly>
		                        </div>				
            				</c:when>
            			</c:choose>
                        
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">직급</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          
                        <c:choose>
            				<c:when test="${ emp.job_no == 1 }">
            					<input class="form-control" id="job_no" type="text" name="job_no"
                         		 value="사원" readonly>		        		   
            				</c:when>
            				<c:when test="${ emp.job_no == 2 }">
            					<input class="form-control" id="job_no" type="text" name="job_no"
                          		value="팀장" readonly>		        		   
            				</c:when>
            				<c:when test="${ emp.job_no == 3 }">
            					<input class="form-control" id="job_no" type="text" name="job_no"
                          		value="관리자" readonly>				
            				</c:when>
            			</c:choose>
                          
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">기본급</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="sal" type="text" name="sal" >
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">인센티브</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="sal_bonus" type="text" name="sal_bonus" >
                        </div>
                      </div>
                      
                             
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
								<button class="btn btn-success" type="submit">등록</button>
						</div>
					  </div>
					 </form> 
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../etc/footer.jsp" %>
	</div>	
	
	<!-- /page content -->

	</div>

	<!-- jQuery -->
	<script src="resources/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>	

	<!-- Custom Theme Scripts -->
	<script src="resources/build/js/custom.min.js"></script>

</body>
</html>