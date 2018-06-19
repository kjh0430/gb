package com.crm.gb.salary.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.gb.emp.model.vo.Emp;
import com.crm.gb.salary.model.service.SalaryService;
import com.crm.gb.salary.model.vo.Salary;

@Controller
public class SalaryController {
	private static final Logger logger = LoggerFactory.getLogger(SalaryController.class);
	
	@Autowired
	private SalaryService salaryService;
	
	/** 급여관련 사원리스트 화면출력 */
	@RequestMapping("empSalary.do")
	public String empSalaryList(Salary salary, Model model,
			@RequestParam(value="startPage", defaultValue="1") int startPage) {
		logger.info("급여관련 사원리스트 실행");
		
		ArrayList<Salary> salaryList = salaryService.selectSalaryList();
		
			salary.setShowPage(10); //보여줄 페이지 수
			salary.setTotalRow(salaryList.size());	// 총 회원 수
			salary.setStart(startPage);	// 시작페이지
			
			int showPage = salary.getShowPage();
			int totalRow = salary.getTotalRow();
			int start = (salary.getStart() - 1)*showPage+1;
			int end = start+9;
			int currentPage = 1;
	
			salary.setStartRow(start);	// 시작 열
			salary.setEndRow(end);	// 끝 열
			
			if(totalRow%showPage != 0) {	// 끝페이지
				salary.setEnd((totalRow/showPage)+1);
			}else {
				salary.setEnd(totalRow/showPage);
			}
		
			ArrayList<Salary> list = salaryService.selectSalaryPageList(salary);
			
		model.addAttribute("salaryList", salaryList);
		model.addAttribute("salaryPageList", list);
		model.addAttribute("start", currentPage);
		model.addAttribute("end", salary.getEnd());
		
		return "emp/empSalary";
	}
	
	/** 사원 급여명세서 */
	@RequestMapping(value="empSalaryDetail.do", method=RequestMethod.POST)
	@ResponseBody
	public void empSalaryDetail(Salary salary, HttpServletResponse response,
			@RequestParam(value="emp_no") int emp_no) throws IOException{
		logger.info("급여정보 상세보기");
		
		salary = salaryService.selectSalaryDetail(emp_no);
		
		System.out.println("받아온 사원번호: "+emp_no);
		
		response.setContentType("application/json; charset=utf-8");
		JSONObject job = new JSONObject();
			
			job.put("name", URLEncoder.encode(salary.getEmp().getEmp_name(), "utf-8"));
			job.put("dept", URLEncoder.encode(salary.getDept().getDept_name(), "utf-8"));
			job.put("job", URLEncoder.encode(salary.getJob().getJob_name(), "utf-8"));
			job.put("sal", salary.getSal());
			job.put("bonus", salary.getSal_bonus());
			job.put("toSal", (salary.getSal()+salary.getSal_bonus()));
			
		PrintWriter out = response.getWriter();
		
		out.print(job.toJSONString());
		out.flush();
		out.close();
		
	}
	
	
}
