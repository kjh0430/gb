package com.crm.gb.order.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.crm.gb.client.model.vo.Client;
import com.crm.gb.order.model.vo.Order;

public interface OrderService {
	
	public abstract ArrayList<Client> selectAccountClientList(int emp_no); //거래서 정보 조회

	public abstract int insertOrderList(Order orderlist); //주문 등록 
	
	public abstract int selectOrderMaxNo();
	
	public abstract ArrayList<Order> selectAllOrder(int emp_no);
	
	public abstract ArrayList<Order> selectOrderList(int order_no);
}