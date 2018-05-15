package com.crm.gb.client.model.service;

import java.util.ArrayList;

import com.crm.gb.client.model.vo.Client;

public interface ClientService {
	
	public abstract ArrayList<Client> selectAllClient(); 	// 모든 고객정보조회
	public abstract ArrayList<Client> selectPoList();	// 잠재고객 정보조회
	public abstract Client selectClient(Client client);	// 고객정보 조회
	public abstract Client selectClient(int client_no);	// 고객번호로 조회
	public abstract int insertClient(Client client);		// 고객등록
	public abstract int updateClient(Client client);		// 고객정보변경
	public abstract int deleteClient(int client_no);	// 고객정보삭제
}
