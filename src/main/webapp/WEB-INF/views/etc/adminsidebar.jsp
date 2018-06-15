<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminsidebar</title>
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
         <li><a><i class="fa fa-desktop"></i>사원관리 <span class="fa fa-chevron-down"></span></a>
         <ul class="nav child_menu">
             <li><a href="goalAdmin.do">목표관리</a></li>
             <li><a href="goalStateAdmin.do">목표현황</a>
             <li><a href="empRegister.do">사원등록</a></li>
             <li><a href="empList.do">사원목록</a></li>
             <li><a href="empSalary.do">사원급여</a></li>
           </ul>
         </li>

         <li><a href="#"><i class="fa fa-table"></i>영업관리<span class="fa fa-chevron-down"></span></a>
            <ul class="nav child_menu">   
             <li><a href="productList.do">제품관리</a></li>
             <li><a href="moveAdminDailyReport.do">영업일지</a></li>
           </ul>
           
         </li>
         <li><a><i class="fa fa-edit"></i>영업현황 <span class="fa fa-chevron-down"></span></a>
           <ul class="nav child_menu">
             <li><a href="accountList.do?emp_no=${loginEmp.emp_no }&job_no=${loginEmp.job_no}&page=1">거래처 목록</a></li>
             <li><a href="orderList.do?emp_no=${loginEmp.emp_no}&page=1">매출현황</a></li>
           </ul>
         </li>
         <li><a><i class="fa fa-clone"></i> 공지사항 <span class="fa fa-chevron-down"></span></a>
           <ul class="nav child_menu">
             <li><a href="noticeList.do?page=1">공지사항</a></li>             
           </ul>
         </li>
       </ul>
     </div>
     <div class="menu_section">
       <h3>MY PAGE</h3>
         <ul class="nav side-menu">
	      <li><a><i class="fa fa-file-text-o"></i> 전자결재 <span class="fa fa-chevron-down"></span></a>
	        <ul class="nav child_menu">
	          <li><a href="approvalListAdmin.do?emp_no=${loginEmp.emp_no}&job_no=${loginEmp.job_no}">결재리스트</a></li>
	         
	        </ul>
	      </li>
	      <li><a href="messageList.do"><i class="fa fa-file-text-o"></i> 쪽지함 <span class="count_badge badge bg-green"></span></a>
	      </li>
	     <!--  <li><a><i class="fa fa-cog"></i> 설정</a> </li> -->
	    </ul>
     </div>
   </div>
   <div class="sidebar-footer hidden-small">
     <a data-toggle="tooltip" data-placement="top" title="Settings">
       <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
     </a>
     <a data-toggle="tooltip" data-placement="top" title="FullScreen">
       <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
     </a>
     <a data-toggle="tooltip" data-placement="top" title="Lock">
       <span class="glyphicon glyphicon-eye-close" aria-hidden="true"></span>
     </a>
     <a data-toggle="tooltip" data-placement="top" title="Logout" href="login.html">
       <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
     </a>
   </div>
   	<script type="text/javascript">
	var emp_no = ${loginEmp.emp_no};
	var EventSource4 = new EventSource("count.do?emp_no="+emp_no);
	EventSource4.onopen = function(){
		//console.log("연결중2");		
	}
	EventSource4.onmessage = function(event) {
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