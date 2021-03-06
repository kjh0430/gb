package com.crm.gb.approval.model.dao;



import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.gb.approval.model.vo.Approval;


@Repository("ApprovalDao")
public class ApprovalDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Approval selectName(int emp_No) {
		
	return sqlSession.selectOne("getName",emp_No);
	}

	public int insertApproval(Approval apr) {
		
		
		return sqlSession.insert("ApprovalSubmit",apr);
	}

	public ArrayList<Approval> selectapprovalListE(Approval apr) {
	
		return (ArrayList)sqlSession.selectList("approvalListE",apr);
		
	}

	public ArrayList<Approval> selectapprovalListA(Approval apr) {
		
		return (ArrayList)sqlSession.selectList("approvalListA",apr);
	}

	public int updateTeamApproval(Approval apr) {
		
		return sqlSession.update("updateTeamApproval",apr);
	}

	public int updateMgrApproval(Approval apr) {
	
		return sqlSession.update("updateMgrApproval",apr);
	}

	public int selectAdminNo(Approval apr) {
		return sqlSession.selectOne("selectAdminNo",apr);
	}

	public int selectgetListE(Approval apr) {
	
		return sqlSession.selectOne("selectgetListCountE",apr);
	}

	public ArrayList<Approval> selectapprovalListConditionA(Approval apr) {
	
		return (ArrayList)sqlSession.selectList("selectapprovalListConditionA",apr);
	}

	

	public int selectgetConditionListA(Approval apr) {
		
		return sqlSession.selectOne("selectgetConditionCountA",apr);
	}

	public int selectgetListCountA(Approval apr) {
	
		return sqlSession.selectOne("selectgetListCountA",apr);
	}

}
