package com.crm.gb.goal.model.vo;

import java.io.Serializable;
import java.util.Date;

import org.springframework.stereotype.Component;

@Component("goal")
public class Goal implements Serializable{
	private static final long serialVersionUID = 2897349057L;
	
	private int dailyworkNo;
	private int clientNo;
	private int empNo;
	private String dailyTitle;
	private String dailyComment;
	private Date dailyDate;
	

	public Goal() {}
	
	public Goal(int dailyworkNo, int clientNo, int empNo, String dailyTitle, String dailyComment, Date dailyDate) {
		super();
		this.dailyworkNo = dailyworkNo;
		this.clientNo = clientNo;
		this.empNo = empNo;
		this.dailyTitle = dailyTitle;
		this.dailyComment = dailyComment;
		this.dailyDate = dailyDate;
	}
	public int getDailyworkNo() {
		
		return dailyworkNo;
	}
	public void setDailyworkNo(int dailyworkNo) {
		this.dailyworkNo = dailyworkNo;
	}
	public int getClientNo() {
		return clientNo;
	}
	public void setClientNo(int clientNo) {
		this.clientNo = clientNo;
	}
	public int getEmpNo() {
		return empNo;
	}
	public void setEmpNo(int empNo) {
		this.empNo = empNo;
	}
	public String getDailyTitle() {
		return dailyTitle;
	}
	public void setDailyTitle(String dailyTitle) {
		this.dailyTitle = dailyTitle;
	}
	public String getDailyComment() {
		return dailyComment;
	}
	public void setDailyComment(String dailyComment) {
		this.dailyComment = dailyComment;
	}
	public Date getDailyDate() {
		return dailyDate;
	}
	public void setDailyDate(Date dailyDate) {
		this.dailyDate = dailyDate;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Goal [dailyworkNo=" + dailyworkNo + ", clientNo=" + clientNo + ", empNo=" + empNo + ", dailyTitle="
				+ dailyTitle + ", dailyComment=" + dailyComment + ", dailyDate=" + dailyDate + "]";
	}
	
	
	
	
	
	
}
