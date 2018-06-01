package com.crm.gb.calendar.model.service;

import java.util.ArrayList;

import com.crm.gb.calendar.model.vo.Calendar;
import com.crm.gb.message.model.vo.Message;



public interface CalendarService {
	public abstract ArrayList<Calendar> selectCalendar(Calendar calendar);
	public abstract Calendar selectDetail(Calendar calendar);

}
