package com.crm.gb.order.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.gb.client.model.vo.Client;

/*@Repository("orderDao")*/
public class OrderDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** (거래중인)거래처 목록 메소드 Dao **/
	public ArrayList<Client> selectAccountClient(int emp_no){
		
		return (ArrayList)sqlSession.selectList("selectAccountClient", emp_no);
	}
	
}
