package com.crm.gb.dailywork.model.dao;

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
}
