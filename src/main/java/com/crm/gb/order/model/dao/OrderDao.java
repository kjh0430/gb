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
		System.out.println("orderlist22222:" + orderlist.toString());
		return sqlSession.insert("insertOrderList",orderlist);
	}
	
	public int selectOrderMaxNo() {
		return sqlSession.selectOne("selectOrderMaxNo");
	}
}
