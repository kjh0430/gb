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
var allCheck=false;
//숫자와 문자 포함 형태의  5에서 10자리 비밀번호

$(function(){

	$('#emp_no').val("${loginEmp.emp_no}");
	
	
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
	
});


  function checkPass(){

	var pwd_pattern= /^[A-Za-z0-9]{5,10}$/; 
	
	var password1=$('#emp_pwd1').val();
	var password2=$('#emp_pwd2').val();
	
	var checkN = password2.search(/[0-9]/g); 
	var checkE = password2.search(/[a-z]/ig);
	
	 if(password1==null && password1=="" && password2==null && password2==""){
		alert("password를 입력해주세요!")
		allCheck=false;
		return allCheck;
	 }
	 if(!pwd_pattern.test(password2)){
		alert("비밀번호는 숫자,문자 포함 5~10자리 입니다.");
		allCheck=false;
		return allCheck; 
	}    
    if(checkN<0 || checkE< 0)
    { 
        alert("비밀번호는 숫자,문자 포함 5~10자리 입니다.");
        allCheck=false;
        return allCheck;
    }
	if(pwd_pattern.test(password1) && pwd_pattern.test(password2)){
		alert("수정이 완료 되었습니다.");
		allCheck=true;
		return allCheck;		
	}
  }
  
  function backMyInfo(){
	  location.href="info.do";
	  
  }




</script>
</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a href="mainView.do" class="site_title"><i class="fa fa-google"></i>
							<span>GROUP BEAN</span></a>
					</div>

					<div class="clearfix"></div>

					<!-- sidebar menu -->
					<c:choose>
			            	<c:when test="${ loginEmp.job_no == 3}">
					            <!-- sidebar menu -->
					            <%@ include file="../etc/adminsidebar.jsp" %>
					            <!-- /sidebar menu -->
			            	</c:when>
			            	<c:when test="${ loginEmp.job_no == 2}">
			            	<%@ include file="../etc/adminsidebar.jsp" %>
			            	
			            	</c:when>
			            	<c:otherwise>
								<!-- sidebar menu -->
					            <%@ include file="../etc/sidebar.jsp" %>
					            <!-- /sidebar menu --> 
			            	</c:otherwise>
			            </c:choose>
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
							<h3>나의 정보</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>비밀번호 수정</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									
									
									
					 <form class="form-horizontal form-label-left" action="updatePassword.do" 
					 method="post" onsubmit="return checkPass();">
					
					
                     
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">password1</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="emp_pwd1" type="password" placeholder="비밀번호 입력">
                        </div>
                       
                      </div>
                          <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">password2</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="emp_pwd2" type="password" name="emp_pwd" placeholder="비밀번호 재입력">
                          <input id="emp_no" name="emp_no" type="hidden">
                        </div>
                       
                      </div> 
                      
                      
                     
                   
                   
                    
                      
                    
             
                   
           
                     
                             
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                          <button class="btn btn-primary" style="margin-left:25%;" type="submit">수정</button>
                          <button class="btn btn-danger"onclick="backMyInfo();" type="button">취소</button>
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