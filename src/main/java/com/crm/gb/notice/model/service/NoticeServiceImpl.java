package com.crm.gb.notice.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.gb.notice.model.dao.NoticeDao;
import com.crm.gb.notice.model.vo.Notice;

@Service("noticeService")
public class NoticeServiceImpl implements NoticeService{

	@Autowired
	private NoticeDao noticeDao;

	/*공지사항 목록 조회*/
	@Override
	public ArrayList<Notice> selectAllNoticeList() {
		
		return noticeDao.selectAllNotice();
	}

	//공지사항 상세정보
	@Override
	public Notice selectNotice(int notice_no) {
		
		return noticeDao.detailNotice(notice_no);
	}
	
	
	
}
