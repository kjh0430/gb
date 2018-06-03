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

@Override
public Calendar selectDetail(Calendar calendar) {

	return CalendarDao.selectDetail(calendar);
}

@Override
public int updateSchedule(Calendar calendar) {
	
	return CalendarDao.updateSchedule(calendar);
}

@Override
public Calendar selectgetInfo(Calendar calendar) {
	// TODO Auto-generated method stub
	return CalendarDao.selectgetInfo(calendar);
}
	
}
