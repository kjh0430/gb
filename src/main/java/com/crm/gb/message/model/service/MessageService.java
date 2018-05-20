package com.crm.gb.message.model.service;

import java.util.ArrayList;



import com.crm.gb.emp.model.vo.Emp;
import com.crm.gb.message.model.vo.Message;


public interface MessageService {

	
	
	 ArrayList<Message> selectSearch(String empName);
	 
	 

}
