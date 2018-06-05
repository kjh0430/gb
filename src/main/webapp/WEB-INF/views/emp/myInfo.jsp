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


<script type="text/javascript">
$(function(){

var allCheck=false;

	//내 정보 가져오기
	$.ajax({
		url:"getMyInfo.do",
		data:{emp_no : "${loginEmp.emp_no}",job_no:"${loginEmp.job_no}"},
		type:"post",
		success:function(data){
			$('#emp_no').val("${loginEmp.emp_no}");
			$('#emp_name').val(data.emp_name);
			$('#emp_addr').val(data.emp_addr);
			$('#emp_phone').val(data.emp_phone);
			$('#job_name').val(data.job_name);
			$('#emp_email').val(data.emp_email);
			$('#mgr_name').val(data.mgr_name);
			$('#city').val(data.city);
			$('#county').val(data.county);
			$('#village').val(data.village);
			$('#dept_name').val(data.dept_name);		
		}		
	});
	
	$('#emp_pwd2').blur(function(){
		var p1=$('#emp_pwd1').val();
		var p2=$('#emp_pwd2').val();
		
		if(p1==p2){
			alert("비밀번호가 일치합니다.");
		}else{
			alert("비밀번호가 일치하지 않습니다.");
			$('#emp_pwd1').val("");
			$('#emp_pwd2').val("");
		}
	});
	
	$('#emp_email').blur(function(){
		
		
		$.ajax({
			
			url:"emailCheck.do",
			data:{emp_no :"${loginEmp.emp_no}", emp_email:$('#emp_email').val()},
			type:"post",
			success:function(data){
			
				if(data.check=="N" && $('#emp_email').val()!="" && $('#emp_email').val()!=null){
					alert("사용가능한 e-mail입니다.");
					
				}else if(data.check=="Y"){
					alert("다른 사람이 사용하고 있는 e-mail입니다.");
				}
			}
		});
		
	
	});
	
	$('#emp_phone').blur(function(){

		$.ajax({
			
			url:'checkPhoneck.do',
			data:{emp_no :"${loginEmp.emp_no}", emp_phone:$('#emp_phone').val()},
			type:"post",
			success:function(data){
				 
				if(data.check=="N" && $('#emp_phone').val()!="" && $('#emp_phone').val()!=null){
					alert("사용가능한 전화번호 입니다.");
					
				}else if(data.check=="Y"){
					alert("다른 사람이 사용하고 있는 번호입니다.");
				}
			}
			
		});
	});
	
});

function checkCondition(){
	var pwd_pattern=/^[A-Za-z0-9]{5,10}$/; //숫자와 문자 포함 형태의  5에서 10자리 비밀번호
	var phone_pattern = /^\d{3}-\d{3,4}-\d{4}$/;
	var email_pattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	var password1=$('#emp_pwd1').val();
	var password2=$('#emp_pwd2').val();
	var email=$('#emp_email').val();
	var phone=$('#emp_phone').val();
	
	
	var pwdcheck="false";
	var emailcheck="false";
	var phonecheck="false";
	if(!pwd_pattern.test(password1) && !pwd_pattern.test(password2)){
		alert("비밀번호는 숫자,문자 포함 5~10자리 입니다.");
		allCheck=false;
		return allCheck; 
	}if(!phone_pattern.test(phone)){
		alert("올바른 e-mail 형식이 아닙니다.");
		allCheck=false;
		return allCheck;
	}if(!email_pattern.test(email)){
		alert("올바른 전화번호 형식이 아닙니다.ex)010-1234-5678");
		allCheck=false;
		return allCheck;
	}if(pwd_pattern.test(password1) && pwd_pattern.test(password2) && phone_pattern.test(phone) && email_pattern.test(email)){
		allCheck=true;
		return allCheck;
		
	}
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
			<%@ include file="../etc/topnav.jsp"%>
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>정보 수정</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>정보 수정</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									
									
									
					
					<form class="form-horizontal form-label-left" action="empinsert.do" method="post" onsubmit="return checkCondition();">

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">사원번호 *</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="emp_no" name="emp_no" type="text" readonly >
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">password1</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="emp_pwd1" type="password" placeholder="비밀번호 입력">
                        </div>
                       
                      </div>
                          <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">password2</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="emp_pwd2" type="password" placeholder="비밀번호 재입력">
                        </div>
                       
                      </div>
                      
                      
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">이름</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="emp_name" name="emp_name" type="text" readonly>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">주소</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="emp_addr" name="emp_addr" type="text" readonly>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">연락처</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                         <input class="form-control" id="emp_phone" name="emp_phone" type="tel" placeholder="연락처">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">직급</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                         <input class="form-control" id="job_name" name="job_name" type="tel" readonly>
                      </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">이메일</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="emp_email" name="emp_email" type="email" placeholder="이메일">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">상사이름</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control col-md-7 col-xs-12" id="mgr_name" name="mgr_name" type="text" readonly>
                          
                        </div>
                      </div>
             
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">담당지역</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="city" name="city" type="text" readonly>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="county" name="county" type="text" readonly> 
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="village" name="village" type="text" readonly>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">부서</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                         <input class="form-control" id="dept_name" name="dept_name" type="text" readonly>
                        </div>
                      </div>
                             
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button class="btn btn-primary" type="submit" onclick="modifyInfo()">수정</button>
								</div>
							</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- footer content -->
			<%@ include file="../etc/footer.jsp"%>
			<!-- /footer content -->
	</div>
	
	
	<!-- modal -->
	
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