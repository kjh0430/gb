package com.crm.gb.client.model.service;

import java.util.ArrayList;

import com.crm.gb.client.model.vo.Client;
import com.crm.gb.client.model.vo.ClientFile;
import com.crm.gb.order.model.vo.Order;

public interface ClientService {
	
	public abstract ArrayList<Client> selectAllClient(); 	// 모든 고객정보조회
	public abstract ArrayList<Client> selectAllClient(Client client);	//등록고객 페이징 처리 조회용
	public abstract ArrayList<Client> selectPoClient(Client client);	//잠재고객 페이징 처리 조회용
	public abstract ArrayList<Client> selectPoList();	// 잠재고객 정보조회
	public abstract ArrayList<Client> selectClientList(String client_name);	// 거래처 이름으로 검색
	public abstract ArrayList<Client> selectPoList(String client_name);	// 잠재고객 이름으로 검색
	public abstract Client selectClient(Client client);	// 고객정보 조회
	public abstract Client selectClient(int client_no);	// 고객번호로 조회
	public abstract int insertClient(Client client);		// 고객등록
	public abstract int updateClient(Client client);		// 고객정보수정
	public abstract int deleteClientFile(int client_file_no);	//고객 첨부파일 수정
	public abstract int updateClientEmp(Client client);		// 고객담당 사원정보변경
	public abstract int updateDelClient(int client_no);	// 고객정보삭제
	public abstract ArrayList<Client> selectSearchAccount(Client clientInfo); //거래처 이름으로 검색
	public abstract ArrayList<Client> selectAccountClientList(Client client); //거래서 정보 조회
	
	public abstract int insertClientFile(ClientFile clientFile);	//고객관련 파일추가
	public abstract ArrayList<ClientFile> selectClientFileList(int client_no);	//해당고객이 갖고있는 첨부파일 조회
	public abstract int updateClientContract(int client_no);	// 계약 후 계약상태 변경

	ArrayList<Client> selectAllAccountClient(int emp_no); // 방문일지용 거래처목록

	public abstract Client selectOrderClient(Order order); //발주정보 상세보기
	
	public abstract int clientListCount(Client client);
	public abstract int selectClientCondition(Client client); //조건 검색
	public abstract ArrayList<Client> selectgetClientCondition(Client client); //조건 검색 리스트 불러오기
}
