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

}
