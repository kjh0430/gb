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
	
	
	@RequestMapping(value="getName.do", method=RequestMethod.GET)
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
		System.out.println("전송이 완료");
		}
		
		return "approval/approvalList";
	}
}
