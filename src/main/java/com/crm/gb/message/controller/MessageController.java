package com.crm.gb.message.controller;



import static org.hamcrest.CoreMatchers.instanceOf;

import java.io.IOException; 
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	
	@RequestMapping(value="searchEmp.do" ,method=RequestMethod.POST)
	@ResponseBody
	public void searchEmp(@RequestParam(name="searchName") String empName,HttpServletResponse  response) throws IOException {
	
		
	
		ArrayList<Message> SearchEmp=MessageService.selectSearch(empName);
		
		JSONArray jarr=new JSONArray();
		
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
	
	
	@RequestMapping(value="sub.do",method=RequestMethod.POST)
	@ResponseBody
			public void submitMessage(Message message,HttpServletResponse response,HttpServletRequest request) throws IOException {
		System.out.println("보내는사람 번호"+message.getMessage_from_no());
		System.out.println("받는사람 번호"+message.getMessage_to_no());
		System.out.println("제목"+message.getMessage_title());
		System.out.println("내용"+message.getMessage_content());
		String no=request.getParameter("no");
		System.out.println("no"+no);
		
		int result=MessageService.insertMessage(message);
	
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out=response.getWriter();
		out.append("메시지가 성공적으로 전송되었습니다.");
		out.flush();
		out.close();
	}
	
	@RequestMapping(value="getMessage.do",method=RequestMethod.POST)
	public void getMessage() {
		
		
		
	}
	
}
