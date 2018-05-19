package com.crm.gb.dailywork.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.crm.gb.client.model.service.ClientService;
import com.crm.gb.client.model.vo.Client;
import com.crm.gb.dailywork.model.service.DailyworkService;
import com.crm.gb.dailywork.model.vo.Dailywork;
import com.crm.gb.emp.model.vo.Emp;

@Controller
public class DailyworkController {
	
	private static final Logger logger = LoggerFactory.getLogger(DailyworkController.class);
	
	@Autowired
	public DailyworkService dailyworkService;
	
	@Autowired
	public ClientService clientService;
	
	/** 방문일지 페이지 이동 메소드 **/
	
	@RequestMapping(value="visit.do" , method=RequestMethod.GET)
	public String dailyVisit() {
		
		return "dailywork/visit";
	}
	
	//json 객체 배열 메소드 
	@RequestMapping(value="accountlist.do", method=RequestMethod.POST)
	public void clientJsonMethod(Emp emp,HttpServletResponse response) throws IOException{
		
		logger.info("json 객체 배열 메소드 실행...");
		
		int emp_no = emp.getEmp_no();
		//int emp_no = Integer.parseInt(emp_num);
		System.out.println("emp_no :" + emp.getEmp_no());
		
		ArrayList<Client> accountClientList = clientService.selectAccountClientList(emp_no);		
		System.out.println("client 객체 : " + accountClientList);
		
		JSONArray jarr = new JSONArray();
		
		for(Client client : accountClientList) {
			JSONObject jclient = new JSONObject();
			jclient.put("client_no", client.getClient_no());
			jclient.put("client_company", client.getClient_company());
			jclient.put("client_loc_x", Double.parseDouble(client.getClient_loc_x()));
			jclient.put("client_loc_y", Double.parseDouble(client.getClient_loc_y()));
			
			jarr.add(jclient);
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("accountlist", jarr);
		System.out.println("jarr : " + jarr);
		
		response.setContentType("application/json; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.println(sendJson.toJSONString());
		out.flush();
		out.close();
		
	}
	
	
	//영업일지로 이동
	@RequestMapping("moveDailyReport.do")
	public String moveProductList() {
		return "dailywork/dailyReport";
	}

	//영업일지-방문일지 조회 컨트롤
	@RequestMapping(value="visitList.do",method=RequestMethod.POST)
	public void selectDailywork(Dailywork dw,HttpServletResponse response) throws IOException {
		
		System.out.println("visitList running!!");	
		//System.out.println(dw.getDaily_date());
		ArrayList<Dailywork> visitList = dailyworkService.selectVisit(dw);		
		JSONArray jarr = new JSONArray();
		
		for(Dailywork daily : visitList) {
			JSONObject jdw = new JSONObject();
			jdw.put("dailywork_no",daily.getDailywork_no());
			jdw.put("client_name", daily.getClient_name());
			jdw.put("emp_no", daily.getEmp_no());
			jdw.put("daily_comment", daily.getDaily_comment());
			jdw.put("daily_date", daily.getDaily_date());
			jdw.put("client_no", daily.getClient_no());
			jdw.put("client_loc_x", daily.getClient_loc_x());
			jdw.put("client_loc_y", daily.getClient_loc_y());
			
			jarr.add(jdw);
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		//System.out.println("jarr : " + jarr);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(sendJson.toJSONString());		
		out.flush();
		out.close();
	}
	
	
//	@RequestMapping(value="visit.do" , method=RequestMethod.GET)
//	public String dailyVisit(Dailywork dailywork,Model model) {
//		
//		logger.info("방문일지 등록 메소드 실행!!!!!!");
//		int result = dailyworkService.insertDailywork(dailywork);
//		
//		return "dailyreport/visit";
//	}
	
	/** 방문일지 등록 메소드 **/
}
