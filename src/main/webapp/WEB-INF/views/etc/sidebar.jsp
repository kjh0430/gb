<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sidebar</title>
<style>
	.count_badge{
		margin-left:4px;
	}
</style>
<script src="resources/js/EventSource.js"></script>
</head>
<body>

	<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
	  <div class="menu_section">
	   
	    <ul class="nav side-menu">
	      <li><a href="mainView.do"><i class="fa fa-home"></i> Home</a></li>
	      <li><a><i class="fa fa-desktop"></i> 고객관리 <span class="fa fa-chevron-down"></span></a>
	        <ul class="nav child_menu">	          
	          <li><a href="addClient.do">고객등록</a></li>
	          <li><a href="clientList.do">고객목록</a></li>
	          <li><a href="poList.do">잠재고객</a></li>
	          <li><a href="contractList.do?emp_no=${ loginEmp.emp_no }">계약</a></li>
	        </ul>
	      </li>
	      <li><a><i class="fa fa-table"></i> 영업현황 <span class="fa fa-chevron-down"></span></a>
	        <ul class="nav child_menu">
	          <li><a href="accountList.do?emp_no=${loginEmp.emp_no}&page=1&job_no=${loginEmp.job_no}&client_company=null">거래처</a></li>
	          <li><a href="selectOrderClient.do?emp_no=${loginEmp.emp_no}">발주하기</a>
	          <li><a href="orderList.do?emp_no=${loginEmp.emp_no}&page=1&client_company=null">매출현황</a></li>
	          <li><a href="visit.do">방문일지</a></li>
	        </ul>
	      </li>
	      <li><a><i class="fa fa-edit"></i> 영업관리 <span class="fa fa-chevron-down"></span></a>
	        <ul class="nav child_menu">


	          <li><a href="productList.do?page=1">제품관리</a></li>
	          <li><a href="MovegoalState.do">목표현황</a></li>
	          <li><a href="moveDailyReport.do">영업일지</a></li>


	        </ul>
	      </li>
	       <li><a href="noticeList.do?page=1"><i class="fa fa-file-text-o"></i> 공지사항</a></li>
	    </ul>
	  </div>
	  <div class="menu_section">
	    <h3>MY PAGE</h3>
	    <ul class="nav side-menu">
	      <li><a><i class="fa fa-file-text-o"></i> 전자결재 <span class="fa fa-chevron-down"></span></a>
	        <ul class="nav child_menu">
	          <li><a href="approval.do">결재신청</a></li>
	          <li><a href="approvalListE.do?emp_no=${loginEmp.emp_no}">결재목록</a></li>
	        </ul>
	      </li>
	      
	       <li><a href="messageList.do"><i class="fa fa-file-text-o"></i> 쪽지함 <span class="count_badge badge bg-green"></span></a>
	      </li>
	      
	      
	    </ul>
	  </div>
	
	</div>
	<div class="sidebar-footer hidden-small">
	  
	</div>
	<script type="text/javascript">
	$(function(){
		
	})
	var emp_no = ${loginEmp.emp_no};
	var EventSource2 = new EventSource("count.do?emp_no="+emp_no);
	EventSource2.onopen = function(){
		//console.log("연결중2");		
	}
	EventSource2.onmessage = function(event) {

		var count = event.data;
		if(count>0){
			$(".count_badge").html(count);		
		}else{
			$(".count_badge").css("display","none");
		}
		

	};
	
	</script>


</body>
</html>