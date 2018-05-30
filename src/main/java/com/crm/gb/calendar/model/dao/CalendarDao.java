package com.crm.gb.calendar.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("CalenderDao")
public class CalendarDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
