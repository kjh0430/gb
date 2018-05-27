
package com.crm.gb.approval.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("approval")
public class Approval implements Serializable {

	private static final long serialVersionUID = 16L;
	private int approval_no;
	private int emp_no;
	private String approval_choose_no;
	private String approval_submit_date;
	private Date approval_start_date;
	private Date approval_end_date;
	private String approval_comment;
	private String approval_team_date;
	private String approval_mgr_date;

	// 팀장, 관리자 이름을 가져오기 위한 vo 추가
	private String team_mgr_name;
	private int team_mgr_no;
	private String mgr_name;
	private int mgr_no;
	
	//효율적인 쿼리를 위한 job_no 추가
	private String job_no;

	public Approval() {
	}

	public Approval(int approval_no, int emp_no, String approval_choose_no, String approval_submit_date,
			Date approval_start_date, Date approval_end_date, String approval_comment, String approval_team_date,
			String approval_mgr_date, String team_mgr_name, int team_mgr_no, String mgr_name, int mgr_no,
			String job_no) {
		super();
		this.approval_no = approval_no;
		this.emp_no = emp_no;
		this.approval_choose_no = approval_choose_no;
		this.approval_submit_date = approval_submit_date;
		this.approval_start_date = approval_start_date;
		this.approval_end_date = approval_end_date;
		this.approval_comment = approval_comment;
		this.approval_team_date = approval_team_date;
		this.approval_mgr_date = approval_mgr_date;
		this.team_mgr_name = team_mgr_name;
		this.team_mgr_no = team_mgr_no;
		this.mgr_name = mgr_name;
		this.mgr_no = mgr_no;
		this.job_no = job_no;
	}

	public int getApproval_no() {
		return approval_no;
	}

	public void setApproval_no(int approval_no) {
		this.approval_no = approval_no;
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

	public Date getApproval_start_date() {
		return approval_start_date;
	}

	public void setApproval_start_date(Date approval_start_date) {
		this.approval_start_date = approval_start_date;
	}

	public Date getApproval_end_date() {
		return approval_end_date;
	}

	public void setApproval_end_date(Date approval_end_date) {
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

	public String getTeam_mgr_name() {
		return team_mgr_name;
	}

	public void setTeam_mgr_name(String team_mgr_name) {
		this.team_mgr_name = team_mgr_name;
	}

	public int getTeam_mgr_no() {
		return team_mgr_no;
	}

	public void setTeam_mgr_no(int team_mgr_no) {
		this.team_mgr_no = team_mgr_no;
	}

	public String getMgr_name() {
		return mgr_name;
	}

	public void setMgr_name(String mgr_name) {
		this.mgr_name = mgr_name;
	}

	public int getMgr_no() {
		return mgr_no;
	}

	public void setMgr_no(int mgr_no) {
		this.mgr_no = mgr_no;
	}

	public String getJob_no() {
		return job_no;
	}

	public void setJob_no(String job_no) {
		this.job_no = job_no;
	}

	@Override
	public String toString() {
		return "Approval [approval_no=" + approval_no + ", emp_no=" + emp_no + ", approval_choose_no="
				+ approval_choose_no + ", approval_submit_date=" + approval_submit_date + ", approval_start_date="
				+ approval_start_date + ", approval_end_date=" + approval_end_date + ", approval_comment="
				+ approval_comment + ", approval_team_date=" + approval_team_date + ", approval_mgr_date="
				+ approval_mgr_date + ", team_mgr_name=" + team_mgr_name + ", team_mgr_no=" + team_mgr_no
				+ ", mgr_name=" + mgr_name + ", mgr_no=" + mgr_no + ", job_no=" + job_no + "]";
	}


	
	
	
	
	
	

	

	
}
