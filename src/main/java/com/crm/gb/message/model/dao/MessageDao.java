package com.crm.gb.message.model.dao;

import java.util.ArrayList;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.gb.emp.model.vo.Emp;

@Repository("messageDao")
public class MessageDao {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	public ArrayList<Emp> selectSearch(String empName) {
		
		sqlSession.selectList("selectEmp",empName);
		
		
		return (ArrayList)sqlSession.selectList("selectEmp",empName);
	}

}
