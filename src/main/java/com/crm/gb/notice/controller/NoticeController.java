package com.crm.gb.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.crm.gb.notice.model.service.NoticeService;
import com.crm.gb.notice.model.vo.Notice;

@Controller
public class NoticeController {

	private static final Logger logger=LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	//공지사항 리스트 
	@RequestMapping("noticeList.do")
	public String NoticeList(Notice notice, Model model) {
		logger.info("공지사항 리스트 메소드 실행됨");
		ArrayList<Notice> noticeList=noticeService.selectAllNoticeList();
		model.addAttribute("noticeList",noticeList);
		
		/*System.out.println(noticeList.get(0));*/
		return "notice/noticeList";
	}
	
	//공지사항 추가 페이지
	@RequestMapping("noticeWrite.do")
	public String NoticeWrite() {
		
		return "notice/noticeWrite";
	}
	
	//공지사항 추가 메소드 
	/*@RequestMapping("noticeAdd.do")*/
	@RequestMapping(value="noticeAdd.do", method=RequestMethod.POST)	
	public String NoticeAdd(Notice notice, Model model,HttpServletRequest request ) {
		
		int result=noticeService.insertNotice(notice);
		
		ArrayList<Notice> noticeList=noticeService.selectAllNoticeList();
		model.addAttribute("noticeList",noticeList);
		
		return "notice/noticeList";
	}
	
	
	//공지사항내용 
	@RequestMapping("noticeDetail.do")
	public String NoticeDetail(Notice notice, Model model ,@RequestParam(value="notice_no") int notice_no) {
		
		System.out.println("공지사항 번호"+notice_no);
		
		Notice returnNotice=noticeService.selectNotice(notice_no);
		//공지사항 카운트
		int countNotice=noticeService.countUpdate(notice_no);
		//
		model.addAttribute("detailNotice",returnNotice);
		
		return "notice/noticeDetail";
	}
	
	//공지사항 수정
	@RequestMapping("noticeEdit.do")
	public String NoticeEdit(Notice notice, Model model ,@RequestParam(value="notice_no") int notice_no) {
		
		System.out.println("공지사항 수정번호"+notice_no);
		
		Notice returnNotice=noticeService.selectNotice(notice_no);
		
		model.addAttribute("detailNotice",returnNotice);
		return "notice/noticeEdit";
	}
	//공지사항 수정 update
	@RequestMapping("noticeEditUpdate.do")
	public String NoticeEditUpdate(Notice notice, Model model,@RequestParam(value="notice_no") int notice_no) {
		
		//업데이트 추가 
		int resultNotcie=noticeService.updateNotice(notice);
		
		//
		ArrayList<Notice> noticeList=noticeService.selectAllNoticeList();
		model.addAttribute("noticeList",noticeList);
	
		return "notice/noticeList";
	}
	
	//공지사항 삭제
	@RequestMapping("noticeDelete.do")
	public String NoticeDelete(Notice notice,Model model,@RequestParam(value="notice_no") int notice_no) {
		
		int result=noticeService.deleteNotice(notice_no);
		
		ArrayList<Notice> noticeList=noticeService.selectAllNoticeList();
		model.addAttribute("noticeList",noticeList);
	
		
		return "notice/noticeList";
	}
	
	
}


