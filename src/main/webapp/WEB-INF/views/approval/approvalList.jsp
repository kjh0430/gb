<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

function modalUp(obj){
	var content=$(obj);
	var td=content.children();

	var approval_choose_no=td.eq(0).text();
	var approval_process=td.eq(2).text();
	var approval_start_date=td.eq(4).text();
	var approval_end_date=td.eq(5).text();
	var approval_comment=td.eq(6).text();
	var approval_team_date=td.eq(7).text();
	var approval_mgr_date=td.eq(8).text();
	var approval_team_name=td.eq(9).text();
	var approval_mgr_name=td.eq(10).text();
	
	$('#startDate').val(approval_start_date);
	$('#endDate').val(approval_end_date);
	$('#reason').val(approval_choose_no);
	alert("approval_team_date"+approval_team_date);
	$('#team').val(approval_team_date);
	$('#admin').val(approval_mgr_date);
	$('#textarea').val(approval_comment);
	$('#teamname').text("팀장"+"("+approval_team_name+")");
	$('#mgrname').text("관리자"+"("+approval_mgr_name+")");
	var value="";
if(approval_team_date!=""){
	$('#circle2').css('background-color','#2A3F54');
}

 if(approval_mgr_date!=""){
	$('#circle3').css('background-color','#2A3F54');
	
} 
	
	 $('#modal1').modal("show");
}

function modal1Close(){
	$('#circle2').css('background-color','#ddd');
	$('#circle3').css('background-color','#ddd');
	
	$('#modal1').modal("hide");
}
</script>
<style type="text/css">

#table_ap th:nth-child(4),th:nth-child(5),th:nth-child(6),
th:nth-child(7),th:nth-child(8),th:nth-child(9),th:nth-child(10),th:nth-child(11){
display:none;
}

#table_ap td:nth-child(4),td:nth-child(5),td:nth-child(6),
td:nth-child(7),td:nth-child(8),td:nth-child(9),td:nth-child(10),td:nth-child(11){
display:none;
}

.circle {
width:50px;
height:50px;
 line-height:50px; 
border-radius:50%;
display:block;
background-color:#ddd;
color:white;
font-weight:bold;
}

#circle1{
background-color:#2A3F54;
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
								aria-expanded="false"> <img src="images/img.jpg" alt="">${loginEmp.emp_no}
								<span class=" fa fa-angle-down"></span>
							</a>
								<ul class="dropdown-menu dropdown-usermenu pull-right">
									<li><a href="javascript:;"> Profile</a></li>
									<li><a href="javascript:;"> <span
											class="badge bg-red pull-right">50%</span> <span>Settings</span>
									</a></li>
									<li><a href="javascript:;">Help</a></li>
									<li><a href="logout.do"><i
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
								전자결재 리스트
							</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								
								<div class="x_content">
									
									<table id="table_ap" class="table table-striped table-bordered">
										<thead>
											<tr>
											
												<th>결재유형</th>
												<th>일자</th>
												<th>진행상황</th>
												<th>사원번호</th>
												<th>start</th>
												<th>end</th>
												<th>comment</th>
												<th>team</th>
												<th>mgr</th> 
												<th>team_name</th>
												<th>mgr_name</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${approvalListE}" var="approval">
											<c:if test="${approval.approval_choose_no eq '1'}">
											<c:set var="approval_choose_no" value="휴가"/>
											</c:if>
											<c:if test="${approval.approval_choose_no eq '2'}">
											<c:set var="approval_choose_no" value="경조사"/>
											</c:if>
											<c:if test="${approval.approval_choose_no eq '3'}">
											<c:set var="approval_choose_no" value="병가"/>
											</c:if>
											<c:if test="${approval.approval_choose_no eq '4'}">
											<c:set var="approval_choose_no" value="비고"/>
											</c:if>
											<c:if test="${approval.approval_mgr_date eq null && approval.approval_team_date eq null}">
											 <c:set var="approval_process" value="미진행 "/>
											</c:if>
											<c:if test="${approval.approval_mgr_date eq null && approval.approval_team_date ne null}">
											<c:set var="approval_process" value="팀장 승인 "/>
											</c:if>
											<c:if test="${approval.approval_mgr_date ne null}">
											<c:set var="approval_process" value="결재 완료"/>
											</c:if>
										
											
											<tr onclick="modalUp(this);">
												
												<td style="width:50%;">${approval_choose_no}</td>
												<td style="width:30%;">${approval.approval_submit_date}</td>
												<td>${approval_process}</td>
												<td>${approval.emp_no }</td>
												<td>${approval.approval_start_date}</td>
												<td>${approval.approval_end_date}</td>
												<td>${approval.approval_comment}</td>
												<td>${approval.approval_team_date}</td>
												<td>${approval.approval_mgr_date }</td> 
												<td>${approval.team_mgr_name}</td>
												<td>${approval.mgr_name}</td>
											</tr>
												</c:forEach>
										<tbody>
									</table>
									
									  <div class="modal fade sendMsg" tabindex="-1" role="dialog"
                                 id="modal1" aria-hidden="true">
                                 <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                       <form class="form-horizontal form-label-left input_mask">
                                          <div class="modal-header">
                                             <button type="button" class="close" data-dismiss="modal" onclick="modal1Close();">
                                                <span aria-hidden="true">×</span>
                                             </button>
                                             <h4 class="modal-title" id="myModalLabel">결재 내용</h4>
                                          </div>

                                          <div class="modal-body">
                                          	<div id="wizard" class="form_wizard wizard_horizontal">
										<ul class="wizard_steps anchor" style="margin:0px;padding:0px;">
											<li>
												 <div style = "width:100%" align = "center">
												 <div class="circle" id="circle1">사원</div>
												 </div>
											</li>
											
											<li>
											<div style = "width:100%" align = "center">
											<div class="circle" id="circle2">팀장</div>
											</div>
											</li>
											<li>
											<div style = "width:100%" align = "center">
												<div class="circle" id="circle3">관리자</div>
												</div>
											</li>

										</ul>
										<br>
									</div>
										<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>결재 내용</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<form class="form-horizontal form-label-left">

										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="first-name">일자 
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="date" required="required" id="startDate"
													class="form-date col-md-5 col-xs-12" readonly>
												<input type="date" required="required" id="endDate"
													class="form-date col-md-5 col-xs-12" readonly>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="last-name">사유 
											</label> 
											<div class="col-md-2 col-sm-4 col-xs-12">
												<input type="text" class="form-control"  id="reason" readonly>
											</div>
										</div>
										<div class="form-group">
											<label for="middle-name"
												class="control-label col-md-3 col-sm-3 col-xs-12" id="teamname">팀장</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<div class="input-group" style="margin-bottom:0px;">
													
													
													
													<input type="text" required="required" id="team"
													class="form-date col-md-5 col-xs-12" readonly style="width:163px;">
														
														
													
												</div>
											</div>
										</div>
										<div class="form-group">
											<label for="middle-name"
												class="control-label col-md-3 col-sm-3 col-xs-12" id="mgrname">관리자 </label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<div class="input-group" style="margin-bottom:0px;">
													<input type="text" required="required" id="admin"
													class="form-date col-md-5 col-xs-12" readonly style="width:163px;">
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">비고
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<textarea rows="3" class="form-control col-md-7 col-xs-12" id="textarea" readonly></textarea>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
									
									
                                          </div>
                                          <div class="modal-footer">
                                          	 <button onclick="modal1Close()" type="button"
                                                class="btn btn-primary">확인</button>
                                             
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