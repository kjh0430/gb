package com.crm.gb.order.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.crm.gb.client.model.dao.ClientDao;
import com.crm.gb.client.model.vo.Client;



/*@Service("OrderService")*/
public class OrderServiceImpl implements OrderService{

	@Autowired
	private ClientDao clientDao;
	
	/** (거래중인)거래처 리스트 메소드**/
	@Override
	public ArrayList<Client> selectAccountClientList(int emp_no){
		return clientDao.selectAccountClient(emp_no);
	}
	
	/*@Autowired 
	private OrderDao orderDao;
	*/
}
