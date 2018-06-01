package com.crm.gb.calendar.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.crm.gb.calendar.model.vo.Calendar;
import com.crm.gb.calendar.model.service.CalendarService;


@Controller
public class CalendarController {
	
	@Autowired
	private CalendarService CalendarService;

	
	
	@RequestMapping(value="calendarLoad.do" ,method=RequestMethod.POST)
	@ResponseBody
	public void calendarLoad(Calendar calendar,HttpServletResponse  response) throws IOException {		
	
		ArrayList<Calendar> seCalendar=CalendarService.selectCalendar(calendar);		
		JSONArray jarr=new JSONArray();
		
		System.out.println(calendar.getJob_no());
		System.out.println(calendar.getEmp_no());
		for(Calendar cal : seCalendar) {
			
			JSONObject jsonobject=new JSONObject();
			
			jsonobject.put("calendar_no",cal.getCalendar_no());
			jsonobject.put("emp_no",cal.getEmp_no());
			jsonobject.put("emp_name",cal.getEmp_name());
			jsonobject.put("calendar_title",cal.getCalendar_title());
			jsonobject.put("calendar_content",cal.getCalendar_content());
			jsonobject.put("calendar_start_date",cal.getCalendar_start_date1());
			jsonobject.put("calendar_end_date",cal.getCalendar_end_date1());
			
			jarr.add(jsonobject);
			
			}
		
		JSONObject send=new JSONObject();
		send.put("list",jarr);
		
		response.setContentType("application/json; charset=utf-8");	
	
		PrintWriter out=response.getWriter();
		out.println(send.toJSONString());
		out.flush();
		out.close();
	
	}
	
	
}
