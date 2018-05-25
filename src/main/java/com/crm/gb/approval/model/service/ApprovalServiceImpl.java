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
	public Approval selectName(int emp_no) {
		
		return ApprovalDao.selectName(emp_no);
	}



	@Override
	public int insertApproval(Approval apr) {
		// TODO Auto-generated method stub
		return ApprovalDao.insertApproval(apr);
	}



	@Override
	public ArrayList<Approval> selectapprovalListE(Approval apr) {
	
		return ApprovalDao.selectapprovalListE(apr);
	}

	
}
