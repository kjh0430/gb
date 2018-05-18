package com.crm.gb.message.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.gb.emp.model.vo.Emp;
import com.crm.gb.message.model.dao.MessageDao;



@Service("MessageService")
public class MessageServiceImpl implements MessageService {

	
	
	@Autowired 
	private MessageDao messageDao;
	
	@Override
	public ArrayList<Emp> selectSearch(String empName) {
		
		
		
		return messageDao.selectSearch(empName);
	}

}
