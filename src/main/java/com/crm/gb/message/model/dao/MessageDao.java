package com.crm.gb.message.model.dao;

import java.util.ArrayList;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.gb.emp.model.vo.Emp;
import com.crm.gb.message.model.vo.Message;
import com.crm.gb.message.model.vo.Notify;

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
	
	//메시지 받는 사람 미접속중일때, db에 insert
	public int insertNofity(Notify notify) {		
		return sqlSession.insert("insertNotify",notify);
	}
	
	//로그인 했을때 알람보여주기
	public ArrayList<Notify> selectNotify(Emp emp) {		
		return (ArrayList)sqlSession.selectList("selectNotify", emp);
	}

	public int updateNotify(Notify notify) {
		return sqlSession.update("updateNotify",notify);
	}

}
