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

    <title>GROUP BEAN | </title>

    <!-- Bootstrap -->
    <link href="resources/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="resources/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="resources/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
   
   
   <link href="resources/fullcalendar-3.9.0/fullcalendar.css" rel="stylesheet">
   <link href="resources/fullcalendar-3.9.0/fullcalendar.min.css" rel="stylesheet">
    <!-- Custom Theme Style -->
    <link href="resources/build/css/custom.min.css" rel="stylesheet">
    <link href="resources/css/main.css" rel="stylesheet">
    
       
    
    <script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
    <script src="resources/fullcalendar-3.9.0/lib/jquery.min.js"></script>
    <script type="text/javascript">//calendar
   
    var writer_no="";
    var event=new Array();
  	//calendar load
  	
  	function calendarLoad(){
  		
  		$.ajax({
	
		url:"calendarLoad.do",
		data:{emp_no : "${loginEmp.emp_no}", dept_no : "${loginEmp.dept_no}"},
		type:"post",
		dataType:"json",
		success: function(data) {
			
			var jsonSt = JSON.stringify(data);
            var json = JSON.parse(jsonSt);
			 event=new Array();
		
		for ( var i in json.list) {
			event.push({
				title: json.list[i].calendar_title,
				start:json.list[i].calendar_start_date,
				end:json.list[i].calendar_end_date,
				url:"javascript:detailCalendar("+json.list[i].calendar_no+")"
			});
		 };	
			$('#myCalendar').fullCalendar({
	    		  				
			 	header: {
			 		 left:'month,basicWeek,basicDay',
			 		 center:'title',
				     right: 'today prev,next'
				  }, 
		  
				  buttonIcons: false,
				  weekNumbers: false,	  
				  events:event
					 
	    	}); 
					
			var value="<button class='btn btn-danger' onclick='Schedule();'"+
			"style='padding:0.1%; margin-top:1%;' id='addScheduleRed'>일정추가</button>";
			$('#addschedule').html(value);
		 }		
	});		
  	}
    
    $(function() {
    	
    	calendarLoad();
    	
  	}); 
 	function Schedule(){
 		$.ajax({
 		url:"getInfo.do",               
 		data:{emp_no :"${loginEmp.emp_no}",dept_no :"${loginEmp.dept_no}"},
 		type:"post",
 		dataType:"json",
 		success:function(data){
  			$('#addwriter').val(data.emp_name);
  			$('#adddept_name').val(data.calendar_dept_name);
  			$('#modal3').modal("show");
  			}
 		
 		});
 	}//Schedule
  		
  		//일정 비교 (수정)
	function checkDate(){
		var ckModistartDate=$('#startDateM').val();
		var sArr=ckModistartDate.split('-');
		
		var ckModiendDate=$('#endDateM').val();
		var eArr=ckModiendDate.split('-');
		
		var start1 =new Date(sArr[0],parseInt(sArr[1])-1,sArr[2]);
		var end1 =new Date(eArr[0],parseInt(eArr[1])-1,eArr[2]);
		
		if(start1.getTime()>end1.getTime()){
			alert("시작 날짜 또는 종료 날짜가 유효하지 않습니다.");
		}
	} 	
  		//일정 비교(추가)
		function checkDates(){
 			var ckModistartDate=$('#addstartDate').val();
 			var sArr=ckModistartDate.split('-');
 		
 			var ckModiendDate=$('#addendDate').val();
 			var eArr=ckModiendDate.split('-');
 			
 			var start1 =new Date(sArr[0],parseInt(sArr[1])-1,sArr[2]);
 			var end1 =new Date(eArr[0],parseInt(eArr[1])-1,eArr[2]);
 			
 			if(start1.getTime()>end1.getTime()){
 				alert("시작 날짜 또는 종료 날짜가 유효하지 않습니다.");
 			}
  		} 	
 		
  	 	
  	 	//modal 상세보기 닫기 detail 닫기

    	function modal1Close(){
    		$('#modal1').modal("hide");
    	}
  		
  	    //modal2 수정페이지 닫기
		function modal2Close(){
    		
    		$('#modal2').modal("hide");
    		$('#writerM').val("");
			$('#dept_nameM').val("");
			$('#calendar_titleM').val("");
			$('#calendar_contentM').val("");
		
    	}
  	    //일정추가 닫기
  	    function modal3Close(){
  	    	$('#modal3').modal("hide");
  	    }
  	  	
    	//스케줄 수정하기
 		function modify(calendar_no){
 			
    		 //시작 날짜 수정
 			var mostartDate=$('#startDate').val();
    		
 			
 		   var syyyy=mostartDate.substring(0,4);
 		   var smm=mostartDate.substring(5,7);
 		   var sdd=mostartDate.substring(8,10);
 			
 		  $('#startDateM').val(syyyy+"-"+smm+"-"+sdd);
 			
 		 	var shour=mostartDate.substring(11,13);
			var sminute=mostartDate.substring(14,16);
 			
			$('#startTimeM').val(shour+":"+sminute);
 			
			//종료날짜 수정
			var moendDate=$('#endDate').val();
			
			 var eyyyy=moendDate.substring(0,4);
	 		   var emm=moendDate.substring(5,7);
	 		   var edd=moendDate.substring(8,10);
	 			
	 		  $('#endDateM').val(eyyyy+"-"+emm+"-"+edd);
	 			
	 			var ehour=moendDate.substring(11,13);
				var eminute=moendDate.substring(14,16);
	 			
				$('#endTimeM').val(ehour+":"+eminute);
			
		
			$('#writerM').val($('#writer').val());
			$('#dept_nameM').val($('#dept_name').val());
			$('#calendar_titleM').val($('#calendar_title').val());
			$('#calendar_contentM').val($('#calendar_content').val());
			
			value="";
			value="<button onclick='realModify("+calendar_no+");' type='button'"+
                "class='btn btn-info' id='modalButtonM' style='float:right;'>수정</button>";
		$('#modifySchedule').html(value);
			$('#modal2').modal("show");
			$('#modal1').modal("hide");
 		} 	
  	 	
    	//detail
    	function detailCalendar(calendar_no){
		
		 $.ajax({
			url:"detail2.do",
			data:{ calendar_no:calendar_no, dept_no :"${loginEmp.dept_no}"},
    		type:"post",
    		dataType:"json",
    		success: function(data) {
    			
    			$('#modal1').modal("show");
    			$('#startDate').val(data.calendar_start_date);
    			$('#endDate').val(data.calendar_end_date);
    			$('#writer').val(data.emp_name);
    			$('#dept_name').val(data.calendar_dept_name);
    			$('#calendar_title').val(data.calendar_title);
    			$('#calendar_content').val(data.calendar_content);
    			
    			writer_no=data.emp_no;
    			var emp_no="${loginEmp.emp_no}";
    			calendar_no=data.calendar_no;
    			
    			 if(emp_no==writer_no) {
    				var value="<button onclick='modify("+calendar_no+");' type='button'"+ 
    				"class='btn btn-info' style='float:right; margin-right:0%;'>수정</button>"+
    				"<button onclick='deleteSchedule("+calendar_no+");' type='button'"+ 
    				"class='btn btn-danger' style='float:right; margin-right:0.5%;'>삭제</button>";
    				$('#modifyModal1').html(value);
    				}
    			}
			}); 
		}
    	//수정 값 db로
    	function realModify(calendar_no){
    	 
    		var ModistartDate=$('#startDateM').val();
    		var ModistartTime=$('#startTimeM').val();
    		
    		var modifyStartSchedule=ModistartDate+" "+ModistartTime;
    		
    		
    		var ModiendDate=$('#endDateM').val();
    		var ModiendTime=$('#endTimeM').val();
    		
    		var modifyEndSchedule=ModiendDate+" "+ModiendTime;
    		
    		 sArr=ModistartDate.split('-');
    		 eArr=ModistartTime.split('-');
    		
    		 start1 =new Date(sArr[0],parseInt(sArr[1])-1,sArr[2]);
    		 end1 =new Date(eArr[0],parseInt(eArr[1])-1,eArr[2]);
    		
    		 
    		 startTimeck =new Date(modifyStartSchedule);
    		 endTimeck= new Date(modifyEndSchedule);
    		 
    		 
    		 
    		if(startTimeck.getMinutes()>endTimeck.getMinutes() && startTimeck.getHours()>endTimeck.getHours()){
    			
    			alert("시작시간이 종료 시간보다 늦습니다.");
    	
    		}else if(startTimeck.getMinutes()==endTimeck.getMinutes() && startTimeck.getHours()>endTimeck.getHours() ){
    			alert("시작시간이 종료 시간보다 늦습니다.");
    		
    			
    		}else if(startTimeck.getMinutes()<endTimeck.getMinutes() &&startTimeck.getHours()>endTimeck.getHours()){
    			alert("시작시간이 종료 시간보다 늦습니다.");
			}
    		else if (start1.getTime()>end1.getTime()){
    			
    		alert("날짜가 유효하지 않습니다.");
    		}
    		
    		else if(start1.getTime()>end1.getTime()){	
    		alert("날짜가 유효하지 않습니다.");
    		}else if($('#startDateM').val() =="" || $('#startTimeM').val() ==""
  					|| $('#endDateM').val()  =="" || $('#endTimeM').val() ==""  || $('#calendar_titleM').val() ==""  || 
  					$('#calendar_contentM').val() =="" ){
  				alert("입력하지 않은 정보가 있습니다. 빠짐없이 입력해주세요.");
  				
  				 }else{
  					 
    		$.ajax({
    			
    			url:"modifySchedule.do",
    			data:{calendar_no :calendar_no, calendar_start_date : modifyStartSchedule,
    					calendar_end_date : modifyEndSchedule,calendar_title : $('#calendar_titleM').val(),
    					calendar_content :$('#calendar_contentM').val()
    					},
    			type:"post",
    			success:function(data){
    				alert("일정 수정이 완료 되었습니다.");
    				 modal2Close();
    				modal1Close();
    				location.href="mainView.do";
    				/* calendarLoad(); */
    			},
    			
    		});
  				 }
    		
    	}
    	//일정 추가
    	function addSchedule(){
    		
    		var addstartDate=$('#addstartDate').val();
    		var addstartTime=$('#addstartTime').val();
    		
    		var addstart=addstartDate+" "+addstartTime;
    		
    		var addendDate=$('#addendDate').val();
    		var addendTime=$('#addendTime').val();
    	
    		var addend=addendDate+" "+addendTime;
    		
    		var addcalendar_title=$('#addcalendar_title').val();
    		var addcalendar_content=$('#addcalendar_content').val();
    		
    		
    	     sArr=addstartDate.split('-');
    		 eArr=addendDate.split('-');
    		
    		  start1 =new Date(sArr[0],parseInt(sArr[1])-1,sArr[2]);
    		 end1 =new Date(eArr[0],parseInt(eArr[1])-1,eArr[2]);
    		 
    		 startTimeck =new Date(addstart);
    		 endTimeck= new Date(addend);
    		 
    		 
    		 
    		if(startTimeck.getMinutes()>endTimeck.getMinutes() && startTimeck.getHours()>endTimeck.getHours()){
    			
    			alert("시작시간이 종료 시간보다 늦습니다.");
    	
    		}else if(startTimeck.getMinutes()==endTimeck.getMinutes() && startTimeck.getHours()>endTimeck.getHours() ){
    			alert("시작시간이 종료 시간보다 늦습니다.");
    		
    			
    		}else if(startTimeck.getMinutes()<endTimeck.getMinutes() &&startTimeck.getHours()>endTimeck.getHours()){
    			alert("시작시간이 종료 시간보다 늦습니다.");
			}
    		else if (start1.getTime()>end1.getTime()){
    			
    		alert("날짜가 유효하지 않습니다.");
    		}
    		else if($('#addstartDate').val()=="" || $('#addstartTime').val()=="" || $('#addendDate').val()=="" || $('#addendTime').val()=="" || $('#addcalendar_title').val()=="" || $('#addcalendar_content').val()==""){
  				alert("입력하지 않은 정보가 있습니다. 빠짐없이 입력해주세요.");
  				
  				 }else{
  					
  					 $.ajax({
  						 
  						 url:"addSchedule.do",
  						 data:{emp_no:"${loginEmp.emp_no}",calendar_title:addcalendar_title,calendar_content:addcalendar_content,calendar_start_date:addstart,calendar_end_date:addend},
  					 	 type:"post",
  					 	 success:function(data){
  					 	alert("일정이 추가되었습니다.");
  					 		 modal3Close();
  					 		location.href="mainView.do";
  							calendarLoad();  
  					 	 }
  					 });
  					 
  				 }
    	}
    	//일정 삭제
    	function deleteSchedule(calendar_no){
    	
    		$.ajax({
    			url:"deleteSchedule.do",
    			data:{calendar_no:calendar_no},
    			type:"post",
    			success:function(data){
    				alert(data);
    				modal1Close();
    				location.href="mainView.do";
    				calendarLoad();
    			}
    		})
    		
    		
    	}
</script>

 
	<script type="text/javascript">//todolist
    
$(function(){
		
		$.ajax({
	       		url : "todoSelect.do",
	       		data:{
	       			emp_no : "${loginEmp.emp_no}"
	       		},
	    		type:"post",
	    		dataType:"json",
	       		success:function(data){
	       			
	       			var jsonSt = JSON.stringify(data);
	                var json = JSON.parse(jsonSt);
	                var size = Object.keys(json).length;
	       			
	       			/* console.log("todoSelect.do 제대로 실행됨");
	       			console.log("size : " + size); */
	       			
	       			var obj = [json.todo1, json.todo2, json.todo3, json.todo4, json.todo5];
	       			var obj2 = [json.check1, json.check2, json.check3, json.check4, json.check5];
	       			
	       			/* console.log("obj : " + obj);
	       			console.log("obj2 : " + obj2); */	       			
	       			     			
	       			var values = ""
	       			var values2 = ""
	       			var count = 0;
	       			var count2 = 0;
	       			
	       			for(var i in obj){
	       				if(obj[i] != null && obj2[i] == "N"){
	       			values += '<li><p><input type="checkbox" class="flat" id="todo_list'+i+'" name="todo_list'+i+'" >'+obj[i]+'</p></li>';
	    	       	/* console.log("obj["+i+"] : " + obj[i]); */
	    	       	count2++;
	       				}else if(obj[i] != null && obj2[i] == "Y"){
	       					values += '<li><p id="checkp"><input type="checkbox" class="flat" id="todo_list'+i+'" name="todo_list'+i+'" checked disabled>'+obj[i]+'</p></li>';
	    	    	       	/* console.log("obj["+i+"] : " + obj[i]); */
	    	    	       	count++;
	    	    	       	count2++;
	       				}
	       			}
	       			
	       			var goal = new Number((count/count2)*100);
	       			
	       			/* console.log("count : " + count);
	       			console.log("count2 : " + count2);
	       			console.log("goal : " + goal.toFixed(2)); */
	       			
	       			if(obj2[0] == "Y" || obj2[1] == "Y" || obj2[2] == "Y" || obj2[3] == "Y" || obj2[4] == "Y"){
	       				values+='<p id="goalpp" style="float:right;">달성률 : '+goal.toFixed(1)+'%</p>'	       			
	       			}else{
	       				values+='<p><button type="button" class="btn btn-default btn-sm" onclick="checkList()" style="float:right; margin-top:5px;">확인</button></p>';
	       			}
	       			
	       			$(".to_do").html(values);
	       			
	       			},
	       			error: function(){
	       			/* console.log("todolist 출력 error"); */
	       			values = "입력된 값이 없습니다.";
	       			$(".to_do").html(values);
	       			
	       			values2 = '<button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target=".bs-example-modal-lg" style="float:right;">등록</button>';
	       			$(".todo_1").html(values2);
	       			}
	       		});
	});
	
    
    var count = 1;    
    function addKeywordForm(){
       var addedFormDiv = document.getElementById("addedTodo");
       var str = '<input type="text" id="todo_keyword'+count+'" name="todo_keyword'+count+'" class="form-control" placeholder="할일을 입력해주세요">'
       + '<a onclick="delKeywordForm('+count+')"/><i class="fa fa-times"></i></a>';
       
       if(count<5){
       var addedDiv = document.createElement("div");
       addedDiv.setAttribute("id", "keyword_Frm"+count);
       addedDiv.innerHTML = str;
       addedFormDiv.appendChild(addedDiv);       
       /* console.log("todo_keyword : " + str); */
       count++;
       }else{
       alert("5개까지 입력하실 수 있습니다");
       }

       }

       function delKeywordForm(thisCount){          
       var addedFormDiv = document.getElementById("addedTodo");
       
       if(count>1){
       var thisDiv = document.getElementById("keyword_Frm"+thisCount);
       addedFormDiv.removeChild(thisDiv);
       /* console.log("addedFormDiv : " + addedFormDiv); */
       }else{
       document.addedFormDiv.reset();
       }
       count--;
       }
       
       function todoInsert(){
			
       	var emp_no = $('#emp_no').val();       	
       	var todo1 = $('#todo_keyword0').val();
       	var todo2 = $('#todo_keyword1').val();
       	var todo3 = $('#todo_keyword2').val();
       	var todo4 = $('#todo_keyword3').val();
       	var todo5 = $('#todo_keyword4').val();
       	
       	/* console.log("todo1 : " + todo1);
       	
       	console.log("main에서 출력 emp_no : " + emp_no);
       	console.log("main에서 출력 todo1 : " + todo1);
       	console.log("main에서 출력 todo2 : " + todo2);
       	console.log("main에서 출력 todo3 : " + todo3);
       	console.log("main에서 출력 todo4 : " + todo4);
       	console.log("main에서 출력 todo5 : " + todo5); */
       	
       	if($('#todo_keyword0').val() == null || $('#todo_keyword0').val() == ""){
       		alert("값을 입력해주세요.");
       	}else{
       		
       	$.ajax({
       		url : "todoInsert.do",
       		type: "post",
       		dataType: "json",
       		data: {
       			emp_no : emp_no,
       			todo1 : todo1,
       			todo2 : todo2,
       			todo3 : todo3,
       			todo4 : todo4,
       			todo5 : todo5
       		},
       		success:function(obj){
       			
       			alert("등록되었습니다.");
       			$('#addModal').modal('hide');
       					
       			$.ajax({
       	       		url : "todoSelect.do",
       	       		type: "post",
       	       		dataType: "json",
       	       		data: {
       	       			emp_no : emp_no
       	       		},
       	       		success:function(data){       	       			
       	       			/* console.log("todoSelect.do 제대로 실행됨"); */       	       			
       	       			
       	       		var jsonSt = JSON.stringify(data);
	                var json = JSON.parse(jsonSt);
	                var size = Object.keys(json).length;
	       			
	       			/* console.log("todoSelect.do 제대로 실행됨");
	       			console.log("size : " + size); */
	       			
	       			var obj = [json.todo1, json.todo2, json.todo3, json.todo4, json.todo5];
	       			
	       			/* console.log("obj : " + obj); */
	       			       			
	       			var values = ""
	       			var values2 = ""
	       			
	       			for(var i in obj){
	       				if(obj[i] != null){
	       			values += '<li><p><input type="checkbox" class="flat" id="todo_list'+i+'" name="todo_list'+i+'" >'+obj[i]+'</p></li>';
	    	       	/* console.log("obj["+i+"] : " + obj[i]); */
	       				}
	       			}	       			
	       			
	       			values+='<p><button type="button" class="btn btn-default btn-sm" onclick="checkList()" style="float:right;">확인</button></p>';
	       			
	       			$(".to_do").html(values);
	       			
	       			$(".todo_1").html(values2);
	       			
       	       			},
       	       			error: function(){       				
       	       			/* console.log("error"); */
       	       			}
       	       		});
       			},
       			error: function(){       				
       			/* console.log("error"); */
       			}
       		});
       }
       }
       
       function checkList(){
           
       var emp_no = $('#emp_no').val();
       var check1 = 'N';
       var check2 = 'N';
       var check3 = 'N';
       var check4 = 'N';
       var check5 = 'N';
       
    	   if($("input:checkbox[name='todo_list0']").is(":checked")){
    		   check1 = 'Y';
    	   }
    	   if($("input:checkbox[name='todo_list1']").is(":checked")){
    		   check2 = 'Y';
    	   }
    	   if($("input:checkbox[name='todo_list2']").is(":checked")){
    		   check3 = 'Y';
    	   }
    	   if($("input:checkbox[name='todo_list3']").is(":checked")){
    		   check4 = 'Y';
    	   }
    	   if($("input:checkbox[name='todo_list4']").is(":checked")){
    		   check5 = 'Y';
    	   }
    	   
    	   if(!($("input:checkbox[name='todo_list0']").is(":checked")) && !($("input:checkbox[name='todo_list1']").is(":checked")) && !($("input:checkbox[name='todo_list2']").is(":checked")) && !($("input:checkbox[name='todo_list3']").is(":checked")) && !($("input:checkbox[name='todo_list4']").is(":checked"))){
    		   alert("한개 이상 체크 해주세요.");
    	   }else{
    	   
    		$.ajax({
           		url : "todoChecked.do",
           		type: "post",
           		dataType: "json",
           		data: {
           			emp_no : emp_no,
           			check1 : check1,
           			check2 : check2,
           			check3 : check3,
           			check4 : check4,
           			check5 : check5
           		},
           		success:function(data){
           			/* console.log("todoChecked.do 제대로 실행됨"); */
           			
           			alert("등록 되었습니다.");
           			
           			var jsonSt = JSON.stringify(data);
	                var json = JSON.parse(jsonSt);
	                var size = Object.keys(json).length;
	       			
	       			var obj = [json.todo1, json.todo2, json.todo3, json.todo4, json.todo5];
	       			var obj2 = [json.check1, json.check2, json.check3, json.check4, json.check5];
	       			
	       			/* console.log("obj : " + obj);
	       			console.log("obj2 : " + obj2); */	       			
	       			     			
	       			var values = ""
	       			var values2 = ""
	       			var count = 0;
	       			var count2 = 0;
	       			
	       			for(var i in obj){
	       				if(obj[i] != null && obj2[i] == "N"){
	       			values += '<li><p><input type="checkbox" class="flat" id="todo_list'+i+'" name="todo_list'+i+'" >'+obj[i]+'</p></li>';
	    	       	/* console.log("obj["+i+"] : " + obj[i]); */
	    	       	count2++;
	       				}else if(obj[i] != null && obj2[i] == "Y"){
	       					values += '<li><p id="checkp"><input type="checkbox" class="flat" id="todo_list'+i+'" name="todo_list'+i+'" checked disabled>'+obj[i]+'</p></li>';
	    	    	       	/* console.log("obj["+i+"] : " + obj[i]); */
	    	    	       	count++;
	    	    	       	count2++;
	       				}
	       			}
	       			
	       			var goal = new Number((count/count2)*100);
	       			
	       			/* console.log("count : " + count);
	       			console.log("count2 : " + count2);
	       			console.log("goal : " + goal.toFixed(2)); */
	       			
	       			if(obj2[0] == "Y" || obj2[1] == "Y" || obj2[2] == "Y" || obj2[3] == "Y" || obj2[4] == "Y"){
	       				values+='<p id="goalpp" style="float:right;">달성률 : '+goal.toFixed(1)+'%</p>'	       			
	       			}else{
	       				values+='<p><button type="button" class="btn btn-default btn-sm" onclick="checkList()" style="float:right; margin-top:5px;">확인</button></p>';
	       			}
	       			
	       			$(".to_do").html(values);
	       			
           			
           		},
           		error: function(){       				
           			/* console.log("error"); */
           			}
    	   
    		});
    	   
       }
       }
       
    </script>
    
    

    <script >//notice
    
     $(function(){
    
    	$.ajax({
    		url:"latestNotice.do",
    		type:"post",
    		dataType:"json",
    		success:function(data){
    	
    	  var jsonSt = JSON.stringify(data);
	        var jsonl = JSON.parse(jsonSt);
	        var size = Object.keys(jsonl.list).length;
    	
	   
	        
	        
    	value="";
    	if(size>0) {
    	value="<ul class='notice_list'>";
    	
    	 for(var i in jsonl.list){
     	value+="<li><a href='noticeDetail.do?notice_no="+jsonl.list[i].notice_no+"'><span>"+jsonl.list[i].notice_date+"</span>&nbsp;&nbsp;"+jsonl.list[i].notice_title+"</a></li>";
    		
    	}
    	
    	value+="</ul>"
    	
    		$('#latest_notice').html(value); 
    		
    	
    	
    		}else{
    			value="<h5>등록된 공지사항이 없습니다.</h5>"
    				$('#latest_notice').html(value); 
    		}
    		}
    	});
    	
    
    
    }); 
   
    </script>

<script type="text/javascript">
	$(function(){
		//alert("tttttttt");
		$.ajax({
       		url : "mainCount.do",
       		type: "post",
       		dataType: "json",
       		data: {emp_no :  '${loginEmp.emp_no}' , job_no : '${loginEmp.job_no}'},
       		
       		success:function(obj){
       			
       			var objStr = JSON.stringify(obj);
				var json = JSON.parse(objStr);
       			var order_sum = json.order_sum;
       			var order_avg = json.order_avg;
       			var goal_state = json.goal_state;
       			
       			str=String(order_sum);
				str2=String(order_avg);
				
       			$('#orderState').html(str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));
       			$('#orderAvg').html(str2.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'));
       			$('#goalState').html(goal_state+" %");
       			
       			
       		}
		});
		
		// 등록된 고객수
		$.ajax({
			url : "countContract.do",
       		type: "post",
       		dataType: "json",
       		success:function(data){
       			
       			var objStr = JSON.stringify(data);
				var json = JSON.parse(objStr);
       			var count = json.contractCount;
       			
       			$('#countContract').html(count);
       			
       		}
		});
		
	});

</script>

  <style type="text/css">
  
  .control-label{
  margin-top:10px;
  }
  
   .form-control{
      display:inline-block;
      width:90%;
      margin-top:10px;
   }
   
   .fa.fa-times{
      margin-left:10px;
   }
   
   
    input[type=checkbox]{
 	  margin-right:5px;
   }
   
   #checkp{
     text-decoration: line-through;
   }
   
   #goalpp{
      margin-top:5px;
   }
   </style>
    
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="mainView.do" class="site_title"><i class="fa fa-google"></i> <span>GROUP BEAN</span></a>
            </div>

            <div class="clearfix"></div>
            
            <c:choose>
            	<c:when test="${ loginEmp.job_no == 3}">
		            <!-- sidebar menu -->
		            <%@ include file="etc/adminsidebar.jsp" %>
		            <!-- /sidebar menu -->
            	</c:when>
            	<c:when test="${ loginEmp.job_no == 2}">
            	<%@ include file="etc/adminsidebar.jsp" %>
            	
            	</c:when>
            	<c:otherwise>
					<!-- sidebar menu -->
		            <%@ include file="etc/sidebar.jsp" %>
		            <!-- /sidebar menu --> 
            	</c:otherwise>
            </c:choose>
            
          </div>
        </div>

     	 	<!-- top navigation -->
			<c:import url="etc/topnav.jsp"></c:import>
			<!-- /top navigation -->
	
        <!-- page content -->
        <div class="right_col" role="main">
          <!-- top tiles -->
          <div class="row tile_count">
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 매출현황</span>
              <div class="count" id="orderState"></div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 tile_stats_count">
              <span class="count_top"><i class="fa fa-clock-o"></i> 목표달성현황</span>
              <div class="count" id="goalState"></div>
            </div>   
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 평균 주문액</span>
              <div class="count" id="orderAvg"></div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12 tile_stats_count">
              <span class="count_top"><i class="fa fa-user"></i> 신규거래처수</span>
	              	<div class="count" id="countContract"></div>
            </div>
          </div>
          <!-- /top tiles -->
           <div class="row">       	
                 <!-- Start to do list -->
                 <div class="col-md-6 col-sm-6 col-xs-12" style="padding:0px;">
                <div class="col-xs-12">
                  <div class="x_panel">
                    <div class="x_title">
                      <h2>To Do List</h2>
                      <ul class="todo_1">
                      </ul>
                      <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                      <div class="">
                        <ul class="to_do">
                          
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
                
                 <!-- modal -->    			
    			<div class="modal fade bs-example-modal-lg" id="addModal" tabindex="-1" role="dialog" aria-hidden="true">
      			<div class="modal-dialog modal-lg">
          		<div class="modal-content">

            	<div class="modal-header">
             	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span>
             	</button>
             	<h4 class="modal-title" id="myModalLabel">To Do List</h4>
             	</div>
             	<div class="modal-body" style="height:270px;">
             	<div class="col-md-12 col-sm-6 col-xs-12" id="addedTodo">
             	<input type="hidden" id="emp_no" name="emp_no" value="${ loginEmp.emp_no }">
             	<input type="text" id="todo_keyword0" name="todo_keyword0" class="form-control" placeholder="할일을 입력해주세요"/>
				<a onclick="addKeywordForm()"><input type="button" class="btn btn-info" value="추가"/></a>
				<div class="col-md-12 col-sm-6 col-xs-12" id="addedTodo"></div>             	
             	</div>
             	</div>
             	<div class="modal-footer">
             	<button type="button" class="btn btn-primary" onclick="todoInsert()">등록</button>
             	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>             	
             	</div>
           		</div>
       			</div>
    			</div>
				<!-- /page content -->
				
                <!-- End to do list -->
                <div class="col-xs-12">
              <div class="x_panel tile">
                <div class="x_title">
                  <h2>Calendar</h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content" id="myCalendar">
               	
				<div id="addschedule"></div>
			
	
											

				  <!-- calendar detail modal -->
				  	  <div class="modal fade sendMsg" tabindex="-1" role="dialog"
                                 id="modal1" aria-hidden="true" >
                                 <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                       <form class="form-horizontal form-label-left input_mask">
                                          <div class="modal-header">
                                             <button type="button" class="close" data-dismiss="modal" onclick="modal1Close();">
                                                <span aria-hidden="true">×</span>
                                             </button>
                                             <h4 class="modal-title" id="myModalLabel">schedule</h4>
                                          </div>

                                          <div class="modal-body">
                                
										<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>schedule</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<form class="form-horizontal form-label-left">

										<div class="form-group">
										
											<label class="control-label col-md-3 col-sm-3 col-xs-12">시작일자
											</label>
											
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input type="text"  id="startDate"
													class="form-control" readonly style="width:30%;">
												
											</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12"
												>종료일자 
											</label>
											<div class="col-md-9 col-sm-9 col-xs-12" style="">
												<input type="text"  id="endDate"
													class="form-control" readonly style="width:30%;">
												
											</div>
											</div>
										
										
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="first-name">작성자 
											</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
											<input type="text"  id="writer"
													class="form-control" readonly style="width:20%;">
											</div>
										</div>
												<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="first-name">부서명
											</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
											<input type="text"  id="dept_name"
													class="form-control" readonly style="width:20%;">
											</div>
										</div>
													<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="first-name">제목
											</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
											<input type="text"  id="calendar_title"
													class="form-control" readonly style="width:50%;" maxlength="10">
											</div>
										</div>
										    <div class="form-group">

                                                      <label
                                                         class="control-label col-md-3 col-sm-3 col-xs-12 content">내용</label>
                                                      <div class="col-md-9 col-sm-9 col-xs-12">
                                                         <textarea class="form-control" rows="8"
                                                            id="calendar_content" readonly></textarea>
                                                      </div>
                                                   </div>
									
									</form>
								</div>
							</div>
						</div>
					</div>
									
									
                                          </div>
                                        <div class="modal-footer">
                                             
                                             <button onclick="modal1Close();" type="button"
                                                class="btn btn-primary" id="modalButton" style="float:right; margin-left:0.5%;">확인</button>
                                              <div id="modifyModal1"></div>
                                          </div>
                                       </form>

                                    </div>
                                 </div>
                              </div>
                              <!-- 스케줄 수정하기 -->
                              	  <div class="modal fade sendMsg" tabindex="-1" role="dialog"
                                 id="modal2" aria-hidden="true" >
                                 <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                       <form class="form-horizontal form-label-left input_mask">
                                          <div class="modal-header">
                                             <button type="button" class="close" data-dismiss="modal" onclick="modal1Close();">
                                                <span aria-hidden="true">×</span>
                                             </button>
                                             <h4 class="modal-title" id="myModalLabel">schedule</h4>
                                          </div>

                                          <div class="modal-body">
                                
										<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>schedule</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<form class="form-horizontal form-label-left">

										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">시작일자
											</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input type="date"  id="startDateM"
													class="form-control" style="width:30%;" onblur="checkDate();">
												<input type="time"  id="startTimeM"
													class="form-control" style="width:30%;">
											</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12"
												>종료일자 
											</label>
											<div class="col-md-9 col-sm-9 col-xs-12" style="">
												<input type="date"  id="endDateM"
													class="form-control" style="width:30%;" onblur="checkDate();">
												<input type="time"  id="endTimeM"
													class="form-control" style="width:30%;">
												
											</div>
											</div>
										
										
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="first-name">작성자 
											</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
											<input type="text"  id="writerM"
													class="form-control" readonly style="width:20%;">
											</div>
										</div>
												<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="first-name">부서명
											</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
											<input type="text"  id="dept_nameM"
													class="form-control" readonly style="width:20%;">
											</div>
										</div>
													<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="first-name">제목
											</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
											<input type="text"  id="calendar_titleM"
													class="form-control" style="width:50%;" maxlength="10">
											</div>
										</div>
										    <div class="form-group">

                                                      <label
                                                         class="control-label col-md-3 col-sm-3 col-xs-12 content">내용</label>
                                                      <div class="col-md-9 col-sm-9 col-xs-12">
                                                         <textarea class="form-control" rows="8"
                                                            id="calendar_contentM" maxlength="333"></textarea>
                                                      </div>
                                                   </div>
									
													</form>
													</div>
												</div>
											 </div>
										</div>
									</div>
                                        <div class="modal-footer">
                                             
                                             <button onclick="modal2Close();" type="button"
                                                class="btn btn-primary" id="modalButtonMd" style="float:right;">취소</button>
                                              <div id="modifySchedule"></div>
                                          </div>
                                       </form>

                                    </div>
                                 </div>
                              </div>
                              <!-- 일정 추가 -->
                               	  <div class="modal fade sendMsg" tabindex="-1" role="dialog"
                                 id="modal3" aria-hidden="true" >
                                 <div class="modal-dialog modal-lg">
                                    <div class="modal-content">
                                       <form class="form-horizontal form-label-left input_mask">
                                          <div class="modal-header">
                                             <button type="button" class="close" data-dismiss="modal" onclick="modal3Close();">
                                                <span aria-hidden="true">×</span>
                                             </button>
                                             <h4 class="modal-title" id="myModalLabel">schedule</h4>
                                          </div>

                                          <div class="modal-body">
                                
										<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>schedule</h2>
									<div class="clearfix"></div>
								</div>
								<div class="x_content">
									<form class="form-horizontal form-label-left">

										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12">시작일자
											</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
												<input type="date"  id="addstartDate"
													class="form-control" style="width:30%;" onblur="checkDates();">
												<input type="time"  id="addstartTime"
													class="form-control" style="width:30%;">
											</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-3 col-sm-3 col-xs-12"
												>종료일자 
											</label>
											<div class="col-md-9 col-sm-9 col-xs-12" style="">
												<input type="date"  id="addendDate"
													class="form-control" style="width:30%;" onblur="checkDates();">
												<input type="time"  id="addendTime"
													class="form-control" style="width:30%;">
												
											</div>
											</div>
										
										
										<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="first-name">작성자 
											</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
											<input type="text"  id="addwriter"
													class="form-control" readonly style="width:20%;" >
											</div>
										</div>
												<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="first-name">부서명
											</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
											<input type="text"  id="adddept_name"
													class="form-control" readonly style="width:20%;" >
											</div>
										</div>
													<div class="form-group">
											<label class="control-label col-md-3 col-sm-3 col-xs-12"
												for="first-name">제목
											</label>
											<div class="col-md-9 col-sm-9 col-xs-12">
											<input type="text"  id="addcalendar_title"
													class="form-control" style="width:50%;" maxlength="10">
											</div>
										</div>
										    <div class="form-group">

                                                      <label
                                                         class="control-label col-md-3 col-sm-3 col-xs-12 content">내용</label>
                                                      <div class="col-md-9 col-sm-9 col-xs-12">
                                                         <textarea class="form-control" rows="8"
                                                            id="addcalendar_content" maxlength="333"></textarea>
                                                      </div>
                                                   </div>
									
													</form>
													</div>
												</div>
											 </div>
										</div>
									</div>
                                        <div class="modal-footer">
                                             
                                             <button onclick="modal3Close();" type="button"
                                                class="btn btn-primary" style="float:right;">취소</button>
                                             <button onclick="addSchedule();" type="button"
                                                class="btn btn-primary" id="addScheduleBlue" style="float:right;">추가</button>
                                          </div>
                                       </form>

                                    </div>
                                 </div>
                              </div>
                           
                </div>
              </div>
            </div>
            </div>
             <div class="col-md-6 col-sm-6 col-xs-12" style="padding:0px;">
			<!-- start of weather widget -->
	          <div class="col-xs-12">
	            <div class="x_panel">
	              <div class="x_title">
	                <h2>오늘의 날씨</h2>
	                <div class="clearfix"></div>
	              </div>
	              <div class="x_content">
	                <div class="row">
	                  <div class="col-sm-12">
	                    <div class="todayDate" style="margin-bottom:5px;">
	                      
	                    </div>
	                  </div>
	                </div>
	               <!--  <div class="row"> -->
	                  <div class="col-sm-4">
	                    <div class="weather-icon" style="padding-left:10px;">
	                      
	                    </div>
	                  </div>
	                  <div class="col-sm-2">
	                    <div class="weather-text">
	                      <h2 class="todayDesc"></h2>
	                    </div>
	                  </div>
	                  <div class="col-sm-6">
	                    <div class="weather-text">
	                      <h2 class="degrees todayTemp">현재기온 : </h2>
	                      <h2 class="todayRain">강수량 : </h2>
	                    </div>
	                  </div>
	                </div>
	                <div class="col-sm-12">
	                  <div class="weather-text pull-right">
	                  	<img src="resources/images/weather/thermo.png" style="width:12px;"/>&nbsp;&nbsp;&nbsp; 
	                    <h4 class="degrees todayMinTemp" style="display:inline-block">최저기온 : </h4> /
	                    <h4 class="degrees todayMaxTemp" style="display:inline-block">최고기온 : </h4>
	                  </div>
	                </div>	
	                <div class="clearfix"></div>
	              </div>
	            </div>	
	          <!-- end of weather widget -->
	          
	          <!-- start of notice widget -->
	          
	          <div class="col-xs-12">
	            <div class="x_panel">
	              <div class="x_title">
	                <h2>Notice </h2> 
	                 <ul style="float:right;">	                 
	                  <a href="noticeList.do?page=1"><i class="fa fa-plus"></i> 더보기</a>
	                  
	               </ul>
	                
	                <div class="clearfix"></div> 
	              </div>
	              <div class="x_content">
	              <div id="latest_notice"></div>
	              	
	               
	                <div class="clearfix"></div>
	              </div>
	            </div>	
	          </div>
	           <!-- end of notice widget -->

            

            <div class="col-xs-12">
              <div class="x_panel tile">
                <div class="x_title">
                  <h2>이번달 제품 판매율</h2>
                  <div class="clearfix"></div>
                </div>
                <div class="x_content">
                 	<div id="container" style="min-width:200px; height: 300px; max-width: 500px; margin: 0 auto"></div>
                </div>
              </div>
            </div>
          </div>
		
         </div>
        <!-- /page content -->
      </div>
    
      <!-- footer content -->
       <%@ include file="etc/footer.jsp" %>
      <!-- /footer content -->
      </div>
    </div>

    <!-- jQuery -->
    <script src="resources/vendors/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap -->
    <script src="resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
   
    <!-- iCheck -->
    <script src="resources/vendors/iCheck/icheck.min.js"></script>
  
    <!-- Custom Theme Scripts -->
    <script src="resources/fullcalendar-3.9.0/lib/tooltipster.bundle.min.js"></script>
    <script src="resources/build/js/custom.min.js"></script>    	
    <script src="resources/fullcalendar-3.9.0/lib/moment.min.js"></script> 
   	<script src="resources/fullcalendar-3.9.0/fullcalendar.js"></script>
   
   <script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
    

   	<script>
   	var amount=[];
	var pname=[];
	var c_data=[];
 	 $(function(){
		  $.ajax({
			url:"productShare.do",
			type:"post",
			dataType:"json",
			success: function(data) {
				
				var objStr =JSON.stringify(data);
				var result = JSON.parse(objStr);				
				
				for ( var i in result.list) {
					c_data[i] = {
							name :result.list[i].product_name,
							y : result.list[i].total
						};
					}
				getChart();
			} 
		
	});//ajax
	
  })
	
	function getChart(){
	  Highcharts.chart('container', {
		  chart: {
		    plotBackgroundColor: null,
		    plotBorderWidth: null,
		    plotShadow: false,
		    type: 'pie'
		  },
		  title: {
		    text: ''
		  },
		  tooltip: {
		    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
		  },
   		  exporting:{
   			 'enabled':false 
   		  },
		  plotOptions: {
		    pie: {
		      allowPointSelect: true,
		      cursor: 'pointer',
		      dataLabels: {
		        enabled: false
		      },
		      showInLegend: true
		    }
		  },
		  colors:[
			    "#3b5159",
			    "#a3c9d9",
			    "#d9b384",
			    "#8c6e54",
			    "#6c8aa2"
		  ],
		  series: [{
		    name: '점유율',
		    colorByPoint: true,
		    data:c_data
		  }]
		});
  }

		

	
	function getWeather(){
		var city = '${loginEmp.getCity()}';
		var county = '${loginEmp.getCounty()}';
		var village = '${loginEmp.getVillage()}';
		if(city=="" || county=="" || village==""){//정보 없을때 본사날씨
			city="서울";
			county ="강남구";
			village="역삼동"			
		}
		var headers = {};
		headers["Accept"]="application/json";
		headers["Content-Type"]="application/json; charset=UTF-8";
		headers["appKey"]="c73d9878-1921-4214-b7a2-1a0653b6c0a1";
		
		$.ajax({
			type:'get',
			headers:headers,
			data:{city:city,county:county,village:village},
			url:'https://api2.sktelecom.com/weather/current/hourly?version=1&callback=result',
			async:false,
			success : function(data){
				//console.log(data);
				var todayDate = data["weather"]["hourly"][0]['timeRelease'];
				var todayTemp = Math.round(data["weather"]["hourly"][0]['temperature']['tc']);
				var todayMinTemp = Math.round(data["weather"]["hourly"][0]['temperature']['tmin']);
				var todayMaxTemp = Math.round(data["weather"]["hourly"][0]['temperature']['tmax']);
				var todayDesc = data["weather"]["hourly"][0]['sky']['name'];
				var todayIcon = data["weather"]["hourly"][0]['sky']['code'];
				var todayRain = data["weather"]["hourly"][0]['precipitation']['sinceOntime'];
				var year = todayDate.substring(0,4);
				var month = todayDate.substring(6,7);
				var day = todayDate.substring(8,10);
					$(".todayDate").append(year+"년 "+month+"월 "+day+"일" );						
					$(".todayMinTemp").append(todayMinTemp);		
					$(".todayMaxTemp").append(todayMaxTemp);		
					$(".todayTemp").append(todayTemp);		
					$(".todayRain").append(todayRain);
					$(".todayDesc").html(todayDesc);
				var icon;
				switch(todayIcon){
					case "SKY_O01" : icon = "<img src='resources/images/weather/SKY_O01.png'/>";break;
					case "SKY_O02" : icon = "<img src='resources/images/weather/SKY_O02.png'/>";break;
					case "SKY_O03" : icon = "<img src='resources/images/weather/SKY_O03.png'/>";break;
					case "SKY_O04" : icon = "<img src='resources/images/weather/SKY_O04.png'/>";break;
					case "SKY_O05" : icon = "<img src='resources/images/weather/SKY_O05.png'/>";break;
					case "SKY_O06" : icon = "<img src='resources/images/weather/SKY_O06.png'/>";break;
					case "SKY_O07" : icon = "<img src='resources/images/weather/SKY_O07.png'/>";break;
					case "SKY_O08" : icon = "<img src='resources/images/weather/SKY_O08.png'/>";break;
					case "SKY_O09" : icon = "<img src='resources/images/weather/SKY_O09.png'/>";break;
					case "SKY_O10" : icon = "<img src='resources/images/weather/SKY_O10.png'/>";break;
					case "SKY_O11" : icon = "<img src='resources/images/weather/SKY_O11.png'/>";break;
					case "SKY_O12" : icon = "<img src='resources/images/weather/SKY_O12.png'/>";break;
					case "SKY_O13" : icon = "<img src='resources/images/weather/SKY_O13.png'/>";break;
					case "SKY_O14" : icon = "<img src='resources/images/weather/SKY_O14.png'/>";break;				
				}
				$(".weather-icon").append(icon);
				},
				complete: function(){
				},
				error	: function(xhr, status, error){
					console.log(error);
				}
			
		}); //end of ajax
	}
	    
   $(function(){
	  getWeather();
	});  
   

	</script>
   	
  </body>
  
</html>