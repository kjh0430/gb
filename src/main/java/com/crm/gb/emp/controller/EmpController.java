package com.crm.gb.emp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.crm.gb.emp.model.service.EmpService;
import com.crm.gb.emp.model.vo.Emp;

@Controller
public class EmpController {
	
	@Autowired
	private EmpService empService;

	@RequestMapping(value="login.do")
		public String loginPage() {			
			return "emp/login";
		}
	
	
	@RequestMapping(value="main.do")
	public String main() {
		
		return "main";
	}
		
	@RequestMapping(value = "empList.do", method = RequestMethod.GET)
	public String empList() {
				
		return "emp/empList";
	}
	@RequestMapping(value = "empRegister.do", method = RequestMethod.GET)
	public String empRegister() {
				
		return "emp/empRegister";
	}
	@RequestMapping(value = "empDetail.do", method = RequestMethod.GET)
	public String empDetail() {
				
		return "emp/empDetail";
	}
	@RequestMapping(value = "moveEmpUpdate.do", method = RequestMethod.GET)
	public String moveEmpUpdate() {				
		return "emp/empUpdate";
	}
	@RequestMapping(value = "moveEmpDelete.do", method = RequestMethod.GET)
	public String moveEmpDelete() {
				
		return "emp/empList";
	}
	
	@RequestMapping(value="empinsert.do", method=RequestMethod.POST)
	public ModelAndView insertEmp(Emp emp, ModelAndView mv) {
		
		System.out.println("전송온 값 : " + emp);
		
		int result = empService.insertEmp(emp);
		
		mv.setViewName("emp/empList");
		
		return mv;
	}
	
	@RequestMapping(value="empupdate.do", method=RequestMethod.POST)
	public ModelAndView updateEmp(Emp emp, ModelAndView mv) {
		
		System.out.println("전송온값 : " + emp);
		
		int result = empService.updateEmp(emp);
		
		mv.setViewName("emp/empList");
		
		return mv;
	}
	
	@RequestMapping(value="empdelete.do", method=RequestMethod.POST)
	public ModelAndView deleteEmp(Emp emp, ModelAndView mv) {
		
		System.out.println("전송온값 : " + emp);
		
		int result = empService.deleteEmp(emp);
		
		mv.setViewName("emp/empList");
		
		return mv;
	}
	
}
