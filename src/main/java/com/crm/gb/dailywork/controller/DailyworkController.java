package com.crm.gb.dailywork.controller;

import java.io.IOException; 
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
		logger.info("방문일지 페이지 run...");
		return "dailywork/visit";
	}
	
	//방문일지 지도위에 거래처 위치 불러오는 json 객체 배열 메소드 
	@RequestMapping(value="locationInfo.do", method=RequestMethod.POST)
	public void clientJsonMethod(Emp emp,HttpServletResponse response) throws IOException{
		
		logger.info("방문일지 json 객체 배열 메소드 실행...");
		
		int emp_no = emp.getEmp_no();
		//int emp_no = Integer.parseInt(emp_num);
		System.out.println("emp_no :" + emp_no);
		
		ArrayList<Client> accountClientList = clientService.selectAllAccountClient(emp_no);		
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
			jdw.put("client_name", daily.getClient_company());
			jdw.put("emp_no", daily.getEmp_no());
			jdw.put("daily_comment", daily.getDaily_comment());
			jdw.put("daily_date", daily.getDaily_date());
			jdw.put("client_no", daily.getClient_no());
			jdw.put("client_loc_x", Double.parseDouble(daily.getClient_loc_x()));
			jdw.put("client_loc_y", Double.parseDouble(daily.getClient_loc_y()));
			
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
	
	/** 방문일지 등록 메소드 **/
	
	@RequestMapping(value="insertDailywork.do", method=RequestMethod.POST)
	public String insertDailywork(Dailywork dailywork) {
		logger.info("방문일지 등록 메소드 실행..");
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ("yyyy-MM-dd", Locale.KOREA );
		Date currentTime = new Date ();
		String mTime = mSimpleDateFormat.format ( currentTime );
		
		System.out.println ( "현재 날짜 : " + mTime );
		
		String time = dailywork.getDaily_date();		
		
		System.out.println("currenttime : " + currentTime);
		System.out.println ( "현재 시간 : " +  time );
		
		dailywork.setDaily_date(mTime +" "+time);
		
		//System.out.println("시간 : " + mTime +" "+time);
		System.out.println("emp_no: " + dailywork.getEmp_no()+" ,client_no: "+dailywork.getClient_no()
	+"comment : "+dailywork.getDaily_comment()+", time : " + dailywork.getDaily_date());
		System.out.println("dailywork: " + dailywork);
		dailyworkService.insertDailywork(dailywork);
		
		return "dailywork/visit";
	}
}
