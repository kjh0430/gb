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
<!-- NProgress -->
<link href="resources/vendors/nprogress/nprogress.css" rel="stylesheet">
<!-- iCheck -->
<link href="resources/vendors/iCheck/skins/flat/green.css"
	rel="stylesheet">

<!-- bootstrap-progressbar -->
<link
	href="resources/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet">
<!-- JQVMap -->
<link href="resources/vendors/jqvmap/dist/jqvmap.min.css"
	rel="stylesheet" />
<!-- bootstrap-daterangepicker -->
<link
	href="resources/vendors/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="resources/build/css/custom.min.css" rel="stylesheet">


<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		google.charts.load('current', {'packages':['corechart']});
		google.charts.setOnLoadCallback(drawVisualization);
	
		function drawVisualization() { 
			var data = google.visualization.arrayToDataTable([
					['Month', 'Bolivia', 'Ecuador', 'Madagascar', 'Papua New Guinea', 'Rwanda', 'Average'],
					['2004/05',  165,      938,         522,             998,           450,      614.6],
					['2005/06',  135,      1120,        599,             1268,          288,      682],
					['2006/07',  157,      1167,        587,             807,           397,      623],
					['2007/08',  139,      1110,        615,             968,           215,      609.4],
					['2008/09',  136,      691,         629,             1026,          366,      569.6]
				]);
			var options = {
					title : 'Monthly Coffee Production by Country',
					vAxis: {title: 'Cups'},
					hAxis: {title: 'Month'}, 
					seriesType: 'bars',
					series: {5: {type: 'line'}}
				};
			
			var chart = new google.visualization.ComboChart(document.getElementById('chart_div_1'));
			chart.draw(data, options);
		}
	</script>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

			google.charts.load('current', {packages: ['corechart', 'bar']});
			google.charts.setOnLoadCallback(drawStacked);
			
			function drawStacked() {
			      var data = google.visualization.arrayToDataTable([
			        ['City', '2010 Population', '2000 Population'],
			        ['New York City, NY', 8175000, 8008000],
			        ['Los Angeles, CA', 3792000, 3694000],
			        ['Chicago, IL', 2695000, 2896000],
			        ['Houston, TX', 2099000, 1953000],
			        ['Philadelphia, PA', 1526000, 1517000]
			      ]);
			
			      var options = {
			        title: 'Population of Largest U.S. Cities',
			        chartArea: {width: '50%'},
			        isStacked: true,
			        hAxis: {
			          title: 'Total Population',
			          minValue: 0,
			        },
			        vAxis: {
			          title: 'City'
			        }
			      };
			      var chart = new google.visualization.BarChart(document.getElementById('chart_div_2'));
			      chart.draw(data, options);
			    }




</script>
<script>
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
            + "<tbody>"
 
			
			for(var i in jsonl.list){
				
				
				
			values+="<tr><td>"+jsonl.list[i].goalMonth+"</td>"+
						"<td>"+jsonl.list[i].goalMoney+"</td>"+
						"<td>"+jsonl.list[i].sales+"</td>"+
						"<td>"+jsonl.list[i].acheive+"%</td></tr>"				
				
			}
            values +="</tbody></table>";
            $('#goalEmpTable').html(values);
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

									<div class="row x_title">
										<div class="col-md-6">
											<h3>
												Network Activities <small>Graph title sub-title</small>
											</h3>
										</div>
										<div class="col-md-6">
											<div id="reportrange" class="pull-right"
												style="background: #fff; cursor: pointer; padding: 5px 10px; border: 1px solid #ccc">
												<i class="glyphicon glyphicon-calendar fa fa-calendar"></i>
												<span>December 30, 2014 - January 28, 2015</span> <b
													class="caret"></b>
											</div>
										</div>
									</div>

									<div class="col-md-9 col-sm-9 col-xs-12">
										<div id="chart_div_1" style="width:900px; height: 500px;"></div>
										<hr>
										<div id="chart_div_2"></div>
									</div>
									
									  
									
									<!-- <div class="col-md-3 col-sm-3 col-xs-12 bg-white">
									
									
										<div class="x_title">
											<h2>Top Campaign Performance</h2>
											<div class="clearfix"></div>
										</div>

										<div class="col-md-12 col-sm-12 col-xs-6">
											<div>
												<p>Facebook Campaign</p>
												<div class="">
													<div class="progress progress_sm" style="width: 76%;">
														<div class="progress-bar bg-green" role="progressbar"
															data-transitiongoal="80"></div>
													</div>
												</div>
											</div>
											<div>
												<p>Twitter Campaign</p>
												<div class="">
													<div class="progress progress_sm" style="width: 76%;">
														<div class="progress-bar bg-green" role="progressbar"
															data-transitiongoal="60"></div>
													</div>
												</div>
											</div>
										</div>
										<div class="col-md-12 col-sm-12 col-xs-6">
											<div>
												<p>Conventional Media</p>
												<div class="">
													<div class="progress progress_sm" style="width: 76%;">
														<div class="progress-bar bg-green" role="progressbar"
															data-transitiongoal="40"></div>
													</div>
												</div>
											</div>
											<div>
												<p>Bill boards</p>
												<div class="">
													<div class="progress progress_sm" style="width: 76%;">
														<div class="progress-bar bg-green" role="progressbar"
															data-transitiongoal="50"></div>
													</div>
												</div>
											</div>
										</div>

									</div> -->
								</div>
							</div>
						</div>

					</div>

					<div class="row" style="vertical-align: middle;">
						<div class="col-xs-12">
							<div class="x_panel">
							<div id="goalEmpTable"></div>
								
								
									
									
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- /page content -->
		</div>
	</div>

	<!-- jQuery -->
	<script src="resources/vendors/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script src="resources/vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script src="resources/vendors/nprogress/nprogress.js"></script>
	<!-- Chart.js -->
	
	<!-- gauge.js -->
	<script src="resources/vendors/gauge.js/dist/gauge.min.js"></script>
	<!-- bootstrap-progressbar -->
	<script
		src="resources/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<!-- iCheck -->
	<script src="resources/vendors/iCheck/icheck.min.js"></script>
	<!-- Skycons -->
	<script src="resources/vendors/skycons/skycons.js"></script>
	<!-- Flot -->
	<script src="resources/vendors/Flot/jquery.flot.js"></script>
	<script src="resources/vendors/Flot/jquery.flot.pie.js"></script>
	<script src="resources/vendors/Flot/jquery.flot.time.js"></script>
	<script src="resources/vendors/Flot/jquery.flot.stack.js"></script>
	<script src="resources/vendors/Flot/jquery.flot.resize.js"></script>
	<!-- Flot plugins -->
	<script
		src="resources/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
	<script
		src="resources/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
	<script src="resources/vendors/flot.curvedlines/curvedLines.js"></script>
	<!-- DateJS -->
	<script src="resources/vendors/DateJS/build/date.js"></script>
	<!-- JQVMap -->
	<script src="resources/vendors/jqvmap/dist/jquery.vmap.js"></script>
	<script src="resources/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
	<script
		src="resources/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
	<!-- bootstrap-daterangepicker -->
	

	<!-- Custom Theme Scripts -->
	<script src="resources/build/js/custom.min.js"></script>

</body>
</html>