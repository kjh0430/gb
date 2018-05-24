package com.crm.gb.approval.model.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.crm.gb.approval.model.dao.ApprovalDao;
import com.crm.gb.approval.model.vo.Approval;


@Service("ApprovalService")
public class ApprovalServiceImpl implements ApprovalService {

@Autowired
private ApprovalDao ApprovalDao;
	
	
	
	@Override
	public Approval selectName(int empNo) {
		
		return ApprovalDao.selectName(empNo);
	}

	
}
