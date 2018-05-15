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
	          <li><a href="addClient.do">고객등록</a></li>
	          <li><a href="clientList.do">고객목록</a></li>
	          <li><a href="poList.do">잠재고객</a></li>
	          <li><a href="contract.do">계약</a></li>
	        </ul>
	      </li>
	      <li><a><i class="fa fa-table"></i> 영업현황 <span class="fa fa-chevron-down"></span></a>
	        <ul class="nav child_menu">
	          <li><a href="accountList.do">거래처</a></li>
	          <li><a href="orderList.do">발주리스트</a></li>
	          <li><a href="tables_dynamic.html">매출현황</a></li>
	          <li><a href="tables_dynamic.html">방문일지</a></li>
	        </ul>
	      </li>
	      <li><a><i class="fa fa-edit"></i> 영업관리 <span class="fa fa-chevron-down"></span></a>
	        <ul class="nav child_menu">
	          <li><a href="form.html">제품관리</a></li>
	          <li><a href="form_advanced.html">목표관리</a></li>
	          <li><a href="form_advanced.html">영업일지</a></li>
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
	          <li><a href="electro.do">결재신청</a></li>
	          <li><a href="chart.do">결재목록</a></li>
	         <!--  <li><a href="projects.html">월간보고</a></li> -->
	        </ul>
	      </li>
	      
	       
	      </li>
	      <!-- <li><a><i class="fa fa-cog"></i> 설정</a> -->
	      </li>
	      
	    </ul>
	  </div>
	
	</div>
	<div class="sidebar-footer hidden-small">
	  
	</div>


</body>
</html>