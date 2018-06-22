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

</script>


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
					<%@ include file="../etc/sidebar.jsp"%>
					<!-- /sidebar menu -->

				</div>
			</div>

			<!-- top navigation -->
			<c:import url="../etc/topnav.jsp"></c:import>
			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>매출현황</h3>
						</div>
					</div>
					<div class="clearfix"></div>
					<!-- map start -->
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							

						</div>
					</div>
					<div class="clearfix"></div>
					<br>
					
					 <form id="formTag" class="form-horizontal form-label-left input_mask" >
					
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
						
							<div class="x_title">
									<h2>거래처 정보</h2>
									
									<div style="text-align:right">
									<h4>${orderList.get(0).order_date.substring(0,10) }</h4>
									</div>
														
								</div>
							
								<div class="x_content">
									<br />
									
										
										<div class="form-group">
											<label class="col-sm-3 control-label">거래처명</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input type="text" class="form-control" name="client_name" id="searchComName2" value="${clientInfo.client_company }" readonly>
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label">거래처번호</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input type="text" class="form-control" name="client_no" id="clientNo" value="${clientInfo.client_no }" readonly>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">담당자</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input type="text" class="form-control" id="searchEmpName" value="${clientInfo.emp_name}" name="emp_name" readonly>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">전화번호</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input type="text" class="form-control" id="searchClientPhone" value="${clientInfo.client_phone }" name="client_phone" readonly>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">주소</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input type="text" class="form-control" id="searchClientAddr" value="${clientInfo.client_addr }" readonly>
											</div>
										</div>
										
								</div>
								
							</div>
						</div>
					</div><!-- row -->
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										주문제품
									</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
							

									<table class="table table-striped table-bordered">
										<thead>
											<tr>
												<th>제품번호</th>
												<th>제품명</th>
												<th>수량</th>
												<th>단가</th>
											</tr>
										</thead>
										<tbody class="order_body">
										</tbody>	
										
											<c:forEach var="list" items="${orderList }">
												<tr>												
													<td>${list.product_no }</td>										
													<td><a href="#">${list.product_name}</td>													
													<td>${list.order_amount }</td>
													<td>${list.order_price }</td>
												</tr>
											</c:forEach>
											<tr>
											<td>합계</td>
											<td></td>
											<td></td>
											<td>${price }</td>
											</tr>
										<!-- <thead>
											<tr>
												<th>제품번호</th>
												<th>제품명</th>
												<th>단가</th>
												<th>수량</th>
												<th>삭제</th>
											</tr>a
											<tr>
												<td>21549871</td>
												<td>예가체프 아라비카 500g</td>
												<td><input type="text" name="order_amount" class="form-control" value="13,000"/></td>
												<td><input type="number" name="order_amount" class="form-control" min="1"/></td>
												<td><button class="btn btn-danger btn-order">&nbsp;&nbsp;<i class="fa fa-trash-o"></i>&nbsp;&nbsp;</button></td>
											</tr>
										<tbody> -->
									</table>
								
									<div class="ln_solid"></div>
									<div class="col-md-12 col-sm-12 col-xs-12 col-md-offset-3" style="margin:0px; text-align:right">
											
											<button type="button" class="btn btn-success" onclick="history.go(-1)">목록</button>
									</div>
								</div>
							</div>
						</div>
					
					
					</div>
					 </form> 
				</div>
			</div>
			
			<c:import url="../etc/footer.jsp"></c:import>
			
		</div>
	</div>

	<!-- /page content
	
 -->




	<!-- jQuery -->
	<script src="resources/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	
	<!-- Custom Theme Scripts -->
	<script src="resources/build/js/custom.min.js"></script>
	

</body>
</html>