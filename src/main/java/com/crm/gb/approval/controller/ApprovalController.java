package com.crm.gb.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ApprovalController {

	@RequestMapping("approval.do")
	public String approval() {
		
	
		
		return "approval/approval";
	}
	
	
	@RequestMapping(value="getName.do", method=RequestMethod.GET)
	public void getName(@RequestParam(name="emp_no") int emp_no) {
		System.out.println("emp_no"+emp_no);
	
		
		
	
	}
	
	
}
