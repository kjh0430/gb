package com.crm.gb.todolist.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.gb.todolist.model.service.TodoListService;
import com.crm.gb.todolist.model.vo.TodoList;

@Controller
public class TodoListController {
	
	private static final Logger logger = LoggerFactory.getLogger(TodoListController.class);
	
	@Autowired
	private TodoListService todolistService;
	
	@RequestMapping(value="todoInsert.do", method=RequestMethod.POST)
	@ResponseBody
	public void todoInsert(@RequestParam(value="emp_no") String emp_num, HttpServletResponse response) throws IOException{
		
		logger.info("todoInsert 실행");
		
		int emp_no = (Integer.parseInt(emp_num));
		System.out.println("emp_no : " + emp_no);
		
		/*System.out.println("전송온 값 : " + todoList);
		
		int result = todolistService.insertTodoList(todoList);
		
		JSONObject job = new JSONObject();
		job.put("todoList", todoList);
		
		System.out.println("todoList : " + todoList);

		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(job.toJSONString());
		out.flush();
		out.close();*/
			
	}
	
}
