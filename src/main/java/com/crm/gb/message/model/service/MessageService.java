package com.crm.gb.message.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.crm.gb.emp.model.vo.Emp;
import com.crm.gb.message.model.vo.Message;
import com.crm.gb.message.model.vo.Notify;

@Service
public interface MessageService {

	public abstract ArrayList<Message> selectSearch(Message message);
	public abstract int insertMessage(Message message);
	public abstract ArrayList<Message> selectReceiveMessage(Message message);
	public abstract ArrayList<Message> selectSendMessage(Message message);
	public abstract int updateReadMessage(Message message);	
	public abstract int insertNotify(Notify notify);
	public abstract ArrayList<Notify> selectNotify(Emp emp);
	public abstract int updateNotify(Notify notify);
	public abstract int countMsg(int emp_no);
}
