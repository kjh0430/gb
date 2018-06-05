package com.crm.gb.message.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.crm.gb.message.model.vo.Message;

@Service
public interface MessageService {

	public abstract ArrayList<Message> selectSearch(Message message);
	public abstract int insertMessage(Message message);
	public abstract ArrayList<Message> selectReceiveMessage(Message message);
	public abstract ArrayList<Message> selectSendMessage(Message message);
	public abstract int updateReadMessage(Message message);	
	public abstract int countMsg(int emp_no);
}
