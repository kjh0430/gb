package com.crm.gb.emp.model.service;

import java.util.ArrayList;

import com.crm.gb.emp.exception.EmpLoginFailException;
import com.crm.gb.emp.model.vo.Emp;

public interface EmpService {
	
	public static final int MID = 1;

	public abstract ArrayList<Emp> selectAllEmp(); 	// 모든 사원정보조회
	public abstract Emp selectEmp(Emp emp) throws EmpLoginFailException;			// 사원정보 조회
	public abstract Emp selectEmp(String emp_no);	// 사원번호로 조회
//	public abstract int insertEmp(Emp emp);		// 사원등록
//	public abstract int updateEmp(Emp emp);		// 사원정보변경
//	public abstract int deleteEmp(String emp_no);	// 사원정보삭제
	

	int insertEmp(Emp emp); //사원 등록
	int updateEmp(Emp emp); //사원 정보 수정
	int deleteEmp(int emp_no); //사원 삭제
	public abstract Emp selectEmpNo(int emp_no); //사원 조회
	public abstract ArrayList<Emp> selectEmpList(); //사원 전체 조회
	
}