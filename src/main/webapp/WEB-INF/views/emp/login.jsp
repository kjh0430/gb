<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GROUP BEAN | LOGIN</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap -->
<link href="resources/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link href="resources/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="resources/build/css/custom.min.css" rel="stylesheet">
<script src="resources/vendors/jquery/dist/jquery.min.js"></script>

<script type="text/javascript">
	
			/** 로그인 submit */
			/* function login() {
				$('#loginForm').submit();
			} */
		
		$(function(){
			$('#mainLoginBtn').on('click', function(){
				$.ajax({
					url: "login.do",
					data: {
						emp_no: $('#emp_no').val(),
						emp_pwd: $('#emp_pwd').val()
					},
					type: "post",
					success: function(data) {
						if(data == "correct") {
							location.href="mainView.do"	
						}else {
							alert("사원번호와 비밀번호를 확인하시기 바랍니다.");
							$('#emp_no').val("");
							$('#emp_pwd').val("");
							return false;
						}
					}
				});	//ajax
			});	//click
		}); //onload
		
		function enterKey() {
			var keyCode = window.event.keyCode;
			if(keyCode==13){
				$.ajax({
					url: "login.do",
					data: {
						emp_no: $('#emp_no').val(),
						emp_pwd: $('#emp_pwd').val()
					},
					type: "post",
					success: function(data) {
						if(data == "correct") {
							location.href="mainView.do"	
						}else {
							alert("사원번호와 비밀번호를 확인하시기 바랍니다.");
							$('#emp_no').val("");
							$('#emp_pwd').val("");
							return false;
						}
					}
				});	//ajax
			}
			
		}
		
		
</script>

</head>

<body class="login">
	<div>
		<a class="hiddenanchor" id="signup"></a> 
		<a class="hiddenanchor" id="signin"></a>

		<div class="login_wrapper">
			<div class="animate form login_form">
				<section class="login_content">
				
					<form id="loginForm" action="login.do" method="post">
						<img src="resources/images/login.png" style="margin-bottom:20px;"/>
						
						<div>
							<input id="emp_no" type="text" name="emp_no" class="form-control" placeholder="Username"
								required>
						</div>
						<div>
							<input id="emp_pwd" type="password" name="emp_pwd" class="form-control"
								placeholder="Password" onkeydown="javascript:enterKey()"/>
						</div>
						<div>
							<input id="mainLoginBtn" type="button" class="btn btn-default submit" 
								style="background:#344659;width:100%;color:#fff; left-margin:0px;" 
									value="LOGIN" />							
						</div><br/>
						<!-- <a class="reset_pass" href="#">Lost your password?</a> -->
						
	
						<div class="clearfix"></div>
						<br />
						<div class="separator">
							<br />
							<div>
								<p>©2018 All Rights Reserved.</p>
							</div>
						</div>
					</form>
				</section>
			</div>

		</div>
	</div>
</body>
</html>
