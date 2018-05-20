package com.crm.gb.order.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.gb.order.dao.OrderDao;



@Service("OrderService")
public class OrderServiceImpl {

	
	
	@Autowired 
	private OrderDao orderDao;
	
}
