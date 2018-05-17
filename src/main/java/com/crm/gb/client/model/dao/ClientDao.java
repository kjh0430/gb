package com.crm.gb.client.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.gb.client.model.vo.Client;

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

	/** 고객정보 상세보기 메소드 Dao */
	public Client detailClient(int client_no) {
		return sqlSession.selectOne("detailClient", client_no);
	}

	/** 고객정보 삭제 메소드 Dao */
	public int deleteClient(int client_no) {
		return sqlSession.delete("client.deleteClient", client_no);
	}

	/** 고객정보 수정 메소드 Dao */
	public int updateClient(Client client) {
		return sqlSession.update("client.updateClient", client);
	}
	
	/** 고객담당 사원정보 수정 메소드 Dao */
	public int updateClientEmp(Client client) {
		return sqlSession.update("client.updateClientEmp", client);
	}
	
	
	
}
