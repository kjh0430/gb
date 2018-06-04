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
	
<!-- Custom Theme Style -->
<link href="resources/build/css/custom.min.css" rel="stylesheet">
<link href="resources/css/main.css" rel="stylesheet">

<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>


<script type="text/javascript">

	$(document).ready(function() {
	
		//팀장 이름, 및 관리자 이름 가져오기
		$.ajax({
			url:"getName.do",
			data:{emp_no :"${loginEmp.emp_no}"},
			type:"post",
			dataType:"json",
			success:function(data){			
				$('#team_mgr').val(decodeURIComponent(data.team_mgr_name.replace(/\+/g," ")));
				$('#mgr_name').val(decodeURIComponent(data.mgr_name.replace(/\+/g," ")));
				$('#team_mgr_no').val(data.team_mgr_no);
				$('#mgr_no').val(data.mgr_no); //관리자의 사원번호
				alert("data.mgr_no"+data.mgr_no);
				alert("team_mgr_no"+data.team_mgr_no);			
			}
		
		});
		result = ${result};
		if(result==1){
			console.log(${result});
			}
	
	});
	
	function resetContent(){
		
		$('#approval_comment').val().remove();
		$('#startDate').val().remove();
		$('#endDate').val().remove();		
		$('#approval_choose_no').val()="선택";
	}


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
			<%@ include file="../etc/topnav.jsp"%>
			<!-- /top navigation -->
			

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>전자 결재</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>신청</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<form id="demo-form2" data-parsley-validate
										class="form-horizontal form-label-left" action="submitApproval.do" method="post">

										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="first-name">일자 <span class="required">*</span>
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="date" required="required" name="approval_start_date" id="startDate" 
													class="form-date col-md-5 col-xs-12" id="startDate">
												<input type="date" required="required" name="approval_end_date" id="endDate" 
													class="form-date col-md-5 col-xs-12">
											</div>
										</div>
										
										<input type="hidden" name=emp_no value="${loginEmp.emp_no}">
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="last-name">사유 <span class="required">*</span>
											</label> 
											
											<div class="col-md-2 col-sm-4 col-xs-12">
												<select class="form-control" id="selectReason" name="approval_choose_no">
													<option selected>선택</option>
													<option value="1">휴가</option>
													<option value="2">경조사</option>
													<option value="3">병가</option>
													<option value="4">비고</option>
													
												</select>
											</div>
										</div>
										<div class="form-group">
											<label for="middle-name"
												class="control-label col-md-3 col-sm-3 col-xs-12">결재자(팀장)<span class="required">*</span></label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<div class="input-group" style="margin-bottom:0px;">
													<input type="text" class="form-control" id="team_mgr" readonly>
													<span class="input-group-btn">
														<input type="hidden" name="approval_team_no" id="team_mgr_no"/>	
													</span>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label for="middle-name"
												class="control-label col-md-3 col-sm-3 col-xs-12">결재자(관리자)<span class="required">*</span></label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<div class="input-group" style="margin-bottom:0px;">
													<input type="text" class="form-control" id="mgr_name" readonly> <span
														class="input-group-btn">
													<input type="hidden" name="approval_mgr_no" id="mgr_no"/>
													</span>
												</div>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">비고
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<textarea rows="3" class="form-control col-md-7 col-xs-12" id="approval_comment" name="approval_comment"></textarea>
											</div>
										</div>
										<div class="ln_solid"></div>
										<div class="form-group">
											<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
												<button class="btn btn-danger" type="reset" onclick="resetContent();">Reset</button>
												<button type="submit" class="btn btn-primary">Submit</button>
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
	</div>
	
	
	




	<!-- jQuery -->
	<script src="resources/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="resources/build/js/custom.min.js"></script>

</body>
</html>