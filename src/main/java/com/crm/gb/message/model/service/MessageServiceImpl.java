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
	public ArrayList<Message> selectSearch(String empName) {
		
		
		
		return messageDao.selectSearch(empName);
	}

}
