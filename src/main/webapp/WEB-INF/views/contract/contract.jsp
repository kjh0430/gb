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
	
</script>
<style type="text/css">
	.table > tbody > tr > td{
		vertical-align:middle;
	}
	.btn-order{
		padding:3px 6px;
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
					<%@ include file="../etc/sidebar.jsp"%>
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
							<h3>계약</h3>
						</div>
					</div>
					<div class="clearfix"></div>
					<!-- map start -->
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							

						</div>
					</div>
					<div class="clearfix"></div>
					<br>
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>거래처</h2>
									<!-- client modal start -->
									<div style="text-align:right">
									<button type="button" class="btn btn-primary"data-toggle="modal" data-target=".cl-example-modal-lg">거래처선택</button>
									</div>
									<div class="modal fade cl-example-modal-lg" tabindex="-1"
										role="dialog" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">

												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal">
														<span aria-hidden="true">×</span>
													</button>
													<h4 class="modal-title" id="myModalLabel">거래처</h4>
												</div>
												<div class="modal-body">
													
													<form class="form-horizontal form-label-left input_mask">
														<div class="form-group">
															<div class="row">
															<label class="col-sm-2 control-label">거래처명</label>
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
															<table id="table_items" class="table table-striped table-bordered">
																<tr>
																	<th>사업자 등록 번호</th>
																	<th>거래처명</th>
																	<th>전화번호</th>
																	<th>주소</th>
																</tr>
																<tr>
																	<td><a href="#">11548-9865-695</a></td>
																	<td>프로젝트 413</td>
																	<td>070-4587-8569</td>
																	<td>서울특별시 강남구 역삼1동 논현로97길 19-11</td>
																</tr>
																<tr>
																	<td><a href="#">11548-9865-695</a></td>
																	<td>프로젝트 413</td>
																	<td>070-4587-8569</td>
																	<td>서울특별시 강남구 역삼1동 논현로97길 19-11</td>
																</tr>
																<tr>
																	<td><a href="#">11548-9865-695</a></td>
																	<td>프로젝트 413</td>
																	<td>070-4587-8569</td>
																	<td>서울특별시 강남구 역삼1동 논현로97길 19-11</td>
																</tr>															
															</table>
														</div>
													</form>
													
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default"
														data-dismiss="modal">Close</button>
													<button type="button" class="btn btn-primary">Save
														changes</button>
												</div>

											</div>
										</div>
									</div>
									<!-- client modal end -->
								</div>
								<div class="x_content">																	
									<form class="form-horizontal form-label-left input_mask">
										<div class="form-group">
											<label class="col-sm-3 control-label">거래처명</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input type="text" class="form-control" placeholder="" value="거래처 이름">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">담당자</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input type="text" class="form-control" placeholder="" value="담당자 이름">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">전화번호</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input type="text" class="form-control" placeholder="" value="전화번호 이름">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">주소</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input type="text" class="form-control" placeholder="" value="주소">
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div><!-- row -->
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										계약내용
									</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<form class="form-horizontal form-label-left input_mask">
										<div class="form-group">
											<label class="col-sm-3 control-label">계약금액</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input type="text" class="form-control" placeholder="" value="최소 500,000">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">할인율</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input type="text" class="form-control" placeholder="" value="기본 10%">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">계약 시작일</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input type="date" class="form-control" placeholder="">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">계약 종료일</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input type="date" class="form-control" placeholder="">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">사업자등록번호</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input type="text" class="form-control" placeholder="" value="사업자 등록 번호">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">첨부파일</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input type="file"/>
											</div>
										</div>
									</form>
									
									
									<div class="ln_solid"></div>
									<div class="col-md-12 col-sm-12 col-xs-12 col-md-offset-3" style="margin:0px">
											<button type="button" class="btn btn-primary">Cancel</button>
											<button class="btn btn-primary" type="reset">Reset</button>
											<button type="submit" class="btn btn-success">Submit</button>
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


	<!-- Custom Theme Scripts -->
	<script src="resources/build/js/custom.min.js"></script>
	

</body>
</html>