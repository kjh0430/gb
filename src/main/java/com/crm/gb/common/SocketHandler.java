package com.crm.gb.common;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.crm.gb.emp.model.service.EmpService;
import com.crm.gb.emp.model.vo.Emp;
import com.crm.gb.notify.model.service.NotifyService;
import com.crm.gb.notify.model.vo.Notify;

public class SocketHandler extends TextWebSocketHandler{
	@Autowired
	EmpService empService;
	
	@Autowired
	NotifyService notifyService;
	
	Map<String, WebSocketSession> users;
	
	public SocketHandler() {
		// TODO Auto-generated constructor stub
	}
	
	@PostConstruct // 초기화 어노테이션 무조건 자동으로 호출해준다
	public void init() {
		users = new HashMap<String, WebSocketSession>();
	
	}
	
	// 웹소켓 서버에 클라이언트가 접속하면 호출되는 메소드
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
         
        super.afterConnectionEstablished(session);
        //System.out.println("클라이언트 접속됨");
         
        Map<String, Object> map = session.getAttributes();
        String emp_no = (String)map.get("emp_no");
        //System.out.println("map.emp_no : " + emp_no);
    	users.put(emp_no, session);

    }
    @Override
    public void handleTextMessage(WebSocketSession session,TextMessage message)throws Exception{
    	
        String to_no = (String)(message.getPayload());        
        //System.out.println("결재 할 사람 : "+to_no);       
         
        Map<String, Object> map = session.getAttributes();
        String from_no = (String)map.get("emp_no");
        Emp emp = empService.selectEmpNo(Integer.parseInt(from_no));
        String to_name = emp.getEmp_name();
        //System.out.println("결재 신청한 사람 : "+from_no);
        
       if(users.containsKey(to_no)) {
        	users.get(to_no).sendMessage(new TextMessage(to_name));
        }else {
        	Notify notify = new Notify(Integer.parseInt(from_no),Integer.parseInt(to_no),"A");
        	int result = notifyService.insertNotify(notify);
        }    	
    }
    
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        super.afterConnectionClosed(session, status);
        Map<String, Object> map = session.getAttributes();
        String emp_no = (String)map.get("emp_no");
    	users.remove(emp_no, session);
        System.out.println("클라이언트 접속해제");
    }
 
}
