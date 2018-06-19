package com.crm.gb.emp.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.gb.emp.exception.EmpLoginFailException;
import com.crm.gb.emp.model.dao.EmpDao;
import com.crm.gb.emp.model.vo.Emp;

@Service("empService")
public class EmpServlceImpl implements EmpService{

	@Autowired
	private EmpDao empDao;
	
	/** 모든사원정보 조회 메소드 */
	@Override
	public ArrayList<Emp> selectAllEmp() {
		// TODO Auto-generated method stub
		return null;
	}

	/** 사원정보 조회 메소드  */
	@Override
	public Emp selectEmp(Emp emp) throws EmpLoginFailException{
		return empDao.selectEmp(emp);
	}
	
	/** 사원번호로 정보조회하는 메소드 */
	@Override
	public Emp selectEmp(String emp_no) {
		// TODO Auto-generated method stub
		return null;
	}
	
	/*사원 등록*/
	@Override
	public int insertEmp(Emp emp) {
		return empDao.insertEmp(emp);
	}

	/*사원 정보 수정*/
	@Override
	public int updateEmp(Emp emp) {
		return empDao.updateEmp(emp);
	}

	/*사원 삭제여부 수정*/
	@Override
	public int updateEmpDelete(int emp_no) {
		return empDao.updateEmpDelete(emp_no);
	}

	/*사원 조회*/
	@Override
	public Emp selectEmpNo(int emp_no) {
		return empDao.selectEmpNo(emp_no);
	}

	/*사원 전체 조회*/
	@Override
	public ArrayList<Emp> selectEmpList() {
		return empDao.selectEmpList();
	}

	/*연락처 중복검사*/
	@Override
	public Emp selectCheckPhone(String emp_phone) {
		return empDao.selectCheckPhone(emp_phone);
	}
	
	/*이메일 중복검사*/
	@Override
	public Emp selectCheckEmail(String emp_email) {
		return empDao.selectCheckEmail(emp_email);
	}	

	/*상사이름 조회*/
	@Override
	public Emp selectMgrNo(int emp_no) {
		return empDao.selectMgrNo(emp_no);
	}
	
	/* 부서별 사원리스트 */
	@Override
	public ArrayList<Emp> selectDeptEmp(Emp emp) {
		return empDao.selectDeptEmp(emp);
	}

	//나의 정보 가져오기
	@Override
	public Emp selectMyInfo(Emp emp) {
		
		return empDao.selectMyInfo(emp);
	}
	//이메일 체크
	@Override
	public Emp selectEmail(Emp emp) {
		
		return empDao.selectEmail(emp);
	}
	//폰 체크
	@Override
	public Emp selectPhoneckdupl(Emp emp) {
		
		return empDao.selectPhoneckdupl(emp);
	}
	//정보 수정
	@Override
	public int updateMyInfo(Emp emp) {
		
		return empDao.updateMyInfo(emp);
	}
	
	//비밀번호 업데이트
	@Override
	public int updatePassword(Emp emp) {
		
		return empDao.updatePassword(emp);
	}

	//사원목록 갯수
	@Override
	public Emp selectListCount() {
		return empDao.selectListCount();
	}

	//사원목록 페이징
	@Override
	public ArrayList<Emp> selectEmpList(Emp emp) {
		return empDao.selectEmpList(emp);
	}

	//상사번호 목록
	@Override
	public ArrayList<Emp> selectMgrList(Emp emp) {
		return empDao.selectMgrList(emp);
	}	
	
}
