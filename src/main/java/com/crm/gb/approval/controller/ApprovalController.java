package com.crm.gb.approval.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.crm.gb.approval.model.service.ApprovalService;
import com.crm.gb.emp.model.vo.Emp;

@Controller
public class ApprovalController {

	@Autowired
	private ApprovalService ApprovalService; 
	
	
	@RequestMapping("approval.do")
	public String approval() {
		
	
		
		return "approval/approval";
	}
	
	
	@RequestMapping(value="getName.do", method=RequestMethod.GET)
	public void getName(@RequestParam(name="emp_no") int emp_no) {
		System.out.println("emp_no"+emp_no);
	
		
		Emp returnName=ApprovalService.selectName(emp_no);
		
	
	}
	
	
}
