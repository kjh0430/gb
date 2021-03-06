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

<title>회원정보 수정페이지</title>

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
	$(function(){
		//고객정보 수정
		$('#updateClientBtn').on('click', function(){
			if(confirm("해당 정보로 변경하시겠습니까?")==true) {
				location.href="updateClient.do?client_no="+""+${ detailClient.client_no }+"";
			}else{
				return false;
			}
		});		
		
		//정보수정 취소
		/* $('#cancelClientBtn').on('click', function(){
			//location.href="detailClient.do?client_no="+""+${ detailClient.client_no }+"";
			history.go(-1);
		}); */
		
	});
</script>


<script type="text/javascript">
	var count = 0;
	
	function deleteFiles(num) {
		var really = confirm("해당파일이 삭제됩니다. 삭제하시겠습니까?");
		if(really == true) {
			
			$.ajax({
				url : "updateClientFile.do",
				type: "post",
				data : {
					client_file_no : $('#reFile'+num).val()
				},
				success: function(data) {
					if(data == "ok") {
						$("#file"+num).html("");
					}
				}
			});
		
		}else{
			return false;
		}
		
	}
	function addFiles(){
		
		$('#fileF').append("<div id='dfile"+count+"'><input name='client_file' type='file'> <a href='javascript:dFile("+count+")'>삭제</a> </div>");
		count++;
	}
	function dFile(count){
		$('#dfile'+count).html("");
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
			<c:import url="../etc/topnav.jsp"></c:import>
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
						<c:choose>
							<c:when test="${ detailClient.client_contract eq 'N' }">
								<h3>잠재고객</h3>
							</c:when>
							<c:otherwise>
								<h3>등록고객</h3>
							</c:otherwise>
						</c:choose>
							
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
									<form action="updateClient.do" method="post" id="updateClient" data-parsley-validate
										class="form-horizontal form-label-left" enctype="multipart/form-data">
									<input type="hidden" name="emp_no" value="${ detailClient.emp.emp_no }">
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="first-name">고객번호
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input name="client_no" type="text" id="client_no" required="required"
													class="form-control col-md-7 col-xs-12" 
													value="${ detailClient.client_no }" readonly>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="first-name">고객명
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input name="client_name" type="text" id="client_name" required="required"
													class="form-control col-md-7 col-xs-12" 
													value="${ detailClient.client_name }" >
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="last-name">담당자명 
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" id="" name="emp.emp_name"
													required="required" class="form-control col-md-7 col-xs-12" 
													value="${ detailClient.emp.emp_name }" readonly>
											</div>
										</div>
										<div class="form-group">
											<label for="middle-name"
												class="control-label col-md-3 col-sm-3 col-xs-12">
												직책
												</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input id="client_job"
													class="form-control col-md-7 col-xs-12" type="text"
													name="client_job" 
													value="${ detailClient.client_job }" >
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												이메일
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input name="client_email" id="client_email"
													class="date-picker form-control col-md-7 col-xs-12"
													required="required" type="text" 
													value="${ detailClient.client_email }" >
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												담당자 연락처
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input name="emp.emp_phone" id=""
													class="date-picker form-control col-md-7 col-xs-12"
													required="required" type="text"
													value="${ detailClient.emp.emp_phone }" readonly>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												주소
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input name="client_addr" id="client_addr"
													class="date-picker form-control col-md-7 col-xs-12"
													required="required" type="text" 
													value="${ detailClient.client_addr }" >
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												고객 연락처
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input name="client_phone" id="client_phone"
													class="date-picker form-control col-md-7 col-xs-12"
													required="required" type="text" 
													value="${ detailClient.client_phone }" >
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												계약 유무
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input name="client_contract" id="client_contract"
													class="date-picker form-control col-md-7 col-xs-12"
													required="required" type="text" 
													value="${ detailClient.client_contract }" readonly>
											</div>
										</div>
										<%-- <div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												비고
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input name="client_comment" id="client_contract"
													class="date-picker form-control col-md-7 col-xs-12"
													required="required" type="text" 
													value="${ detailClient.client_comment }" >
											</div>
										</div> --%>
										
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												첨부파일
											</label>
											
											<div id="fileF" class="col-md-6 col-sm-6 col-xs-12">
											
												<a href="javascript:addFiles()">추가</a>
												<c:forEach var="list" items="${ clientFileList }" varStatus="num">
												<div id="file${ num.index }">
												<input id="reFile${ num.index }" type="hidden" name="reFile" value="${ list.client_file_no }">
													<input name="client_file" id="client_original_file"
														class="date-picker form-control col-md-7 col-xs-12"
														required="required" type="text" 
														value="${ list.client_original_file }" readonly>
												<a onclick="deleteFiles('${ num.index }')" style="cursor:pointer;">삭제</a>
												</div>
												</c:forEach>
											</div>
										</div>
										
										<div class="ln_solid"></div>
										<div class="form-group">
											<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
												<button id="updateClientBtn" type="submit" class="btn btn-primary">수정완료</button>
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
										
											<c:forEach var="list" items="${ dailyHistoryList }">
												<li>
													<div class="block">
														<div class="block_content">
															<h2 class="title">${ list.client_company }</h2>
															<div class="byline">
																<span>${ list.daily_date }</span>
															</div>
															<p class="excerpt">${ list.daily_comment }</p>
														</div>
													</div>
												</li>
											</c:forEach>
											
										</ul>
									</div>
                   					
								</div>
							</div>
						</div>
					</div><!-- row -->
				</div>
			</div>
			
			<!-- start footer -->
				<c:import url="../etc/footer.jsp"></c:import>
			<!-- end footer -->
			
			
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