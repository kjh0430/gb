package com.crm.gb.emp.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.gb.emp.model.vo.Emp;

@Repository("empDao")
public class EmpDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int insertEmp(Emp emp) {
		return sqlSession.insert("empInsert", emp);
	}

	public int updateEmp(Emp emp) {
		return sqlSession.update("empUpdate", emp);
	}

	public int deleteEmp(Emp emp) {
		return sqlSession.delete("empDelete", emp);
	}

}
