package com.crm.gb.emp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
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
	
	/** 사원급여화면 */
	@RequestMapping("empSalary.do")
	public String empSalaryView() {
		return "emp/empSalary";
	}
	
	/** 로그인 정보확인 컨트롤러 */
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public void loginEmp(Emp emp, Model model, HttpServletResponse response) throws IOException{
		logger.info("로그인관련 컨트롤러 실행됨");
		
		System.out.println("받아온 사원정보: "+emp);
		
		try {
			
			Emp returnEmp=empService.selectEmp(emp);
				System.out.println("사원정보 조회:" + returnEmp);
			model.addAttribute("loginEmp", returnEmp);				
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			
			if(returnEmp != null) {
				out.append("correct");
				out.flush();
			}else {
				out.append("fail");
				out.flush();
			}
			out.close();
			
		} catch (EmpLoginFailException e) {
			model.addAttribute("message", e.getMessage());
		}
		
	}
	
	/** 로그아웃 컨트롤러 */
	@RequestMapping("logout.do")
	public String logoutView(SessionStatus session) {
		session.setComplete();
		return "emp/login";
	}
	
	@RequestMapping(value="main.do")
	public String main() {
		
		return "main";
	}		
	
	/*사원 등록화면*/
	@RequestMapping(value = "empRegister.do")
	public String empRegister(Emp emp, Model model) {
		
		ArrayList<Emp> empList = empService.selectEmpList();
		System.out.println("empList : " + empList);
		model.addAttribute("empList", empList);
				
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
	public String insertEmp(Emp emp, Model model){
		logger.info("emp insert 실행");
		System.out.println("전송온 값 : " + emp);
		
		int result = empService.insertEmp(emp);
		
		ArrayList<Emp> empList = empService.selectEmpList();
		model.addAttribute("empList", empList);
		
		return "emp/empList";
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
	@RequestMapping(value="checkPhone.do", method=RequestMethod.POST)
	@ResponseBody
	public String selectCheckPhone(@RequestParam(value="emp_phone") String emp_phone, HttpServletResponse response) throws IOException{
		
		logger.info("selectCheckPhone 실행");
		
		System.out.println("연락처 번호 : "+emp_phone);
		
		Emp checkPhone = empService.selectCheckPhone(emp_phone);
		
		if(checkPhone != null) {		
			
		JSONObject job = new JSONObject();
		job.put("emp_phone", emp_phone);
		
		System.out.println("checkPhone 값 있음");
		System.out.println("emp : " + checkPhone);
		System.out.println("emp_phone : " + emp_phone);

		return job.toJSONString();
		
		}else {
			System.out.println("checkPhone null");
			return null;
		}
			
	}
	
	/*이메일 중복검사*/
	@RequestMapping(value="checkEmail.do", method=RequestMethod.POST)
	@ResponseBody
	public String selectCheckEmail(@RequestParam(value="emp_email") String emp_email, HttpServletResponse response) throws IOException{
		
		logger.info("selectCheckEmail 실행");
		
		System.out.println("이메일 주소 : "+emp_email);
		
		Emp checkEmail = empService.selectCheckEmail(emp_email);
		
		if(checkEmail != null) {
			
		JSONObject job = new JSONObject();
		job.put("emp_email", emp_email);
		
		System.out.println("checkEmail 값 있음");
		System.out.println("emp : " + checkEmail);
		System.out.println("emp_email : " + emp_email);

		return job.toJSONString();
		
		}else {
			System.out.println("checkEmail null");
			return null;
		}
			
	}
	
	/*상사번호로 이름 가져오기*/
	@RequestMapping(value="mgrName.do", method=RequestMethod.POST)
	@ResponseBody
	public void selectMgrNo(@RequestParam(value="emp_mgr") String emp_mgr, HttpServletResponse response) throws IOException{
		
		logger.info("selectMgrNo 실행");
		
		System.out.println("상사번호 : "+emp_mgr);
		
		int emp_no = (Integer.parseInt(emp_mgr));
		
		Emp mgrName = empService.selectMgrNo(emp_no);
		
		if(mgrName != null) {
			
		JSONObject job = new JSONObject();
		job.put("emp_name", mgrName.getEmp_name());
		
		System.out.println("mgrName 값 있음");
		System.out.println("emp : " + mgrName);
		System.out.println("mgrName : " + mgrName.getEmp_name());

		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(job.toJSONString());
		out.flush();
		out.close();
		
		}else {
			System.out.println("mgrName null");
		}
			
	}
	
	@RequestMapping(value="selectMgrList.do", method=RequestMethod.POST)
	@ResponseBody
	public void selectMgrList(HttpServletResponse response) throws IOException{
		logger.info("selectMgrList 실행");
		
		ArrayList<Emp> selectMgrList = empService.selectEmpList();
		JSONArray jarr = new JSONArray();
		
		for(Emp emp : selectMgrList) {
			JSONObject jsonobject = new JSONObject();
			jsonobject.put("emp_no", emp.getEmp_no());
			jsonobject.put("emp_name", emp.getEmp_name());
			jarr.add(jsonobject);
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("mgrList", jarr);
		
		response.setContentType("application/json; charset=utf-8");
		System.out.println("selectMgrList : " + sendJson);
		PrintWriter out = response.getWriter();
		out.println(sendJson.toJSONString());
		out.flush();
		out.close();
		
	}
		
	@RequestMapping(value="todoInsert.do", method=RequestMethod.POST)
	@ResponseBody
	public void todoInsert(@RequestParam(value="firstTodo") String firstTodo, @RequestParam(value="todoList") String todoList, HttpServletResponse response) throws IOException{
		
		logger.info("todoInsert 실행");
		
		JSONObject job = new JSONObject();
		job.put("firstTodo", firstTodo);
		job.put("todoList", todoList);
		
		System.out.println("firstTodo : " + firstTodo);
		System.out.println("todoList : " + todoList);

		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(job.toJSONString());
		out.flush();
		out.close();
			
	}
		
}