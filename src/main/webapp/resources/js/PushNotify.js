/**
 * 
 */

var ws=null;
$(function(){
	
	ws = new WebSocket("ws://192.168.110.96:7300/gb/hello.do?emp_no="+emp_no);
    ws.onopen = function () {
      // console.log("onopen");
    };
    ws.onmessage = function (event) {
    	//console.log("onmessage" + event.data);
    		
		 var img = 'resources/images/apr.png';
		 var text = event.data+"님이 결재를 신청하셨습니다.";
		
		 if (window.Notification && Notification.permission === "granted") {
			var notification = new Notification('Message', { body: text, icon: img });
		 }else if(mNotify =="mobile"){
   			alert(text);
   		}		
		
    };
    ws.onclose = function (event) {
    	//console.log("onclose");
    };

	
})

