package com.crm.gb.contract.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.gb.contract.model.vo.Contract;

@Repository("contractDao")
public class ContractDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 계약 리스트 조회 메소드 */
	public ArrayList<Contract> selectAllList(int emp_no) {
		return (ArrayList)sqlSession.selectList("contract.contractList", emp_no);
	}

	/** 게약서 등록 메소드 */
	public int insertContract(Contract contract) {
		return sqlSession.insert("contract.insertContract", contract);
	}
}
