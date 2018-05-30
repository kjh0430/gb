package com.crm.gb.calendar.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.gb.calendar.model.dao.CalendarDao;

@Service("CalendarService")
public class CalendarServiceImpl implements CalendarService {

@Autowired
private CalendarDao CalenderDao;
	
}
