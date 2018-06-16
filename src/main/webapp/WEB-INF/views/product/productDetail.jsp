<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
	$(document).ready(function() {
		var st = "${avail}";
		var yes = "Y";
		var no = "N";
		if (st == yes) {
			$("#sale_y").attr("checked", true);
		} else if (st == no) {
			$("#sale_n").attr("checked", true);
		}
		var job_no = "${loginEmp.job_no}";
		if(job_no != 3){
			$("#admin_btn").css("display","none");
			$("#product_name").attr('readonly',true);
			$("#product_price").attr('readonly',true);
			$("#product_comment").attr('readonly',true);
			$("#product_amount").attr('readonly',true);
			$("#sale_y").attr('disabled',true);
			$("#sale_n").attr('disabled',true);	
			$("#pFile-0").css("display","none");
		}

	});
	
	var index=1;	
	
	$(function(){
		$(".add_btn").attr("disabled",true)
	});
	
	function addFile(){			
		var value="<li id='pFile-"+index+"' class='added' style='border:none;padding:0px;width:100%'><input type='file' onchange='fileChange()' class='form-control' name='product_file'>"
		+"<a href='javascript:delFile(\"pFile-"+index+"\")' title='삭제'>&nbsp;&nbsp;<i class='fa fa-times'></i></a></li>";
		$(".p_file").append(value);
		var firstFile = $("#firstFile").val(); 
		if(index==1 && firstFile==("")){
			$(".fileSpan").html("");
			index++;
		}else{
			index++;
		}		
		$(".add_btn").attr("disabled",true);
		$(".fileSpan").html("");
	};
	
	function delFile(idx){
		var firstFile = $("#firstFile").val(); 
		if(idx==1 && firstFile !=("")){
			$(".fileSpan").html("<a href='javascript:resetFile()' title='삭제'>&nbsp;<i class='fa fa-times'></i></a>");
			$("#"+idx).remove();
		}else{
			$("#"+idx).remove();
		}	
		
		var count = $(".p_file").length;
		if(count==1){
			$("#pFile-0 .fileSpan").html("<a href='javascript:resetFile()' title='삭제'>&nbsp;<i class='fa fa-times'></i></a>");
		}
		$(".add_btn").attr("disabled",false)
	}
	
	function resetFile(){
		$("#firstFile").val("");
		$(".fileSpan").html("");	
		$(".add_btn").attr("disabled",true)	
	}
	
	function firstChange(){
		var firstFile = $("#firstFile").val(); 
		if(firstFile!=""){
			$(".fileSpan").html("<a href='javascript:resetFile()' title='삭제'>&nbsp;<i class='fa fa-times'></i></a>");
		}
		$(".add_btn").attr("disabled",false);		
	}
	
	function fileChange(){
		$(".add_btn").attr("disabled",false)
	}
	
	function deleteFile(renameFile){
		var test = confirm("첨부파일을 삭제하시겠습니까?");
		if(test){
			$.ajax({
				url:"deleteFile.do",
				data:{product_rename_file:renameFile},
				type:"post",
				success:function(result){
					
				},
				error:function(request,status,errorData){
					console.log("error data : " +request.status+"\n"
							+"message : "+request.responseText+"\n"
							+"error : "+errorData);
				}	
			})//ajax
		}
		location.reload();
		
			
	}

</script>
<style type="text/css">
	.p_file{
		list-style:none;
		padding-left:0px;
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
	#pfs > li{
		border:solid 1px #ccc;
		padding:5px;
		margin-bottom:5px;
		width:80%;
	}
	.add{
		margin-top:10px;
	}
	
</style>
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

					<c:choose>
						<c:when test="${ loginEmp.job_no == 3}">
							<!-- sidebar menu -->
							<%@ include file="../etc/adminsidebar.jsp"%>
							<!-- /sidebar menu -->
						</c:when>
						<c:when test="${ loginEmp.job_no == 2}">
							<%@ include file="../etc/adminsidebar.jsp"%>

						</c:when>
						<c:otherwise>
							<!-- sidebar menu -->
							<%@ include file="../etc/sidebar.jsp"%>
							<!-- /sidebar menu -->
						</c:otherwise>
					</c:choose>

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
								제품 상세정보
							</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								
								<div class="x_content">
                   					 <br />
									<form class="form-horizontal form-label-left" method="post" action="updateProduct.do" encType="multipart/form-data">

										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="first-name">제품번호
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" id="first-name" required="required" name="product_no"
													class="form-control col-md-7 col-xs-12" value="${productDetail.product_no}" readonly>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="first-name">제품명
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" id="product_name" required="required"
													class="form-control col-md-7 col-xs-12" name="product_name" value="${productDetail.product_name}" >
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="last-name">판매가격 
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input type="text" id="product_price" required="required" 
												class="form-control col-md-7 col-xs-12" name="product_price" value="${productDetail.product_price}" >
											</div>
										</div>
										<div class="form-group">
											<label for="middle-name"
												class="control-label col-md-3 col-sm-3 col-xs-12">
												재고
												</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<input id="product_amount"	class="form-control col-md-7 col-xs-12" type="text"
												value="${productDetail.product_amount}" name="product_amount" >
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												제품정보
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<textarea id="product_comment" class="form-control col-md-7 col-xs-12" rows="3" name="product_comment">${productDetail.product_comment}</textarea>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												판매여부
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12" style="height:34px;padding:6px 12px">
												
										<input class="form-check-input" type="radio" name="product_availability" id="sale_y" value="sale_y"> 
										<label class="form-check-label"	for="sale_yn">판매가능 </label>
										<input class="form-check-input" type="radio" name="product_availability" id="sale_n" value="sale_n">
										<label class="form-check-label" for="sale_n">판매불가 </label>
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">
												첨부파일
											</label>
											<div class="col-md-6 col-sm-6 col-xs-12">
												<ul class="p_file" id="pfs">
												<c:forEach var="list" items="${productFileNames}">													
												<li>
													<a href="productFileDown.do?pfName=${list.product_rename_file}&oriName=${list.product_original_file}">${list.product_original_file}</a>
													<span class="fileSpan1"><a href="javascript:deleteFile('${list.product_rename_file}')" title='삭제'>&nbsp;<i class='fa fa-times'></i></a></span>	
													<!-- <input type="button" class="btn btn-dark add_btn" onclick="addFile()" value="추가"/> -->
												</li>
												</c:forEach>
												<li id="pFile-0" style="border:none;padding:0px;width:100%">
													<input type="file" id="firstFile" name="product_file" onchange="firstChange()" class="form-control">
													<span class="fileSpan"></span>	
													<input type="button" class="btn btn-dark add_btn" onclick="addFile()" value="추가"/>
												</li>
												</ul>
											</div>
										</div>
										<div class="ln_solid"></div>
										<div class="form-group">
											<div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3" id="admin_btn">
												<button type="submit" class="btn btn-primary">정보수정</button>
												<button class="btn btn-danger" type="button" onclick="deleteProduct();">제품삭제</button>
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
			<!-- /footer -->
		</div>
	</div>

	<!-- /page content -->


	<!-- jQuery -->
	<script src="resources/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- Custom Theme Scripts -->
	<script src="resources/build/js/custom.min.js"></script>
	<script type="text/javascript">
		function deleteProduct(){
			var test = confirm("제품을 삭제하시겠습니까?");
			if(test){
				location.href='deleteProduct.do?product_no=${productDetail.product_no}'
			}
		}
	</script>

</body>
</html>