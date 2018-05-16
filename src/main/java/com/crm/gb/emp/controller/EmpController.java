package com.crm.gb.emp.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.crm.gb.emp.exception.EmpLoginFailException;
import com.crm.gb.emp.model.service.EmpService;
import com.crm.gb.emp.model.vo.Emp;

@Controller
public class EmpController {
	private static final Logger logger=LoggerFactory.getLogger(EmpController.class);
	
	@Autowired
	private EmpService empService;

	/* 일반 사원 테이블 추가부분 */
	@Autowired
	private BCryptPasswordEncoder pwdEncoder;
	
	/** 시작화면 */
	@RequestMapping("view.do")
	public String loginView() {
		return "emp/login";
	}
	
	/** 메인화면 */
	@RequestMapping("mainView.do")
	public String mainView() {
		return "main";
	}
	
	/** 로그인 정보확인 컨트롤러 */
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String loginEmp(Emp emp, Model model, HttpServletResponse response) {
		logger.info("로그인관련 컨트롤러 실행됨");
		
		System.out.println("받아온 사원정보: "+emp);
		
		try {
			
			Emp returnEmp=empService.selectEmp(emp);
			model.addAttribute("loginEmp", returnEmp);	
			
			
		} catch (EmpLoginFailException e) {
			model.addAttribute("message", e.getMessage());
			return "error/error";
		}
		
		return "main";
	}
	
	/** 로그아웃 컨트롤러 */
	@RequestMapping("logout.do")
	public String logoutView(SessionStatus session) {
		session.setComplete();
		return "emp/login";
	}	
	/* 2018.05.15 17:30 여기까지 */
	
	/*@RequestMapping(value="login.do")
		public String loginPage() {			
			return "emp/login";
		}*/
	
	
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
	public ModelAndView insertEmp(Emp emp, ModelAndView mv) throws IOException{
		
		System.out.println("전송온 값 : " + emp);
		
		int result = empService.insertEmp(emp);
			
		/*JSONObject job = new JSONObject();
		job.put("emp_no", emp.getEmp_no());
		job.put("emp_pwd", emp.getEmp_pwd());
		job.put("emp_name", URLEncoder.encode(emp.getEmp_name(), "utf-8"));
		job.put("emp_addr", URLEncoder.encode(emp.getEmp_addr(), "utf-8"));
		job.put("emp_phone", emp.getEmp_phone());
		job.put("job_no", emp.getJob_no());
		job.put("emp_email", emp.getEmp_email());
		job.put("emp_mgr", emp.getEmp_mgr());
		job.put("emp_hiredate", emp.getEmp_hiredate());
		job.put("emp_firedate", emp.getEmp_firedate());
		job.put("city", URLEncoder.encode(emp.getCity(), "utf-8"));
		job.put("county", URLEncoder.encode(emp.getCounty(), "utf-8"));
		job.put("village", URLEncoder.encode(emp.getVillage(), "utf-8"));
		job.put("dept_no", emp.getDept_no());*/
		
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

