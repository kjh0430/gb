package com.crm.gb.dailywork.model.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("dailywork")
public class Dailywork implements java.io.Serializable{
	
	private static final long serialVersionUID = 1111L;

	private int dailyworkNo;
	private int clientNo;
	private int empNo;
	private String dailyTitle;
	private String dailyLocX;
	private String dailyLocY;
	private String dailyComment;
	private Date dailyDate;
	
	public Dailywork() {}
	
	public Dailywork(int dailyworkNo, int clientNo, int empNo, String dailyTitle, String dailyLocX, String dailyLocY,
			String dailyComment, Date dailyDate) {
		super();
		this.dailyworkNo = dailyworkNo;
		this.clientNo = clientNo;
		this.empNo = empNo;
		this.dailyTitle = dailyTitle;
		this.dailyLocX = dailyLocX;
		this.dailyLocY = dailyLocY;
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

	public String getDailyLocX() {
		return dailyLocX;
	}

	public void setDailyLocX(String dailyLocX) {
		this.dailyLocX = dailyLocX;
	}

	public String getDailyLocY() {
		return dailyLocY;
	}

	public void setDailyLocY(String dailyLocY) {
		this.dailyLocY = dailyLocY;
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

	
}
