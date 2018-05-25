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

	//공지사항 수정
	@Override
	public int updateNotice(Notice notice) {
		return noticeDao.updateNotice(notice);
	}

	
	//공지사항 추가
	@Override
	public int insertNotice(Notice notice) {
		
		return noticeDao.insertNotice(notice);
	}
	//공지사항 카운트 
	@Override
	public int countUpdate(int notice_no) {
		
		return noticeDao.countUpdate(notice_no);
	}

	//공지사항 삭제
	@Override
	public int deleteNotice(int notice_no) {
		
		return noticeDao.delectNotice(notice_no);
	}
	//공지사항 리스트 갯수
	@Override
	public Notice noticeListCount() {
		
		return noticeDao.countNoticeList();
	}
	
	
	
}
