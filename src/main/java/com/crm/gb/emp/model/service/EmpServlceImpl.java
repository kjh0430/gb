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

//	/** 사원정보 등록 메소드 */
//	@Override
//	public int insertEmp(Emp emp) {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	/** 사원정보 업데이트 메소드 */
//	@Override
//	public int updateEmp(Emp emp) {
//		// TODO Auto-generated method stub
//		return 0;
//	}
//
//	/** 사원정보 삭제 메소드 */
//	@Override
//	public int deleteEmp(String emp_no) {
//		// TODO Auto-generated method stub
//		return 0;
//	}

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
	public int selectCheckEmail(String emp_email) {
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
	
}
