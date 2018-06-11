package com.crm.gb.message.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.gb.emp.model.vo.Emp;
import com.crm.gb.message.model.dao.MessageDao;
import com.crm.gb.message.model.vo.Message;



@Service("MessageService")
public class MessageServiceImpl implements MessageService {

	
	
	@Autowired 
	private MessageDao messageDao;
	
	@Override
	public ArrayList<Message> selectSearch(Message message) {
		return messageDao.selectSearch(message);
	}
	
	@Override
	public int insertMessage(Message message) {
		return messageDao.insertMessage(message);
	}

	@Override
	public ArrayList<Message> selectReceiveMessage(Message message) {	
		return messageDao.selectReceiveMessage(message);
	}

	@Override
	public ArrayList<Message> selectSendMessage(Message message) {		
		return messageDao.selectSendMessage(message);
	}

	@Override
	public int updateReadMessage(Message message) {		
		return messageDao.updateReadMessage(message);
	}


	@Override
	public int countMsg(int emp_no) {		
		return messageDao.countMsg(emp_no);
	}

	@Override
	public int selectgetListCount(Message message) {
		
		return messageDao.selectgetListCount(message);
	}

	@Override
	public int selectConditionListCount(Message message) {

		return messageDao.selectConditionListCount(message);
	}

	@Override
	public ArrayList<Message> selectReceiveConditionMessage(Message message) {
	
		return messageDao.selectReceiveConditionMessage(message);
	}

	@Override
	public int selectsendListCount(Message message) {
		
		return messageDao.selectsendListCount(message);
	}

	@Override
	public int selectConditionsendListCount(Message message) {
		// TODO Auto-generated method stub
		return messageDao.selectConditionsendListCount(message);
	}

	@Override
	public ArrayList<Message> selectSendConditionMessage(Message message) {
		// TODO Auto-generated method stub
		return messageDao.selectSendConditionMessage(message);
	}

	
}
