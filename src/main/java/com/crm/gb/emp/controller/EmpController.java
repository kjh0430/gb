package com.crm.gb.emp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.crm.gb.emp.exception.EmpLoginFailException;
import com.crm.gb.emp.model.service.EmpService;
import com.crm.gb.emp.model.vo.Emp;

@Controller
@SessionAttributes("loginEmp")
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
	public String loginEmp(Emp emp, Model model) {
		logger.info("로그인관련 컨트롤러 실행됨");
		
		System.out.println("받아온 사원정보: "+emp);
		
		try {
			
			Emp returnEmp=empService.selectEmp(emp);

			model.addAttribute("loginEmp", returnEmp);	
			//System.out.println("returnEmp"+returnEmp);
			
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
	
	/*사원 등록화면*/
	@RequestMapping(value = "empRegister.do")
	public String empRegister() {
				
		return "emp/empRegister";
	}	

	/*사원 수정화면 이동*/
	@RequestMapping(value = "moveEmpUpdate.do")
	public String moveEmpUpdate(Emp emp, Model model, @RequestParam(value="emp_no") String emp_num) {
		logger.info("수정 페이지로 넘어감");
		System.out.println("수정페이지로 넘어가면서 : " + emp);
		int emp_no = (Integer.parseInt(emp_num));
		
		Emp detailEmp = empService.selectEmpNo(emp_no);
		model.addAttribute("emp", detailEmp);
		System.out.println("detailEmp : " + detailEmp);
		return "emp/empUpdate";
	}
	
	/*사원 목록*/
	@RequestMapping(value = "empList.do")
	public String empList(Emp emp, Model model) {
		logger.info("사원 목록 실행");
		ArrayList<Emp> empList = empService.selectEmpList();
		System.out.println("empList : " + empList);
		model.addAttribute("empList", empList);
		return "emp/empList";
	}
	
	/*사원 목록 상세보기*/
	@RequestMapping(value = "empDetail.do")
	public String empDetail(Emp emp, Model model, @RequestParam(value="emp_no") String emp_num) {
		logger.info("사원 상세보기 실행");
		
		System.out.println("사원 상세정보: "+emp);
		int emp_no = (Integer.parseInt(emp_num));
					
			Emp detailEmp = empService.selectEmpNo(emp_no);
			model.addAttribute("emp", detailEmp);
			System.out.println("detailEmp : " + detailEmp);
		
		return "emp/empDetail";
	}
	
	/*사원 등록*/
	@RequestMapping(value="empinsert.do", method = RequestMethod.POST)
	@ResponseBody
	public String insertEmp(Emp emp, Model model, HttpServletResponse response) throws Exception{
		logger.info("emp insert 실행");
		System.out.println("전송온 값 : " + emp);
		
		int result = empService.insertEmp(emp);
		
		System.out.println("result : " + result);
		
		/*ArrayList<Emp> empList = empService.selectEmpList();
		model.addAttribute("empList", empList);*/
		
		String returnValue = null;
		if(result == 0) {
			model.addAttribute("returnValue", true);
			return "returnValue";
		}else {
			model.addAttribute("returnValue", false);
			return "returnValue";
		}
		
	}
	
	/*사원 정보 수정*/
	@RequestMapping(value="empupdate.do")
	public String updateEmp(Emp emp, Model model) {
		
		logger.info("emp update 실행");
		
		System.out.println("전송온값 : " + emp);
		
		int result = empService.updateEmp(emp);
		ArrayList<Emp> empList = empService.selectEmpList();
		model.addAttribute("empList", empList);
		
		return "emp/empList";
	}
	
	/*사원 삭제여부 수정*/
	@RequestMapping(value="updateEmpDelete.do")
	public String updateEmpDelete(Emp emp, Model model, @RequestParam(value="emp_no") String emp_num) {
		
		logger.info("emp delete 실행");
		
		System.out.println("사원 상세정보: "+emp);
		int emp_no = (Integer.parseInt(emp_num));
		
		int result = empService.updateEmpDelete(emp_no);
		ArrayList<Emp> empList = empService.selectEmpList();
		model.addAttribute("empList", empList);
		
		return "emp/empList";
	}
	
	/*연락처 중복검사*/
	@RequestMapping(value="checkPhone.do")
	@ResponseBody
	public String selectCheckPhone(@RequestParam(value="emp_phone") String emp_phone, Model model) {
		
		logger.info("selectCheckPhone 실행");
		
		System.out.println("연락처 번호 : "+emp_phone);
		
		int result = empService.selectCheckPhone(emp_phone);
		
		String returnValue = null;
		if(result == 0) {
			model.addAttribute("returnValue", "true");
			return "returnValue";
		}else {
			model.addAttribute("returnValue", "false");
			return "returnValue";
		}
	
	}
		
}