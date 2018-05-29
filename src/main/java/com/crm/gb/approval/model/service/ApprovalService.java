package com.crm.gb.approval.model.service;


import java.util.ArrayList;

import com.crm.gb.approval.model.vo.Approval;




public interface ApprovalService {

	Approval selectName(int emp_no);
	int insertApproval(Approval apr);
	ArrayList<Approval> selectapprovalListE(Approval apr);
	ArrayList<Approval> selectapprovalListA(Approval apr);
	int updateTeamApproval(Approval apr);
	int updateMgrApproval(Approval apr);
}
