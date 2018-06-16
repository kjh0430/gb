package com.crm.gb.goal.controller;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.gb.goal.model.service.GoalService;
import com.crm.gb.goal.model.vo.Goal;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

@Controller
public class GoalController {
	private static final Logger logger=LoggerFactory.getLogger(GoalController.class);
	
	@Autowired
	private GoalService goalService;
	
		
	//목표 관리 리스트 출력
	@RequestMapping("goalAdmin.do")
	public String GoalAdmin(Goal goal, Model model) {
		
		ArrayList<Goal> goalStateList=goalService.selectGoalStateList();
		
		System.out.println("목표 관리 리스트"+goalStateList);
		
		
		
		
		model.addAttribute("goalStateList", goalStateList); 
		
		
		
		return "goal/goalAdmin";
	}
	
	//달별 리스트 출력
	@RequestMapping("goalMonthList.do")
	public String GoalAdminList() {
		
		return "goal/goalAdmin";
	}
	
	
	
	@RequestMapping("goalAdminDetail.do")
	public String GoalAmdinDetail(Goal goal, Model model,@RequestParam(value="emp_no") int emp_no) {
		
		return "goal/goalAdminDetail";
	}
	
	
	@RequestMapping("goalState.do")
	public String GoalSate() {
		
		return "goal/goalState";
	}
	
	@RequestMapping("goalStateAdmin.do")
	public String GoalStateAdmin() {
		
		return "goal/goalStateAdmin";
	}
	
	@RequestMapping("search.do")
	@ResponseBody
	public void searchEmp(Goal goal,HttpServletResponse  response) throws IOException {
	ArrayList<Goal> searchEmp=goalService.selectEmpCondition(goal);
	JSONArray jarr=new JSONArray();
	
	for(Goal goal1: searchEmp) {
		
		JSONObject jsonobject=new JSONObject();
		
		jsonobject.put("emp_name",goal1.getEmp_name());
		jsonobject.put("dept_name",goal1.getDept_name());
		jsonobject.put("emp_job",goal1.getJob_name());
		jsonobject.put("emp_email",goal1.getEmp_email());
		jsonobject.put("emp_no",goal1.getEmp_no());
		jarr.add(jsonobject);
		
	}
	JSONObject send=new JSONObject();
	send.put("list",jarr);
	
	response.setContentType("application/json; charset=utf-8");	
	//System.out.println("messageController:"+send);
	PrintWriter out=response.getWriter();
	out.println(send.toJSONString());
	out.flush();
	out.close();
	}
	@RequestMapping("getgoalInfo.do")
	@ResponseBody
	public void goalEmpInfo(Goal goal,HttpServletResponse  response) throws IOException {
	ArrayList<Goal> selectEmpGoal=goalService.selectEmpGoal(goal);
	JSONArray jarr=new JSONArray();
	
	for(Goal goal1: selectEmpGoal) {
		
		JSONObject jsonobject=new JSONObject();
		
		jsonobject.put("goalMonth",goal1.getGoalMonth());
		jsonobject.put("goalMoney",goal1.getGoalmoney());
		jsonobject.put("sales",goal1.getSales());
		jsonobject.put("acheive",goal1.getAcheive());
		
		jarr.add(jsonobject);
		
	}
	JSONObject send=new JSONObject();
	send.put("list",jarr);
	
	response.setContentType("application/json; charset=utf-8");	
	PrintWriter out=response.getWriter();
	out.println(send.toJSONString());
	out.flush();
	out.close();
	}

	
	@RequestMapping("getAll.do")
	@ResponseBody
	public void goalAllEmp(HttpServletResponse  response) throws IOException {
	ArrayList<Goal> selectAllgoal=goalService.selectEmpAll();
	JSONArray jarr=new JSONArray();
	
	for(Goal goal1: selectAllgoal) {
		
		JSONObject jsonobject=new JSONObject();
		
		jsonobject.put("goalMonth",goal1.getGoalMonth());
		jsonobject.put("goalMoney",goal1.getGoalmoney());
		jsonobject.put("sales",goal1.getSales());
		jsonobject.put("acheive",goal1.getAcheive());
		
		jarr.add(jsonobject);
		
	}
	JSONObject send=new JSONObject();
	send.put("list",jarr);
	
	response.setContentType("application/json; charset=utf-8");	
	PrintWriter out=response.getWriter();
	out.println(send.toJSONString());
	out.flush();
	out.close();
	}
}
