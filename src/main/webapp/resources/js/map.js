/**
 * 
 */

	
	
	$(function(){
		var mapContainer = document.getElementById('map'), 
	    mapOption = { 
	        center: new daum.maps.LatLng(37.498993, 127.032909), 
	        level: 3 
	    };

		var map = new daum.maps.Map(mapContainer, mapOption);
		var markerPosition  = new daum.maps.LatLng(37.498993, 127.032909); 
		var marker = new daum.maps.Marker({
		    position: markerPosition
		});
		marker.setMap(map);
		
	});//onload
	
	
	

	//visitlist ajax
	function selectVisit(emp_no){
		if(emp_no==null){
			var string=$("#emp_no option:selected").val();	
			var emp_no = string.split(' / ',1)*1;
		}
		$.ajax({
			url:"visitList.do",
			type:"post",
			dataType:"json",
			data:{emp_no:emp_no,daily_date:$("#daily_date").val()},
			success:function(obj){
				console.log("obj : " +obj); 
				var objStr =JSON.stringify(obj);
				var visit = JSON.parse(objStr);	
				
				if(visit.list!=null){
					
					var values="";
					var loc=new Array();
					var points=new Array();
					
					for(var i in visit.list){
						values+= "<li><div class='block'><div class='block_content'><h2 class='title'>"
						+visit.list[i].client_name+"</h2><div class='daily_time'><span>"+visit.list[i].daily_date
						+"</span></div><p class='expert'>"+visit.list[i].daily_comment+"</p></div></div></li>"
						
						loc[i]= {title:visit.list[i].client_name,
								 latlng: new daum.maps.LatLng(visit.list[i].client_loc_x,visit.list[i].client_loc_y)};
						points[i] = new daum.maps.LatLng(visit.list[i].client_loc_x,visit.list[i].client_loc_y);  
					}
					
					$("#visitList").html(values);
					
					//지도시작!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
				    mapOption = { 
				        center: new daum.maps.LatLng(37.498993, 127.032909), 
				        level: 3 // 지도의 확대 레벨
				    };
	
					var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성				 
					var bounds = new daum.maps.LatLngBounds();
				
					for (i = 0; i < points.length; i++) {				  
					    bounds.extend(points[i]);
					}
					map.setBounds(bounds);
					
					// 마커를 표시할 위치와 title 객체 배열입니다 
					var positions = new Array();
					
					for(var i in loc){
						positions[i] = loc[i];
					}
					
					for (var i = 0; i < positions.length; i ++) {
					    // 마커를 생성합니다
					    var marker = new daum.maps.Marker({
					        map: map, // 마커를 표시할 지도
					        position: positions[i].latlng, // 마커를 표시할 위치
					        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다				       
					    });
					    
					    var iwContent = '<div style="padding:5px;text-align:center;width:100%">'+positions[i].title+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
					    iwPosition = positions[i].latlng; //인포윈도우 표시 위치입니다
	
						// 인포윈도우를 생성합니다
						var infowindow = new daum.maps.InfoWindow({
						    position : iwPosition, 
						    content : iwContent 
						});
						infowindow.open(map, marker); 					    
					}
									
					//선그리기
					var linePath = new Array();
					for (i = 0; i < points.length; i++) {					  
					    linePath[i] = points[i];
					}
	
					// 지도에 표시할 선을 생성합니다
					var polyline = new daum.maps.Polyline({
					    path: linePath, // 선을 구성하는 좌표배열 입니다
					    strokeWeight: 5, // 선의 두께 입니다
					    strokeColor: '#1ABB9C', // 선의 색깔입니다
					    strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
					    strokeStyle: 'solid' // 선의 스타일입니다
					});
	
					// 지도에 선을 표시합니다 
					polyline.setMap(map); 

				}else{
					//리스트 사이즈가 0이면 담당지역의 지도를 뿌려줌					
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new daum.maps.LatLng(37.498993, 127.032909), 
				        level: 4 // 지도의 확대 레벨
				    };  

					var map = new daum.maps.Map(mapContainer, mapOption); 
					
					
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new daum.maps.services.Geocoder();
					geocoder.addressSearch(obj.city+","+obj.county, function(result, status) {
	
					    // 정상적으로 검색이 완료됐으면 
					     if (status === daum.maps.services.Status.OK) {	
					        var coords = new daum.maps.LatLng(result[0].y, result[0].x);
					        map.setCenter(coords);
					    } 
					});  
					
					$("#visitList").html("방문한 거래처가 없습니다.");
				} //else 끝
			},
			error:function(request,status,errorData){
				console.log("error data : " +request.status+"\n"
						+"message : "+request.responseText+"\n"
						+"error : "+errorData);
			}	
		});	
	}//visitlist ajax
	
	//orderlist ajax
	function selectOrder(emp_no){	
		if(emp_no==null){
			var string=$("#emp_no option:selected").val();	
			var emp_no = string.split(' / ',1)*1;
		}
		console.log("emp_no : "+emp_no);
		$.ajax({
			url:"orderList.do",
			type:"post",
			dataType:"json",
			data:{emp_no:emp_no,daily_date:$("#daily_date").val()},
			success:function(obj){				
				console.log("order : "+obj);				
				var objStr =JSON.stringify(obj);
				var order = JSON.parse(objStr);	
				var size =  Object.keys(order.list).length;				
				var sum=0;
				
				if(size>0){
					var value="<thead><tr><th>주문번호</th><th>거래처명</th><th>금액</th></tr></thead><tbody>";	
					for(var i in order.list){	
						value+="<tr><td><a>"+order.list[i].order_no+"</a></td><td>"+order.list[i].client_company+"</td><td>"+order.list[i].total+"</td></tr>";
						sum+=order.list[i].total;
					}					
					value+="<tr style='border-top:solid 2px #ddd;font-weight:bold'><td>합계</td><td></td><td>"+sum+"</td></tbody>";
					$("#table_ol").html(value);
				}else{
					$("#table_ol").html("주문 내역이 없습니다.");
				} //else 끝 */
			},
			error:function(request,status,errorData){
				console.log("error data : " +request.status+"\n"
						+"message : "+request.responseText+"\n"
						+"error : "+errorData);
			}	
		});	
	}	
	
		
	
	