package com.crm.gb.goal.controller;

import org.json.simple.JSONArray;
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

import com.crm.gb.goal.model.service.GoalService;
import com.crm.gb.goal.model.vo.Goal;

import java.io.IOException;
import java.io.PrintWriter;

import java.net.URLEncoder;


import java.util.ArrayList;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpServletResponse;

@Controller
public class GoalController {
	private static final Logger logger=LoggerFactory.getLogger(GoalController.class);
	
	@Autowired
	private GoalService goalService;
	
		
	//목표 관리 리스트 출력
	@RequestMapping("goalAdmin.do")
	public String GoalAdmin() {
		return "goal/goalAdmin";
		
	}
	
	//달별 리스트 출력
	@RequestMapping(value="goalMonthList.do" ,method=RequestMethod.POST)
	public void GoalAdminList(Goal goal, Model model ,HttpServletResponse  response, 
			HttpServletRequest request,@RequestParam(value="gdata") String gdata) throws IOException{
		
		
	
		//System.out.println(gdata);
		
		System.out.println("시작좀!!");
		ArrayList<Goal> goalStateListMonth=goalService.selectGoalStateListMonth(gdata);
		
		//System.out.println("날짜"+gdata);
		
		JSONArray jarr=new JSONArray();
		
		for(Goal g : goalStateListMonth) {
			//System.out.println("받아온 날짜: "+g.getContract_date_start_goal());		
		
			JSONObject jsonobject=new JSONObject();		
			
			jsonobject.put("emp_no",g.getEmp_no());
			jsonobject.put("emp_name",g.getEmp_name());
			jsonobject.put("contract_money",g.getContract_money());
			jsonobject.put("contract_date_start_goal",g.getContract_date_start_goal());			
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
	
	
	//목표 상세보기
	@RequestMapping("goalAdminDetail.do")
	public String GoalAmdinDetail(Goal goal, Model model, @RequestParam(value="emp_no") int emp_no,
			@RequestParam(value="emp_name") String emp_name,@RequestParam(value="contract_money") int contract_money,
			@RequestParam(value="contract_date_start_goal") String goal_date) {
				
	
		Goal contract_money_sum=goalService.selectGoalContractMoneySum(emp_no);
		
		System.out.println(contract_money_sum.getContract_money_sum());
		
		
		model.addAttribute("emp_no", emp_no);		
		model.addAttribute("emp_name", emp_name);		
		model.addAttribute("contract_money", contract_money);		
		model.addAttribute("goal_date", goal_date);
		model.addAttribute("contract_money_sum", contract_money_sum.getContract_money_sum());
		
		return "goal/goalAdminDetail";
	}
	
	//목표설정,method=RequestMethod.POST,@RequestParam("goal_date") Date goal_date,@RequestParam("goal_money") int goal_money,
	@RequestMapping(value="goalAdminAdd.do" ,method=RequestMethod.POST)	
	public void GoalAdd(Goal goal,HttpServletResponse response) throws IOException{
		
		System.out.println("GoalAdd in");
		
		System.out.println("--------------------------");
	
		System.out.println(goal.getEmp_no());
		System.out.println(goal.getGoal_date_start());
		System.out.println(goal.getGoal_money());
		
		
		
		int goalcount=goalService.countGoal(goal);
		System.out.println("확인유무 목표 수량 갯수 :" +goalcount);
		if(goalcount>0) {
			
			System.out.println("엘스야");
			JSONObject send=new JSONObject();
			String pass="2";
			send.put("send",URLEncoder.encode(pass,"utf-8"));
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out=response.getWriter();
			out.print(send.toJSONString());
			out.flush();
			out.close();
			
			
		}else {
		
			int goalinsert=goalService.insertGoal(goal);
			
			System.out.println("목표설정goalInsert : "+goalinsert);
			
			JSONObject send=new JSONObject();
			String pass="1";
		
			send.put("send",URLEncoder.encode(pass,"utf-8"));
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out=response.getWriter();
			out.print(send.toJSONString());
			out.flush();
			out.close();
			
		}
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("goalState.do")
	public String GoalSate() {
		
		return "goal/goalState";
	}
	
	@RequestMapping("goalStateAdmin.do")
	public String GoalStateAdmin() {
		
		return "goal/goalStateAdmin";
	}
	
	@RequestMapping("myGoal.do")
	public String myGoal() {
		return "goal/MygoalState";
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
