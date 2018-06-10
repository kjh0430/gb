package com.crm.gb.approval.model.service;


import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.crm.gb.approval.model.vo.Approval;



@Service
public interface ApprovalService {

	Approval selectName(int emp_no);
	int insertApproval(Approval apr);
	ArrayList<Approval> selectapprovalListE(Approval apr);
	ArrayList<Approval> selectapprovalListA(Approval apr);
	int updateTeamApproval(Approval apr);
	int updateMgrApproval(Approval apr);
	int selectAdminNo(Approval apr);
	int selectgetListE(Approval apr);
}
