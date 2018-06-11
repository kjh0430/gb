package com.crm.gb.salary.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.gb.emp.model.vo.Emp;
import com.crm.gb.salary.model.dao.SalaryDao;
import com.crm.gb.salary.model.vo.Salary;

@Service("salaryService")
public class SalaryServiceImpl implements SalaryService{
	
	@Autowired
	private SalaryDao salaryDao;
	
	/** 급여관련 사원리스트 */
	@Override
	public ArrayList<Salary> selectSalaryList() {
		return salaryDao.selectSalaryList();
	}
	
	/** 사원 급여정보 조회 */
	@Override
	public Salary selectSalaryDetail(int salary_no) {
		return salaryDao.selectSalaryDetail(salary_no);
	}
	
	/** 사원 직책 조회 */
	@Override
	public Emp selectEmpJob(int emp_no) {
		return salaryDao.selectEmpJob(emp_no);
	}
}
