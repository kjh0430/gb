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

<script type="text/javascript" src="resources/js/jquery-3.3.1.min.js"></script>
<script>


</script>
<style>
#getvalues th:nth-child(5){
display:none;
}
#getvalues td:nth-child(5){
display:none;

}
#container {
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
					<%@ include file="../etc/sidebar.jsp"%>
					<!-- /sidebar menu -->

				</div>
			</div>

			<!-- top navigation -->

			<%@ include file="../etc/topnav.jsp"%>

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
									<div class="col-md-12 col-sm-12 col-xs-12">
										<div id="container"></div>
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
				   <%@ include file="../etc/footer.jsp" %>
			</div>
			<!-- /page content -->
		</div>
	
    
	<!-- jQuery -->
	<script src="resources/vendors/jquery/dist/jquery.min.js"></script>
	
	<!-- Bootstrap -->
	<script src="resources/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	
	<!-- Custom Theme Scripts -->
	<script src="resources/build/js/custom.min.js"></script>
	
	<script src="https://code.highcharts.com/highcharts.js"></script>
	<script src="https://code.highcharts.com/modules/exporting.js"></script>
	<script src="https://code.highcharts.com/modules/export-data.js"></script>
	
    
   	<script type="text/javascript">
  	
   	var goal= [];
	var perform =[];
	var month = [];
	
   	$(document).ready(function() {
   		
   		
   		
        $.ajax({
  	  	  url:"getgoalInfo.do",
  		    type:"post",
  		    dataType:"json",
  		    data:{
  		    	emp_no:"${loginEmp.emp_no}"
  		    },
  		    success:function(obj){
  		    	goal = [];
  		    	perform =[];
  		    	month = [];
  		    	
  		    	var objStr = JSON.stringify(obj);
  		        var jsonl = JSON.parse(objStr);
  		        var size = Object.keys(jsonl.list).length;
  		        
  		        values = "<table class='table table-striped table-bordered table-responsive' style='min-width:550px;'><thead><tr><th>(월)</th><th>목표(원)</th><th>매출(원)</th><th>달성(%)</th></thead>"
  		            + "<tbody>";
  					for(var i in jsonl.list){
  						
  						str=String(jsonl.list[i].goalMoney);
  						str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
						str1=String(jsonl.list[i].sales);
						str1.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
  						
  						
  						values+="<tr><td>"+jsonl.list[i].goalMonth+"</td>"+
  									"<td>"+str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"</td>"+
  									"<td>"+str1.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,')+"</td>"+
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
   		
   		
   		
   	});
   	
   
	

	   	function drawChart(){

	   		Highcharts.chart('container', {
	   		  chart: {
	   		    zoomType: 'x'
	   		  },
	   		  title: {
	   		    text: '목표 달성 현황'
	   		  },
	   		  subtitle: {
	   		    text: ''
	   		  },
	   		  xAxis: [{
	   		    categories: month,
	   		    crosshair: true
	   		  }],
	   		  yAxis: [{ // Primary yAxis
	   		    labels: {
	   		       format: '{value} 원', 
	   		      style: {
	   		        color: Highcharts.getOptions().colors[1]
	   		      }
	   		    },
	   		    title: {
	   		      text: '실적',
	   		      style: {
	   		        color: Highcharts.getOptions().colors[1]
	   		      }
	   		    }
	   		  }, { // Secondary yAxis
	   		    title: {
	   		      text: '목표',
	   		      style: {
	   		        color: Highcharts.getOptions().colors[0]
	   		      }
	   		    },
	   		    labels: {
	   		      format: '{value} 원',
	   		      style: {
	   		        color: Highcharts.getOptions().colors[0]
	   		      }
	   		    },
	   		    opposite: true
	   		  }],
	   		  tooltip: {
	   		    shared: true
	   		  },
	   		  legend: {
	   		    layout: 'vertical',
	   		    align: 'left',
	   		    x: 120,
	   		    verticalAlign: 'top',
	   		    y: 100,
	   		    floating: true,
	   		    backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
	   		  },
	   		  exporting:{
	   			 'enabled':false 
	   		  },
	   		  series: [{
	   		    name: '목표',
	   		    type: 'column',
	   		    yAxis: 1,
	   		    data: goal,
	   		    tooltip: {
	   		      valueSuffix: ' 원'
	   		    }

	   		  }, {
	   		    name: '실적',
	   		    type: 'spline',
	   		    data: perform,
	   		    tooltip: {
	   		      valueSuffix: '원'
	   		    }
	   		  }]
	   		});


	   	}
	
   	</script> 

</body>
</html>