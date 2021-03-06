package com.crm.gb.contract.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.gb.contract.model.vo.Contract;
import com.crm.gb.contract.model.vo.ContractSearchList;

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

	/** 계약서 상세보기 메소드 */
	public Contract selectContractDetail(int client_no) {
		return sqlSession.selectOne("contract.contractDetail", client_no);
	}
	
	/** 고객 할인율 검색 메소드 **/
	public int selectDiscount(int client_no) {
		return sqlSession.selectOne("selectDiscount", client_no);
	}

	/** 페이지 처리 계약리스트 조회 메소드 */
	public ArrayList<Contract> selectPageList(Contract contract) {
		return (ArrayList)sqlSession.selectList("contract.contractPageList", contract);
	}

	/** 계약리스트 조회 메소드 */
	public ArrayList<Contract> selectContractList(ContractSearchList contractSearch) {
		return (ArrayList)sqlSession.selectList("contract.searchContractList", contractSearch);
	}

	/** 계약된 고객수 */
	public int selectCountContract() {
		return sqlSession.selectOne("contract.countContract");
	}
	
	
}
