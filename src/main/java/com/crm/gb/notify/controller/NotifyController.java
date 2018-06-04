package com.crm.gb.notify.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.crm.gb.emp.model.vo.Emp;
import com.crm.gb.notify.model.service.NotifyService;
import com.crm.gb.notify.model.vo.Notify;

@Controller
public class NotifyController {
	
	@Autowired
	NotifyService notifyService;
	
	//접속안했을때 받은 쪽지에 대한 알람
	@RequestMapping(value="selectNofity.do",method=RequestMethod.POST)
	public void selectNotify(Emp emp,HttpServletResponse response) throws IOException {
		ArrayList<Notify> notifyList = notifyService.selectNotify(emp);
		JSONArray jarr= new JSONArray();
		
		for(Notify notify : notifyList) {
			JSONObject job = new JSONObject();
			job.put("notify_no", notify.getNotify_no());
			job.put("from_name", notify.getEmp_name());
			job.put("notify_to", notify.getNotify_to());
			job.put("notify_category", notify.getNotify_category());
			job.put("notify_date", notify.getNotify_date());
			job.put("notify_read", notify.getNotify_read());
			
			jarr.add(job);
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
	//비접속시 왔던 알람 확인했을 때,
	@RequestMapping(value="updateNofity.do",method=RequestMethod.POST)
	public void updateNofity(Notify notify,HttpServletResponse response) throws IOException {
		int result = notifyService.updateNotify(notify);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		if(result>0) {
			out.append("OK");
			out.flush();	
		}else {
			out.append("FAIL");
			out.flush();	
		}
		out.close();
	}
	
}
