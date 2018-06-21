package com.crm.gb.salary.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.crm.gb.emp.model.vo.Emp;
import com.crm.gb.salary.model.vo.Salary;

@Repository("salaryDao")
public class SalaryDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 급여관련 사원리스트 */
	public ArrayList selectSalaryList() {
		return (ArrayList)sqlSession.selectList("salary.salaryList");
	}

	/** 사원 급여정보 조회 */
	public Salary selectSalaryDetail(int salary_no) {
		return sqlSession.selectOne("salaryDetail", salary_no);
	}

	/** 사원 직책 조회 */
	public Emp selectEmpJob(int emp_no) {
		return sqlSession.selectOne("salary.empJob", emp_no);
	}

	/** 급여리스트 페이지 조회 */
	public ArrayList<Salary> selectSalaryPageList(Salary salary) {
		return (ArrayList)sqlSession.selectList("salary.selectSalaryPageList", salary);
	}

	/** 급여리스트 검색 */
	public ArrayList<Salary> selectSearchList(String emp_name) {
		return (ArrayList)sqlSession.selectList("salary.selectSearchName", emp_name);
	}

	public int insertSalary(Salary salary) {
		return sqlSession.insert("salary.insertSalary",salary);
	}
	
	
}
