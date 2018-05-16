package com.crm.gb.emp.controller;

import java.io.IOException;
import java.io.PrintWriter;
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
			System.out.println("returnEmp"+returnEmp);
			
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
	public void insertEmp(Emp emp, ModelAndView mv, HttpServletResponse response) throws IOException{
		
		System.out.println("전송온 값 : " + emp);
		
		int result = empService.insertEmp(emp);
		
		System.out.println("result : " + result);
		
		/*PrintWriter out = response.getWriter();
		
			out.append("ok");
			out.flush();		
		
		out.close();*/
		
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

