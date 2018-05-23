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
		function login() {
			$('#loginForm').submit();
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
							<input type="text" name="emp_no" class="form-control" placeholder="Username"
								required>
						</div>
						<div>
							<input type="password" name="emp_pwd" class="form-control"
								placeholder="Password"/>
						</div>
						<div>
							<input type="button" class="btn btn-default submit" 
								style="background:#344659;width:100%;color:#fff; left-margin:0px;" 
									value="LOGIN" onclick="login()"/>							
						</div><br/>
						<!-- <a class="reset_pass" href="#">Lost your password?</a> -->
						<a class="reset_pass" href="adminmain.do">관리자main보기</a> 
	
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

			<!-- <div id="register" class="animate form registration_form">
				<section class="login_content">
					<form>
						<h1>Create Account</h1>
						<div>
							<input type="text" class="form-control" placeholder="Username"
								required="" />
						</div>
						<div>
							<input type="email" class="form-control" placeholder="Email"
								required="" />
						</div>
						<div>
							<input type="password" class="form-control"
								placeholder="Password" required="" />
						</div>
						<div>
							<a class="btn btn-default submit" href="index.html">Submit</a>
						</div>

						<div class="clearfix"></div>

						<div class="separator">
							<p class="change_link">
								Already a member ? <a href="#signin" class="to_register">
									Log in </a>
							</p>

							<div class="clearfix"></div>
							<br />

							<div>
								<h1>
									<i class="fa fa-paw"></i> Gentelella Alela!
								</h1>
								<p>©2016 All Rights Reserved. Gentelella Alela! is a
									Bootstrap 3 template. Privacy and Terms</p>
							</div>
						</div>
					</form>
				</section>
			</div> -->
		</div>
	</div>
</body>
</html>
