package com.crm.gb.approval.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.gb.emp.model.vo.Emp;

@Repository("ApprovalDao")
public class ApprovalDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Emp selectName(int empNo) {
		
		
		
		return sqlSession.selectOne("getName",empNo);
	}

}
