package com.crm.gb.approval.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component("approval")
public class Approval implements Serializable {

	private static final long serialVersionUID = 16L;
	
	private int emp_no;
	private String approval_choose_no;
	private String approval_submit_date;
	private String approval_start_date;
	private String approval_end_date;
	private String approval_comment;
	private String approval_team_date;
	private String approval_mgr_date;
	
	public Approval(int emp_no, String approval_choose_no, String approval_submit_date, String approval_start_date,
			String approval_end_date, String approval_comment, String approval_team_date, String approval_mgr_date) {
		super();
		this.emp_no = emp_no;
		this.approval_choose_no = approval_choose_no;
		this.approval_submit_date = approval_submit_date;
		this.approval_start_date = approval_start_date;
		this.approval_end_date = approval_end_date;
		this.approval_comment = approval_comment;
		this.approval_team_date = approval_team_date;
		this.approval_mgr_date = approval_mgr_date;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public String getApproval_choose_no() {
		return approval_choose_no;
	}

	public void setApproval_choose_no(String approval_choose_no) {
		this.approval_choose_no = approval_choose_no;
	}

	public String getApproval_submit_date() {
		return approval_submit_date;
	}

	public void setApproval_submit_date(String approval_submit_date) {
		this.approval_submit_date = approval_submit_date;
	}

	public String getApproval_start_date() {
		return approval_start_date;
	}

	public void setApproval_start_date(String approval_start_date) {
		this.approval_start_date = approval_start_date;
	}

	public String getApproval_end_date() {
		return approval_end_date;
	}

	public void setApproval_end_date(String approval_end_date) {
		this.approval_end_date = approval_end_date;
	}

	public String getApproval_comment() {
		return approval_comment;
	}

	public void setApproval_comment(String approval_comment) {
		this.approval_comment = approval_comment;
	}

	public String getApproval_team_date() {
		return approval_team_date;
	}

	public void setApproval_team_date(String approval_team_date) {
		this.approval_team_date = approval_team_date;
	}

	public String getApproval_mgr_date() {
		return approval_mgr_date;
	}

	public void setApproval_mgr_date(String approval_mgr_date) {
		this.approval_mgr_date = approval_mgr_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Approval [emp_no=" + emp_no + ", approval_choose_no=" + approval_choose_no + ", approval_submit_date="
				+ approval_submit_date + ", approval_start_date=" + approval_start_date + ", approval_end_date="
				+ approval_end_date + ", approval_comment=" + approval_comment + ", approval_team_date="
				+ approval_team_date + ", approval_mgr_date=" + approval_mgr_date + "]";
	}
	
	
	
	
	
}
