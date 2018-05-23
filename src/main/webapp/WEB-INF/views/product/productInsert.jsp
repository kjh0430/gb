<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="images/favicon.ico" type="image/ico" />

<title>잠재고객 상세페이지</title>

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
	
	
	function addFile(){
		var index=1;		
		var value="<li id='pFile-"+index+"' class='added'><input type='file' class='form-control' name='product_file'>"
		+"<a href='javascript:delFile(\"pFile-"+index+"\")' title='삭제'>&nbsp;&nbsp;<i class='fa fa-times'></i></a></li>";
		$(".p_file").append(value);
		var firstFile = $("#firstFile").val(); 
		console.log(firstFile +"," + typeof(firstFile));
		if(index==1 && firstFile==("")){
			$(".fileSpan").html("");
			index++;
		}else{
			index++;
		}		
	};
	
	function delFile(idx){
		var firstFile = $("#firstFile").val(); 
		console.log(firstFile +"," + typeof(firstFile));
		if(idx==1 && firstFile !=("")){
			$(".fileSpan").html("<a href='javascript:resetFile()' title='삭제'>&nbsp;<i class='fa fa-times'></i></a>");
			$("#"+idx).remove();
		}else{
			$("#"+idx).remove();
		}		
	}
	
	function resetFile(){
		$("#firstFile").val("");
		$(".fileSpan").html("");		
	}
	
	function firstChange(){
		var firstFile = $("#firstFile").val(); 
		if(firstFile!=""){
			$(".fileSpan").html("<a href='javascript:resetFile()' title='삭제'>&nbsp;<i class='fa fa-times'></i></a>");
		}
	}

</script>
<style type="text/css">
	.p_file{
		list-style:none;
		padding-left:0px;
	}
	.added{
		margin-top:10px;
	}
	input[type=file]{
		display:inline-block;
		width:80%;
	}
	.add_btn{
		margin-bottom:0px;
		float:right;
		display:inline-block;
	}
</style>
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
							<h3>
								제품 등록
							</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								
								<div class="x_content">
                   					 <br />
									<form action="insertProduct.do" method="post" encType="multipart/form-data" 
									class="form-horizontal form-label-left">

										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="product_name">제품 이름
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" id="product_name" required="required"
													class="form-control col-md-7 col-xs-12" name="product_name">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="product_price">판매 가격 
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="number" id="product_price" name="product_price"
													required="required" class="form-control col-md-7 col-xs-12" >
											</div>
										</div>
										<div class="form-group">
											<label for="middle-name"
												class="control-label col-md-3 col-sm-3 col-xs-12">
												재고
												</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input id="product_amount"
													class="form-control col-md-7 col-xs-12" type="number"
													name="product_amount">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												제품정보
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<textarea class="form-control col-md-7 col-xs-12" name="product_comment" rows="3"></textarea>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												판매여부
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12" style="height:34px;padding:6px 12px">												
													<input class="form-check-input" type="radio" name="product_availability" id="sale_y" value="sale_y" checked>
													<label class="form-check-label" for="sale_yn">판매가능 </label>
													<input class="form-check-input" type="radio" name="product_availability" id="sale_n" value="sale_n">
													<label class="form-check-label" for="sale_n">판매불가 </label>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												첨부파일
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12" >
											<ul class="p_file">
												<li id="pFile-0">
													<input type="file" id="firstFile" name="product_file" onchange="firstChange()" class="form-control">
													<span class="fileSpan"></span>	
													<input type="button" class="btn btn-dark add_btn" onclick="addFile()" value="추가"/>
												</li>
											</ul>								
											</div>
										</div>
										<div class="ln_solid"></div>
										<div class="form-group">
											<!-- <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
												<button type="submit" class="btn btn-primary">정보수정</button>
												<button class="btn btn-danger" type="button">제품삭제</button>
											</div> -->
											
											<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
												<button type="submit" class="btn btn-primary">등록</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div><!-- row -->
				</div>
			</div>
			<!-- footer -->
			<%@ include file="../etc/footer.jsp"%>
			<!-- footer -->
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