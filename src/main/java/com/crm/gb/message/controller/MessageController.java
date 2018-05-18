package com.crm.gb.message.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MessageController {

	
	@RequestMapping("messageList.do")
	public String loginView() {
		return "message/messageList";
	}
	
	
}
