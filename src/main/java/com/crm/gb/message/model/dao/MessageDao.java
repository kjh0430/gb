package com.crm.gb.message.model.dao;

import java.util.ArrayList;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.gb.message.model.vo.Message;

@Repository("messageDao")
public class MessageDao {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	public ArrayList<Message> selectSearch(Message message) {
		return (ArrayList)sqlSession.selectList("selectEmp",message);
	}
	
	public int insertMessage(Message message) {		
		return sqlSession.insert("insertMessage",message);
	}
	
	public ArrayList<Message> selectReceiveMessage(Message message) {
		return (ArrayList)sqlSession.selectList("selectReceiveMessage",message);
	}
	
	public ArrayList<Message> selectSendMessage(Message message) {
		return (ArrayList)sqlSession.selectList("selectSendMessage",message);
	}
	
	public int updateReadMessage(Message message) {		
		return sqlSession.update("updateReadMessage",message);
	}
	
	public int countMsg(int emp_no) {
		return sqlSession.selectOne("countMsg", emp_no);
	}

	public int selectgetListCount(Message message) {
		
		return sqlSession.selectOne("getListCount",message);
	}

	public int selectConditionListCount(Message message) {
	
		return sqlSession.selectOne("receiveConditionCount",message);
	}

	public ArrayList<Message> selectReceiveConditionMessage(Message message) {
		
		return (ArrayList)sqlSession.selectList("receiveConditionList",message);
	}

	public int selectsendListCount(Message message) {
		
		return sqlSession.selectOne("sendListCount",message);
	}

	public int selectConditionsendListCount(Message message) {
		
		return sqlSession.selectOne("sendConditionCount",message);
	}

	public ArrayList<Message> selectSendConditionMessage(Message message) {
	
		return (ArrayList)sqlSession.selectList("selectSendConditionMessage",message);
	}

}
