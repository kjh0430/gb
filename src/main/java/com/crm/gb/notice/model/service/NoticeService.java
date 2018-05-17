package com.crm.gb.notice.model.service;

import java.util.ArrayList;

import com.crm.gb.notice.model.vo.Notice;

public interface NoticeService {

	public abstract ArrayList<Notice> selectAllNoticeList();//공지사항 리스트 조회

}
