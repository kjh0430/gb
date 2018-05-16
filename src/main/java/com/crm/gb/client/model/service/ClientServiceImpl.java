package com.crm.gb.client.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.gb.client.model.dao.ClientDao;
import com.crm.gb.client.model.vo.Client;
import com.crm.gb.emp.model.vo.Emp;

@Service("clientService")
public class ClientServiceImpl implements ClientService{

	@Autowired
	private ClientDao clientDao;
	
	/** 모든 고객정보 조회 메소드 */
	@Override
	public ArrayList<Client> selectAllClient() {
		return clientDao.selectAllClient();
	}

	/** 잠재고객 조회 메소드 */
	@Override
	public ArrayList<Client> selectPoList() {
		return clientDao.selectPoList();
	}
	
	/** 고객정보 조회 메소드 */
	@Override
	public Client selectClient(Client client) {
		
		return null;
	}

	/** 고객번호로 정보조회 메소드 */
	@Override
	public Client selectClient(int client_no) {
		return clientDao.detailClient(client_no);
	}

	/** 고객정보 등록 메소드 */
	@Override
	public int insertClient(Client client) {
		// TODO Auto-generated method stub
		return clientDao.insertClient(client);
	}

	/** 고객정보 업데이트 메소드 */
	@Override
	public int updateClient(Client client) {
		// TODO Auto-generated method stub
		return 0;
	}

	/** 고객정보 삭제 메소드 */
	@Override
	public int deleteClient(int client_no) {
		return clientDao.deleteClient(client_no);
	}
	
	/** 거래처 리스트 메소드 **/
	@Override
	public ArrayList<Client> selectAccountClientList(int emp_no) {
		return clientDao.selectAccountClient(emp_no);
	}

}
