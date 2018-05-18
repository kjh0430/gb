package com.crm.gb.message.controller;



import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.crm.gb.emp.model.vo.Emp;
import com.crm.gb.message.model.service.MessageService;


@Controller
public class MessageController {

	
	@Autowired
	private MessageService MessageService;

	@RequestMapping("messageList.do")
	public String loginView() {
		return "message/messageList";
		
	}
	
	
	@RequestMapping(value="searchEmp.do" ,method=RequestMethod.POST)
	public String searchEmp(@RequestParam(name="searchName") String empName,HttpServletResponse  response) {
	
		
	
		ArrayList<Emp> SearchEmp=MessageService.selectSearch(empName);
		
		JSONArray jarr=new JSONArray();
		
		for(Emp emp : SearchEmp) {
			
			JSONObject jsonobject=new JSONObject();
			
			
			
		}
		
		
		
		
		
		response.setContentType("application/json; charset=utf-8");	
		
		return "";
	}
	

	
}
