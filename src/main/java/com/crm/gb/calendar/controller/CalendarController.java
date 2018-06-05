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
		

		
		System.out.println("calendarController"+seCalendar);
		for(Calendar cal : seCalendar) {
			
			JSONObject jsonobject=new JSONObject();
			
			jsonobject.put("calendar_no",cal.getCalendar_no());
			jsonobject.put("emp_no",cal.getEmp_no());
			jsonobject.put("emp_name",cal.getEmp_name());
			jsonobject.put("calendar_title",cal.getCalendar_title());
			jsonobject.put("calendar_content",cal.getCalendar_content());
			jsonobject.put("calendar_start_date",cal.getCalendar_start_date());
			jsonobject.put("calendar_end_date",cal.getCalendar_end_date());
			
			
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
	
	@RequestMapping(value="detail2.do" ,method=RequestMethod.POST)
	@ResponseBody
	public void calendardetail(Calendar calendar,HttpServletResponse  response) throws IOException {		
	
		Calendar calendarDar=CalendarService.selectDetail(calendar);		
	
		System.out.println(calendar.getDept_no());
		
		JSONObject send=new JSONObject();
	
		send.put("calendar_no",calendar.getCalendar_no());
		send.put("emp_no",calendarDar.getEmp_no());
		send.put("emp_name",calendarDar.getEmp_name());
		send.put("calendar_title",calendarDar.getCalendar_title());
		send.put("calendar_content",calendarDar.getCalendar_content());
		send.put("calendar_start_date",calendarDar.getCalendar_start_date());
		send.put("calendar_end_date",calendarDar.getCalendar_end_date());
		send.put("calendar_dept_name",calendarDar.getDept_name());
		
		
		response.setContentType("application/json; charset=utf-8");	
	
		PrintWriter out=response.getWriter();
		out.println(send.toJSONString());
		out.flush();
		out.close();
	
	}
	
		@RequestMapping(value="modifySchedule.do" ,method=RequestMethod.POST)
		@ResponseBody
		public void calendarModify(Calendar calendar,HttpServletResponse response) throws IOException {		
		
			System.out.println(calendar.getCalendar_content());
			System.out.println(calendar.getCalendar_end_date());
			System.out.println(calendar.getCalendar_no());
			System.out.println(calendar.getCalendar_start_date());
			System.out.println(calendar.getCalendar_title());
			
			int result=CalendarService.updateSchedule(calendar);
			
			
			
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out=response.getWriter();
			
			out.append("일정이 수정되었습니다.");
			out.flush();
			out.close();
			
		
		}
		
		@RequestMapping(value="getInfo.do" ,method=RequestMethod.POST)
		@ResponseBody
		public void CalendargetInfo(Calendar calendar,HttpServletResponse  response) throws IOException {		
		System.out.println("emp_no"+calendar.getEmp_no());
		System.out.println("job_no"+calendar.getDept_no());
			
			Calendar getcalendarDar=CalendarService.selectgetInfo(calendar);		
		
			System.out.println("부서이름"+getcalendarDar.getDept_name());
			
			JSONObject send=new JSONObject();
		
		
			send.put("emp_no",getcalendarDar.getEmp_no());
			send.put("emp_name",getcalendarDar.getEmp_name());
			send.put("calendar_dept_name",getcalendarDar.getDept_name());
			
			
			response.setContentType("application/json; charset=utf-8");	
		
			PrintWriter out=response.getWriter();
			out.println(send.toJSONString());
			out.flush();
			out.close();
		
		}
		
		@RequestMapping(value="addSchedule.do" ,method=RequestMethod.POST)
		@ResponseBody
		public void insertCalendar(Calendar calendar,HttpServletResponse response) throws IOException {		
		
			System.out.println(calendar.getCalendar_content());
			System.out.println(calendar.getCalendar_end_date());
			System.out.println(calendar.getCalendar_no());
			System.out.println(calendar.getCalendar_start_date());
			System.out.println(calendar.getCalendar_title());
			
			int result=CalendarService.insertSchedule(calendar);
			
			
			
			
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out=response.getWriter();
			
			out.append("일정이 추가되었습니다.");
			out.flush();
			out.close();
			
		
		}
	
			
		@RequestMapping(value="deleteSchedule.do" ,method=RequestMethod.POST)
		@ResponseBody
		public void deleteCalendar(Calendar calendar,HttpServletResponse response) throws IOException {		
		
			System.out.println(calendar.getCalendar_no());
			
			int result=CalendarService.deleteSchedule(calendar);
		
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out=response.getWriter();
			
			out.append("일정이 삭제되었습니다.");
			out.flush();
			out.close();
			
		
		}
	
}
