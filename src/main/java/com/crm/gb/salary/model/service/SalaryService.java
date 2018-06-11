package com.crm.gb.salary.model.service;

import java.util.ArrayList;

import com.crm.gb.emp.model.vo.Emp;
import com.crm.gb.salary.model.vo.Salary;

public interface SalaryService {
	
	public abstract ArrayList<Salary> selectSalaryList();	// 급여관련 사원리스트 
	public abstract Salary selectSalaryDetail(int salary_no);	// 사원 급여정보 조회
	public abstract Emp selectEmpJob(int emp_no);	// 직책 조회용
	
}
