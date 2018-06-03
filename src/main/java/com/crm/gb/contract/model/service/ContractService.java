package com.crm.gb.contract.model.service;

import java.util.ArrayList;

import com.crm.gb.contract.model.vo.Contract;

public interface ContractService {
	public abstract ArrayList<Contract> selectAllList(int emp_no);	// 계약정보 리스트
	public abstract int insertContract(Contract client_no);		// 계약서 등록
	public abstract Contract selectContractDetail(int client_no);	// 계약서 상세보기
	public abstract ArrayList<Contract> selectPageList(Contract contract);	// 페이징 처리 리스트
	
	public abstract int selectDiscount(int client_no); //고객 할인율 검색
}
