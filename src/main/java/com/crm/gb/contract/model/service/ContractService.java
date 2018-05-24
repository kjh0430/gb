package com.crm.gb.contract.model.service;

import java.util.ArrayList;

import com.crm.gb.contract.model.vo.Contract;

public interface ContractService {
	public abstract ArrayList<Contract> selectAllList(int emp_no);	// 계약정보 리스트
	public abstract int insertContract(Contract client_no);		//계약서 등록
	
}
