package com.crm.gb.emp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EmpController {

	@RequestMapping(value="login.do")
		public String loginPage() {
			
			return "emp/login";
		}
	
	
	@RequestMapping(value="main.do")
	public String main() {
		
		return "main";
	}
	
}
