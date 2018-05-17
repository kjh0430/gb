package com.crm.gb.notice.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.crm.gb.notice.model.service.NoticeService;
import com.crm.gb.notice.model.vo.Notice;

@Controller
public class NoticeController {

	private static final Logger logger=LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping("noticeList.do")
	public String NoticeList(Notice notice, Model model) {
		logger.info("공지사항 리스트 메소드 실행됨");
		ArrayList<Notice> noticeList=noticeService.selectAllNoticeList();
		model.addAttribute("noticeList",noticeList);
		
		return "notice/noticeList";
	}
	
	@RequestMapping("noticeWrite.do")
	public String NoticeWrite() {
		
		return "notice/noticeWrite";
	}
	
}
