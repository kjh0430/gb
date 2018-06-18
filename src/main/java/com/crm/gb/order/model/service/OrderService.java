package com.crm.gb.order.model.service;

import java.util.ArrayList;

import com.crm.gb.emp.model.vo.Emp;
import com.crm.gb.order.model.vo.Order;

public interface OrderService {
	
	//public abstract ArrayList<Client> selectAccountClientList(int emp_no); //거래서 정보 조회

	public abstract int insertOrderList(Order orderlist); //주문 등록 
	
	public abstract int selectOrderMaxNo();
	
	public abstract ArrayList<Order> selectAllOrder(int emp_no);
	
	public abstract ArrayList<Order> selectOrderList2(Order order); //매출현황 

	public abstract ArrayList<Order> selectOrderlist(Order order); // 영업일지 
	
	public abstract ArrayList<Order> selectAllOrderList(Order order); //매출현황 전체 리스트
	
	public abstract int orderListCount(Order order); // 주문 리스트 카운드

	public abstract ArrayList<Order> productShare();

	public abstract int selectConditionListCount(Order order); //조건 검색 시 행의 개수ㄴ
	
	public abstract int selectOrderSum(Emp emp); //이달의 매출현황
	
	public abstract int selectselectOrderAvg(Emp emp); //이달의 매출 평균 
	
	public abstract String selectGoalState(Emp emp); //목표달성 현황 
	
}