package com.crm.gb.approval.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ApprovalController {

	@RequestMapping("approval.do")
	public String approval() {
		
	
		
		return "approval/approval";
	}
	
	
	
}
