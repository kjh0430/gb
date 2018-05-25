package com.crm.gb.client.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.gb.client.model.vo.Client;
import com.crm.gb.client.model.vo.ClientFile;
import com.crm.gb.emp.model.vo.Emp;

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
	public ArrayList<Client> selectAccountClient(int emp_no){
		
		return (ArrayList)sqlSession.selectList("selectAccountClient", emp_no);
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
	public ArrayList<Client> selectSearchAccount(String client_company){
		
		return (ArrayList)sqlSession.selectList("selectSearchAccount", client_company);
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

	
}
