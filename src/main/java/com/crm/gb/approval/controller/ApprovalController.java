package com.crm.gb.approval.controller;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.gb.approval.model.service.ApprovalService;
import com.crm.gb.approval.model.vo.Approval;
import com.crm.gb.emp.model.vo.Emp;

@Controller
public class ApprovalController {

	@Autowired
	private ApprovalService ApprovalService; 
	
	
	@RequestMapping("approval.do")
	public String approval() {
		
	
		
		return "approval/approval";
	}
	
	//팀장,관리자 이름 가져오기
	@RequestMapping(value="getName.do", method=RequestMethod.POST)
	@ResponseBody
	public String getName(@RequestParam(name="emp_no") int emp_no,HttpServletResponse response) throws UnsupportedEncodingException {
		System.out.println("emp_no"+emp_no);
	
		
	Approval returnMgr=ApprovalService.selectName(emp_no);
		
	response.setContentType("application/json; charset=utf-8");	
	
	System.out.println(returnMgr.getTeam_mgr_name());
	System.out.println(returnMgr.getTeam_mgr_no());
	System.out.println(returnMgr.getMgr_name());
	System.out.println(returnMgr.getMgr_no());
	JSONObject job=new JSONObject();
	
	job.put("team_mgr_name",URLEncoder.encode(returnMgr.getTeam_mgr_name(),"utf-8"));
	job.put("team_mgr_no",returnMgr.getTeam_mgr_no());
	job.put("mgr_name",URLEncoder.encode(returnMgr.getMgr_name(),"utf-8"));
	job.put("mgr_no",returnMgr.getMgr_no());
	return job.toJSONString();
	}
	
	//결재 제출
	@RequestMapping(value="submitApproval.do",method=RequestMethod.POST)
	public String submitApproval(Approval apr) {
		System.out.println("시작날짜"+apr.getApproval_start_date());
		System.out.println("종료날짜"+apr.getApproval_end_date());
		System.out.println("사원번호"+apr.getEmp_no());
		System.out.println("결재사유번호"+apr.getApproval_choose_no());
		System.out.println("팀장번호"+apr.getTeam_mgr_no());
		System.out.println("관리자번호"+apr.getMgr_no());
		System.out.println("비고"+apr.getApproval_comment());
		
		SimpleDateFormat format=new SimpleDateFormat("yyyy.MM.dd HH:mm:ss", Locale.KOREA);
		Date date=new Date();
		Date time=new Date(date.getTime());
		String getdate=format.format(time);
		System.out.println(getdate);
		
		
		apr.setApproval_submit_date(getdate);
		
		int result=ApprovalService.insertApproval(apr);
		if(result>0) {
		System.out.println("전송 완료");
		}
		
		return "approval/approval";
	}
	//결재한 리스트
	@RequestMapping(value="approvalListE.do", method=RequestMethod.GET)
	
	public String approvalListE(Approval apr,Model model,@RequestParam(name="emp_no") int emp_no,HttpServletResponse response) {
		
		apr.setEmp_no(emp_no);

		ArrayList<Approval> approvalListE= ApprovalService.selectapprovalListE(apr);

		model.addAttribute("approvalListE",approvalListE);
		System.out.println("approvalListE"+approvalListE);
		
		return "approval/approvalList";
	}
	

	@RequestMapping(value="approvalListAdmin.do")
	public String approvalListE(Approval apr,Model model,@RequestParam(name="emp_no") int emp_no ,@RequestParam(name="job_no") String job_no ) {
		apr.setEmp_no(emp_no);
		apr.setJob_no(job_no);
		
		System.out.println(apr.getEmp_no());
		System.out.println(apr.getJob_no());
		ArrayList<Approval> approvalListA=ApprovalService.selectapprovalListA(apr);
		
		model.addAttribute("approvalListA",approvalListA);
		System.out.println(approvalListA);
		
		return "approval/approvalListAdmin";
	}
		
	
	
}
