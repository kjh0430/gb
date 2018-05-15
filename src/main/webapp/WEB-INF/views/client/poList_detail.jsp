<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="images/favicon.ico" type="image/ico" />

<title>잠재고객 상세페이지</title>

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
							<h3>
								잠재고객
							</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>상세정보</h2>
									
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
                   					 <br />
									<form id="demo-form2" data-parsley-validate
										class="form-horizontal form-label-left">

										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="first-name">고객번호
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" id="first-name" required="required"
													class="form-control col-md-7 col-xs-12" value="154" readonly>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="first-name">고객명
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" id="first-name" required="required"
													class="form-control col-md-7 col-xs-12" value="잉어킹" >
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="last-name">담당자명 
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" id="last-name" name="last-name"
													required="required" class="form-control col-md-7 col-xs-12" value="정대만" >
											</div>
										</div>
										<div class="form-group">
											<label for="middle-name"
												class="control-label col-md-3 col-sm-3 col-xs-12">
												직책
												</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input id="middle-name"
													class="form-control col-md-7 col-xs-12" type="text"
													name="middle-name" value="사원" >
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												이메일
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input id="birthday"
													class="date-picker form-control col-md-7 col-xs-12"
													required="required" type="text" value="slamdunk@email.com">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												담당자 연락처
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input id="birthday"
													class="date-picker form-control col-md-7 col-xs-12"
													required="required" type="text" value="02-5489-6598">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												주소
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input id="birthday"
													class="date-picker form-control col-md-7 col-xs-12"
													required="required" type="text" value="서울시 송파구 삼전동 100">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												고객 연락처
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input id="birthday"
													class="date-picker form-control col-md-7 col-xs-12"
													required="required" type="text" value="02-5489-6598">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												계약 유무
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input id="birthday"
													class="date-picker form-control col-md-7 col-xs-12"
													required="required" type="text" value="N">
											</div>
										</div>
										<div class="ln_solid"></div>
										<div class="form-group">
											<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
												<button type="submit" class="btn btn-primary">정보수정</button>
												<button class="btn" type="button">거래처 삭제</button>
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
									<h2>방문 이력</h2>
									
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<div class="dashboard-widget-content">
										<ul class="list-unstyled timeline widget">
											<li>
												<div class="block">
													<div class="block_content">
														<h2 class="title">스타벅스 석촌호수 서호</h2>
														<div class="byline">
															<span>2018-02-05 10:34</span>
														</div>
														<p class="excerpt">방문일지에서 코멘트란에 쓴 내용들어갈 자리</p>
													</div>
												</div>
											</li>
											<li>
												<div class="block">
													<div class="block_content">
														<h2 class="title">프로젝트 413 역삼</h2>
														<div class="byline">
															<span>2018-02-05 12:30</span>
														</div>
														<p class="excerpt"></p>
													</div>
												</div>
											</li>
											<li>
												<div class="block">
													<div class="block_content">
														<h2 class="title">카페 플로레</h2>
														<div class="byline">
															<span>2018-02-05 14:25</span>
														</div>
														<p class="excerpt">모닝커피 메뉴가 없어지면서 주문 원두량이 줄어서 계약금액 조정을
															원하심. 계약금액 조정시 할인율 변경이 불가피함을 공지하고 계약을 유지하는 방향으로 상담</p>
													</div>
												</div>
											</li>
										</ul>
									</div>
                   					
								</div>
							</div>
						</div>
					</div><!-- row -->
				</div>
			</div>
		</div>
	</div>

	<!-- /page content -->


	<!-- jQuery -->
	<script src="resources/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- Custom Theme Scripts -->
	<script src="resources/build/js/custom.min.js"></script>

</body>
</html>