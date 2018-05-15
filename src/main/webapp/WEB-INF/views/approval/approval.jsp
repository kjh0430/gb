<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		
	});
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
					<%@ include file="../etc/adminsidebar.jsp"%>
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
							<h3>전자 결재</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>신청</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<form id="demo-form2" data-parsley-validate
										class="form-horizontal form-label-left">

										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="first-name">일자 <span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="date" required="required" name="startDate"
													class="form-date col-md-5 col-xs-12">
												<input type="date" required="required" name="endDate"
													class="form-date col-md-5 col-xs-12">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="last-name">사유 <span class="required">*</span>
											</label> 
											<div class="col-md-2 col-sm-4 col-xs-12">
												<select class="form-control">
													<option>1</option>
													<option>2</option>
													<option>3</option>
													<option>4</option>
													<option>5</option>
												</select>
											</div>
										</div>
										<div class="form-group">
											<label for="middle-name"
												class="control-label col-md-3 col-sm-3 col-xs-12">결재자 1 <span class="required">*</span></label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<div class="input-group" style="margin-bottom:0px;">
													<input type="text" class="form-control"> <span
														class="input-group-btn">
														<button type="button" class="btn btn-default" data-toggle="modal" data-target=".ap1-modal-lg"><i class="fa fa-search"></i></button>
													</span>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label for="middle-name"
												class="control-label col-md-3 col-sm-3 col-xs-12">결재자 2 <span class="required">*</span></label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<div class="input-group" style="margin-bottom:0px;">
													<input type="text" class="form-control"> <span
														class="input-group-btn">
														<button type="button" class="btn btn-default" data-toggle="modal" data-target=".ap1-modal-lg"><i class="fa fa-search"></i></button>
													</span>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">비고
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<textarea rows="3" class="form-control col-md-7 col-xs-12"></textarea>
											</div>
										</div>
										<div class="ln_solid"></div>
										<div class="form-group">
											<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
												<button class="btn btn-danger" type="reset">Reset</button>
												<button type="submit" class="btn btn-primary">Submit</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 결재자 modal start -->

	<div class="modal fade ap1-modal-lg" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">×</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">결재자 선택1</h4>
				</div>
				<div class="modal-body">
					
					<form class="form-horizontal form-label-left input_mask">
						<div class="form-group">
							<div class="row">
							<label class="col-sm-2 control-label">사원명</label>
								<div class="col-sm-10">	
									<div class="input-group">
										<input type="text" class="form-control"> <span class="input-group-btn">
											<button type="button" class="btn btn-primary">
												<i class="fa fa-search"></i>
											</button>
										</span>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<table id="ap_emp1" class="table table-striped table-bordered ap_emp">
								<tr>
									<th>사원번호</th>
									<th>사원명</th>
									<th>소속팀</th>
									<th>직급</th>
									<th>선택</th>
								</tr>
								<tr>
									<td>04</td>
									<td>채치수</td>
									<td>영업 1팀</td>
									<td>팀장</td>
									<td><input type="button" class="btn btn-dark btn-input" value="선택"/></td>
								</tr>
								<tr>
									<td>15</td>
									<td>채치수</td>
									<td>영업 1팀</td>
									<td>팀장</td>
									<td><input type="button" class="btn btn-dark btn-input" value="선택"/></td>
								</tr>
							
							</table>
						</div>
					</form>
					
				</div>
			</div>
		</div>
	</div>
	<!-- client modal end -->

	<!-- /page content -->




	<!-- jQuery -->
	<script src="resources/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="resources/build/js/custom.min.js"></script>

</body>
</html>