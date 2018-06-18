package com.crm.gb.client.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.gb.client.model.dao.ClientDao;
import com.crm.gb.client.model.vo.Client;
import com.crm.gb.client.model.vo.ClientFile;
import com.crm.gb.order.model.vo.Order;

@Service("clientService")
public class ClientServiceImpl implements ClientService{

	@Autowired
	private ClientDao clientDao;
	
	/** 모든 고객정보 조회 메소드 */
	@Override
	public ArrayList<Client> selectAllClient() {
		return clientDao.selectAllClient();
	}
	
	/** 등록고객 페이지 처리 조회 메소드 */
	@Override
	public ArrayList<Client> selectAllClient(Client client) {
		return clientDao.selectPageAllClient(client);
	}
	
	/** 잠재고객 페이지 처리 조회 메소드 */
	@Override
	public ArrayList<Client> selectPoClient(Client client) {
		return clientDao.selectPagePoClient(client);
	}

	/** 잠재고객 조회 메소드 */
	@Override
	public ArrayList<Client> selectPoList() {
		return clientDao.selectPoList();
	}
	
	/** 고객정보 조회 메소드 */
	@Override
	public Client selectClient(Client client) {
		
		return clientDao.selectClient(client);
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
		return clientDao.updateClient(client);
	}
	
	/** 고객관련 첨부파일 수정 메소드 */
	@Override
	public int deleteClientFile(int client_file_no) {
		return clientDao.deleteClientFile(client_file_no);
	}
	
	/** 계약 후 계약현황 수정 메소드 */
	@Override
	public int updateClientContract(int client_no) {
		return clientDao.updateClientContract(client_no);
	}
	
	/** 고객담당 사원정보 업데이트 메소드 */
	@Override
	public int updateClientEmp(Client client) {
		return clientDao.updateClientEmp(client);
	}
	
	/** 고객정보 삭제 메소드 */
	@Override
	public int updateDelClient(int client_no) {
		return clientDao.deleteClient(client_no);
	}
	
	
	/** 거래처 리스트 메소드 **/
	@Override
	public ArrayList<Client> selectAccountClientList(Client client) {
		return clientDao.selectAccountClient(client);
	}
	
	/** 고객관련 파일 추가 메소드 */
	@Override
	public int insertClientFile(ClientFile clientFile) {
		return clientDao.insertClientFile(clientFile);
	}
	
	/** 거래처 이름 검색 메소드 */
	@Override
	public ArrayList<Client> selectClientList(String client_name) {
		return clientDao.selectSearchClient(client_name);
	}
	
	/** 고객이 갖고있는 첨부파일 조회 메소드 */
	@Override
	public ArrayList<ClientFile> selectClientFileList(int client_no) {
		return clientDao.selectClientFile(client_no);
	}
	
	/** 거래처 이름 검색 결과 리스트 메소드 **/
	@Override
	public ArrayList<Client> selectSearchAccount(Client clientInfo){
		return clientDao.selectSearchAccount(clientInfo);
	}
	
	/** 발주정보 상세보기 메소드 **/
	@Override
	public Client selectOrderClient(Order order) {
		return clientDao.selectOrderClient(order);
	}
	
	/** 방문일지용 고객정보 조회 메소드 */
	@Override
	public ArrayList<Client> selectAllAccountClient(int emp_no) {
		return clientDao.selectAllAccountClient(emp_no);
	}
		
	/** 잠재고객 이름으로 검색 */
	@Override
	public ArrayList<Client> selectPoList(String client_name) {
		return clientDao.selectPoList(client_name);
	}
	
	@Override
	public int clientListCount(Client client) {
		return clientDao.clientListCount(client);
	}

	@Override  //클라이언트 회사명 조건검색 
	public int selectClientCondition(Client client) {

		return clientDao.selectClientCondition(client);
	}

	@Override //검색 조건에 맞는 클라이언트명 가져오기
	public ArrayList<Client> selectgetClientCondition(Client client) {
		
		return clientDao.selectListClientCondition(client);
	}
	
}
