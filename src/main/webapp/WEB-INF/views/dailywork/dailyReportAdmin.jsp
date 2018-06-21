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
	$(function(){
		document.getElementById("daily_date").valueAsDate = new Date();		
		
		$.ajax({
			url:"selectDeptEmp.do",
			type:"post",
			dataType:"json",
			data:{dept_no:"${loginEmp.dept_no}",job_no:"${loginEmp.job_no}",emp_no:"${loginEmp.emp_no}"},
			success:function(obj){
				console.log(obj);
				var objStr =JSON.stringify(obj);
				var result = JSON.parse(objStr);		
				var size = Object.keys(result.list).length;
				var arrDept = [];
				var value_dept="";
				var value_emp="<option>사원선택</option>";
				if(size>0){
					for(var i in result.list){
						arrDept[i]=result.list[i].dept_name;							
					}					
					//$.unique(arrDept);
					var uni_dept =[];
					uni_dept = unique(arrDept);
					
					for(var i in uni_dept){
						if(i==0){
							value_dept+="<option selected>"+uni_dept[i]+"</option>"							
						}else{
							value_dept+="<option>"+uni_dept[i]+"</option>"
						}
					}
					$("#dept_no").html(value_dept);	
					
					function selectEmp(dept){
						for(var i in result.list){
							if(result.list[i].dept_name == dept){	
								if(result.list[i].job_no == 1){
								value_emp+="<option><span>"+result.list[i].emp_no + "</span> / "+result.list[i].emp_name+"</option>"		
								}
							}
						}
						$("#emp_no").html(value_emp);	
						
					}
					selectEmp($("#dept_no option:selected").val());
					
					$("#dept_no").change(function(){
						value_emp="<option>사원선택</option>";
						selectEmp($("#dept_no option:selected").val());						
					})
				}				
				
			},
			error:function(request,status,errorData){
				console.log("error data : " +request.status+"\n"
						+"message : "+request.responseText+"\n"
						+"error : "+errorData);
			}			
			
		});//ajax
		
	});//onload	
	
	function unique(list) {
	    var result = [];
	    $.each(list, function(i, e) {
	        if ($.inArray(e, result) == -1) result.push(e);
	    });
	    return result;
	}

	
	
</script>

</head>


<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<div class="left_col scroll-view">
					<div class="navbar nav_title" style="border: 0;">
						<a href="Movemain.do" class="site_title"><i class="fa fa-google"></i>
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
							<h3>영업일지</h3>
						</div>
					</div>
					<div class="clearfix"></div>
					<div class="row" style="margin-bottom:10px;">
						<div class="col-xs-12 col-lg-4">
							<div class="form-group">
							  <select class="form-control" id="dept_no">
							    
							  </select>
							</div>
						</div>
						<div class="col-xs-12 col-lg-4">
							<div class="form-group">
								  <select class="form-control" id="emp_no">
								  
								  </select>
							 </div>
						</div>
						<div class="col-xs-12 col-lg-4">
							<div class="form-group">
								<input type="date" class="form-control" id="daily_date" name="daily_date" style="width:200px;display:inline-block">
								<button class="btn btn-dark" onclick="selectDailyreport()"style="display:inline-block;margin-bottom:3px;">확인</button>
							</div>	
						</div>
					</div>			
					
					
					<!-- map start -->
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div id="map" style="height: 400px"></div>	
						</div>
					</div>
					<div class="clearfix"></div>
					<br>
					<div class="row">
						<div class="col-md-6 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title" style="margin-bottom:0px;">
									<h2>방문거래처</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<div class="dashboard-widget-content">
										<ul class="list-unstyled timeline widget" id="visitList">
											
										</ul>
									</div>
								</div>
							</div>
						</div>
						<!-- visit end -->
						<div class="col-md-6 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title" style="margin-bottom:0px;">
									<h2>주문내역</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content" id="orderlist">
									<div class="dashboard-widget-content">
									<table class="table" id="table_ol" style="margin-bottom:10px;">
									</table>
									</div>
								</div>
							</div>
						</div>
						<!-- row -->
					</div>
				</div>
			</div>
			<!-- footer content -->
			<%@ include file="../etc/footer.jsp"%>
			<!-- /footer content -->
		</div>		
	</div>
	<!-- /page content -->
	
	<!-- jQuery -->
	<script src="resources/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	
	<!-- Custom Theme Scripts -->
	<script src="resources/build/js/custom.min.js"></script>
	
	<!-- daum map script -->
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9847a2e4326a2ca39c99b754b2d4e80c&libraries=services"></script>		
	<script type="text/javascript" src="resources/js/map.js?ver=1"></script>
	<script type="text/javascript">
		function selectDailyreport(){	
			var date = $("#daily_date").val();
			var emp_option = $("#emp_no option:selected").val();
	
			
			if($("#emp_no option:selected").val() == "사원선택"){
				alert("사원을 선택해주세요.");			
			}else if(date==""){
				alert("날짜를 선택해주세요.");
			}else{
				selectVisit();	
				selectOrder();
			}
			
			
		}
		
		
	</script>
</body>
</html>