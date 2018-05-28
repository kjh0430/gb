package com.crm.gb.message.model.service;

import java.util.ArrayList;

import com.crm.gb.message.model.vo.Message;

public interface MessageService {

	ArrayList<Message> selectSearch(Message message);

	int insertMessage(Message message);

	ArrayList<Message> selectReceiveMessage(Message message);

	ArrayList<Message> selectSendMessage(Message message);

	int updateReadMessage(Message message);
}
