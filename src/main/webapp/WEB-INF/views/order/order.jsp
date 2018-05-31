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

var idx = 1;
var amount = new Array(); //상품수량 변수 
var price = new Array(); //상품가격 변수 
var orderInfo = new Array(); 
var client_no;
var calcValue=new Array(); // 예상 결재 비용 배열 변수
var discount =  new Array(); //할인율 배열 
var c_discount; //해당 고객의 할인율 

	function searchCom(){	
		
		$.ajax({
			url: "searchCom.do",
			type : "post",
			dataType : "json",
			data : {
				searchComName : $('#searchComName').val(),
				emp_no : '${loginEmp.emp_no}'
			},
			success : function(obj){
				var objStr = JSON.stringify(obj);
				var jsonl = JSON.parse(objStr);
				var value = "<table id='table_items' class='table table-striped table-bordered'>"
				+"<tr><th>거래처번호</th><th>거래처명</th><th>전화번호</th><th>주소</th></tr>";
				
				for(var i in jsonl.list){
					value += "<tr onclick='selectCom(this);'>"
					+"<td>"+jsonl.list[i].client_no+"</td>"
					+"<td>"+jsonl.list[i].client_company+"</td>"
					+"<td>"+jsonl.list[i].client_phone+"</td>"
					+"<td>"+jsonl.list[i].client_addr+"</td>"
					+"</tr>";	
					discount[i] = jsonl.list[i].contract_discount;
				}
				
				value += "</table>";
			//	alert("value : " + value);
				$('#searchResult').html(value);
			}
			
		});//ajax complete
	}
	
	function selectCom(obj){
		$('.order_body').html("");
		var tr=$(obj);
		//alert("obj : " + $(obj).index());
		c_discount = discount[$(obj).index()-1];
		//alert("discount: "  + c_discount);
		var td=tr.children();
		 client_no=td.eq(0).text();
		var client_company=td.eq(1).text();
		var client_phone=td.eq(2).text();
		var client_addr=td.eq(3).text();
		
		$('#searchModal').modal("hide");
		
		/* submit하기 위하여 갑 넣기 */
	//	$('#searchComName').val(client_company);
		
		$('#clientNo').val(client_no);
		$('#searchComName2').val(client_company);
		$('#searchEmpName').val('${loginEmp.emp_name}');
		$('#searchClientPhone').val(client_phone);
		$('#searchClientAddr').val(client_addr);
		
	}

	//상품 검색용.
	function searchProduct(){
		$.ajax({
			url: "searchProduct.do",
			type : "post",
			dataType : "json",
			data : {
				searchProductName : $('#searchProductName').val(),
				client_no : client_no
			},
			success : function(obj){
				
				var objStr = JSON.stringify(obj);
				var json = JSON.parse(objStr);
				var value = "<table id='table_items' class='table table-striped table-bordered'>"
				+"<tr><th>제품번호</th><th>제품명</th><th>단가</th></tr>";
				
				for(var i in json.plist){
					this.row = i;
					value += "<tr onclick='selectProduct(this);'>"
					+"<td>"+json.plist[i].product_no+"</td>"
					+"<td>"+json.plist[i].product_name+"</td>"
					+"<td>"+json.plist[i].product_price+"</td>"
					+"</tr>";
					
				}
				
				
				value += "</table>";
				$('#searchProductList').html(value);
			}
		});//ajax complete
	}
	
	function selectProduct(obj){
		//alert("obj : " + $(obj));
		var tr=$(obj);
		var td=tr.children();
		//alert("ㅎㅇㅎㅇㅎ: " + discount);
		var product_no=td.eq(0).text();
		var product_name=td.eq(1).text();
		var product_price=td.eq(2).text()*(1-c_discount/100);
		//var product_=td.eq(3).text();
		
		$('#searchModal2').modal("hide");
		
		var value = $('.order_body').html();
		

		
		//console.log(amount[1]);
		/* submit하기 위하여 갑 넣기 */
		value += "<tr id='tr"+idx+"'>"
		+"<td><input type='text' id='productNo"+idx+"' name='product_no' class='form-control' value='"+product_no+"' readonly/></td>"
		+"<td>"+product_name+"</td>"
		+"<td><input type='number' onblur='saveAmount("+idx+");' id='orderAmount"+idx+"' name='order_amount' class='form-control' min='1' value='1'/></td>"
		+"<td><input type='text' id='orderPrice"+idx+"' name='order_price' class='form-control' value='"+product_price+"'/></td>"
		+"<td><button type='button' class='btn btn-danger btn-order' onclick='deleteRow("+idx+");'>&nbsp;&nbsp;<i class='fa fa-trash-o'></i>&nbsp;&nbsp;</button></td>"
		+"</tr>";
		
		
		
		idx++;
		
		$('.order_body').html(value);
		
		for(i=1; i<amount.length; i++){
			 $('#orderAmount'+i).val(amount[i]);
			
		}
		
		calcPrice(idx-1);
	
		//alert($('#productName').val());	
		
	}
	
	//상품 수량 유지 함수 
	//선택한 상품 * 수량 합계
	
	function saveAmount(idx){
		
		amount[idx] = 
		console.log("amount: " +amount[idx]);

			
		calcPrice(idx);
	}
	
	
	
	function calcPrice(idx){
		console.log("calcPrice함수 실행!");
		/* amount[idx] = $('#orderAmount'+idx).val();
		price[idx] = $('#orderPrice'+idx).val();
		calcValue[idx] = amount[idx] * price[idx]; */
		
		var sum=0;
		
		/* if(calcValue[idx] == '0'){
			
			calcValue[idx] = amount[idx] * price[idx];
			
			for(var i=1; i <= idx ; i++){
				if((calcValue[i] !='') && (calcValue[i] !=null) && (calcValue[i] != 'nudefined') && (calcValue[i] != 'NaN')){
					sum = sum +  calcValue[i];
					console.log("sum : "+sum);
				}else{
					console.log("실행 안됨!!");
				}
				
			}
			$('#calcValue').html(sum);	
		}
		 */

		amount[idx] = $('#orderAmount'+idx).val();
		console.log("amount["+idx+"]: " + amount[idx]);
		price[idx] = $('#orderPrice'+idx).val();
		
		console.log("price ["+idx+"]: " + price[idx]);
		
		calcValue[idx] = amount[idx] * price[idx];
		
		console.log("calc : " + calcValue[idx]);
		//alert("idx : " +idx);
		
		
		//if문을 사용해서 calcValue[idx] 의 값이 undefine일 경우 i++..
		//if('' || null || undefined || 0 || NaN){ // ... }else{ console.log("여기가 실행"); }
		
		for(var i=1; i <= idx ; i++){
			if(calcValue[i]=='NaN'){
				calcValue[i]=0;
			}
			if((calcValue[i] !='') || (calcValue[i] !=null) || (calcValue[i] != 'nudefined') || !(isNaN(calcValue[i]))){
				
				if(!(isNaN(sum+calcValue[i]))){ 
					sum = sum +  calcValue[i];
				}
				console.log("sum : "+sum);
				
			}else{
				console.log("실행 안됨!!");
			}
			
		}
		//sum += calcValue[idx];		
		//console.log("sum : " + sum);
		
		//console.log("sum : " + sum);
		//alert("prcie * amount = " + value ); 
		$('#calcValue').val(sum);	
		

	}
	
	//삭제버튼 클릭시 추가된 상품의 ROW삭제 
	function deleteRow(idx){
		console.log("deldteRow 함수 구동!!");
	//	alert("idc : " + idx);
		
		$('#tr'+idx).remove();
		console.log("idx ["+idx+"]=" + idx);
		console.log("calcValue["+idx+"]=" + calcValue[idx]);
		
		calcValue[idx] = 0;
		amount[idx] =0 ;
		price[idx] = 0;

		console.log("amount["+idx+"] : " + amount[idx] );
		console.log("price["+idx+"] : " + price[idx] );
		//console.log("reAmount :" + amount[idx]);
		console.log("calcValue.length = " + calcValue.length-1);
		calcPrice(calcValue.length-1);
		
		
	}
	
	function noticeAlert(){
		alert("발주가 완료되었습니다!");
	}
	
	
</script>
<style type="text/css">
	.table > tbody > tr > td{
		vertical-align:middle;
	}
	.btn-order{
		padding:3px 6px;
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

					<!-- sidebar menu -->
					<%@ include file="../etc/sidebar.jsp"%>
					<!-- /sidebar menu -->

				</div>
			</div>

			<!-- top navigation -->
			<div class="top_nav">
				<div class="nav_menu">
					<nav>
						<div class="nav toggle">
							<a id="menu_toggle"><i class="fa fa-bars"></i></a>
						</div>

						<ul class="nav navbar-nav navbar-right">
							<li class=""><a href="javascript:;"
								class="user-profile dropdown-toggle" data-toggle="dropdown"
								aria-expanded="false"> <img src="images/img.jpg" alt="">John
									Doe <span class=" fa fa-angle-down"></span>
							</a>
								<ul class="dropdown-menu dropdown-usermenu pull-right">
									<li><a href="javascript:;"> Profile</a></li>
									<li><a href="javascript:;"> <span
											class="badge bg-red pull-right">50%</span> <span>Settings</span>
									</a></li>
									<li><a href="javascript:;">Help</a></li>
									<li><a href="login.html"><i
											class="fa fa-sign-out pull-right"></i> Log Out</a></li>
								</ul></li>

							<li role="presentation" class="dropdown"><a
								href="javascript:;" class="dropdown-toggle info-number"
								data-toggle="dropdown" aria-expanded="false"> <i
									class="fa fa-envelope-o"></i> <span class="badge bg-green">6</span>
							</a>
								<ul id="menu1" class="dropdown-menu list-unstyled msg_list"
									role="menu">
									<li><a> <span class="image"><img
												src="images/img.jpg" alt="Profile Image" /></span> <span> <span>John
													Smith</span> <span class="time">3 mins ago</span>
										</span> <span class="message"> Film festivals used to be
												do-or-die moments for movie makers. They were where... </span>
									</a></li>
									<li><a> <span class="image"><img
												src="images/img.jpg" alt="Profile Image" /></span> <span> <span>John
													Smith</span> <span class="time">3 mins ago</span>
										</span> <span class="message"> Film festivals used to be
												do-or-die moments for movie makers. They were where... </span>
									</a></li>
									<li><a> <span class="image"><img
												src="images/img.jpg" alt="Profile Image" /></span> <span> <span>John
													Smith</span> <span class="time">3 mins ago</span>
										</span> <span class="message"> Film festivals used to be
												do-or-die moments for movie makers. They were where... </span>
									</a></li>
									<li><a> <span class="image"><img
												src="images/img.jpg" alt="Profile Image" /></span> <span> <span>John
													Smith</span> <span class="time">3 mins ago</span>
										</span> <span class="message"> Film festivals used to be
												do-or-die moments for movie makers. They were where... </span>
									</a></li>
									<li>
										<div class="text-center">
											<a> <strong>See All Alerts</strong> <i
												class="fa fa-angle-right"></i>
											</a>
										</div>
									</li>
								</ul></li>
						</ul>
					</nav>
				</div>
			</div>
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>주문하기</h3>
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
					
					 <form id="formTag" class="form-horizontal form-label-left input_mask" action="insertorder.do" method="post">
					<input type="hidden" name="emp_no" value="${loginEmp.emp_no }"/>
										
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>거래처 정보</h2>
									
								<!-- client modal start -->
									<div style="text-align:right">
									<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".cl-example-modal-lg">거래처선택</button>
									</div>
									<!-- 고객 모달 검색창... -->
									<div class="modal fade cl-example-modal-lg" tabindex="-1"
										id="searchModal" role="dialog" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">

												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal">
														<span aria-hidden="true">×</span>
													</button>
													<h4 class="modal-title" id="myModalLabel">거래처</h4>
												</div>
												<div class="modal-body">
													
														<div class="form-group">
															<div class="row">
															<label class="col-sm-2 control-label">거래처명</label>
																<div class="col-sm-10">	
																	<div class="input-group">
																		<input type="text" class="form-control" placeholder="상호명을 입력해주세요." id="searchComName" name="client_company"> <span class="input-group-btn">
																			
																			
																			<button type="button" class="btn btn-primary" onclick="searchCom();">
																				<i class="fa fa-search"></i>
																			</button>
																		</span>
																	</div>
																</div>
															</div>
														</div>
														<div class="row" id="searchResult">
															<table id="table_items" class="table table-striped table-bordered">
																<tr>
																	<th>거래처번호</th>
																	<th>거래처명</th>
																	<th>전화번호</th>
																	<th>주소</th>
																</tr>
																
															</table>
														</div>
													
												</div>
												<!-- <div class="modal-footer">
													<button type="button" class="btn btn-default"
														data-dismiss="modal">Close</button>
													<button type="button" class="btn btn-primary">Save
														changes</button>
												</div> -->

											</div>
										</div>
									</div>
									<!-- client modal end -->
									
									
								</div>
								
								<div class="x_content">
									<br />
									
										
										<div class="form-group">
											<label class="col-sm-3 control-label">거래처명</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input type="text" class="form-control" placeholder="거래처명을 검색해주세요." name="client_name" id="searchComName2" value="">
											</div>
										</div>
										<div class="form-group">
											<label class="col-sm-3 control-label">거래처번호</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input type="text" class="form-control" placeholder="거래처 번호" name="client_no" id="clientNo">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">담당자</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input type="text" class="form-control" placeholder="담당직원" id="searchEmpName" value="" name="emp_name">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">전화번호</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input type="text" class="form-control" placeholder="연락처" id="searchClientPhone" value="" name="client_phone">
											</div>
										</div>
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">주소</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input type="text" class="form-control" id="searchClientAddr" value="" placeholder="주소">
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
								<!-- product modal start -->
									<div style="text-align:right">
									
									<button type="button" class="btn btn-primary"data-toggle="modal" data-target=".bs-example-modal-lg" >품목추가</button>
									</div>
									<div class="modal fade bs-example-modal-lg" tabindex="-1"
										id="searchModal2" role="dialog" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">

												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal">
														<span aria-hidden="true">×</span>
													</button>
													<h4 class="modal-title" id="myModalLabel">품목</h4>
												</div>
												<div class="modal-body">
									<!--       -->				
														<div class="form-group">
															<div class="row">
															<label class="col-sm-2 control-label">품목명</label>
																<div class="col-sm-10">	
																	<div class="input-group">
																		<input type="text" class="form-control" placeholder="제품명을 입력해주세요." id="searchProductName" name="product_name"> <span class="input-group-btn">
																			<button type="button" class="btn btn-primary" onclick="searchProduct();">
																				<i class="fa fa-search"></i>
																			</button>
																		</span>
																	</div>
																</div>
															</div>
														</div>
														<div class="row" id="searchProductList">
															<table id="table_items" class="table table-striped table-bordered">
																<tr>
																	<th>품번</th>
																	<th>제품명</th>
																	<th>단가</th>
																	<th>선택</th>
																</tr>
																
															
															</table>
														</div>
													
													
												</div>
												<div class="modal-footer">
													<button type="button" class="btn btn-default"
														data-dismiss="modal">Close</button>
													
												</div>

											</div>
										</div>
									</div>
									<!-- product modal end -->
									

									<table class="table table-striped table-bordered">
										<thead>
											<tr>
												<th style="width: 16%;">제품번호</th>
												<th style="width: 29%;">제품명</th>
												<th style="width: 15%;">수량</th>
												<th style="width: 29%;">단가</th>
												<th style="width: 6%;">삭제</th>
											</tr>
										</thead>
										<tbody class="order_body">
										</tbody>	
										<!-- <thead>
											<tr>
												<th>제품번호</th>
												<th>제품명</th>
												<th>단가</th>
												<th>수량</th>
												<th>삭제</th>
											</tr>
										</thead>
										<tbody id="order_tbody">
											<tr>
												<td>21549871</td>
												<td>예가체프 아라비카 500g</td>
												<td><input type="text" name="order_amount" class="form-control" value="13,000"/></td>
												<td><input type="number" name="order_amount" class="form-control" min="1"/></td>
												<td><button class="btn btn-danger btn-order">&nbsp;&nbsp;<i class="fa fa-trash-o"></i>&nbsp;&nbsp;</button></td>
											</tr>
										<tbody> -->
									</table>
									<table class="table table-striped table-bordered">
									<tr>
									<td style="width: 63.2%;">합계</td>
							
									<td><input type="number" id="calcValue" readonly></td>
									</tr>
									</table>
								
									<div class="ln_solid"></div>
									<div class="col-md-12 col-sm-12 col-xs-12 col-md-offset-3" style="margin:0px; text-align:right">											
											<button type="submit" class="btn btn-success" onclick="noticeAlert();">주문</button>
									</div>
								</div>
							</div>
						</div>
					
					
					</div>
					 </form> 
				</div>
			</div>
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