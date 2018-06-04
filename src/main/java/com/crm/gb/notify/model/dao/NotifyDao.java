package com.crm.gb.notify.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.gb.emp.model.vo.Emp;
import com.crm.gb.notify.model.vo.Notify;

@Repository("notifyDao")
public class NotifyDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertNotify(Notify notify) {		
		return sqlSession.insert("insertNotify",notify);
	}
	
	//로그인 했을때 알람보여주기
	public ArrayList<Notify> selectNotify(Emp emp) {		
		return (ArrayList)sqlSession.selectList("selectNotify", emp);
	}

	public int updateNotify(Notify notify) {
		return sqlSession.update("updateNotify",notify);
	}

}
