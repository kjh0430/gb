<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>topnav</title>
</head>
<script type="text/javascript">
	var eventSource = new EventSource("notify.do");
	eventSource.onopen = function(e){
		console.log("연결중");
		
	}
	eventSource.onmessage = function(event) {
	    console.log("received event data : " + event.data);
	};
		
</script>
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
							
							<li><a href="javascript:;">쪽지함</a></li>
							<li><a href="logout.do"><i
									class="fa fa-sign-out pull-right"></i> 로그아웃</a></li>
						</ul></li>

					<li role="presentation" class="dropdown"><a
						href="javascript:;" class="dropdown-toggle info-number"
						data-toggle="dropdown" aria-expanded="false"> <i
							class="fa fa-bell-o"></i> <span class="badge bg-green">6</span>
					</a>
						<ul id="menu1" class="dropdown-menu list-unstyled msg_list"
							role="menu">
							<li><a> <span class="image"><img
										src="images/img.jpg" alt="Profile Image" /></span> <span> <span>John
											Smith</span> <span class="time">3 mins ago</span>
								</span> <span class="message"> Film festivals used to be
										do-or-die moments for movie makers. They were where... </span>
							</a></li>
							<li><a> <span class="image"><img
										src="images/img.jpg" alt="Profile Image" /></span> <span> <span>John
											Smith</span> <span class="time">3 mins ago</span>
								</span> <span class="message"> Film festivals used to be
										do-or-die moments for movie makers. They were where... </span>
							</a></li>
							
						</ul></li>
				</ul>
			</nav>
		</div>
	</div>


</body>
</html>