package com.crm.gb.emp.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.crm.gb.emp.model.dao.EmpDao;
import com.crm.gb.emp.model.vo.Emp;

@Service("empService")
public class EmpServiceImpl implements EmpService {
	
	@Autowired
	private EmpDao empDao;	

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
