package com.crm.gb.client.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.gb.client.model.vo.Client;
import com.crm.gb.client.model.vo.ClientFile;
import com.crm.gb.order.model.vo.Order;

@Repository("clientDao")
public class ClientDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 신규고객 등록 메소드 Dao */
	public int insertClient(Client client) {
		return sqlSession.insert("insertClient", client);
	}

	/** 등록된 고객정보 확인 메소드 Dao */
	public Client showClient(Client client) {
		return null;
	}
	
	/** 등록된 모든 고객정보 확인 메소드 Dao */
	public ArrayList<Client> selectAllClient() {
		return (ArrayList)sqlSession.selectList("selectAllClient");
	}

	/** 등록된 잠재고객 정보확인 메소드 Dao */
	public ArrayList<Client> selectPoList() {
		return (ArrayList)sqlSession.selectList("selectPoList");
	}
	
	/** 거래중이 거래처 정보 확인 메소드 Dao **/
	public ArrayList<Client> selectAccountClient(Client client){
		
		return (ArrayList)sqlSession.selectList("selectAccountClient", client);
	}
	

	/** 고객정보 상세보기 메소드 Dao */
	public Client detailClient(int client_no) {
		return sqlSession.selectOne("detailClient", client_no);
	}

	/** 고객정보 삭제 메소드 Dao */
	public int deleteClient(int client_no) {
		return sqlSession.update("client.deleteClient", client_no);
	}

	/** 고객정보 수정 메소드 Dao */
	public int updateClient(Client client) {
		return sqlSession.update("client.updateClient", client);
	}
	
	/** 고객담당 사원정보 수정 메소드 Dao */
	public int updateClientEmp(Client client) {
		return sqlSession.update("client.updateClientEmp", client);
	}
	

	/** 거래처 이름 검색 결과 리스트 메소드 **/
	public ArrayList<Client> selectSearchAccount(Client clientInfo){
		
		return (ArrayList)sqlSession.selectList("selectSearchAccount", clientInfo);
	}
	

	/** 방문일지용 모든 거래처 정보 확인 메소드 Dao **/
	public ArrayList<Client> selectAllAccountClient(int emp_no){
		
		return (ArrayList)sqlSession.selectList("selectAllAccountClient", emp_no);
	}

	/** 고객관련 첨부파일 추가 메소드 Dao */
	public int insertClientFile(ClientFile clientFile) {
		return sqlSession.insert("client.insertClientFile", clientFile);
	}

	/** 고객정보 조회 메소드 Dao */
	public Client selectClient(Client client) {
		return sqlSession.selectOne("selectClient", client);
	}

	/** 고객 첨부파일 조회 메소드 Dao */
	public ArrayList<ClientFile> selectClientFile(int client_no) {
		return (ArrayList)sqlSession.selectList("selectClientFile", client_no);
	}

	/** 고객 계약상태 변경 메소드 Dao */
	public int updateClientContract(int client_no) {
		return sqlSession.update("updateClientContract", client_no);
	}

	/** 발주정보 상세보기 메소드 DAO**/
	public Client selectOrderClient(Order order) {
		return sqlSession.selectOne("selectOrderClient", order);
	}
	/** 거래처 이름으로 검색 메소드 Dao */
	public ArrayList<Client> selectSearchClient(String client_name) {
		return (ArrayList)sqlSession.selectList("searchClientList", client_name);
	}

	/** 잠재고객 이름으로 검색 메소드 Dao */
	public ArrayList<Client> selectPoList(String client_name) {
		return (ArrayList)sqlSession.selectList("searchPoList", client_name);
	}

	/** 등록고객 페이지 처리 리스트 메소드 Dao */
	public ArrayList<Client> selectPageAllClient(Client client) {
		return (ArrayList)sqlSession.selectList("pageList", client);
	}

	/** 잠재고객 페이지 처리 리스트 메소드 Dao */
	public ArrayList<Client> selectPagePoClient(Client client) {
		return (ArrayList)sqlSession.selectList("pagePoList", client);
	}

	/**  거래중인 고객사 리스트카운트 Dao**/
	public int clientListCount(int emp_no) {
		System.out.println("dao : " + emp_no);
		return sqlSession.selectOne("clCount",emp_no);
	}

	public ArrayList<Client> selectAccountClient(int emp_no) {
		// TODO Auto-generated method stub
		return null;
	}

	/** 고객관련 첨부파일 수정 Dao */
	public int deleteClientFile(int client_file_no) {
		return sqlSession.delete("deleteClientFile", client_file_no);
	}

	
}
