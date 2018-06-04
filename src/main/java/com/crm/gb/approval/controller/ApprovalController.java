package com.crm.gb.approval.controller;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;


import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.gb.approval.model.service.ApprovalService;
import com.crm.gb.approval.model.vo.Approval;


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
	System.out.println(returnMgr.getApproval_team_no());
	System.out.println(returnMgr.getMgr_name());
	System.out.println(returnMgr.getApproval_mgr_no());
	JSONObject job=new JSONObject();
	
	job.put("team_mgr_name",URLEncoder.encode(returnMgr.getTeam_mgr_name(),"utf-8"));
	job.put("team_mgr_no",returnMgr.getApproval_team_no());
	job.put("mgr_name",URLEncoder.encode(returnMgr.getMgr_name(),"utf-8"));
	job.put("mgr_no",returnMgr.getApproval_mgr_no());
	return job.toJSONString();
	}
	
	//결재 제출
	@RequestMapping(value="submitApproval.do",method=RequestMethod.POST)
	@ResponseBody
	public void submitApproval(Approval apr, HttpServletResponse response) throws IOException {
/*		System.out.println("신청하는 사원"+apr.getEmp_no());
		System.out.println("시작날짜"+apr.getApproval_start_date());
		System.out.println("팀장번호:"+apr.getApproval_team_no());
		System.out.println("관리자번호"+apr.getApproval_mgr_no());
		System.out.println("종료날짜"+apr.getApproval_end_date());
		System.out.println("사원번호"+apr.getEmp_no());
		System.out.println("결재사유번호"+apr.getApproval_choose_no());
		System.out.println("팀장번호"+apr.getApproval_team_no());
		System.out.println("관리자번호"+apr.getApproval_mgr_no());
		System.out.println("비고"+apr.getApproval_comment());*/
		
		SimpleDateFormat format=new SimpleDateFormat("yyyy.MM.dd HH:mm:ss", Locale.KOREA);
		Date date=new Date();
		Date time=new Date(date.getTime());
		String getdate=format.format(time);
		//System.out.println(getdate);
		
		
		apr.setApproval_submit_date(getdate);
		
		int result=ApprovalService.insertApproval(apr);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out=response.getWriter();
		out.println("결재 신청이 완료 되었습니다.");
		out.flush();
		out.close();
		
	}
	//결재한 리스트
	@RequestMapping(value="approvalListE.do", method=RequestMethod.GET)
	
	public String approvalListE(Approval apr,Model model,@RequestParam(name="emp_no") int emp_no,HttpServletResponse response) {
		
		apr.setEmp_no(emp_no);

		ArrayList<Approval> approvalListE= ApprovalService.selectapprovalListE(apr);

		model.addAttribute("approvalListE",approvalListE);
		//System.out.println("approvalListE"+approvalListE);
		
		return "approval/approvalList";
	}
	
	//admin 결재 리스트
	@RequestMapping(value="approvalListAdmin.do")
	public String approvalListA(Approval apr,Model model,@RequestParam(name="emp_no") int emp_no ,@RequestParam(name="job_no") String job_no ) {
		apr.setEmp_no(emp_no);
		apr.setJob_no(job_no);
		
		//System.out.println(apr.getEmp_no());
		//System.out.println(apr.getJob_no());
		ArrayList<Approval> approvalListA=ApprovalService.selectapprovalListA(apr);
		
		model.addAttribute("approvalListA",approvalListA);
		//System.out.println(approvalListA);
		
		return "approval/approvalListAdmin";
	}
		
	@RequestMapping(value="teamManager.do",method=RequestMethod.POST)
	public void String(Approval apr,HttpServletResponse  response) throws IOException {
		
		SimpleDateFormat format=new SimpleDateFormat("yyyy.MM.dd HH:mm:ss", Locale.KOREA);
		Date date=new Date();
		Date time=new Date(date.getTime());
		String getdate=format.format(time);
		//System.out.println(getdate);
		
		apr.setApproval_team_date(getdate); 
		
		int result=ApprovalService.updateTeamApproval(apr);
		int admin_no = ApprovalService.selectAdminNo(apr);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out=response.getWriter();
		out.append(admin_no+"");
		out.flush();
		out.close();
		
		
	}
	
	@RequestMapping(value="adminManager.do", method=RequestMethod.POST)
	public void adminManager(Approval apr,HttpServletResponse response) throws IOException {
		SimpleDateFormat format=new SimpleDateFormat("yyyy.MM.dd HH:mm:ss", Locale.KOREA);
		Date date=new Date();
		Date time=new Date(date.getTime());
		String getdate=format.format(time);
		//System.out.println(getdate);
		
		apr.setApproval_mgr_date(getdate);		
		
		int result=ApprovalService.updateMgrApproval(apr);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out=response.getWriter();
		out.append("관리자 승인 완료");
		out.flush();
		out.close();
		
	}
}
