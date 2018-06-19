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
$(document).ready(function() {
    
} );

</script>

<script type="text/javascript">

$(function(){
	
	$('#goalMonth').change(function(){
		var gdate=$('#goalMonth').val();
		
		/* alert("date: "+gdate); */
		
		
		$.ajax({
			url:"goalMonthList.do",
			type:"post",
			data: {
				gdata:gdate
			},
			dataType:"json",
			success:function(data){
				
				var jsonStr = JSON.stringify(data);
				var json = JSON.parse(jsonStr);
				
				
				var values='';
				for(var i in json.list){
					 /* alert("이름"+json.list[i].emp_name);
					alert("사원번호"+json.list[i].emp_no); */
					/* alert("총금액"+json.list[i].contract_money);
					alert("시작날짜 "+json.list[i].contract_date_start_goal);  */
					
					var str=String(json.list[i].contract_money);
                    var a =str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
					
                    
					values += 
						"<tr><td>"+json.list[i].emp_no+"</td>"+
						"<td>"+decodeURIComponent(json.list[i].emp_name)+"</td>"+
						"<td>"+a+"</td>"+
						"<td>"+decodeURIComponent(json.list[i].contract_date_start_goal)+"</td>"+													
						"<td><a class='btn btn-primary btn-modify' href='goalAdminDetail.do?emp_no="+json.list[i].emp_no+"&emp_name="+decodeURIComponent(json.list[i].emp_name)+"&contract_money="+json.list[i].contract_money+"&contract_date_start_goal="+decodeURIComponent(json.list[i].contract_date_start_goal)+"'>수정</a></td></tr>"
						
								
						/* "<td><a class='btn btn-primary btn-modify' href='goalAdminDetail.do?emp_no="+json.list[i].emp_no+"&emp_name="+decodeURIComponent(json.list[i].emp_name)+"&contract_money="+json.list[i].contract_money+"'>수정</a></td></tr>" */
						/* "<td><a class='btn btn-primary btn-modify' href='goalAdminDetail.do?emp_name="+decodeURIComponent(json.list[i].emp_name)+"&'>수정</a></td></tr>" */
						
						
					
				}
				
				$('#goalListMonth').html(values);
			},
			error : function(a, b, c) {
				console.log(a + b + c);
			}
			
			
		});
		
		
	});
	
	
});

function goalAdminDetail(){
	
	
	
	
	
	
	
	
	
	/* $.ajax({
		url:"",
		data:{
			
			
			
		},
		type:"post",
		dataType:"json",
		success:function(data){
			
			
		}
		
		
		
	}); */
	
	
	}



</script>

<style type="text/css">
	.btn-modify{
		padding:3px 6px;
		margin:0px;
		font-size:13px;
	}
	.table-bordered>tbody>tr>td{
		vertical-align:middle;
	}
</style>
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
							<h3>
								목표관리
							</h3>
						</div>
					</div>
					
					
					<div class="row">
						

					</div><!-- end row -->
					

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										목표관리
									</h2>
									<div class="clearfix"></div>
								</div>
								<div class="title_right">
									<div class="control-group" style="float:right">
										<div class="controls">
										<input type="month" class="form-control" id="goalMonth" style="width:260px"></div>
									</div>
								</div>
								<div class="x_content table-responsive">									
									<table id="table_tg" class="table table-striped table-responsive table-bordered" style="min-width:650px;">
										<thead>
											<tr>
												<th>사원번호</th>
												<th>사원명</th>
												<th>총 실적(월)</th>
												<th>(월)</th>
												<!-- <th>이번달 목표</th>
												<th>수정1</th> -->
												<th>수정</th>
											</tr>
										</thead>
										<tbody id="goalListMonth">
										
											<c:forEach var="goalList" items="${goalStateList}">
												<c:choose>
													<c:when test="${goalList.emp_name=='관리자'}">
													
														
													</c:when>
													<c:otherwise>
														<tr>
															<td>${goalList.emp_no}</td> 
															<td>${goalList.emp_name}</td>																										
															<td>${goalList.contract_money}</td>
															<td>${goalList.contract_date_start_goal}월</td>
															<!-- <td><input type="text" value="삼번달이번달 목표" name="target_num"/></td>
															<td><input type="button" class="btn btn-primary btn-modify" value="수정" name="target_modify" onsubmit="return goalAdminDetail();"/></td> -->
															<td><a class="btn btn-primary btn-modify" href="goalAdminDetail.do?emp_no=${goalList.emp_no}&emp_name=${goalList.emp_name}&contract_money=${goalList.contract_money}&contract_date_start_goal=${goalList.contract_date_start_goal}">수정</a></td>
														</tr>
													</c:otherwise>
												</c:choose>
											</c:forEach>
											
										</tbody>
									</table>
								</div>
								
								
							</div>
						</div>
					</div>
				</div>
			</div>
			<%@ include file="../etc/footer.jsp"%>
		</div>
	</div>

	<!-- /page content -->


	<!-- jQuery -->
	<script src="resources/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	
	<!-- Custom Theme Scripts -->
	<script src="resources/build/js/custom.min.js"></script>

</body>
</html>