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
<!-- NProgress -->
<link href="resources/vendors/nprogress/nprogress.css" rel="stylesheet">
<!-- Animate.css -->
<link href="resources/vendors/animate.css/animate.min.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="resources/build/css/custom.min.css" rel="stylesheet">
</head>

<body class="login">
	<div>
		<a class="hiddenanchor" id="signup"></a> <a class="hiddenanchor"
			id="signin"></a>

		<div class="login_wrapper">
			<div class="animate form login_form">
				<section class="login_content">
					<form>
						<img src="resources/images/login.png" style="margin-bottom: 20px;"/>
						
						<div>
							<input type="text" class="form-control" placeholder="Username"
								required="" />
						</div>
						<div>
							<input type="password" class="form-control"
								placeholder="Password" required="" />
						</div>
						<div>
							<!-- 로그인 기능 구현 시 a태그 지우고 아래 주석 활용하여 할 것  
							src-main-webapp-resources-build-css-custom.css
						4039번째줄 margin-left:0px로 변경 -->
							
							<!--  <input type="submit" class="btn btn-default submit" style="background:#344659;width:100%;color:#fff;" value="LOGIN" />	 -->	
						
							<a href="main.do" class="btn btn-default submit" style="background:#344659;width:100%;color:#fff;">LOGIN</a>				
						</div><br/>
						<a class="reset_pass" href="clientList.do">Lost your password?</a>
						<a class="reset_pass" href="testView.do">TestView</a>
						<a class="reset_pass" href="testView2.do">TestView2</a>
	
						<div class="clearfix"></div>
						<br />
						<div class="separator">
							<br />
							<div>
								<p>©2016 All Rights Reserved.</p>
							</div>
						</div>
					</form>
				</section>
			</div>

			<div id="register" class="animate form registration_form">
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
			</div>
		</div>
	</div>
</body>
</html>
