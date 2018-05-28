package com.crm.gb.order.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.gb.client.model.dao.ClientDao;
import com.crm.gb.client.model.vo.Client;
import com.crm.gb.order.model.dao.OrderDao;
import com.crm.gb.order.model.vo.Order;



@Service("OrderService")
public class OrderServiceImpl implements OrderService{

	@Autowired
	private ClientDao clientDao;
	
	@Autowired 
	private OrderDao orderDao;
	
	/** (거래중인)거래처 리스트 메소드**/
	@Override
	public ArrayList<Client> selectAccountClientList(int emp_no){
		return clientDao.selectAccountClient(emp_no);
	}
	
	/* 주문 등록 메소드 */
	@Override
	public int insertOrderList(Order orderlist) {
		return orderDao.insertOrderList(orderlist);
	}
	
	/*order_no max값 가져오는 메소드*/
	@Override
	public int selectOrderMaxNo() {
		return orderDao.selectOrderMaxNo();
	}

	/* 영업일지에 나오는 orderList 메소드 */
	@Override
	public ArrayList<Order> selectOrderlist(Order order) {		
		return orderDao.selectOrderlist(order);
	}
	
	
}
