package com.crm.gb.emp.model.service;

import org.springframework.stereotype.Service;

import com.crm.gb.emp.model.vo.Emp;

@Service
public interface EmpService {
	
	public static final int MID = 1;

	int insertEmp(Emp emp);
	int updateEmp(Emp emp);
	int deleteEmp(Emp emp);

}
