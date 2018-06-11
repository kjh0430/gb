package com.crm.gb.todolist.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.gb.emp.model.vo.Emp;
import com.crm.gb.todolist.model.service.TodoListService;
import com.crm.gb.todolist.model.vo.TodoList;

@Controller
public class TodoListController {
	
	private static final Logger logger = LoggerFactory.getLogger(TodoListController.class);
	
	@Autowired
	private TodoListService todolistService;
	
	@RequestMapping(value="todoInsert.do", method=RequestMethod.POST)
	@ResponseBody
	public void todoInsert(TodoList todolist, HttpServletResponse response) throws IOException{
		
		logger.info("todoInsert 실행");
		System.out.println("controller에서 출력 todolist : " + todolist);
		int result = todolistService.insertTodoList(todolist);
		
		System.out.println("todoInsert 여기까지 실행됨");
		
		JSONObject job = new JSONObject();
		job.put("emp_no", todolist.getEmp_no());
		job.put("todo1", todolist.getTodo1());
		job.put("todo2", todolist.getTodo2());
		job.put("todo3", todolist.getTodo3());
		job.put("todo4", todolist.getTodo4());
		job.put("todo5", todolist.getTodo5());

		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(job.toJSONString());
		out.flush();
		out.close();
			
	}
	
	@RequestMapping(value="todoSelect.do", method=RequestMethod.POST)
	@ResponseBody
	public void todoSelect(TodoList todolist, Model model, @RequestParam(value="emp_no") String emp_num, HttpServletResponse response) throws IOException{
		
		logger.info("todoSelect 실행");
		int emp_no = (Integer.parseInt(emp_num));
		
		System.out.println("TodoList select controller에서 출력 emp_no : " + emp_no);
		System.out.println("controller에서 출력 todolist : " + todolist);
		TodoList detailtodolist = todolistService.selectTodoList(emp_no);
		
		model.addAttribute("todolist", detailtodolist);
		
		System.out.println("todoSelect 여기까지 실행됨");
		
		JSONObject job = new JSONObject();
		job.put("emp_no", detailtodolist.getEmp_no());
		job.put("todo1", detailtodolist.getTodo1());
		job.put("todo2", detailtodolist.getTodo2());
		job.put("todo3", detailtodolist.getTodo3());
		job.put("todo4", detailtodolist.getTodo4());
		job.put("todo5", detailtodolist.getTodo5());

		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(job.toJSONString());
		out.flush();
		out.close();
			
	}
	
}
