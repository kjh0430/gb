package com.crm.gb.approval.model.dao;



import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.gb.approval.model.vo.Approval;


@Repository("ApprovalDao")
public class ApprovalDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Approval selectName(int empNo) {
		
	Approval approval=new Approval();
	
		
	
	return sqlSession.selectOne("getName",empNo);
	}

}
