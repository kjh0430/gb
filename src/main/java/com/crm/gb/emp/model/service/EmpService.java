package com.crm.gb.emp.model.service;

import java.util.ArrayList;

import com.crm.gb.emp.exception.EmpLoginFailException;
import com.crm.gb.emp.model.vo.Emp;

public interface EmpService {
	
	public static final int MID = 1;

	public abstract ArrayList<Emp> selectAllEmp(); 	// 모든 사원정보조회
	public abstract Emp selectEmp(Emp emp) throws EmpLoginFailException;			// 사원정보 조회
	public abstract Emp selectEmp(String emp_no);	// 사원번호로 조회
	

	int insertEmp(Emp emp); //사원 등록
	int updateEmp(Emp emp); //사원 정보 수정
	int updateEmpDelete(int emp_no); //사원 삭제여부 수정
	public abstract Emp selectEmpNo(int emp_no); //사원 조회
	public abstract ArrayList<Emp> selectEmpList(); //사원 전체 조회
	public abstract Emp selectCheckPhone(String emp_phone); //연락처 중복검사
	public abstract Emp selectCheckEmail(String emp_email); //이메일 중복검사
	public abstract ArrayList<Emp> selectDeptEmp(Emp emp); //부서별 사원리스트
	public abstract Emp selectMgrNo(int emp_no); //상사이름 조회
	public abstract Emp selectCheckEmpNo(int emp_no); //사원번호 중복검사
	public abstract Emp selectMyInfo(Emp emp); //나의 정보 가져오기
	public abstract Emp selectEmail(Emp emp); //이메일 check
	public abstract Emp selectPhoneckdupl(Emp emp); //phone check
	public abstract int updateMyInfo(Emp emp); //내 정보 업데이트
	
	
}