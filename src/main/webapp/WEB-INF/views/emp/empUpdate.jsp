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
    $('#table_cl').dataTable( {
        ordering:false,
        lengthChange:false,
        pageLength:15
    } );
} );
</script>
<style type="text/css">
table tr th, table tr td
{ 
	/* font-size: 15px;
	margin: 10px 0 30px 0; */
}
</style>

<script type="text/javascript">

function mgrList(){
	$.ajax({
		url: "selectMgrList.do",
		type : "post",
		dataType : "json",
		success : function(obj){
			console.log("selectMgrList.do 실행");
			var objStr = JSON.stringify(obj);
			var jsonObj = JSON.parse(objStr);
			var outValues = "<table id='mgrTable'><tr><th style='text-align:center;'>사원번호</th><th style='text-align:center;'>사원이름</th></tr>";
			
			for(var i in jsonObj.mgrList){
				outValues += "<tr onclick='selectMgrNo(this);'><td>" + jsonObj.mgrList[i].emp_no + "</td><td>" 
				+ decodeURIComponent(jsonObj.mgrList[i].emp_name) + "</td></tr>";
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
	
	var emp_no = td.eq(0).text();
	var emp_name = td.eq(1).text();
	
	$('#mgrModal').modal('hide');
	$('#emp_mgr').val(emp_no);
	
}

function empUpdate(){
	
	var emp_pwd = $('#emp_pwd').val();
	
	var pwd_pattern= /^[A-Za-z0-9]{5,10}$/; //숫자와 문자 포함 형태의  5에서 10자리 비밀번호
	
	if(emp_pwd==null && password1==""){
		alert("password를 입력해주세요!")
		allCheck=false;
		return allCheck;
	 }
	 if(!pwd_pattern.test(emp_pwd)){
		alert("비밀번호는 숫자,문자 포함 5~10자리 입니다.");
		allCheck=false;
		return allCheck; 
	}

	if(pwd_pattern.test(password1)){		
		alert("수정이 완료 되었습니다.");
		allCheck=true;
		return allCheck;		
	}
}

function backMyInfo(){
	  location.href="empDetail.do?emp_no="+""+${ emp.emp_no }+"";
}

</script>

<style type="text/css">
#mgrTable{
text-align:center;
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
							<h3>
								인사관리
							</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<font style="font-size:18px;">정보수정</font>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
								
								
					<!-- 사원 수정폼 -->
					<form class="form-horizontal form-label-left" action="empupdate.do" method="post" onsubmit="return empUpdate();">	
					 <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">사원번호</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="emp_no" name="emp_no" type="text" value="${ emp.emp_no }" readonly>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">비밀번호</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="emp_pwd" name="emp_pwd" type="password" value="">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">이름</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="emp_name" name="emp_name" type="text" value="${ emp.emp_name }">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">주소</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="emp_addr" name="emp_addr" type="text" value="${ emp.emp_addr }">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">연락처</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="emp_phone" name="emp_phone" type="tel" value="${ emp.emp_phone }">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">직급</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        <c:choose>
            				<c:when test="${ emp.job_no == 1 }">
            					<select class="form-control" id="job_no" name="job_no">
                           	 		<option value="1" selected>사원</option>
                            		<option value="2">팀장</option>
                            		<option value="3">관리자</option>                         
                          		</select>		        		   
            				</c:when>
            				<c:when test="${ emp.job_no == 2 }">
            					<select class="form-control" id="job_no" name="job_no">
                           	 		<option value="1">사원</option>
                            		<option value="2" selected>팀장</option>
                            		<option value="3">관리자</option>                         
                          		</select>		        		   
            				</c:when>
            				<c:when test="${ emp.job_no == 3 }">
            					<select class="form-control" id="job_no" name="job_no">
                           	 		<option value="1">사원</option>
                            		<option value="2">팀장</option>
                            		<option value="3" selected>관리자</option>                         
                          		</select>					
            				</c:when>
            			</c:choose>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">이메일</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="emp_email" name="emp_email" type="email" value="${ emp.emp_email }">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">상사번호</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control col-md-7 col-xs-12" id="emp_mgr" name="emp_mgr" type="text" value="${ emp.emp_mgr }" style="width:85%;">
                          <button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm" style="float:right;" onclick="mgrList()">조회</button>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">입사일</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="emp_hiredate" name="emp_hiredate" type="date" value="${ emp.emp_hiredate }">
                        </div>
                      </div>
                      <%-- <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">퇴사일</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
            			  <input class="form-control" id="emp_firedate" name="emp_firedate" type="text" value="${ emp.emp_firedate }">              
                        </div>
                      </div> --%>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">담당지역</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="city" name="city" type="text" value="${ emp.city }">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="county" name="county" type="text" value="${ emp.county }">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12"></label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                          <input class="form-control" id="village" name="village" type="text" value="${ emp.village }">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">부서</label>
                        <div class="col-md-6 col-sm-6 col-xs-12">
                        <c:choose>
            				<c:when test="${ emp.dept_no == 1 }">
            					<select class="form-control" id="dept_no" name="dept_no">
                           			<option value="1" selected>영업1팀</option>
                            		<option value="2">영업2팀</option>
                            		<option value="3">관리자</option>                       
                          		</select>		        		   
            				</c:when>
            				<c:when test="${ emp.dept_no == 2 }">
            					<select class="form-control" id="dept_no" name="dept_no">
                           	 		<option value="1">영업1팀</option>
                            		<option value="2" selected>영업2팀</option>
                            		<option value="3">관리자</option>                         
                          		</select>		        		   
            				</c:when>
            				<c:when test="${ emp.dept_no == 3 }">
            					<select class="form-control" id="dept_no" name="dept_no">
                           	 		<option value="1">영업1팀</option>
                            		<option value="2">영업2팀</option>
                            		<option value="3" selected>관리자</option>                         
                          		</select>					
            				</c:when>
            			</c:choose>
                        </div>
                      </div>
                             
                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                          <button class="btn btn-success" type="submit">수정</button>                    
                          <button class="btn btn-primary" type="button" onclick="backMyInfo()">취소</button>                     
                        </div>
                      </div>
					</form>
                  </div>
                </div>
              </div>
									
			  <!-- <div class="col-md-12 col-sm-6 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>접촉이력</h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th>접촉일</th>
                          <th>접촉구분</th>
                          <th>접촉내용</th>
                        </tr>
                      </thead>
                      <tbody>
                        <tr>
                          <td>2018/05/05</td>
                          <td></td>
                          <td></td>
                        </tr>
                      </tbody>
                    </table>

                  </div>
                </div>
              </div> -->
									
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- /page content -->
	
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
             <!-- <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
             <button type="button" class="btn btn-primary">등록</button> -->
             </div>

           </div>
       </div>
    </div>
	<!-- /page content -->

	
	</div>
	</div>

	<!-- jQuery -->
	<script src="resources/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script src="resources/vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script src="resources/vendors/nprogress/nprogress.js"></script>
	<!-- iCheck -->
	<script src="resources/vendors/iCheck/icheck.min.js"></script>
	<!-- Datatables -->
	<script
		src="resources/vendors/datatables.net/js/jquery.dataTables.min.js"></script>
	<script
		src="resources/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
	<script
		src="resources/vendors/datatables.net-buttons/js/dataTables.buttons.min.js"></script>
	<script
		src="resources/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js"></script>
	<script
		src="resources/vendors/datatables.net-buttons/js/buttons.flash.min.js"></script>
	<script
		src="resources/vendors/datatables.net-buttons/js/buttons.html5.min.js"></script>
	<script
		src="resources/vendors/datatables.net-buttons/js/buttons.print.min.js"></script>
	<script
		src="resources/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js"></script>
	<script
		src="resources/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js"></script>
	<script
		src="resources/vendors/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="resources/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js"></script>
	<script
		src="resources/vendors/datatables.net-scroller/js/dataTables.scroller.min.js"></script>
	<script src="resources/vendors/jszip/dist/jszip.min.js"></script>
	<script src="resources/vendors/pdfmake/build/pdfmake.min.js"></script>
	<script src="resources/vendors/pdfmake/build/vfs_fonts.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="resources/build/js/custom.min.js"></script>

</body>
</html>