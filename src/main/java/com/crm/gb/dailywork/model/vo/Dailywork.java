package com.crm.gb.dailywork.model.vo;



import org.springframework.stereotype.Component;

@Component("Dailywork")
public class Dailywork implements java.io.Serializable{
	
	private static final long serialVersionUID = 111L;

	private int dailywork_no;
	private int client_no;
	private int emp_no;
	private String daily_comment;
	private String daily_date;
	private String client_company;
	private String client_loc_x;
	private String client_loc_y;
	
	public Dailywork() {}

	public Dailywork(int dailywork_no, int client_no, int emp_no, String daily_comment, String daily_date) {
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

	public String getDaily_date() {
		return daily_date;
	}

	public void setDaily_date(String daily_date) {
		this.daily_date = daily_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	public String getClient_company() {
		return client_company;
	}

	public void setClient_company(String client_company) {
		this.client_company = client_company;
	}

	public String getClient_loc_x() {
		return client_loc_x;
	}

	public void setClient_loc_x(String client_loc_x) {
		this.client_loc_x = client_loc_x;
	}

	public String getClient_loc_y() {
		return client_loc_y;
	}

	public void setClient_loc_y(String client_loc_y) {
		this.client_loc_y = client_loc_y;
	}
	
	
}