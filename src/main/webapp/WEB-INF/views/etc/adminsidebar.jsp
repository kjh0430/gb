<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminsidebar</title>
</head>
<body>

   <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
     <div class="menu_section">
      
       <ul class="nav side-menu">
         <li><a href="main.html"><i class="fa fa-home"></i> Home</a></li>
         <li><a><i class="fa fa-desktop"></i>사원관리 <span class="fa fa-chevron-down"></span></a>
           <ul class="nav child_menu">
             <li><a href="">목표관리</a></li>
             <li><a href="">사원등록</a></li>
             <li><a href="">사원목록</a></li>
             
           </ul>
         </li>
         <li><a href="SaleActi.do"><i class="fa fa-table"></i>영업관리<span class="fa fa-chevron-down"></span></a>
            <ul class="nav child_menu">
             <li><a href="">제품관리</a></li>
             <li><a href="">영업일지</a></li>
           </ul>
           
         </li>
         <li><a><i class="fa fa-edit"></i> 영업현황 <span class="fa fa-chevron-down"></span></a>
           <ul class="nav child_menu">
             <li><a href="form.html">거래처 목록</a></li>
             <li><a href="form_advanced.html">매출현황</a></li>
           </ul>
         </li>
       </ul>
     </div>
     <div class="menu_section">
       <h3>MY PAGE</h3>
         <ul class="nav side-menu">
	      <li><a><i class="fa fa-file-text-o"></i> 전자결재 <span class="fa fa-chevron-down"></span></a>
	        <ul class="nav child_menu">
	          <li><a href="e_commerce.html">결재리스트</a></li>
	         
	        </ul>
	      </li>
	     
	     
	      <li><a href=""><i class="fa fa-file-text-o"></i> 쪽지함</a>
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


</body>
</html>