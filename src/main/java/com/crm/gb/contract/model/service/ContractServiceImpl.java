package com.crm.gb.contract.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.gb.contract.model.dao.ContractDao;
import com.crm.gb.contract.model.vo.Contract;
import com.crm.gb.contract.model.vo.ContractSearchList;

@Service("contractService")
public class ContractServiceImpl implements ContractService {
	
	@Autowired
	public ContractDao contractDao;
	
	/** 계약정보 전체 리스트 조회 */
	@Override
	public ArrayList<Contract> selectAllList(int emp_no) {
		return contractDao.selectAllList(emp_no);
	}
	
	/** 계약된 고객수 */
	@Override
	public int selectCountContract(int emp_no) {
		// TODO Auto-generated method stub
		return contractDao.selectCountContract(emp_no);
	}
	
	/** 계약리스트 검색 */
	@Override
	public ArrayList<Contract> selectContractList(ContractSearchList contractSearch) {
		return contractDao.selectContractList(contractSearch);
	}
	
	/** 페이지 처리 계약리스트 조회 */
	@Override
	public ArrayList<Contract> selectPageList(Contract contract) {
		return contractDao.selectPageList(contract);
	}
	
	/** 계약서 등록 */
	@Override
	public int insertContract(Contract contract) {
		return contractDao.insertContract(contract);
	}
	
	/** 계약서 상세보기 */
	@Override
	public Contract selectContractDetail(int client_no) {
		return contractDao.selectContractDetail(client_no);
	}
	
	/**  고객할인율 검색 **/
	@Override
	public int selectDiscount(int client_no) {
		return contractDao.selectDiscount(client_no);
	}
}
