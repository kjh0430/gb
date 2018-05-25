<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
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
   $(function() {

      //받은 쪽지함
         $.ajax({
               url : "getMessage.do",
               data : {
                  message_to_no : "${loginEmp.emp_no}"
               },
               type : "get",
               success : function(data) {
                  
                  var jsonSt = JSON.stringify(data);
                  var json = JSON.parse(jsonSt);
                  var size = Object.keys(json.list).length;

                  var values = "<table class='table table-hover' id='table_rec'><thead><tr><th>보낸사람</th><th style='width:40%;'>제목</th><th>받은날짜</th><th>사번</th><th>내용</th></thead>"
                        + "<tbody>"

                  for ( var i in json.list) {

                     values += "<tr onclick='confirm(this);' style='cusor:hand'><td>" + json.list[i].from_empName
                           + "</td><td>" + json.list[i].message_title
                           + "</td><td>" + json.list[i].message_date
                           + "</td><td>"+json.list[i].from_empNo+"</td><td>"
                                    +json.list[i].message_content+"</td></tr>";

                  }

                  values += "</tbody></table>"

                  $('#receive_msg').html(values);

               },
               error : function(request, status, errorData) {
                  alert("error code : " + request.status + "\n"
                        + "message :" + request.responseText + "\n"
                        + "error :" + errorData);
               }
            });

      //보낸쪽지함
         $.ajax({
            url : "sendMessage.do",
            data : {
               message_from_no : "${loginEmp.emp_no}"
            },
            type : "get",
            success : function(data) {
            
               var jsonSt = JSON.stringify(data);
               var json = JSON.parse(jsonSt);
               var size = Object.keys(json.list).length;

               var values = "<table class='table table-hover' id='table_sm'><thead><tr><th>받은사람</th><th style='width:40%;'>제목</th><th>받은날짜</th><th>내용</th><thead>"
                     + "<tbody>"

               for ( var i in json.list) {

                  values += "<tr onclick='confirmSend(this);' style='cusor:hand'><td>" + json.list[i].to_empName
                        + "</td><td>" + json.list[i].message_title
                        + "</td><td>" + json.list[i].message_date
                        + "</td><td>"+json.list[i].message_content
                        +"</td></tr>";

               }

               values += "</tbody></table>"

               $('#send_msg').html(values);
							
               
               
            },
            error : function(request, status, errorData) {
               alert("error code : " + request.status + "\n"
                     + "message :" + request.responseText + "\n"
                     + "error :" + errorData);
            }
         });
      
   });
   
   function modal1Close(){
	   $('#modal1').modal("hide");
	   $('#searchName').val("");
	   $('#message_to_no').val("");
	   $('#message_title').val("");
	   $('#message_content').val("");
	   
	 
   }
   
   //답장 확인 버튼 modal4 열기
   function answerMessage(){
      
      $('#modal4').modal("show");   
   }
   //쪽지 확인 창 닫기
   function closeModal3(){
      
      $('#modal3').modal("hide");
   }
   //답장 창 닫기
   function closeModal4(){
      $('#modal4').modal("hide");
      $('#anwer_title').val("");
      $('#answer_content').val("");
      
   }
   	//보낸 메시지 확인 모달 닫기
  function closeModal5(){
	  $('#modal5').modal("hide");
  }
   
   
   //사원 검색하기
   function searchEmp() {
	if($('#searchName').val()!=""){
      $.ajax({
         url : "searchEmp.do",
         type : "post",
         dataType : "json",
         data : {
         searchName : $('#searchName').val()
            },
            success : function(obj) {
               var objStr = JSON.stringify(obj);
               var jsonl = JSON.parse(objStr);
               var value = "<table class='table table-hover' id='getvalues'><thead><tr><th>이름</th><th>직급</th><th>부서</th><th>e-mail</th><th>사원번호</th></tr></thead><tbody>";

                  for ( var i in jsonl.list) {

                     value += "<tr onclick='selectEmp(this);' style='cusor:hand'><td>"
                           + jsonl.list[i].emp_name
                           + "</td><td>"
                           + jsonl.list[i].dept_name
                           + "</td><td>"
                           + jsonl.list[i].emp_job
                           + "</td><td>"
                           + jsonl.list[i].emp_email
                           + "</td><td>"
                           + jsonl.list[i].emp_no + "</td></tr>";
                  }

                  value += "</tbody></table>";

                  $('#myModal2').modal("show");
                  $('#searchTable').html(value);

               },error : function(request, status, errorData) {
                  alert("error code : " + request.status + "\n"
                  + "message :" + request.responseText + "\n"
                  + "error :" + errorData);
                  }
         });
	}else{
		alert("검색할 사원을 입력해주세요");
	}
	
   }
   //테이블에서 보낼 사원 선택
   function selectEmp(obj) {
      var content = $(obj);
      var td = content.children();

      var emp_name = td.eq(0).text();
      var dept_name = td.eq(1).text();
      var emp_job = td.eq(2).text();
      var emp_email = td.eq(3).text();
      var emp_no = td.eq(4).text();
      $('#myModal2').modal("hide");
      $('#searchName').val(emp_name);

      $('#message_to_no').val(emp_no);
   }
   //쪽지확인
   function confirm(obj){
      
	   $.ajax({
		  
		   
		   
	   });
	   
	   
	   
	   
	  var content=$(obj);
      var td=content.children();
      
      var a_from_empName=td.eq(0).text();
      var a_message_title=td.eq(1).text();
      var a_message_date=td.eq(2).text();
      var a_message_from_empNo=td.eq(3).text();
      var a_message_content=td.eq(4).text();
   	
      alert(a_message_content);
      $('#modal3').modal("show");
      //답장 확인란에 값 추가
      $('#a_from_empName').val(a_from_empName);
      $('#a_message_title').val(a_message_title);
      $('#a_message_content').val(a_message_content);
      
      //답장 보낼 때 추가
      $('#a_to_emp').val(a_from_empName); 
      $('#to_emp_no').val(a_message_from_empNo);
   }
   
   function confirmSend(obj){
	 
	   var content=$(obj);
	   var td=content.children();
	   
	   var s_to_empName=td.eq(0).text();
	   var s_message_title=td.eq(1).text();
	   var s_message_content=td.eq(3).text();
	   
	   $('#s_to_empName').val(s_to_empName);
	   $('#s_message_title').val(s_message_title);
	   $('#s_message_content').val(s_message_content);
	   
	   $('#modal5').modal("show");
   }
   
   //답장하기
   function answerSubmit(){
      $('#modal4').modal("hide");
      
      $.ajax({
         url:"sendAnswer.do",
         type:"post",
         data:{
            message_from_no : "${loginEmp.emp_no}",
            message_to_no : $('#to_emp_no').val(),
            message_title : $('#anwer_title').val(),
            message_content :$('#answer_content').val(),
            
         },success: function(data){
            alert(data);
            //보낸쪽지함
            $.ajax({
               url : "sendMessage.do",
               data : {
                  message_from_no : "${loginEmp.emp_no}"
               },
               type : "get",
               success : function(data) {
               
                  var jsonSt = JSON.stringify(data);
                  var json = JSON.parse(jsonSt);
                  var size = Object.keys(json.list).length;

                  var values = "<table class='table table-hover' id='table_sm'><thead><tr><th>받은사람</th><th style='width:40%;'>제목</th><th>받은날짜</th><th>내용</th><thead>"
                        + "<tbody>"

                  for ( var i in json.list) {

                     values += "<tr onclick='confirmSend(this);' style='cusor:hand'><td>" + json.list[i].to_empName
                           + "</td><td>" + json.list[i].message_title
                           + "</td><td>" + json.list[i].message_date
                           + "</td><td>"+json.list[i].message_content
                           +"</td></tr>";

                  }

                  values += "</tbody></table>"

                  $('#send_msg').html(values);
   							
                  
                  
               },
               error : function(request, status, errorData) {
                  alert("error code : " + request.status + "\n"
                        + "message :" + request.responseText + "\n"
                        + "error :" + errorData);
               }
            });
            
            
            
            
         },error : function(request, status, errorData) {
                  alert("error code : " + request.status + "\n"
                  + "message :" + request.responseText + "\n"
                  + "error :" + errorData);
                  }
      });
      
      
   }
   
   //쪽지 보내기
   function modalSubmit() {

	   if($('#searchName').val() !="" && $('#message_title').val() !="" && $('#message_content').val()!=""){
	   
	   
	   
      $('#modal1').modal("hide");

      $.ajax({
         url : "sub.do",
         type : "post",
         data : {
            message_from_no : "${loginEmp.emp_no}",
            message_to_no : $('#message_to_no').val(),
            message_title : $('#message_title').val(),
            message_content : $('#message_content').val(),
            no : 1

         },
         success : function(data) {
            alert(data);
            //보낸쪽지함
            $.ajax({
               url : "sendMessage.do",
               data : {
                  message_from_no : "${loginEmp.emp_no}"
               },
               type : "get",
               success : function(data) {
               
                  var jsonSt = JSON.stringify(data);
                  var json = JSON.parse(jsonSt);
                  var size = Object.keys(json.list).length;

                  var values = "<table class='table table-hover' id='table_sm'><thead><tr><th>받은사람</th><th style='width:40%;'>제목</th><th>받은날짜</th><th>내용</th><thead>"
                        + "<tbody>"

                  for ( var i in json.list) {

                     values += "<tr onclick='confirmSend(this);' style='cusor:hand'><td>" + json.list[i].to_empName
                           + "</td><td>" + json.list[i].message_title
                           + "</td><td>" + json.list[i].message_date
                           + "</td><td>"+json.list[i].message_content
                           +"</td></tr>";

                  }

                  values += "</tbody></table>"

                  $('#send_msg').html(values);
   							
                  
                  
               },
               error : function(request, status, errorData) {
                  alert("error code : " + request.status + "\n"
                        + "message :" + request.responseText + "\n"
                        + "error :" + errorData);
               }
            });
            
            
            
            
            
            
            
            
            
         },error : function(request, status, errorData) {
                 /*  alert("error code : " + request.status + "\n"
                  + "message :" + request.responseText + "\n"
                  + "error :" + errorData); */
                  alert("사원 검색을 하셔야합니다! 다시 시도해주세요");
                  }

      });
	   }else{
		   alert("내용을 빠짐없이 입력해주세요.");
	   }
   }
</script>
<style type="text/css">
.btn-modify {
   padding: 3px 6px;
   margin: 0px;
   font-size: 13px;
}

.table-bordered>tbody>tr>td {
   vertical-align: middle;
}

#table_rm tr:last-child {
   border-bottom: 1px solid #ddd;
}

#getvalues th:nth-child(5), td:nth-child(5) {
   display: none;
}

#table_rec th:nth-child(4){
   display: none;
}
#table_rec td:nth-child(4){
display:none;
}

#table_rec th:nth-child(5){
display: none;
}

#table_rec td:nth-child(5){
display: none;
}

#table_sm th:nth-child(4){
display:none;
}

#table_sm td:nth-child(4){
display:none;
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
               <%@ include file="../etc/sidebar.jsp"%>
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
                     <h3>쪽지</h3>
                  </div>
               </div>

               <div class="clearfix"></div>

               <div class="row">
                  <div class="col-md-12 col-sm-12 col-xs-12">
                     <div class="x_panel">
                        <div class="x_title">
                           <!-- <div style="text-align:right"> -->
                           <div>
                              <button type="button" class="btn btn-success"
                                 data-toggle="modal" data-target=".sendMsg">쪽지보내기</button>
                           </div>
                           <div class="clearfix"></div>
                        </div>
                        <div class="x_content">
                           <div class="" role="tabpanel" data-example-id="togglable-tabs">
                              <ul id="myTab" class="nav nav-tabs bar_tabs" role="tablist">
                                 <li role="presentation" class="active"><a
                                    href="#receive_msg" id="home-tab" role="tab"
                                    data-toggle="tab" aria-expanded="true">받은쪽지함</a></li>
                                 <li role="presentation" class=""><a href="#send_msg"
                                    role="tab" id="profile-tab" data-toggle="tab"
                                    aria-expanded="false">보낸쪽지함</a></li>

                              </ul>
                              <!-- start of receive msg tab -->
                              <div id="myTabContent" class="tab-content">
                                 <div role="tabpanel" class="tab-pane fade active in"
                                    id="receive_msg" aria-labelledby="home-tab"></div>
                                 <!-- end of receive msg tab -->

                                 <!-- start of send msg tab -->
                                 <div role="tabpanel" class="tab-pane fade" id="send_msg"
                                    aria-labelledby="profile-tab">
                                 
                                 </div>
                                 <!-- end of send msg tab -->
                              </div>

                              <!-- message modal -->
                              <div class="modal fade sendMsg" tabindex="-1" role="dialog"
                                 id="modal1" aria-hidden="true">
                                 <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                       <form class="form-horizontal form-label-left input_mask">
                                          <div class="modal-header">
                                             <button type="button" class="close" data-dismiss="modal">
                                                <span aria-hidden="true">×</span>
                                             </button>
                                             <h4 class="modal-title" id="myModalLabel">쪽지보내기</h4>
                                          </div>

                                          <div class="modal-body">
                                             <div class="form-group" style="margin: 0px;">
                                                <div class="row">
                                                   <label
                                                      class="control-label col-md-3 col-sm-3 col-xs-12">받는사람</label>

                                                   <div class="col-md-9 col-sm-9 col-xs-12">
                                                      <div class="input-group">

                                                         <input type="text" class="form-control"
                                                            placeholder="받는이의 이름을 입력해주세요." id="searchName" required>

                                                         <input type="hidden" name="message_from_no"
                                                            value="${loginEmp.emp_no}"> <input
                                                            type="hidden" name="message_to_no"
                                                            id="message_to_no"> <span
                                                            class="input-group-btn">
                                                            <button type="button" class="btn btn-primary"
                                                               onclick="searchEmp();">
                                                               <i class="fa fa-search"></i>
                                                            </button>

                                                         </span>
                                                      </div>
                                                   </div>
                                                   <label class="control-label col-md-3 col-sm-3 col-xs-12">제목</label>
                                                   <div class="col-md-9 col-sm-9 col-xs-12">
                                                      <div class="input-group" style="width:100%">
                                                         <input type="text" class="form-control"
                                                            name="message_title" id="message_title"
                                                            placeholder="제목을 입력해주세요." required>
                                                      </div>
                                                   </div>
                                                   <div class="form-group">

                                                      <label
                                                         class="control-label col-md-3 col-sm-3 col-xs-12">내용</label>
                                                      <div class="col-md-9 col-sm-9 col-xs-12">
                                                         <textarea class="form-control" rows="8"
                                                            name="message_content" id="message_content" required></textarea>
                                                      </div>
                                                   </div>
                                                </div>
                                                <!-- end of row -->
                                             </div>
                                          </div>
                                          <div class="modal-footer">
                                          	 <button onclick="modal1Close()" type="button"
                                                class="btn btn-primary">취소</button>
                                             <button onclick="modalSubmit();" type="button"
                                                class="btn btn-primary">전송</button>
                                          </div>
                                       </form>

                                    </div>
                                 </div>
                              </div>
                              <!-- modal2 -->
                              <div class="modal fade sendMsg2" tabindex="-1" role="dialog"
                                 id="myModal2" aria-hidden="true">
                                 <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                       <form class="form-horizontal form-label-left input_mask">
                                          <div class="modal-header">
                                             <button type="button" class="close" data-dismiss="modal">
                                                <span aria-hidden="true">×</span>
                                             </button>
                                             <h4 class="modal-title" id="myModalLabel2">사원 검색</h4>
                                          </div>
                                          <div class="modal-body">
                                             <div class="form-group" style="margin: 0px;">
                                                <div class="row">
                                                   <label
                                                      class="control-label col-md-3 col-sm-3 col-xs-12"></label>
                                                   <div class="col-md-9 col-sm-9 col-xs-12">
                                                      <div class="input-group">


                                                         <span class="input-group-btn"> </span>

                                                      </div>
                                                   </div>

                                                   <div id="searchTable"></div>

                                                   <div class="form-group">


                                                      <div class="col-md-9 col-sm-9 col-xs-12"></div>
                                                   </div>
                                                </div>

                                             </div>
                                          </div>
                                          <div class="modal-footer"></div>
                                       </form>
                                    </div>
                                 </div>
                              </div>
                              <!--  end modal2 -->
                              <!-- modal3 start -->
                              <!-- 답장 및 내용확인처리-->
                              <div class="modal fade sendMsg3" tabindex="-1" role="dialog"
                                 id="modal3" aria-hidden="true">
                                 <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                       <form class="form-horizontal form-label-left input_mask">
                                          <div class="modal-header">
                                             <button type="button" class="close" data-dismiss="modal">
                                                <span aria-hidden="true">×</span>
                                             </button>
                                             <h4 class="modal-title" id="myModalLabel3">쪽지 확인</h4>
                                          </div>

                                          <div class="modal-body">
                                             <div class="form-group" style="margin: 0px;">
                                                <div class="row">
                                                   <label
                                                      class="control-label col-md-3 col-sm-3 col-xs-12">보낸사람</label>

                                                   <div class="col-md-9 col-sm-9 col-xs-12">
                                                      <div class="input-group">

                                                         <input type="text" class="form-control"
                                                            id="a_from_empName" readonly>
                                                               
                                                      </div>
                                                   </div>
                                                   <label
                                                      class="control-label col-md-3 col-sm-3 col-xs-12">제목</label>
                                                   <div class="col-md-9 col-sm-9 col-xs-12">
                                                      <div class="input-group" style="width:100%">
                                                         <input type="text" class="form-control"
                                                            name="message_title" id="a_message_title" readonly
                                                            >
                                                      </div>
                                                   </div>



                                                   <div class="form-group">

                                                      <label
                                                         class="control-label col-md-3 col-sm-3 col-xs-12">내용</label>
                                                      <div class="col-md-9 col-sm-9 col-xs-12">
                                                         <textarea class="form-control" rows="8"
                                                            id="a_message_content" readonly></textarea>
                                                      </div>
                                                   </div>
                                                </div>
                                                <!-- end of row -->
                                             </div>
                                          </div>
                                          <div class="modal-footer">
                                             <button onclick="closeModal3();" type="button"
                                                class="btn btn-primary">확인</button>
                                                
                                                <button onclick="answerMessage();" type="button"
                                                class="btn btn-primary">답장</button>
                                          </div>
                                       </form>

                                    </div>
                                 </div>
                              </div>
                           <!--    답장하기 modal -->
                           <div class="modal fade sendMsg4" tabindex="-1" role="dialog"
                                 id="modal4" aria-hidden="true">
                                 <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                       <form class="form-horizontal form-label-left input_mask">
                                          <div class="modal-header">
                                             <button type="button" class="close" data-dismiss="modal">
                                                <span aria-hidden="true">×</span>
                                             </button>
                                             <h4 class="modal-title" id="myModalLabel4">답장하기</h4>
                                          </div>

                                          <div class="modal-body">
                                             <div class="form-group" style="margin: 0px;">
                                                <div class="row">
                                                   <label
                                                      class="control-label col-md-3 col-sm-3 col-xs-12">받는사람</label>

                                                   <div class="col-md-9 col-sm-9 col-xs-12">
                                                      <div class="input-group">

                                                         <input type="text" class="form-control"
                                                             id="a_to_emp" readonly>

                                                        
                                                      </div>
                                                   </div>
                                                   <label
                                                      class="control-label col-md-3 col-sm-3 col-xs-12">제목</label>
                                                   <div class="col-md-9 col-sm-9 col-xs-12">
                                                      <div class="input-group" style="width:100%">
                                                         <input type="text" class="form-control" 
                                                             id="anwer_title"
                                                            placeholder="제목을 입력해주세요." required>
                                                            <input type="hidden" id="to_emp_no">
                                                      </div>
                                                   </div>



                                                   <div class="form-group">

                                                      <label
                                                         class="control-label col-md-3 col-sm-3 col-xs-12">내용</label>
                                                      <div class="col-md-9 col-sm-9 col-xs-12">
                                                         <textarea class="form-control" rows="8"
                                                             id="answer_content" required></textarea>
                                                      </div>
                                                   </div>
                                                </div>
                                                <!-- end of row -->
                                             </div>
                                          </div>
                                          <div class="modal-footer">
                                             <button onclick="closeModal4();" type="button"
                                                class="btn btn-primary">취소</button>
                                             <button onclick="answerSubmit();" type="button"
                                                class="btn btn-primary">전송</button>
                                          </div>
                                       </form>

                                    </div>
                                 </div>
                              </div>
                              <!--  보낸 메시지함에서 보낸 내용 읽기 -->
                              <div class="modal fade sendMsg5" tabindex="-1" role="dialog"
                                 id="modal5" aria-hidden="true">
                                 <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                       <form class="form-horizontal form-label-left input_mask">
                                          <div class="modal-header">
                                             <button type="button" class="close" data-dismiss="modal">
                                                <span aria-hidden="true">×</span>
                                             </button>
                                             <h4 class="modal-title" id="myModalLabel3">쪽지 확인</h4>
                                          </div>

                                          <div class="modal-body">
                                             <div class="form-group" style="margin: 0px;">
                                                <div class="row">
                                                   <label
                                                      class="control-label col-md-3 col-sm-3 col-xs-12">받은사람</label>

                                                   <div class="col-md-9 col-sm-9 col-xs-12">
                                                      <div class="input-group">

                                                         <input type="text" class="form-control"
                                                            id="s_to_empName" readonly>
                                                               
                                                                                                                          
                                                      </div>
                                                   </div>
                                                   <label
                                                      class="control-label col-md-3 col-sm-3 col-xs-12">제목</label>
                                                   <div class="col-md-9 col-sm-9 col-xs-12">
                                                      <div class="input-group" style="width:100%">
                                                         <input type="text" class="form-control"
                                                             id="s_message_title" readonly
                                                            >
                                                      </div>
                                                   </div>



                                                   <div class="form-group">

                                                      <label
                                                         class="control-label col-md-3 col-sm-3 col-xs-12">내용</label>
                                                      <div class="col-md-9 col-sm-9 col-xs-12">
                                                         <textarea class="form-control" rows="8"
                                                            id="s_message_content" readonly></textarea>
                                                      </div>
                                                   </div>
                                                </div>
                                                <!-- end of row -->
                                             </div>
                                          </div>
                                          <div class="modal-footer">
                                             <button onclick="closeModal5();" type="button"
                                                class="btn btn-primary">확인</button>
                                                
                                               
                                          </div>
                                       </form>

                                    </div>
                                 </div>
                              </div>
                              
                              
                              
                              <!-- message modal -->
                           </div>

                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
         
         <c:import url="../etc/footer.jsp"></c:import>

         <!-- /page content -->
      </div>
   </div>



   <!-- jQuery -->
   <script src="resources/vendors/jquery/dist/jquery.min.js"></script>
   <!-- Bootstrap -->
   <script src="resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
   
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


   <!-- Custom Theme Scripts -->
   <script src="resources/build/js/custom.min.js"></script>

</body>
</html>