package com.crm.gb.order.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.gb.client.model.vo.Client;
import com.crm.gb.order.model.vo.Order;

@Repository("orderDao")
public class OrderDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** (거래중인)거래처 목록 메소드 Dao **/
	public ArrayList<Client> selectAccountClient(int emp_no){		
		return (ArrayList)sqlSession.selectList("selectAccountClient", emp_no);
	}
	
	public int insertOrderList(Order orderlist) {
		return sqlSession.insert("insertOrderList",orderlist);
	}
	
	public int selectOrderMaxNo() {
		return sqlSession.selectOne("selectOrderMaxNo");
	}

	public ArrayList<Order> selectAllOrder(int emp_no){
		return (ArrayList)sqlSession.selectList("selectAllOrderList",emp_no);
	}
	
	public ArrayList<Order> selectOrderList2(Order order){
		return (ArrayList)sqlSession.selectList("selectOrderList2", order);
	}
	/* 방문일지를 위한 주문 목록 */
	public ArrayList<Order> selectOrderlist(Order order) {
		return (ArrayList)sqlSession.selectList("selectOrderlist",order);
	}
	
	public ArrayList<Order> selectAllOrderList(Order order){
		return (ArrayList)sqlSession.selectList("selectAllOrderList",order);
	}
	
	//orderList count
	public int orderListCount(Order order) {
		return sqlSession.selectOne("orderListCount",order);
	}

	public ArrayList<Order> productShare() {
		return (ArrayList)sqlSession.selectList("productShare");
	}

	public int selectConditionListCount(Order order) {
		
		return sqlSession.selectOne("conditionListCount",order);
	}
	
	//이달의 매출현황
	public int selectOrderSum(int emp_no) {
		return sqlSession.selectOne("selectOrderSum",emp_no);
	}
	
	//이달의 평균매출
	public int selectselectOrderAvg(int emp_no) {
		return sqlSession.selectOne("selectOrderAvg",emp_no);
	}
	
	//목표달성현황 
	public String selectGoalState(int emp_no) {
		return sqlSession.selectOne("selectGoalState",emp_no);
	}
}
