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

} );

</script>
<script type="text/javascript">
	$(function(){
		$('#edit_add').click(function(){
			alert('수정합니다.');
			
		});
	});

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
			<%@ include file="../etc/topnav.jsp"%>
			<!-- top navigation -->

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>
								목표관리설정
							</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										목표상세설정
									</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<br />
									<form id="demo-form2" data-parsley-validate
										class="form-horizontal form-label-left" action="noticeEditUpdate.do">
											
										
										
										
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="first-name">사원명
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" id="first-name" required="required"
													class="form-control col-md-7 col-xs-12" name ="notice_title" value="${detailNotice.notice_title}">
											</div>
										</div>
										
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="first-name">총실적
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" id="first-name" required="required"
													class="form-control col-md-7 col-xs-12" name ="notice_title" value="${detailNotice.notice_title}">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="first-name">월별실적
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" id="first-name" required="required"
													class="form-control col-md-7 col-xs-12" name ="notice_title" value="${detailNotice.notice_title}">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="first-name">목표금액 설정
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" id="first-name" required="required"
													class="form-control col-md-7 col-xs-12" name ="notice_title" value="${detailNotice.notice_title}">
											</div>
										</div>
										
										
										<div class="ln_solid"></div>
										<div class="form-group">
											<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
												<button  id="edit_add"type="submit" class="btn btn-success">수정</button>
											</div>
											
										</div>

									</form>
								</div>
							</div>
						</div>
					</div>
						<!-- row -->
					</div>
				</div>
				<%@ include file="../etc/footer.jsp"%>
		</div>
	</div>

	<!-- /page content -->


	<!-- jQuery -->
	<script src="resources/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	
	<!-- Custom Theme Scripts -->
	<script src="resources/build/js/custom.min.js"></script>

</body>
</html>