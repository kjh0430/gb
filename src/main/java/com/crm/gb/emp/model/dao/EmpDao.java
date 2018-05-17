package com.crm.gb.emp.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.crm.gb.emp.exception.EmpLoginFailException;
import com.crm.gb.emp.model.vo.Emp;

@Repository("empDao")
public class EmpDao {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private BCryptPasswordEncoder pwdEncoder;
	
	
	/** 로그인처리 Dao */
	public Emp selectEmp(Emp emp) throws EmpLoginFailException{
		
		Emp resultEmp=sqlSession.selectOne("emp.loginEmp", emp);
		
//		if(pwdEncoder.matches(emp.getEmp_pwd(), resultEmp.getEmp_pwd())) {
//			return resultEmp;
//		}else {
//			throw new EmpLoginFailException("아이디와 비밀번호를 확인하세요!!");
//		}
		
		return resultEmp;
	}

	public int insertEmp(Emp emp) {
		return sqlSession.insert("empInsert", emp);
	}

	public int updateEmp(Emp emp) {
		return sqlSession.update("empUpdate", emp);
	}

	public int deleteEmp(Emp emp) {
		return sqlSession.delete("empDelete", emp);
	}

	public Emp selectEmpNo(int emp_no) {
		return sqlSession.selectOne("detailEmp", emp_no);
	}

	public ArrayList<Emp> selectEmpList() {
		return (ArrayList)sqlSession.selectList("empList");
	}
	
}
