package com.crm.gb.dailywork.model.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.gb.dailywork.model.vo.Dailywork;

@Repository("dailyworkDao")
public class DailyworkDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/** 방문일지 등록 메소드 Dao**/
	public int insertDailywork(Dailywork dailywork) {
		return sqlSession.insert("insertDailywork", dailywork);
	}

	//영업일지 _ 방문일지 선택
	public ArrayList<Dailywork> selectVisit(Dailywork dw) {
		return (ArrayList)sqlSession.selectList("selectVisit", dw);
	}
}
