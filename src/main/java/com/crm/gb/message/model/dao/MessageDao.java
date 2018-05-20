package com.crm.gb.message.model.dao;

import java.util.ArrayList;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.gb.emp.model.vo.Emp;
import com.crm.gb.message.model.vo.Message;

@Repository("messageDao")
public class MessageDao {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	public ArrayList<Message> selectSearch(String empName) {
		
		sqlSession.selectList("selectEmp",empName);
		
		
		return (ArrayList)sqlSession.selectList("selectEmp",empName);
	}

}
