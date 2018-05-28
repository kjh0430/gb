package com.crm.gb.message.controller;





import java.io.IOException; 
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import com.crm.gb.message.model.service.MessageService;
import com.crm.gb.message.model.vo.Message;


@Controller
public class MessageController {
	
	@Autowired
	private MessageService MessageService;

	@RequestMapping("messageList.do")
	public String loginView() {
		return "message/messageList";
		
	}
	
	Message sendmsg;
	
	//사원 검색
	@RequestMapping(value="searchEmp.do" ,method=RequestMethod.POST)
	@ResponseBody
	public void searchEmp(Message message,HttpServletResponse  response) throws IOException {	
		
	
		ArrayList<Message> SearchEmp=MessageService.selectSearch(message);		
		JSONArray jarr=new JSONArray();
		System.out.println("사원검색"+message.getMessage_from_no());
		for(Message msg : SearchEmp) {
			
			JSONObject jsonobject=new JSONObject();
			
			jsonobject.put("emp_name",msg.getEmp_name());
			jsonobject.put("dept_name",msg.getDept_name());
			jsonobject.put("emp_job",msg.getJob_name());
			jsonobject.put("emp_email", msg.getEmp_email());
			jsonobject.put("emp_no", msg.getEmp_no());
			jarr.add(jsonobject);
			
			}
		
		JSONObject send=new JSONObject();
		send.put("list",jarr);
		
		
		
	
		response.setContentType("application/json; charset=utf-8");	
		System.out.println("messageController:"+send);
		PrintWriter out=response.getWriter();
		out.println(send.toJSONString());
		out.flush();
		out.close();
	
	}
	
	//메시지 보내기
	@RequestMapping(value="sub.do",method=RequestMethod.POST)
	public void submitMessage(Message message,HttpServletResponse response,@RequestParam("no") int no) throws IOException {
		System.out.println("보내는사람 번호"+message.getMessage_from_no());
		System.out.println("받는사람 번호"+message.getMessage_to_no());
		System.out.println("제목"+message.getMessage_title());
		System.out.println("내용"+message.getMessage_content());
		System.out.println("no"+no);
		
		
		SimpleDateFormat format=new SimpleDateFormat("yyyy.MM.dd HH:mm:ss", Locale.KOREA);
		Date date=new Date();
		Date time=new Date(date.getTime());
		String getdate=format.format(time);
		System.out.println(getdate);
		
		
		message.setMessage_date(getdate);
		
		int result=MessageService.insertMessage(message);
		
		sendmsg = new Message(message.getMessage_from_no(),message.getMessage_to_no(),message.getMessage_date());
		
		System.out.println("sendmsg : " + sendmsg);
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out=response.getWriter();
		out.append("메시지가 성공적으로 전송되었습니다.");
		out.flush();
		out.close();
	}
	//받은 메시지함
	@RequestMapping(value="getMessage.do",method=RequestMethod.GET)
	public void getMessage(Message message ,HttpServletResponse  response) throws IOException {		
		
		ArrayList<Message> receiveMessage=MessageService.selectReceiveMessage(message);		
		JSONArray jarr=new JSONArray();

		for(Message msg : receiveMessage) {
			
			JSONObject jsonobject=new JSONObject();
			
			System.out.println("받은 메시지함:"+msg.getEmp_name()+","+msg.getMessage_from_no());
			jsonobject.put("from_empName",msg.getEmp_name());
			jsonobject.put("from_empNo",msg.getMessage_from_no());
			jsonobject.put("message_title",msg.getMessage_title());
			jsonobject.put("message_date",msg.getMessage_date());
			jsonobject.put("message_content", msg.getMessage_content());
			jsonobject.put("message_no",msg.getMessage_no());
			jsonobject.put("message_confirm",msg.getMessage_confirm());
			jarr.add(jsonobject);
			
			}
		
		JSONObject send=new JSONObject();
		send.put("list",jarr);
			
		response.setContentType("application/json; charset=utf-8");	
		System.out.println("messageController:"+send);
		PrintWriter out=response.getWriter();
		out.println(send.toJSONString());
		out.flush();
		out.close();
		System.out.println("컨트롤러 나감");
	}
	
	
	//보낸 메시지함
	@RequestMapping(value="sendMessage.do",method=RequestMethod.GET)
	public void sendMessage(Message message ,HttpServletResponse  response) throws IOException {
		
		
		ArrayList<Message> sendMessage=MessageService.selectSendMessage(message);		
		JSONArray jarr=new JSONArray();

		for(Message msg : sendMessage) {
			
			JSONObject jsonobject=new JSONObject();
			System.out.println("보낸 메시지함"+msg.getEmp_name()+","+msg.getMessage_to_no());
			jsonobject.put("to_empName",msg.getEmp_name());
			jsonobject.put("to_emp_no", msg.getMessage_to_no());
			jsonobject.put("message_title",msg.getMessage_title());
			jsonobject.put("message_date",msg.getMessage_date());
			jsonobject.put("message_content", msg.getMessage_content());
			
			jarr.add(jsonobject);
			
			}
		
		JSONObject send=new JSONObject();
		send.put("list",jarr);
	
		response.setContentType("application/json; charset=utf-8");	
		System.out.println("messageController:"+send);
		PrintWriter out=response.getWriter();
		out.println(send.toJSONString());
		out.flush();
		out.close();
	}
	
	//답장하기
	/*@RequestMapping(value="sendAnswer.do",method=RequestMethod.POST)
	public void sendAnswer(Message message,HttpServletResponse response) throws IOException {
		System.out.println("보내는사람 번호"+message.getMessage_from_no());
		System.out.println("받는사람 번호"+message.getMessage_to_no());
		System.out.println("제목"+message.getMessage_title());
		System.out.println("내용"+message.getMessage_content());
		SimpleDateFormat format=new SimpleDateFormat("yyyy.MM.dd HH:mm:ss", Locale.KOREA);
		Date date=new Date();
		Date time=new Date(date.getTime());
		String getdate=format.format(time);
		System.out.println(getdate);
		
		
		message.setMessage_date(getdate);
		
		int result=MessageService.insertMessage(message);
	
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out=response.getWriter();
		out.append("메시지가 전송되었습니다.");
		out.flush();
		out.close();		
	}*/
	
	
	@RequestMapping(value="readMessage.do")
	public void readMessage(Message message,HttpServletResponse response) throws IOException {
		
		int result=MessageService.updateReadMessage(message);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out=response.getWriter();
		out.append("");
		out.flush();
		out.close();
	}
	
	
	
	@RequestMapping(value="notify.do")
	public void getNotify(Message message,HttpServletResponse response) throws IOException {
		response.setContentType("text/event-stream;charset=UTF-8");
		response.setHeader("Cache-Control", "no-cache");
		response.setHeader("Connection", "keep-alive");
		

		PrintWriter out = response.getWriter();		
		if(sendmsg != null) {
			out.write("data: " + "새 공지글이 등록되었습니다." + "\n\n");
			out.flush();
		}
		
		
	}
	
/*	@RequestMapping(value="notify.do")
	public ResponseBodyEmitter getNotify(Message message) {
		 final SseEmitter emitter = new SseEmitter();
	        ExecutorService service = Executors.newSingleThreadExecutor();
	        service.execute(() -> {
	           message.setEmp_no(1);
	                try {
	                    emitter.send(message, MediaType.TEXT_PLAIN);

	                    Thread.sleep(200);
	                } catch (Exception e) {
	                    e.printStackTrace();
	                    emitter.completeWithError(e);
	                    return;
	                }
	           
	            emitter.complete();
	        });
	        return emitter;	
	}*/
	
	
}
