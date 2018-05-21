package com.crm.gb.client.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.crm.gb.client.model.vo.Client;
import com.crm.gb.emp.model.vo.Emp;

public interface ClientService {
	
	public abstract ArrayList<Client> selectAllClient(); 	// 모든 고객정보조회
	public abstract ArrayList<Client> selectPoList();	// 잠재고객 정보조회
	public abstract Client selectClient(Client client);	// 고객정보 조회
	public abstract Client selectClient(int client_no);	// 고객번호로 조회
	public abstract int insertClient(Client client);		// 고객등록
	public abstract int updateClient(Client client);		// 고객정보변경
	public abstract int updateClientEmp(Client client);		// 고객담당 사원정보변경
	public abstract int deleteClient(int client_no);	// 고객정보삭제
	public abstract ArrayList<Client> selectSearchAccount(String client_company); //거래처 이름으로 검색
	public abstract ArrayList<Client> selectAccountClientList(int emp_no); //거래서 정보 조회
	ArrayList<Client> selectAllAccountClient(int emp_no); // 방문일지용 거래처목록

}
