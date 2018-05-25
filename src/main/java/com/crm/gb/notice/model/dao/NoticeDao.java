package com.crm.gb.notice.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.gb.notice.model.vo.Notice;

@Repository("noticedao")
public class NoticeDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	//공지사항 리스트 출력 메소드 
	public ArrayList<Notice> selectAllNotice() {
		return (ArrayList)sqlSession.selectList("notice_mapper.selectAllNotice");
	}
	//공지사항 상세정보
	public Notice detailNotice(int notice_no) {
		
		return sqlSession.selectOne("detailNotice",notice_no);
		
	}
	//공지사항 업데이트
	public int updateNotice(Notice notice) {
		
		return sqlSession.update("updateNotice",notice);
	}
	//공지사항 추가
	public int insertNotice(Notice notice) {
		
		return sqlSession.insert("insertNotice",notice);
	}
	
	//공지사항 조횟수
	public int countUpdate(int notice_no) {
		
		return sqlSession.update("updateCountNotice", notice_no);
	}
	//공지사항 삭제
	public int delectNotice(int notice_no) {
		
		return sqlSession.delete("deleteNotice", notice_no);
	}
	//공지사항 게시물 갯수
	public Notice countNoticeList() {
		
		return sqlSession.selectOne("notice_mapper.countNotice");
	}

}
