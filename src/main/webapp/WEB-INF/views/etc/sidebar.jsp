<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sidebar</title>
</head>
<body>

	<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
	  <div class="menu_section">
	   
	    <ul class="nav side-menu">
	      <li><a href="main.html"><i class="fa fa-home"></i> Home</a></li>
	      <li><a><i class="fa fa-desktop"></i> 고객관리 <span class="fa fa-chevron-down"></span></a>
	        <ul class="nav child_menu">
	          <li><a href="MoveaddClient.do">고객등록</a></li>
	          <li><a href="MoveclientList.do">고객목록</a></li>
	          <li><a href="MovepoList.do">잠재고객</a></li>
	          <li><a href="Movecontract.do">계약</a></li>
	        </ul>
	      </li>
	      <li><a><i class="fa fa-table"></i> 영업현황 <span class="fa fa-chevron-down"></span></a>
	        <ul class="nav child_menu">
	          <li><a href="MoveaccountList.do">거래처</a></li>
	          <li><a href="MoveorderList.do">매출현황</a></li>
	          <li><a href="Movevisit.do">방문일지</a></li>
	        </ul>
	      </li>
	      <li><a><i class="fa fa-edit"></i> 영업관리 <span class="fa fa-chevron-down"></span></a>
	        <ul class="nav child_menu">
	          <li><a href="#">제품관리</a></li>
	          <li><a href="MovegoalState.do">목표현황</a></li>
	          <li><a href="MovedailySales.do">영업일지</a></li>
	        </ul>
	      </li>
	    </ul>
	  </div>
	  <div class="menu_section">
	    <h3>MY PAGE</h3>
	    <ul class="nav side-menu">
	      <li><a><i class="fa fa-file-text-o"></i> 전자결재 <span class="fa fa-chevron-down"></span></a>
	        <ul class="nav child_menu">
	          <!-- <li><a href="e_commerce.html">계약제안</a></li> -->
	          <li><a href="Moveapproval.do">결재신청</a></li>
	          <li><a href="MoveapprovalList.do">결재목록</a></li>
	         <!--  <li><a href="projects.html">월간보고</a></li> -->
	        </ul>
	      </li>
	      
	       <li><a href="MovemessageList.do"><i class="fa fa-file-text-o"></i> 쪽지함</a>
	      </li>
	      <!-- </li>
	      <li><a><i class="fa fa-cog"></i> 설정</a>
	      </li> -->
	      
	    </ul>
	  </div>
	
	</div>
	<div class="sidebar-footer hidden-small">
	  
	</div>


</body>
</html>