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
				<!-- top tiles -->
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>목표 현황</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<br />
					
					
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>상세검색</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<div class="col-md-6 col-sm-12 col-xs-12">
									<form class="form-horizontal form-label-left">
										<div class="form-group">
											<div class="col-sm-3">
											<select class="form-control" id="sales_select">
												<option>전체</option>
												<option>팀별</option>
												<option>사원별</option>
											</select>
											</div>
											<div class="col-sm-9">
												<div class="input-group">
													<input type="text" class="form-control"> <span
														class="input-group-btn">
														<button type="submit" class="btn btn-primary">검색</button>
													</span>
												</div>
											</div>
										</div>
									</form>
									</div>
								</div>
							</div>
						</div>

					</div><!-- end row -->
					
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="dashboard_graph">

									<div class="row x_title">
										<div class="col-md-6">
											<h3>
												Network Activities <small>Graph title sub-title</small>
											</h3>
										</div>
										<div class="col-md-6">
											<div id="reportrange" class="pull-right"
												style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
												<i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
												<span>December 30, 2014 - January 28, 2015</span> <b
													class="caret"></b>
											</div>
										</div>
									</div>

									<div class="col-md-9 col-sm-9 col-xs-12">
										<div id="chart_plot_01" class="demo-placeholder"></div>
									</div>
									<div class="col-md-3 col-sm-3 col-xs-12 bg-white">
										<div class="x_title">
											<h2>Top Campaign Performance</h2>
											<div class="clearfix"></div>
										</div>

										<div class="col-md-12 col-sm-12 col-xs-6">
											<div>
												<p>Facebook Campaign</p>
												<div class="">
													<div class="progress progress_sm" style="width: 76%;">
														<div class="progress-bar bg-green" role="progressbar"
															data-transitiongoal="80"></div>
													</div>
												</div>
											</div>
											<div>
												<p>Twitter Campaign</p>
												<div class="">
													<div class="progress progress_sm" style="width: 76%;">
														<div class="progress-bar bg-green" role="progressbar"
															data-transitiongoal="60"></div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-12 col-sm-12 col-xs-6">
											<div>
												<p>Conventional Media</p>
												<div class="">
													<div class="progress progress_sm" style="width: 76%;">
														<div class="progress-bar bg-green" role="progressbar"
															data-transitiongoal="40"></div>
													</div>
												</div>
											</div>
											<div>
												<p>Bill boards</p>
												<div class="">
													<div class="progress progress_sm" style="width: 76%;">
														<div class="progress-bar bg-green" role="progressbar"
															data-transitiongoal="50"></div>
													</div>
												</div>
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>

					</div>

					<div class="row" style="vertical-align: middle;">
						<div class="col-xs-12">
							<div class="x_panel">
								<table id="table_cl" class="table table-striped table-bordered"
									style="min-width: 500px;">
									<tr>
										<td>&nbsp;</td>
										<td>목표</td>
										<td>매출</td>
										<td>달성</td>
									</tr>
									<tr>
										<td>년 매출</td>
										<td>240,000</td>
										<td>180,000</td>
										<td>80%</td>
									</tr>
									<tr>
										<td>1월</td>
										<td>12,000</td>
										<td>80,000</td>
										<td>80%</td>
									</tr>
									<tr>
										<td>2월</td>
										<td>12,000</td>
										<td>80,000</td>
										<td>80%</td>
									</tr>
									<tr>
										<td>3월</td>
										<td>12,000</td>
										<td>80,000</td>
										<td>80%</td>
									</tr>
									<tr>
										<td>4월</td>
										<td>12,000</td>
										<td>80,000</td>
										<td>80%</td>
									</tr>
									<tr>
										<td>5월</td>
										<td>12,000</td>
										<td>80,000</td>
										<td>80%</td>
									</tr>
									<tr>
										<td>6월</td>
										<td>12,000</td>
										<td>80,000</td>
										<td>80%</td>
									</tr>
									<tr>
										<td>7월</td>
										<td>12,000</td>
										<td>90,000</td>
										<td>80%</td>
									</tr>
									<tr>
										<td>8월</td>
										<td>12,000</td>
										<td>90,000</td>
										<td>85.0%</td>
									</tr>
									<tr>
										<td>9월</td>
										<td>13,000</td>
										<td>90,000</td>
										<td>89.4%</td>
									</tr>
									<tr>
										<td>10월</td>
										<td>13,000</td>
										<td>90,000</td>
										<td>90%</td>
									</tr>
									<tr>
										<td>11월</td>
										<td>13,000</td>
										<td>90,000</td>
										<td>70%</td>
									</tr>
									<tr>
										<td>12월</td>
										<td>13,000</td>
										<td>90,000</td>
										<td>78%</td>
									</tr>
								</table>
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
	<!-- Chart.js -->
	
	<!-- gauge.js -->
	<script src="resources/vendors/gauge.js/dist/gauge.min.js"></script>
	<!-- bootstrap-progressbar -->
	<script
		src="resources/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<!-- iCheck -->
	<script src="resources/vendors/iCheck/icheck.min.js"></script>
	<!-- Skycons -->
	<script src="resources/vendors/skycons/skycons.js"></script>
	<!-- Flot -->
	<script src="resources/vendors/Flot/jquery.flot.js"></script>
	<script src="resources/vendors/Flot/jquery.flot.pie.js"></script>
	<script src="resources/vendors/Flot/jquery.flot.time.js"></script>
	<script src="resources/vendors/Flot/jquery.flot.stack.js"></script>
	<script src="resources/vendors/Flot/jquery.flot.resize.js"></script>
	<!-- Flot plugins -->
	<script
		src="resources/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
	<script
		src="resources/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
	<script src="resources/vendors/flot.curvedlines/curvedLines.js"></script>
	<!-- DateJS -->
	<script src="resources/vendors/DateJS/build/date.js"></script>
	<!-- JQVMap -->
	<script src="resources/vendors/jqvmap/dist/jquery.vmap.js"></script>
	<script src="resources/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
	<script
		src="resources/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
	<!-- bootstrap-daterangepicker -->
	

	<!-- Custom Theme Scripts -->
	<script src="resources/build/js/custom.min.js"></script>

</body>
</html>