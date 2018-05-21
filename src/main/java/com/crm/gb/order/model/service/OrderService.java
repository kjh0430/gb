package com.crm.gb.order.model.service;

import java.util.ArrayList;

import com.crm.gb.client.model.vo.Client;

public interface OrderService {
	
	public abstract ArrayList<Client> selectAccountClientList(int emp_no); //거래서 정보 조회

}
