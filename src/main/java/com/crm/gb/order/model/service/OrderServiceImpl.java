package com.crm.gb.order.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.gb.client.model.dao.ClientDao;
import com.crm.gb.client.model.vo.Client;
import com.crm.gb.emp.model.vo.Emp;
import com.crm.gb.order.model.dao.OrderDao;
import com.crm.gb.order.model.vo.Order;



@Service("OrderService")
public class OrderServiceImpl implements OrderService{

	@Autowired
	private ClientDao clientDao;
	
	@Autowired 
	private OrderDao orderDao;
	
//	/** (거래중인)거래처 리스트 메소드**/
//	@Override
//	public ArrayList<Client> selectAccountClientList(int emp_no){
//		return clientDao.selectAccountClient(emp_no);
//	}
//	
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

	
	@Override
	public ArrayList<Order> selectAllOrder(int emp_no){
		return orderDao.selectAllOrder(emp_no);
	}
	
	@Override
	public ArrayList<Order> selectOrderList2(Order order){
		return orderDao.selectOrderList2(order);
	}

	/* 영업일지에 나오는 orderList 메소드 */
	@Override
	public ArrayList<Order> selectOrderlist(Order order) {		
		return orderDao.selectOrderlist(order);
	}
	
	/** 매출현황 전체 리스트 출력 메소드 **/
	@Override
	public ArrayList<Order> selectAllOrderList(Order order){
		return orderDao.selectAllOrderList(order);
	}
	
	@Override
	public int orderListCount(Order order) {
		return orderDao.orderListCount(order);
	}
	
	//주문리스트 중 제품별 판매량
	@Override
	public ArrayList<Order> productShare() {
		return orderDao.productShare();
	}

	@Override
	public int selectConditionListCount(Order order) {
		
		return orderDao.selectConditionListCount(order);
	}

	@Override
	public int selectOrderSum(Emp emp) {
		return orderDao.selectOrderSum(emp);
	}
	
	@Override
	public int selectselectOrderAvg(Emp emp) {
		return orderDao.selectselectOrderAvg(emp);
	}
	
	@Override
	public String selectGoalState(Emp emp) {
		return orderDao.selectGoalState(emp);
	}
}
