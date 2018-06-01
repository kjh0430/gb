package com.crm.gb.calendar.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.gb.calendar.model.vo.Calendar;
import com.crm.gb.message.model.vo.Message;

@Repository("CalenderDao")
public class CalendarDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public ArrayList<Calendar> selectCalendar(Calendar calendar) {
		
		return (ArrayList)sqlSession.selectList("selectCalendar",calendar);
	}
	
	
	
}
