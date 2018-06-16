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

<script>

	var goal= [];
	var perform =[];
	var month = [];
	function selectEmp(obj){
		
		 var content = $(obj);
	     var td = content.children();
	
	     var emp_name = td.eq(0).text();
	     var dept_name = td.eq(1).text();
	     var emp_job = td.eq(2).text();
	     var emp_email = td.eq(3).text();
	      emp_no = td.eq(4).text();
	     $('#searchModal').modal("hide");
	
	 
	      $.ajax({
	    url:"getgoalInfo.do",
		    type:"post",
		    dataType:"json",
		    data:{
		    	emp_no:emp_no
		    },
		    success:function(obj){
		    	
		    	var objStr = JSON.stringify(obj);
		        var jsonl = JSON.parse(objStr);
		        var size = Object.keys(jsonl.list).length;
		        
		        values = "<table class='table table-striped table-bordered table-responsive' style='min-width:550px;'><thead><tr><th>(월)</th><th>목표(원)</th><th>매출(원)</th><th>달성(%)</th></thead>"
		            + "<tbody>";
					for(var i in jsonl.list){
						values+="<tr><td>"+jsonl.list[i].goalMonth+"</td>"+
									"<td>"+jsonl.list[i].goalMoney+"</td>"+
									"<td>"+jsonl.list[i].sales+"</td>"+
									"<td>"+jsonl.list[i].acheive+"%</td></tr>"				
						goal.push(jsonl.list[i].goalMoney);
						perform.push(jsonl.list[i].sales);
						month.push(jsonl.list[i].goalMonth);
					}
					
		            values +="</tbody></table>";
		            $('#goalEmpTable').html(values);
		            drawChart();
		   		}
	   	  });
	     
		
	}


	function searchEmp(){
	
		emp_name=$('#empName').val();
		
		if($('#empName').val()!=null){
		
		$.ajax({
		url:"search.do",
		type:"post",
		dataType:"json",
		data:{
			emp_name:emp_name,
			emp_no:"${loginEmp.emp_no}"
		},
		success :function(obj){
			var objStr = JSON.stringify(obj);
	        var jsonl = JSON.parse(objStr);
	        var size = Object.keys(jsonl.list).length;	
			
	     	if(size>0){
	            var value = "<table class='table table-hover' id='getvalues'><thead><tr><th>이름</th><th>직급</th><th>부서</th><th>e-mail</th><th>사원번호</th></tr></thead><tbody>";
	
	               for ( var i in jsonl.list) {
	
	                  value += "<tr onclick='selectEmp(this);' style='cusor:hand'><td>"
	                        + jsonl.list[i].emp_name
	                        + "</td><td>"
	                        + jsonl.list[i].emp_job
	                        + "</td><td>"
	                        + jsonl.list[i].dept_name
	                        + "</td><td>"
	                        + jsonl.list[i].emp_email
	                        + "</td><td>"
	                        + jsonl.list[i].emp_no + "</td></tr>";
	               }
	
	               value += "</tbody></table>";
	
	               $('#searchModal').modal("show");
	               $('#searchTable').html(value);
	     	}else{
	     		values="<br><br><br><br><br><br><h2 style='text-align:center;'>검색 결과가 없습니다."+
	     		"</h2><br><br><br><br><br><br>"
	     		 $('#searchModal').modal("show");
	            $('#searchTable').html(values);	     		
	    	 	}
			}
		});
		}else{
			alert("검색할 사원을 입력해주세요.");
		}
		
		
	}

</script>
<style>
#getvalues th:nth-child(5){
display:none;
}
#getvalues td:nth-child(5){
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
					<%@ include file="../etc/adminsidebar.jsp"%>
					<!-- /sidebar menu -->

				</div>
			</div>

			<!-- top navigation -->
			<div class="top_nav">
				<div class="nav_menu">
					<nav>
						<div class="nav toggle">
							<a id="menu_toggle"><i class="fa fa-bars"></i></a>
						</div>

						<ul class="nav navbar-nav navbar-right">
							<li class=""><a href="javascript:;"
								class="user-profile dropdown-toggle" data-toggle="dropdown"
								aria-expanded="false"> <img src="images/img.jpg" alt="">John
									Doe <span class=" fa fa-angle-down"></span>
							</a>
								<ul class="dropdown-menu dropdown-usermenu pull-right">
									<li><a href="javascript:;"> Profile</a></li>
									<li><a href="javascript:;"> <span
											class="badge bg-red pull-right">50%</span> <span>Settings</span>
									</a></li>
									<li><a href="javascript:;">Help</a></li>
									<li><a href="login.html"><i
											class="fa fa-sign-out pull-right"></i> Log Out</a></li>
								</ul></li>

							<li role="presentation" class="dropdown"><a
								href="javascript:;" class="dropdown-toggle info-number"
								data-toggle="dropdown" aria-expanded="false"> <i
									class="fa fa-envelope-o"></i> <span class="badge bg-green">6</span>
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
									<li>
										<div class="text-center">
											<a> <strong>See All Alerts</strong> <i
												class="fa fa-angle-right"></i>
											</a>
										</div>
									</li>
								</ul></li>
						</ul>
					</nav>
				</div>
			</div>
			<!-- /top navigation -->

			<!-- page content -->
			<div class="right_col" role="main">
				<!-- top tiles -->
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>목표 현황</h3>
						</div>
						<div style="float:right">
							<div class="input-group" style="width:300px">
								<input type="text" class="form-control" placeholder="사원별 검색" id="empName"> 
								<span class="input-group-btn">
								<button type="submit" class="btn btn-primary" onclick="searchEmp();">검색</button>
								</span>
							</div>
							
							<!-- 사원 검색 modal -->
							  <div class="modal fade sendMsg2" tabindex="-1" role="dialog"
                                 id="searchModal" aria-hidden="true">
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
                              <!-- 	사원 검색 modal 끝 -->
						</div>
					</div>

					<div class="clearfix"></div>
					</div><!-- end row -->
					
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="dashboard_graph">

									

									<div class="col-md-9 col-sm-9 col-xs-12">
										<div id="chart_div_1">
											<canvas id="chart"></canvas>
										</div>
										
									</div>
	
								</div>
							</div>
						</div>

					</div>

					<div class="row" style="vertical-align: middle;">
						<div class="col-xs-12">
							<div class="x_panel">
								<div id="goalEmpTable"></div>								
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /page content -->
		</div>
	
	<!-- jQuery -->
	<script src="resources/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	
	<!-- Custom Theme Scripts -->
	<script src="resources/build/js/custom.min.js"></script>
	
	<!-- Chart -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.min.js"></script>
    
   	<script type="text/javascript">
   		function drawChart(){
   			
   			var data = {
   				  labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul"],
   				  datasets: [{
   				    label: "Dataset #1",
   				    backgroundColor: "rgba(255,99,132,0.2)",
   				    borderColor: "rgba(255,99,132,1)",
   				    borderWidth: 2,
   				    hoverBackgroundColor: "rgba(255,99,132,0.4)",
   				    hoverBorderColor: "rgba(255,99,132,1)",
   				    data: [65, 59, 20, 81, 56, 55, 40],
   				  }]
   				};

   				var options = {
   				  maintainAspectRatio: false,
   				  scales: {
   				    yAxes: [{
   				      stacked: true,
   				      gridLines: {
   				        display: true,
   				        color: "rgba(255,99,132,0.2)"
   				      }
   				    }],
   				    xAxes: [{
   				      gridLines: {
   				        display: false
   				      }
   				    }]
   				  }
   				};

   				Chart.Bar('chart', {
   				  options: options,
   				  data: data
   				});

   		}
   	
   	</script> 

</body>
</html>