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

	@Override
	public int insertEmp(Emp emp) {
		return empDao.insertEmp(emp);
	}

	@Override
	public int updateEmp(Emp emp) {
		return empDao.updateEmp(emp);
	}

	@Override
	public int deleteEmp(Emp emp) {
		return empDao.deleteEmp(emp);
	}	
	
	
}
