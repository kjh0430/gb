package com.crm.gb.approval.model.service;


import com.crm.gb.approval.model.vo.Approval;




public interface ApprovalService {

	Approval selectName(int emp_no);
	int insertApproval(Approval apr);
}
