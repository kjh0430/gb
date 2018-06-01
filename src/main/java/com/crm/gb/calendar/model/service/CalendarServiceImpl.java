package com.crm.gb.calendar.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.gb.calendar.model.dao.CalendarDao;
import com.crm.gb.calendar.model.vo.Calendar;

@Service("CalendarService")
public class CalendarServiceImpl implements CalendarService {

@Autowired
private CalendarDao CalendarDao;

@Override
public ArrayList<Calendar> selectCalendar(Calendar calendar) {
	
	return CalendarDao.selectCalendar(calendar);
}
	
}
