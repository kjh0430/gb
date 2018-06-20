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



<!-- Custom Theme Style -->
<link href="resources/build/css/custom.min.css" rel="stylesheet">
<link href="resources/css/main.css" rel="stylesheet">

<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<style type="text/css">
   .table > tbody > tr > td{
      vertical-align:middle;
   }
   .btn-order{
      padding:3px 6px;
   }

	.jSignature{
		width: 200px;
		height: 100px;
	}
	.client_resetBtn{ cursor: pointer;}
	.emp_resetBtn{ cursor: pointer;}
	
</style>

<script type="text/javascript">


	function addFile(){
		var index=1;
		var value="<li id='cFile-"+index+"' class='added'><input type='file' class='form-control' name='client_file'>"
		+"<a href='javascript:delFile(\"cFile-"+index+"\")' title='삭제'>&nbsp;&nbsp;<i class='fa fa-times'></i></a></li>";
		$(".c_file").append(value);
		index++;
	};
	
	function delFile(idx){
		$("#"+idx).remove();
	}
	
	function resetFile(){
		$("#firstFile").val("");
	}
	
	
</script>

<script type="text/javascript">
	$(function(){
		document.getElementById("contact_date_start").valueAsDate = new Date();		
		//selectVisit();	
	});
</script>
<script type="text/javascript">

$(function(){
	
	 $('#contract_date_end').blur(function(){
		 
		 ckModistartDate=$('#contact_date_start').val();
		 sArr=ckModistartDate.split('-');

		 ckModiendDate=$('#contract_date_end').val();
		 eArr=ckModiendDate.split('-');

		 start1 =new Date(sArr[0],parseInt(sArr[1])-1,sArr[2]);
		 end1 =new Date(eArr[0],parseInt(eArr[1])-1,eArr[2]);
		 
		 
		if(start1.getTime()>end1.getTime()){
			alert("입력날짜가 유효하지 않습니다.");
		}
	 });
	
});

function checkCondition(){
	var checkCondition=false;
	

	contract_money=$('#contract_money').val();
	contract_discount=$('#contract_discount').val();
	contact_date_start=$('#contact_date_start').val();
	contract_date_end=$('#contract_date_end').val();
	business_no=$('#business_no').val();
	clientSign=$('#clientSign').val();
	empSign=$('#empSign').val();
	
	if(contract_money==null || contract_money==""){
		alert("계약금액을 입력해주세요.");
		checkCondition=false;
		return checkCondition;
	}else if(contract_discount==null || contract_discount==""){
		alert("할인율을 입력해주세요.");
		checkCondition=false;
		return checkCondition;
	}else if(contact_date_start==null || contact_date_start==""){
			alert("계약 시작 날짜를 입력해주세요.");
			checkCondition=false;
			return checkCondition;
	}else if(contract_date_end==null || contract_date_end==""){
			alert("계약 종료 날짜를 입력해주세요.");
			checkCondition=false;
			return checkCondition;
	}else if(business_no==null || business_no==""){
		alert("사업자 번호를 입력해주세요.");
		checkCondition=false;
		return checkCondition;
	}else if(clientSign==null || clientSign=="" || empSign==null || empSign==""){
		alert("누락된 사인이 있습니다.");
		checkCondition=false;
		return checkCondition;
	}elss if(contract_money!=null && contract_discount!=null && contact_date_start!=null && contract_date_end!=null
			 && business_no!=null && clientSign!=null && empSign!=null ){
		checkCondition=true;
		return checkCondition;
	}
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
                     <h3>계약</h3>
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
               <div class="row">
                  <div class="col-md-12 col-sm-12 col-xs-12">
                     <div class="x_panel">
                        <div class="x_title">
                           <h2>거래처</h2>
                           <!-- client modal start -->
                           <div style="text-align:right">
                           <br><br>
                           <!-- <button type="button" class="btn btn-primary"data-toggle="modal" data-target=".cl-example-modal-lg">거래처선택</button> -->
                           </div>
                           <div class="modal fade cl-example-modal-lg" tabindex="-1"
                              role="dialog" aria-hidden="true">
                              <div class="modal-dialog modal-lg">
                                 <div class="modal-content">

                                    <div class="modal-header">
                                       <button type="button" class="close" data-dismiss="modal">
                                          <span aria-hidden="true">×</span>
                                       </button>
                                       <h4 class="modal-title" id="myModalLabel">거래처</h4>
                                    </div>
                                    <div class="modal-body">
                                       
                                       <form class="form-horizontal form-label-left input_mask">
                                          <div class="form-group">
                                             <div class="row">
                                             <label class="col-sm-2 control-label">거래처명</label>
                                                <div class="col-sm-10">   
                                                   <div class="input-group">
                                                      <input type="text" class="form-control"> <span class="input-group-btn">
                                                         <button type="button" class="btn btn-primary">
                                                            <i class="fa fa-search"></i>
                                                         </button>
                                                      </span>
                                                   </div>
                                                </div>
                                             </div>
                                          </div>
                                          <div class="row">
                                             <table id="table_items" class="table table-striped table-bordered">
                                                <tr>
                                                   <th>사업자 등록 번호</th>
                                                   <th>거래처명</th>
                                                   <th>전화번호</th>
                                                   <th>주소</th>
                                                </tr>
                                                <tr>
                                                   <td><a href="#">11548-9865-695</a></td>
                                                   <td>프로젝트 413</td>
                                                   <td>070-4587-8569</td>
                                                   <td>서울특별시 강남구 역삼1동 논현로97길 19-11</td>
                                                </tr>
                                                <tr>
                                                   <td><a href="#">11548-9865-695</a></td>
                                                   <td>프로젝트 413</td>
                                                   <td>070-4587-8569</td>
                                                   <td>서울특별시 강남구 역삼1동 논현로97길 19-11</td>
                                                </tr>
                                                <tr>
                                                   <td><a href="#">11548-9865-695</a></td>
                                                   <td>프로젝트 413</td>
                                                   <td>070-4587-8569</td>
                                                   <td>서울특별시 강남구 역삼1동 논현로97길 19-11</td>
                                                </tr>                                             
                                             </table>
                                          </div>
                                       </form>
                                       
                                    </div>
                                    <div class="modal-footer">
                                       <button type="button" class="btn btn-default"
                                          data-dismiss="modal">Close</button>
                                       <button type="button" class="btn btn-primary">Save
                                          changes</button>
                                    </div>

                                 </div>
                              </div>
                           </div>
                           <!-- client modal end -->
                        </div>
                        <div class="x_content">                                                   
                           <form class="form-horizontal form-label-left input_mask">
                           			
                              <div class="form-group">
                                 <label class="col-sm-3 control-label">거래처명</label>
                                 <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" class="form-control" 
                                    value="${ detailClient.client_company }" readonly>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label class="control-label col-md-3 col-sm-3 col-xs-12">담당자</label>
                                 <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" class="form-control" 
                                    value="${ detailClient.client_name }" readonly>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label class="control-label col-md-3 col-sm-3 col-xs-12">전화번호</label>
                                 <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" class="form-control" 
                                    value="${ detailClient.client_phone }" readonly>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label class="control-label col-md-3 col-sm-3 col-xs-12">주소</label>
                                 <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" class="form-control" 
                                    value="${ detailClient.client_addr }" readonly>
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
                           <h2>
                              계약내용
                           </h2>
                           <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                           <form class="form-horizontal form-label-left input_mask"
                           	action="insertContract.do" method="post" onsubmit="return checkCondition();">
                           
                           <input type="hidden" name="emp_no" value="${ detailClient.emp_no }">
                           <input type="hidden" name="client_no" value="${ detailClient.client_no }">	
                           	
                              <div class="form-group">
                                 <label class="col-sm-3 control-label">계약금액</label>
                                 <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="number" class="form-control"  id="contract_money"
                                    placeholder="최소 500,000" name="contract_money" required>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label class="control-label col-md-3 col-sm-3 col-xs-12">할인율 (%)</label>
                                 <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="number" class="form-control" 
                                    placeholder="기본 10%" name="contract_discount" id="contract_discount"  required>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label class="control-label col-md-3 col-sm-3 col-xs-12">계약 시작일</label>
                                 <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="date" class="form-control" 
                                    id="contact_date_start" name="contract_date_start" required>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label class="control-label col-md-3 col-sm-3 col-xs-12">계약 종료일</label>
                                 <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="date" class="form-control" 
                                    name="contract_date_end" id="contract_date_end" required>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label class="control-label col-md-3 col-sm-3 col-xs-12">사업자등록번호</label>
                                 <div class="col-md-9 col-sm-9 col-xs-12">
                                    <input type="text" class="form-control" 
                                    placeholder="사업자등록번호" name="business_no" id="business_no" required>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                 주문자 서명 &nbsp; 
                                 <a href="javascript:clientReset();">reset</a></label>
                                 
                                <span id="clientSignature_input"></span>
                                	<input type="hidden" id="clientSign" name="client_Sign" required>
							     
                              </div>
                              <div class="form-group">
                                 <label class="control-label col-md-3 col-sm-3 col-xs-12">
                                 납품자 서명 &nbsp; 
                                 <a href="javascript:empReset();">reset</a></label>
                                 
                                 <span id="empSignature_input"></span>
                                	<input type="hidden" id="empSign" name="emp_Sign" required>
                                 
                              </div>
                            <!-- <div class="form-group">
								<label class="control-label col-md-3 col-sm-3 col-xs-12">
									첨부파일
								</label>
								<div class="col-md-6 col-sm-6 col-xs-12" >
								<ul class="c_file">
									<li id="cFile-0">
										<input type="file" id="firstFile" name="client_file" onchange="firstChange()" class="form-control">
										<span class="fileSpan"></span>	
										<input type="button" class="btn btn-dark add_btn" onclick="addFile()" value="추가"/>
									</li>
								</ul>								
								</div>
							</div> -->
                    
                           
                           <div class="ln_solid"></div>
                           <div class="col-md-12 col-sm-12 col-xs-12 col-md-offset-3" style="margin:0px">
                                 <button id="cancelContractBtn" type="button" class="btn btn-primary">취소</button>
                                 <button id="firmContractBtn" type="submit" class="btn btn-success">확인</button>
                           </div>
                           
                           </form>
                               
                           
                        </div>
                     </div>
                  </div>
               
               
               </div>

            </div>
         </div>
      </div>
   </div>

   <!-- /page content -->
   	<!-- jQuery -->
	<script src="resources/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="resources/build/js/custom.min.js"></script>

	 <!-- 서명관련 스크립트 시작-->
   <script src="resources/jSignature/jSignature.min.js"></script>
 
	<script>
	
	    $(document).ready(function() {
	        $("#clientSignature_input").jSignature();
	        $("#empSignature_input").jSignature();
	       		
	        
	        $('#firmContractBtn').on('click', function(){
	        	
	        	var clientSign = $("#clientSignature_input").jSignature("getData", "svgbase64");
	        	var empSign = $("#empSignature_input").jSignature("getData", "svgbase64");
	        	
	        	//$('#clientSign').val(cimg.src);
	        	//$('#empSign').val(eimg.src);
	        	$('#clientSign').val(clientSign[0]+","+clientSign[1]);
	        	$('#empSign').val(empSign[0]+","+empSign[1]);
	        	
	        
	        });
	    });
	    
		function clientReset(){
        	$("#clientSignature_input").jSignature("reset");
		}	        
        function empReset(){
        	$("#empSignature_input").jSignature("reset");
        }
	        
	        
	    $('#cancelContractBtn').on('click', function(){
	    	history.go(-1);
	    });
	    
	</script>
	<!-- 서명관련 스크립트 끝 -->
</body>
</html>