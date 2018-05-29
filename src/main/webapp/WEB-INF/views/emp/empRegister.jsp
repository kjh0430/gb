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
<!-- <link href="resources/vendors/nprogress/nprogress.css" rel="stylesheet"> -->
<!-- iCheck -->
<!-- <link href="resources/vendors/iCheck/skins/flat/green.css"
	rel="stylesheet"> -->

<!-- bootstrap-progressbar -->
<link
	href="resources/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet">
<!-- JQVMap -->
<!-- <link href="resources/vendors/jqvmap/dist/jqvmap.min.css"
	rel="stylesheet" /> -->
<!-- bootstrap-daterangepicker -->
<link
	href="resources/vendors/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="resources/build/css/custom.min.css" rel="stylesheet">
<link href="resources/css/main.css" rel="stylesheet">

<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<!-- <script type="text/javascript">
	$(document).ready(function() {
		$('#table_cl').dataTable({
			ordering : false,
			lengthChange : false,
			pageLength : 15
		});
	});
</script>  -->

<script type="text/javascript">
function Regiemp(){
	
	var emp_no = $('#emp_no').val();
	var emp_pwd = $('#emp_pwd').val();
	var emp_name = $('#emp_name').val();
	var emp_addr = $('#emp_addr').val();
	var emp_phone = $('#emp_phone').val();
	var job_no = $('#job_no').val();
	var emp_email = $('#emp_email').val();
	var emp_mgr = $('#emp_mgr').val();
	var emp_hiredate = $('#emp_hiredate').val();
	var emp_firedate = $('#emp_firedate').val();
	var city = $('#city').val();
	var county = $('#county').val();
	var village = $('#village').val();
	var dept_no = $('#dept_no').val();
	
	var en1 = new RegExp("[A-Z]");
	var en2 = new RegExp("[a-z]");
	var num = new RegExp("[0-9]");
	var binkan = /\s/g;
	var phone_check = /^\d{3}-\d{3,4}-\d{4}$/;
	var email_check = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if(emp_no.length < 1){
		alert("사원번호를 입력해주세요.");
	}else if(!num.test(emp_no)){
		alert("사원번호는 숫자만 입력해주세요.");
	}else if(emp_pwd.length < 4){
		alert("비밀번호는 4자리 이상 입력해주세요.");
	}else if(emp_phone.match(phone_check) == null){
		alert("연락처를 제대로 입력해주세요.");
	}else{
		$.ajax({
			url : "checkPhone.do",
			type: "post",
			dataType: "json",
			data: {
				emp_phone : $('#emp_phone').val()
			},
			success:function(jsonData){
				console.log("jsonData : " + jsonData);
				alert("이미 등록된 번호 입니다. \n다시 입력하십시오");
				$('#emp_phone').select();
				},
				error: function(){
					alert("사용할 수 있는 번호 입니다.");
				}
			});
	}
	
	if(emp_email.match(email_check) == null){
		alert("이메일 주소를 제대로 입력하십시오.");
	}else{
	
	$.ajax({
		url : "checkEmail.do",
		type: "post",
		dataType: "json",
		data: {
			emp_email : emp_email
		},
		success:function(jsonData){
			console.log("jsonData : " + jsonData);
			alert("이미 등록된 이메일 입니다. \n다시 입력하십시오");
			$('#emp_phone').select();
			},
			error: function(){
				alert("사용할 수 있는 이메일 입니다");
			}
		});
	}
}
</script>

<script type="text/javascript">

function mgrList(){
	$.ajax({
		url: "selectMgrList.do",
		type : "post",
		dataType : "json",
		success : function(obj){
			console.log("selectMgrList.do 실행");
			var objStr = JSON.stringify(obj);
			var jsonObj = JSON.parse(objStr);
			var outValues = "<table id='mgrTable'><tr><th style='text-align:center;'>사원번호</th><th style='text-align:center;'>사원이름</th></tr>";
			
			for(var i in jsonObj.mgrList){
				outValues += "<tr onclick='selectMgrNo(this);'><td>" + jsonObj.mgrList[i].emp_no + "</td><td>" 
				+ decodeURIComponent(jsonObj.mgrList[i].emp_name) + "</td></tr>";
			}
			
			outValues += "</table>";
			
			console.log("outValues : " + outValues);
			
			$("#mgrTable").html(outValues);
		},
		error: function(request, status, errorData){
			console.log("error code : " + request.status + "\n"
					+ "message : " + request.responseText + "\n"
					+ "error : " + errorData);
			}
		
	});    
};

function selectMgrNo(obj){
	var tr = $(obj);
	var td = tr.children();
	
	var emp_no = td.eq(0).text();
	var emp_name = td.eq(1).text();
	
	$('#mgrModal').modal('hide');
	$('#emp_mgr').val(emp_no);
	
}


</script>

<style type="text/css">
#mgrTable{
text-align:center;
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
								aria-expanded="false"> <!-- <img src="images/img.jpg" alt=""> -->John
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
							<h3>인사관리</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>사원등록</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									
									
									
					<!-- 사원 등록 -->
					<form class="form-horizontal form-label-left" action="empinsert.do" method="post">
					<!-- <form class="form-horizontal form-label-left" action="empinsert.do" method="post"> -->

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">사원번호 *</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="emp_no" name="emp_no" type="text" placeholder="사원번호">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">비밀번호 *</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="emp_pwd" name="emp_pwd" type="password" placeholder="비밀번호">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">이름 *</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="emp_name" name="emp_name" type="text" placeholder="사원이름">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">주소 *</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="emp_addr" name="emp_addr" type="text"  placeholder="사원거주지">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">연락처 *</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                         <input class="form-control" id="emp_phone" name="emp_phone" type="tel" placeholder="연락처">
                         <!-- <button class="btn btn-success" type="button" onclick="checkPhone()">Submit</button> -->
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">직급 *</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <select class="form-control" id="job_no" name="job_no">
                            <option value="1">사원</option>
                            <option value="2">팀장</option>
                            <option value="3">관리자</option>                         
                          </select>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">이메일 *</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="emp_email" name="emp_email" type="email" placeholder="이메일">
                          <!-- <button class="btn btn-success" type="button" onclick="checkEmail()">Submit</button> -->
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">상사번호</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control col-md-7 col-xs-12" id="emp_mgr" name="emp_mgr" type="text" placeholder="상사번호" style="width:85%;">
                          <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm" style="float:right;" onclick="mgrList()">조회</button>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">입사일</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="emp_hiredate" name="emp_hiredate" type="date">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">퇴사일</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="emp_firedate" name="emp_firedate" type="date">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">담당지역</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="city" name="city" type="text" placeholder="시">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="county" name="county" type="text" placeholder="구">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="village" name="village" type="text" placeholder="동">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">부서 *</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <select class="form-control" id="dept_no" name="dept_no">
                            <option value="1">영업1팀</option>
                            <option value="2">영업2팀</option>
                            <option value="3">관리자</option>                       
                          </select>
                        </div>
                      </div>
                             
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button class="btn btn-success" type="submit">등록</button>                           
                          <button class="btn btn-primary" type="button">취소</button>
                          <button type="button" class="btn btn-info" onclick="Regiemp()">임시</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	
	
	<!-- modal -->
	<div class="modal fade bs-example-modal-sm" id="mgrModal" tabindex="-1" role="dialog" aria-hidden="true">
       <div class="modal-dialog modal-sm">
          <div class="modal-content">

             <div class="modal-header">
             <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
             </button>
             <h4 class="modal-title" id="myModalLabel">사원조회</h4>
             </div>
             <div class="modal-body" style="overflow-y:auto; overflow-x:hidden; height:400px;">
             <table class="table table-hover" id="mgrTable">
             </table>
             </div>
             <div class="modal-footer">
             <!-- <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
             <button type="button" class="btn btn-primary">등록</button> -->
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
	<!-- <script src="resources/vendors/fastclick/lib/fastclick.js"></script> -->
	<!-- NProgress -->
	<!-- <script src="resources/vendors/nprogress/nprogress.js"></script> -->
	<!-- iCheck -->
	<!-- <script src="resources/vendors/iCheck/icheck.min.js"></script> -->
	<!-- Datatables -->
	<!-- <script
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
	<script src="resources/vendors/pdfmake/build/vfs_fonts.js"></script> -->

	<!-- Custom Theme Scripts -->
	<script src="resources/build/js/custom.min.js"></script>

</body>
</html>