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
<script type="text/javascript">
$(document).ready(function() {

} );

</script>
<script type="text/javascript">
   $(function(){
      $('#edit_add').click(function(){
         alert('수정합니다.');
         
      });
   });
   
    function maxLengthCheck(object){
         if (object.value.length > object.maxLength){
          object.value = object.value.slice(0, object.maxLength);
         }    
        }

   
   function checkEnroll(){
      
      var g_emp_no=$('#goal_emp_no').val();
      var g_goal_date=$('#goal_date').val();
      var goal_contract_date=$('#goal_contract_date').val();
      var g_goal_money=$('#goal_money').val();
      var g_goal_contract_money=$('#goal_contract_money').val();
      
      
      //alert(g_goal_date);
      /* alert(g_emp_no); */
      /* alert("선택된 날자"+g_goal_date);
      alert("선택되어있는 날자"+goal_contract_date); */
      // alert("선택된 금액"+g_goal_money); 
      /* emp_no : g_emp_no, dataType:"json",goal_date : g_goal_date,*/
      //alert("월별 금액"+g_goal_contract_money);
      
      var g_money_1=parseInt(g_goal_money);
      
      var g_money_2=parseInt(g_goal_contract_money);
      
      var g=g_money_1+g_money_2;
      
      //alert(g);
      
      //alert("숫자로 된것"+g_money_1);
      
      if(g_goal_date<goal_contract_date){   
         
         alert("선택된 월보다, 이후로 선택해주세요 ");
         return false;
      }else if(g_money_1<g_money_2){
         
         alert("월별 실적보다 높게 측정하세요 ");
         return false;
         
      }else{
         
         $.ajax({
            url:"goalAdminAdd.do",
            type:"post",
            data:{
               emp_no : g_emp_no,
               goal_date_start : g_goal_date,
               goal_money : g_goal_money
            },
            dataType:"json",
            success:function(data){
               var jsonStr = JSON.stringify(data);//데이터 넘어올때 주소값을 String 형태로 바꿔주는 메소드 
               var json = JSON.parse(jsonStr);//json 객체로 형변환 해주는것 !
               /* alert("여기야"+json.send); */
               
               if(json.send=="1"){
                  alert("목표가 설정되었습니다.");
                  location.href = "goalAdmin.do";
               }else{
                  
                  alert("이미 설정된 목표입니다");
                  false;
               }
               
               
            },
            error:function(a,b,c){
               alert("a = " + a + " , b = " + b + " , c = " + c);
            }   
            
         });
      }
      
   }
   
   
   

</script>




<style type="text/css">
   .btn-modify{
      padding:3px 6px;
      margin:0px;
      font-size:13px;
   }
   .table-bordered>tbody>tr>td{
      vertical-align:middle;
   }
</style>
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
                <%@ include file="../etc/adminsidebar.jsp" %>
               <!-- /sidebar menu -->

            </div>
         </div>

         <!-- top navigation -->
         <%@ include file="../etc/topnav.jsp"%>
         <!-- top navigation -->

         <!-- page content -->
         <div class="right_col" role="main">
            <div class="">
               <div class="page-title">
                  <div class="title_left">
                     <h3>
                        목표관리설정
                     </h3>
                  </div>
               </div>

               <div class="clearfix"></div>

               <div class="row">
                  <div class="col-md-12 col-sm-12 col-xs-12">
                     <div class="x_panel">
                        <div class="x_title">
                           <h2>
                              목표상세설정
                           </h2>
                           <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                           <br />
                           <form id="demo-form2" data-parsley-validate
                              class="form-horizontal form-label-left" action="" method="post">
                              
                              <div class="form-group">
                                 <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                    for="first-name">사원번호
                                 </label>
                                 <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text"  required="required"
                                       class="form-control col-md-7 col-xs-12" id ="goal_emp_no"name ="goal_emp_no" value="${emp_no}" readonly>
                                 </div>
                              </div>
                              
                              <div class="form-group">
                                 <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                    for="first-name">사원명
                                 </label>
                                 <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text"  required="required"
                                       class="form-control col-md-7 col-xs-12"id="goal_emp_name" name ="goal_emp_name" value="${emp_name}" readonly>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                    for="first-name">년-월
                                 </label>
                                 <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text"  required="required"
                                       class="form-control col-md-7 col-xs-12" id="goal_contract_date" name ="goal_contract_date" value="${goal_date}" readonly>
                                 </div>
                              </div>
                              
                              <div class="form-group">
                                 <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                    for="first-name">월별 실적
                                 </label>
                                 <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text"  required="required"
                                       class="form-control col-md-7 col-xs-12" id="goal_contract_money" name ="goal_contract_money" value="${contract_money}" readonly>
                                 </div>
                              </div>   
                              
                              <input type="hidden" name="goal_contract_date_1" id="goal_contract_date_1" value="${goal_date}">
                              
                              <div class="form-group">
                                 <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                    for="first-name">년-월 설정
                                 </label>
                                 <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="month" class="form-control" id="goal_date" name="goal_date" style="width:260px"></div>
                              </div>
                                 
                              <div class="form-group">
                                 <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                    for="first-name">목표금액 설정
                                 </label>
                                 <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="number"  required="required" max="1000000000" maxlength="9" oninput="maxLengthCheck(this)"
                                       class="form-control col-md-7 col-xs-12" id ="goal_money" name ="goal_money" value="">
                                 
                                 </div>
                              </div>
                              
                              <div class="form-group">
                                 <label class="control-label col-md-3 col-sm-3 col-xs-12"
                                    for="first-name">총 실적
                                 </label>
                                 <div class="col-md-6 col-sm-6 col-xs-12">
                                    <input type="text"  required="required"
                                       class="form-control col-md-7 col-xs-12" id="goal_sum" name ="goal_sum" value="${contract_money_sum}"readonly >
                                 </div>
                              </div>
                              
                                                         
                              
                              
                              
                              
                              <div class="ln_solid"></div>
                              <div class="form-group">
                                 <div class="col-md-6 col-sm-6 col-xs-12 col-md-offset-3">                                 
                                    
                                    <input type="button" class="btn btn-success" value="설정" onclick="checkEnroll();">
                              
                                 </div>
                                 
                              </div>

                           </form>
                        </div>
                     </div>
                  </div>
               </div>
                  <!-- row -->
               </div>
            </div>
            <%@ include file="../etc/footer.jsp"%>
      </div>
   </div>

   <!-- /page content -->


   <!-- jQuery -->
   <script src="resources/vendors/jquery/dist/jquery.min.js"></script>
   <!-- Bootstrap -->
   <script src="resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
   <!-- FastClick -->
   
   <!-- Custom Theme Scripts -->
   <script src="resources/build/js/custom.min.js"></script>

</body>
</html>