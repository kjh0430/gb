package com.crm.gb.goal.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.crm.gb.goal.model.service.GoalService;



@Controller
public class GoalController {
	private static final Logger logger=LoggerFactory.getLogger(GoalController.class);
	
		
	
	@RequestMapping("goalAdmin.do")
	public String GoalAdmin() {
		
		return "goal/goalAdmin";
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
