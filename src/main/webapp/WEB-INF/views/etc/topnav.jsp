<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sidebar</title>
<style type="text/css">
 #menu1 li{
 	padding:10px;
 }
 #menu1 li a{
 	text-align:right;
 }
</style>
<script src="resources/js/EventSource.js"></script>
<script src="resources/js/PushNotify.js?ver=1"></script>
</head>

<body>
	<div class="top_nav">
		<div class="nav_menu">
			<nav>
				<div class="nav toggle">
					<a id="menu_toggle"><i class="fa fa-bars"></i></a>
				</div>

				<ul class="nav navbar-nav navbar-right">
					<li class=""><a href="javascript:;"
						class="user-profile dropdown-toggle" data-toggle="dropdown"
						aria-expanded="false">
							${ loginEmp.emp_name }님 <span class=" fa fa-angle-down"></span>
					</a>
						<ul class="dropdown-menu dropdown-usermenu pull-right">
							<li><a href="javascript:;"> 내정보수정</a></li>
							<li><a href="logout.do"><i
									class="fa fa-sign-out pull-right"></i> 로그아웃</a></li>
						</ul></li>

					<li role="presentation" class="dropdown" id="pst"><a
						href="javascript:;" class="dropdown-toggle info-number"
						data-toggle="dropdown" aria-expanded="false"> <i
							class="fa fa-bell-o"></i><span class="notify_badge badge bg-green"></span>
					</a>
						<ul id="menu1" class="dropdown-menu list-unstyled msg_list"
							role="menu">
						</ul></li>
				</ul>
			</nav>
		</div>
	</div>
	
	
	
	<script type="text/javascript">
	
	var emp_no = ${loginEmp.emp_no};

	var mNotify;
	$(function(){
		selectNotify();
		var mobile = [	        
	        'iphone', 'ipad', 'windows ce', 'android', 'blackberry', 'nokia',
	        'webos', 'opera mini', 'sonyerricsson', 'opera mobi', 'iemobile'
	    ];

	    for(var i in mobile) {	        
	        if(navigator.userAgent.toLowerCase().match(new RegExp(mobile[i]))) {	            
	        	mNotify = "mobile";
	        }
	    }
	    
		
	})//onload
	
	function selectNotify(){
		$.ajax({
			url:"selectNofity.do",
			type:"post",
			dataType:"json",
			data:{emp_no:emp_no},
			success:function(obj){
				var objStr =JSON.stringify(obj);
				var notify = JSON.parse(objStr);
				var size =  Object.keys(notify.list).length;	
				
				var value="";
				if(size>0){
					for(var i in notify.list){								
						value+="<li><p>"+notify.list[i].notify_date+"<a href='javascript:confirmNotify(\""+notify.list[i].notify_no+"\")'>"
						+"<i class='fa fa-times'></i></a></p>";
						if(notify.list[i].notify_category == 'M'){
							value+=notify.list[i].from_name+"님이 보낸 쪽지가 도착했습니다.</li>";
						}else if(notify.list[i].notify_category == 'A'){
							value+=notify.list[i].from_name+"님이 요청한 결재가 있습니다.</li>";
						}
					}	
					$("#menu1").html(value);
					$(".notify_badge").html(size);
				}else{
					$("#menu1").html("<li>새로운 알림이 없습니다.</li>");
					$(".notify_badge").css('display','none');
				}
				
			}			
			
		});//ajax
	}
	
	function confirmNotify(notify_no){
		
		$("#pst").addClass("open");
		$('.info_number').attr('aria-expanded', 'true');
		
		$.ajax({
			url:"updateNofity.do",
			type:"post",
			data:{notify_no:notify_no},
			success:function(result){
				if(result == "OK"){
					selectNotify();
				}else{
					alert("실패")
				}		
			}						
		});//ajax
		
	}
	
	
	
	if (window.Notification && Notification.permission !== "granted") {
	    Notification.requestPermission(function (status) {
	      if (Notification.permission !== status) {
	        Notification.permission = status;
	        console.log(status);
	      }
	    });
	}
	
   	var EventSource3 = new EventSource('notify.do?emp_no='+emp_no);
	EventSource3.onopen = function(){
		console.log("연결중");		
	}
	var from_no;
	EventSource3.addEventListener('from_name', function(event) {		
		console.log("from_name : "+ event.data);
		from_name = event.data;
		
	}, false);

	EventSource3.addEventListener('to_no', function(event) {	
		console.log("to_no : "+ event.data);
		
		if( emp_no == event.data){			
			 var img = 'resources/images/msg2.png';
			 var text = from_name+"님이 보낸 쪽지가 도착하였습니다.";
			
			 if (window.Notification && Notification.permission === "granted") {
				var notification = new Notification('Message', { body: text, icon: img });
    		}else if(mNotify =="mobile"){
    			alert(text);
    		}		
		}
		 
	}, false);
		 
		 
		 
		
</script>


</body>
</html>