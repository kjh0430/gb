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

/* $(function(){
	$('#getvalues td:nth-child(3)').hide();
}) */


	function searchEmp() {

	
				$.ajax({
					url : "searchEmp.do",
					type : "post",
					dataType : "json",
					data : {
						searchName : $('#searchName').val()
					},
					success : function(obj) {

						var objStr = JSON.stringify(obj);
						var jsonl = JSON.parse(objStr);
						var value = "<table class='table table-hover' id='getvalues'><thead><tr><th>이름</th><th>직급</th><th>부서</th><th>e-mail</th><th>사원번호</th></tr></thead><tbody>";
					
						for ( var i in jsonl.list) {

							value += "<tr onclick='selectEmp(this);' style='cusor:hand'><td>" + jsonl.list[i].emp_name
									+ "</td><td>" + jsonl.list[i].dept_name
									+ "</td><td>" + jsonl.list[i].emp_job
									+ "</td><td>" + jsonl.list[i].emp_email
									+"</td><td>"+jsonl.list[i].emp_no
									+ "</td></tr>";
						}
						
						
						value += "</tbody></table>";
							
							
						 	$('#myModal2').modal("show"); 
						 	$('#searchTable').html(value);
						 	
					}/* ,error : function(request, status, errorData) {
								alert("error code : " + request.status + "\n"
										+ "message :" + request.responseText + "\n"
										+ "error :" + errorData);
							} */

				});

	}

	
	function selectEmp(obj){
		var tr=$(obj);
		var td=tr.children();
		
		var emp_name=td.eq(0).text();
		var dept_name=td.eq(1).text();
		var emp_job=td.eq(2).text();
		var emp_email=td.eq(3).text();
		var emp_no=td.eq(4).text();
		$('#myModal2').modal("hide");
		
		/* submit하기 위하여 갑 넣기 */
		$('#searchName').val(emp_name);
		
		$ ('#message_to_no').val(emp_no);
	}
	
	
		
		function modalSubmit(){
			
			
			$('#modal1').modal("hide");
			
			$.ajax({
			url:"sub.do",
			type:"post",
			data:{ message_from_no : "${loginEmp.emp_no}",
				message_to_no : $('#message_to_no').val(),
				message_title : $('#message_title').val(),
				message_content : $('#message_content').val()
			},
			success :function(data){
				alert(data);
			}
		
		
		});
	
		}
	
	
	

</script>
<style type="text/css">
.btn-modify {
	padding: 3px 6px;
	margin: 0px;
	font-size: 13px;
}

.table-bordered>tbody>tr>td {
	vertical-align: middle;
}

#table_rm tr:last-child {
	border-bottom: 1px solid #ddd;
}

#getvalues th:nth-child(5),td:nth-child(5){
display:none;
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
							<h3>쪽지</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<!-- <div style="text-align:right"> -->
									<div>
										<button type="button" class="btn btn-success"
											data-toggle="modal" data-target=".sendMsg">쪽지보내기</button>
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<div class="" role="tabpanel" data-example-id="togglable-tabs">
										<ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
											<li role="presentation" class="active"><a
												href="#receive_msg" id="home-tab" role="tab"
												data-toggle="tab" aria-expanded="true">받은쪽지함</a></li>
											<li role="presentation" class=""><a href="#send_msg"
												role="tab" id="profile-tab" data-toggle="tab"
												aria-expanded="false">보낸쪽지함</a></li>

										</ul>
										<!-- start of receive msg tab -->
										<div id="myTabContent" class="tab-content">
											<div role="tabpanel" class="tab-pane fade active in"
												id="receive_msg" aria-labelledby="home-tab">
												<table class="table" id="table_rm">
													<thead>
														<tr>
															<th>보낸사람</th>
															<th>제목</th>
															<th>받은날짜</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>서태웅</td>
															<td><a href="#">지각좀그만하세요...</a></td>
															<td>2018.04.15</td>
														</tr>
														<tr>
															<td>서태웅</td>
															<td><a href="#">지각좀그만하세요...</a></td>
															<td>2018.04.15</td>
														</tr>
														<tr>
															<td>서태웅</td>
															<td><a href="#">지각좀그만하세요...</a></td>
															<td>2018.04.15</td>
														</tr>
														<tr>
															<td>서태웅</td>
															<td><a href="#">지각좀그만하세요...</a></td>
															<td>2018.04.15</td>
														</tr>
														<tr>
															<td>서태웅</td>
															<td><a href="#">지각좀그만하세요...</a></td>
															<td>2018.04.15</td>
														</tr>
														<tr>
															<td>서태웅</td>
															<td><a href="#">지각좀그만하세요...</a></td>
															<td>2018.04.15</td>
														</tr>
														<tr>
															<td>서태웅</td>
															<td><a href="#">지각좀그만하세요...</a></td>
															<td>2018.04.15</td>
														</tr>
													</tbody>
												</table>
											</div>
											<!-- end of receive msg tab -->

											<!-- start of send msg tab -->
											<div role="tabpanel" class="tab-pane fade" id="send_msg"
												aria-labelledby="profile-tab">
												<table class="table" id="table_rm">
													<thead>
														<tr>
															<th>받는사람</th>
															<th>제목</th>
															<th>보낸날짜</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>정대만</td>
															<td><a href="#">지각좀그만하세요...</a></td>
															<td>2018.04.15</td>
														</tr>
														<tr>
															<td>정대만</td>
															<td><a href="#">지각좀그만하세요...</a></td>
															<td>2018.04.15</td>
														</tr>
														<tr>
															<td>정대만</td>
															<td><a href="#">지각좀그만하세요...</a></td>
															<td>2018.04.15</td>
														</tr>
														<tr>
															<td>정대만</td>
															<td><a href="#">지각좀그만하세요...</a></td>
															<td>2018.04.15</td>
														</tr>
														<tr>
															<td>서태웅</td>
															<td><a href="#">지각좀그만하세요...</a></td>
															<td>2018.04.15</td>
														</tr>
														<tr>
															<td>정대만</td>
															<td><a href="#">지각좀그만하세요...</a></td>
															<td>2018.04.15</td>
														</tr>
														<tr>
															<td>송태섭</td>
															<td><a href="#">지각좀그만하세요...</a></td>
															<td>2018.04.15</td>
														</tr>
													</tbody>
												</table>
											</div>
											<!-- end of send msg tab -->
										</div>

										<!-- message modal -->
										<div class="modal fade sendMsg" tabindex="-1" role="dialog" id="modal1"
											aria-hidden="true">
											<div class="modal-dialog modal-lg">
												<div class="modal-content">
													<form class="form-horizontal form-label-left input_mask">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal">
																<span aria-hidden="true">×</span>
															</button>
															<h4 class="modal-title" id="myModalLabel">쪽지보내기</h4>
														</div>
														
														<div class="modal-body">
															<div class="form-group" style="margin: 0px;">
																<div class="row">
																	<label
																		class="control-label col-md-3 col-sm-3 col-xs-12">받는사람</label>
																	
																	<div class="col-md-9 col-sm-9 col-xs-12">
																		<div class="input-group">
																		
																			<input type="text" class="form-control" 
																				placeholder="받는이의 이름을 입력해주세요." id="searchName">
																				
																			<input type="hidden" name="message_from_no" value="${loginEmp.emp_no}">
			
																		 	<input type="hidden" name="message_to_no" id="message_to_no">
																			
																			
																			<span class="input-group-btn">
																				 <button type="button" class="btn btn-primary"
																					onclick="searchEmp();">
																					<i class="fa fa-search"></i>
																				</button> 
																				
																			</span>
																		</div>				
																	</div>														
																	<label
																			class="control-label col-md-3 col-sm-3 col-xs-12">제목</label>
																	<div class="col-md-9 col-sm-9 col-xs-12">
																		<div class="input-group">
																		<input type="text" class="form-control" name="message_title" id="message_title"
																				placeholder="제목을 입력해주세요.">
																				</div>
																				</div>
																	
																
																	
																	<div class="form-group">
																	
																		<label
																			class="control-label col-md-3 col-sm-3 col-xs-12">내용</label>
																		<div class="col-md-9 col-sm-9 col-xs-12">
																			<textarea class="form-control" rows="8" name="message_content" id="message_content"></textarea>
																		</div>
																	</div>
																</div>
																<!-- end of row -->
															</div>
														</div>
														<div class="modal-footer">
															<button  onclick="modalSubmit();" type="button" class="btn btn-primary">전송</button>
														</div>
														</form>
													
												</div>
											</div>
										</div>
										<!-- modal2 -->
										<div class="modal fade sendMsg2" tabindex="-1" role="dialog"
											id="myModal2" aria-hidden="true">
											<div class="modal-dialog modal-lg">
												<div class="modal-content">
													<form class="form-horizontal form-label-left input_mask">
														<div class="modal-header">
															<button type="button" class="close" data-dismiss="modal">
																<span aria-hidden="true">×</span>
															</button>
															<h4 class="modal-title" id="myModalLabel2">사원 검색</h4>
														</div>
														<div class="modal-body">
															<div class="form-group" style="margin: 0px;">
																<div class="row">
																	<label
																		class="control-label col-md-3 col-sm-3 col-xs-12"></label>
																	<div class="col-md-9 col-sm-9 col-xs-12">
																		<div class="input-group">
																			
																		
																			<span class="input-group-btn">
																				
																			</span>

																		</div>
																	</div>
																	
																	<div id="searchTable"></div>








																	<div class="form-group">





																		
																		<div class="col-md-9 col-sm-9 col-xs-12">
																			
																		</div>
																	</div>
																</div>
																
															</div>
														</div>
														<div class="modal-footer">
															
														</div>
													</form>
												</div>
											</div>
										</div>
										<!--  end modal2 -->



										<!-- message modal -->
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