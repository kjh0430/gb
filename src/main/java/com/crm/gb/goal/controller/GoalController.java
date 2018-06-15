package com.crm.gb.goal.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.crm.gb.goal.model.service.GoalService;
import com.crm.gb.goal.model.vo.Goal;

import java.util.ArrayList;

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
}
