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
<!-- <script type="text/javascript">
	$(document).ready(function() {
		$('#table_cl').dataTable({
			ordering : false,
			lengthChange : false,
			pageLength : 15
		});
	});
</script>  -->

<script type="text/javascript">

$(function(){
	
/* if("${loginEmp==null}"){
	location.href="view.do";
} */

var allCheck=false;

$('#emp_phone').blur(function(){
	
	var emp_phone = $('#emp_phone').val();
	var phone_check = /^\d{3}-\d{3,4}-\d{4}$/;
	
	if(emp_phone.match(phone_check) == null){
		alert("올바른 전화번호 형식이 아닙니다.ex)010-1234-5678");
		allCheck=false;
		return allCheck;
	}else{
		
		$.ajax({
			url : "checkPhone.do",
			type: "post",
			dataType: "json",
			data: {
				emp_phone : $('#emp_phone').val()
			},
			success:function(data){
				if(data.check=="N" && $('#emp_phone').val()!="" && $('#emp_phone').val()!=null){
					/* alert("사용가능한 번호 입니다."); */					
				}else if(data.check=="Y"){
					alert("이미 사용되고 있는 번호 입니다.");
				}
			}
		
	});
		
	}

});

$('#emp_email').blur(function(){
	
	var emp_email = $('#emp_email').val();
	var email_check = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if(emp_email.match(email_check) == null){
		alert("올바른 e-mail 형식이 아닙니다.");
		allCheck=false;
		return allCheck;
	}else{
	
	$.ajax({
		url : "checkEmail.do",
		type: "post",
		dataType: "json",
		data: {
			emp_email : $('#emp_email').val()
		},
		success:function(data){
			if(data.check=="N" && $('#emp_email').val()!="" && $('#emp_email').val()!=null){
				/* alert("사용가능한 e-mail 입니다."); */					
			}else if(data.check=="Y"){
				alert("이미 사용되고 있는 e-mail 입니다.");
			}
		}
	
});
	
	}

});

$('#job_no').blur(function(){
	console.log("job_no : " + $('#job_no').val());
	if($('#job_no').val()==3){
		$('#emp_mgr').val(0);
	}
});

	
});

function Regiemp(){	
		
	var emp_name = $('#emp_name').val();
	var emp_pwd = $('#emp_pwd').val();	
	var emp_addr = $('#emp_addr').val();
	var emp_phone = $('#emp_phone').val();
	var job_no = $('#job_no').val();
	var emp_email = $('#emp_email').val();
	var emp_mgr = $('#emp_mgr').val();
	var city = $('#city').val();
	var county = $('#county').val();
	var village = $('#village').val();
	var dept_no = $('#dept_no').val();
	
	var en1 = new RegExp("[A-Z]");
	var en2 = new RegExp("[a-z]");
	var num = new RegExp("[0-9]");
	var phone_check = /^\d{3}-\d{3,4}-\d{4}$/;
	var email_check = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	var pwd_pattern= /^[A-Za-z0-9]{5,10}$/; //숫자와 문자 포함 형태의  5에서 10자리 비밀번호
	
	if(emp_name.length < 1){
		alert("사원이름을 입력해주세요.");
		allCheck=false;
		return allCheck;
	}if(!pwd_pattern.test(emp_pwd)){
		alert("비밀번호는 숫자, 문자 포함 5~10 자리 입니다.");
		allCheck=false;
		return allCheck;
	}if(emp_addr.length < 1){
		alert("주소를 입력해주세요.");
		allCheck=false;
		return allCheck;
	}if(emp_phone.length < 1){
		alert("연락처를 입력해주세요.");
		allCheck=false;
		return allCheck;
	}if(emp_email.length < 1){
		alert("e-mail을 입력해주세요.");
		allCheck=false;
		return allCheck;
	}if(emp_mgr.length == 0){
		alert("상사번호를 입력해주세요.");
		allCheck=false;
		return allCheck;
	}if(!num.test(emp_mgr)){
		alert("상사번호는 숫자만 입력할 수 있습니다.");
		allCheck=false;
		return allCheck;
	}
	if(emp_name.length > 1 && pwd_pattern.test(emp_pwd) && emp_addr.length > 1 && emp_phone.length > 1 && emp_email.length > 1 && emp_mgr.length != 0 && num.test(emp_mgr)){
				
		 $.ajax({
    		url : "empinsert.do",
    		type: "post",
    		dataType: "json",
    		data: {
    			emp_name : emp_name,
    			emp_pwd : emp_pwd,    			
    			emp_addr : emp_addr,
    			emp_phone : emp_phone,
    			job_no : job_no,
    			emp_email : emp_email,
    			emp_mgr : emp_mgr,
    			city : city,
    			county : county,
    			village : village,
    			dept_no : dept_no											    			
    		},
    		success:function(obj){
    				alert("사원이 등록 되었습니다.");
    				location.href="empList.do?page=1";    			
    			},
    			error: function(request, status, errorData){
    				console.log("error code : " + request.status + "\n"
    						+ "message : " + request.responseText + "\n"
    						+ "error : " + errorData);
    				
    			}
    		});		
	}
	
}
</script>

<script type="text/javascript">

function mgrList(){
	
	var job_no2 = $('#job_no option:selected').val();
	console.log("job_no2 : " + job_no2);
	
	$.ajax({
		url: "selectMgrList.do",
		type : "post",
		data: {
			job_no2 : job_no2										    			
		},
		dataType : "json",
		success : function(obj){
			console.log("selectMgrList.do 실행");			
			var objStr = JSON.stringify(obj);
			var jsonObj = JSON.parse(objStr);
			var outValues = "<table id='mgrTable'><tr><th style='text-align:center;'>직급</th><th style='text-align:center;'>사원번호</th><th style='text-align:center;'>사원이름</th></tr>";
			
			if(job_no2 == 3){
				outValues += "<tr><td id='mgrList3' colspan='3'>결과가 존재하지 않습니다.</td></tr>";
			}else{
				for(var i in jsonObj.mgrList){
					if(job_no2 == 1){
					outValues += "<tr onclick='selectMgrNo(this);'><td>팀장</td><td>" + jsonObj.mgrList[i].emp_no + "</td><td>" 
					+ decodeURIComponent(jsonObj.mgrList[i].emp_name) + "</td></tr>";
					}else if(job_no2 == 2){
					outValues += "<tr onclick='selectMgrNo(this);'><td>관리자</td><td>" + jsonObj.mgrList[i].emp_no + "</td><td>" 
					+ decodeURIComponent(jsonObj.mgrList[i].emp_name) + "</td></tr>";	
					}
				}
			}
			
			outValues += "</table>";
			
			console.log("outValues : " + outValues);
			
			$("#mgrTable").html(outValues);
		},
		error: function(request, status, errorData){
			console.log("error code : " + request.status + "\n"
					+ "message : " + request.responseText + "\n"
					+ "error : " + errorData);
			}
		
	});    
};

function selectMgrNo(obj){
	var tr = $(obj);
	var td = tr.children();
	
	var emp_no = td.eq(1).text();
	var emp_name = td.eq(2).text();
	
	$('#mgrModal').modal('hide');	
	$('#emp_mgr').val(emp_no);
	
}


</script>

<style type="text/css">
#mgrTable{
text-align:center;
}
</style>

</head>

<body class="nav-md">
<c:if test="${empty loginEmp}">
</c:if>
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
							<h3>인사관리</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>사원등록</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">									
									
					<!-- 사원 등록 -->
					<form class="form-horizontal form-label-left">
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">이름 *</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="emp_name" name="emp_name" type="text" placeholder="사원이름">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">비밀번호 *</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="emp_pwd" name="emp_pwd" type="password" placeholder="비밀번호">
                        </div>
                      </div>                      
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">주소 *</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="emp_addr" name="emp_addr" type="text"  placeholder="사원거주지">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">연락처 *</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                         <input class="form-control" id="emp_phone" name="emp_phone" type="tel" placeholder="연락처">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">직급 *</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <select class="form-control" id="job_no" name="job_no">
                            <option value="1">사원</option>
                            <option value="2">팀장</option>
                            <option value="3">관리자</option>                         
                          </select>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">이메일 *</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="emp_email" name="emp_email" type="email" placeholder="이메일">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">상사번호</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control col-md-7 col-xs-12" id="emp_mgr" name="emp_mgr" type="text" placeholder="상사번호" style="width:70%;">
                          <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm" style="float:right;" onclick="mgrList()">조회</button>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">담당지역</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="city" name="city" type="text" placeholder="시">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="county" name="county" type="text" placeholder="구">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="village" name="village" type="text" placeholder="동">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">부서 *</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <select class="form-control" id="dept_no" name="dept_no">
                            <option value="1">영업1팀</option>
                            <option value="2">영업2팀</option>
                            <option value="3">관리자</option>                       
                          </select>
                        </div>
                      </div>
                             
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">
                        <c:choose>
			            	<c:when test="${ loginEmp.job_no == 3}">
					            <button class="btn btn-success" type="button" onclick="Regiemp()">등록</button>
			            	</c:when>
			            	<c:otherwise>
								<button class="btn btn-success" type="button" onclick="Regiemp()" disabled>등록</button>
			            	</c:otherwise>
			            </c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../etc/footer.jsp" %>
	</div>	
	
	<!-- modal -->
	<div class="modal fade bs-example-modal-sm" id="mgrModal" tabindex="-1" role="dialog" aria-hidden="true">
       <div class="modal-dialog modal-sm">
          <div class="modal-content">

             <div class="modal-header">
             <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
             </button>
             <h4 class="modal-title" id="myModalLabel">사원조회</h4>
             </div>
             <div class="modal-body" style="overflow-y:auto; overflow-x:hidden; height:400px;">
             <table class="table table-hover" id="mgrTable">
             </table>
             </div>
             <div class="modal-footer">
             </div>

           </div>
       </div>
    </div>
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