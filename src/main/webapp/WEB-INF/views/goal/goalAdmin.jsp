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
var dept_no;
var string="";

$(function(){
   document.getElementById("goalMonth").valueAsDate = new Date();
   
   
   
      $.ajax({
         url:"selectDeptEmp.do",
         type:"post",
         dataType:"json",
         data:{dept_no:"${loginEmp.dept_no}",job_no:"${loginEmp.job_no}",emp_no:"${loginEmp.emp_no}"},
         success:function(obj){
            console.log(obj);
            var objStr =JSON.stringify(obj);
            var result = JSON.parse(objStr);      
            var size = Object.keys(result.list).length;
            var arrDept = [];
            var value_dept="";
            if(size>0){
               for(var i in result.list){
                  arrDept[i]=result.list[i].dept_no +" / " +result.list[i].dept_name;                     
               }               
               var uni_dept =[];
               uni_dept = unique(arrDept);
               
               for(var i in uni_dept){
                  if(i==0){
                     value_dept+="<option selected>"+uni_dept[i]+"</option>"   
                     string=uni_dept[i];
                  }else{
                     value_dept+="<option>"+uni_dept[i]+"</option>"
                  }
               }
               $("#dept_no").html(value_dept);   
               getList();
            }            
            
         },
         error:function(request,status,errorData){
            console.log("error data : " +request.status+"\n"
                  +"message : "+request.responseText+"\n"
                  +"error : "+errorData);
         }         
         
      });//ajax
      
   
   });//onload   
   
   function unique(list) {
       var result = [];
       $.each(list, function(i, e) {
           if ($.inArray(e, result) == -1) result.push(e);
       });
       return result;
   }
   
   function checkCondition(){
      
      alert("checkCondition");
      
      
   }
   function getList(){
      //alert($("#dept_no option:selected").val());
      //string=$("#dept_no option:selected").val();   
      dept_no = string.split(' / ',1)*1;
      console.log("string : " + string);
      console.log("dept_no : " +dept_no);
      
       var date = $("#goalMonth").val();
         var year = date.substring(0,4);
         var month = date.substring(6,7);
         if(month==0){
            month=12;
            year =year-1;
         }
         if(month<10){
            month = "0"+month;
         }
         date = year+"-"+month;
      
      
      $.ajax({
      url:"getList.do",
      type:"post",
      dataType:"json",
      data :{dept_no:dept_no,date:date},
      success:function(data){
         var objStr =JSON.stringify(data);
         var jsonl = JSON.parse(objStr);      
         console.log(jsonl);
         var size = Object.keys(jsonl.list).length;
         
         var value="";
         value="<table id='table_goal' class='table table-striped table-responsive table-bordered' style='min-width:650px;'>"+
         "<thead><tr><th>사원번호</th><th>사원명</th><th>전월 실적</th><th>입력</th><th>확인</th></tr></thead><tbody>"
         for(var i in jsonl.list){
         value+="<tr><td>"+jsonl.list[i].emp_no+"</td>"+
                  "<td>"+jsonl.list[i].emp_name+"</td>"+
                   "<td>"+jsonl.list[i].sales+"</td>"+
                   "<td><input type='number' class='form-control' name='goal'></td>"+
                   "<td><input type='button' class='btn-modify btn btn-info' value='확인'></td></tr>";
                   
            
            
            
            
         }
         value+="</tbody></table>";
         
         $('#tableArea').html(value);
      }
         
      });
      
      
      
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
               <%@ include file="../etc/adminsidebar.jsp"%>
               <!-- /sidebar menu -->

            </div>
         </div>

         <!-- top navigation -->
         <%@ include file="../etc/topnav.jsp"%>
         <!-- /top navigation -->

         <!-- page content -->
         <div class="right_col" role="main">
            <div class="">
               <div class="page-title">
                  <div class="title_left">
                     <h3>
                        목표관리
                     </h3>
                  </div>
               </div>
               
               <div class="clearfix"></div>

               <div class="row">
                  <div class="col-md-12 col-sm-12 col-xs-12">
                     <div class="x_panel">
                        <div class="x_title">
                           <div class="control-group" style="float:right">
                                 <div class="controls">
                                     <select class="form-control" id="dept_no" style="width:150px;margin-right:10px;float:left">
                                        
                                      </select>
                                    <input type="month" class="form-control" id="goalMonth" style="display:inline-block;width:260px">
                                    <input type="button" class="btn btn-dark" style="display:inline-block" onclick="checkCondition();" value="확인">
                                 </div>
                              </div>
                           <div class="clearfix"></div>
                        </div>
                        <div class="title_right">
                           
                        </div>
                        <div class="x_content" id="tableArea">                           
                           
                           
                        </div>
         
                        
                     </div>
                  </div>
               </div>
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
   
   <!-- Custom Theme Scripts -->
   <script src="resources/build/js/custom.min.js"></script>

</body>
</html>