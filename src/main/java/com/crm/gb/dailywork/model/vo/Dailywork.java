package com.crm.gb.dailywork.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("Dailywork")
public class Dailywork implements java.io.Serializable{
	
	private static final long serialVersionUID = 1111L;

	private int dailywork_no;
	private int client_no;
	private int emp_no;
	private String daily_comment;
	private Date daily_date;
	private String client_name;
	
	public Dailywork() {}

	public Dailywork(int dailywork_no, int client_no, int emp_no, String daily_comment, Date daily_date) {
		super();
		this.dailywork_no = dailywork_no;
		this.client_no = client_no;
		this.emp_no = emp_no;
		this.daily_comment = daily_comment;
		this.daily_date = daily_date;
	}

	public int getDailywork_no() {
		return dailywork_no;
	}

	public void setDailywork_no(int dailywork_no) {
		this.dailywork_no = dailywork_no;
	}

	public int getClient_no() {
		return client_no;
	}

	public void setClient_no(int client_no) {
		this.client_no = client_no;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public String getDaily_comment() {
		return daily_comment;
	}

	public void setDaily_comment(String daily_comment) {
		this.daily_comment = daily_comment;
	}

	public Date getDaily_date() {
		return daily_date;
	}

	public void setDaily_date(Date daily_date) {
		this.daily_date = daily_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getClient_name() {
		return client_name;
	}

	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}
	
	
	

}