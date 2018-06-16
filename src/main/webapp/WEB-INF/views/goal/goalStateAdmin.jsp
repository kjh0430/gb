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
#container {
  height: 300px;
  min-width: 310px;
  max-width: 800px;
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
	
    
   	<script type="text/javascript">
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
	

	   	function drawChart(){
	   		var chart = Highcharts.chart('container', {

	   		  chart: {
	   		    type: 'column'
	   		  },

	   		  title: {
	   		    text: 'Highcharts responsive chart'
	   		  },

	   		  subtitle: {
	   		    text: 'Resize the frame or click buttons to change appearance'
	   		  },

	   		  legend: {
	   		    align: 'right',
	   		    verticalAlign: 'middle',
	   		    layout: 'vertical'
	   		  },

	   		  xAxis: {
	   		    categories: ['Apples', 'Oranges', 'Bananas'],
	   		    labels: {
	   		      x: -10
	   		    }
	   		  },

	   		  yAxis: {
	   		    allowDecimals: false,
	   		    title: {
	   		      text: 'Amount'
	   		    }
	   		  },

	   		  series: [{
	   		    name: 'Christmas Eve',
	   		    data: [1, 4, 3]
	   		  }, {
	   		    name: 'Christmas Day before dinner',
	   		    data: [6, 4, 2]
	   		  }, {
	   		    name: 'Christmas Day after dinner',
	   		    data: [8, 4, 3]
	   		  }],

	   		  responsive: {
	   		    rules: [{
	   		      condition: {
	   		        maxWidth: 500
	   		      },
	   		      chartOptions: {
	   		        legend: {
	   		          align: 'center',
	   		          verticalAlign: 'bottom',
	   		          layout: 'horizontal'
	   		        },
	   		        yAxis: {
	   		          labels: {
	   		            align: 'left',
	   		            x: 0,
	   		            y: -5
	   		          },
	   		          title: {
	   		            text: null
	   		          }
	   		        },
	   		        subtitle: {
	   		          text: null
	   		        },
	   		        credits: {
	   		          enabled: false
	   		        }
	   		      }
	   		    }]
	   		  }
	   		});

	   		$('#small').click(function () {
	   		  chart.setSize(400, 300);
	   		});

	   		$('#large').click(function () {
	   		  chart.setSize(600, 300);
	   		});



	   	}
	
   	</script> 

</body>
</html>