package com.crm.gb.approval.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.crm.gb.emp.model.vo.Emp;



public interface ApprovalService {

	ArrayList<Emp> selectName(int empNo);
	
}
