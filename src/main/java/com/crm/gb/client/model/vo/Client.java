package com.crm.gb.client.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("client")
public class Client implements Serializable{
	private static final long serialVersionUID=1805101442L;
	
	private int client_no;
	private String client_name;
	private String client_company;
	private String client_job;
	private String client_email;
	private String client_phone;
	private String client_addr;
	private String client_com_tel;
	private String client_loc_x;
	private String client_loc_y;
	private String client_contract;
	private String client_comment;
	private int emp_no;
	private Date client_enroll;
	
	public Client() {}
	
	



	public Client(int client_no, String client_name, String client_company, String client_job, String client_email,
			String client_phone, String client_addr, String client_com_tel, String client_loc_x, String client_loc_y,
			String client_contract, String client_comment, int emp_no, Date client_enroll) {
		super();
		this.client_no = client_no;
		this.client_name = client_name;
		this.client_company = client_company;
		this.client_job = client_job;
		this.client_email = client_email;
		this.client_phone = client_phone;
		this.client_addr = client_addr;
		this.client_com_tel = client_com_tel;
		this.client_loc_x = client_loc_x;
		this.client_loc_y = client_loc_y;
		this.client_contract = client_contract;
		this.client_comment = client_comment;
		this.emp_no = emp_no;
		this.client_enroll = client_enroll;
	}
	
	
	public int getClient_no() {
		return client_no;
	}





	public void setClient_no(int client_no) {
		this.client_no = client_no;
	}





	public String getClient_name() {
		return client_name;
	}





	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}





	public String getClient_company() {
		return client_company;
	}





	public void setClient_company(String client_company) {
		this.client_company = client_company;
	}





	public String getClient_job() {
		return client_job;
	}





	public void setClient_job(String client_job) {
		this.client_job = client_job;
	}





	public String getClient_email() {
		return client_email;
	}





	public void setClient_email(String client_email) {
		this.client_email = client_email;
	}





	public String getClient_phone() {
		return client_phone;
	}





	public void setClient_phone(String client_phone) {
		this.client_phone = client_phone;
	}





	public String getClient_addr() {
		return client_addr;
	}





	public void setClient_addr(String client_addr) {
		this.client_addr = client_addr;
	}





	public String getClient_com_tel() {
		return client_com_tel;
	}





	public void setClient_com_tel(String client_com_tel) {
		this.client_com_tel = client_com_tel;
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





	public String getClient_contract() {
		return client_contract;
	}





	public void setClient_contract(String client_contract) {
		this.client_contract = client_contract;
	}





	public String getClient_comment() {
		return client_comment;
	}





	public void setClient_comment(String client_comment) {
		this.client_comment = client_comment;
	}





	public Date getClient_enroll() {
		return client_enroll;
	}





	public void setClient_enroll(Date client_enroll) {
		this.client_enroll = client_enroll;
	}





	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	@Override
	public String toString() {
		return "Client [client_no=" + client_no + ", client_name=" + client_name + ", client_company=" + client_company
				+ ", client_job=" + client_job + ", client_email=" + client_email + ", client_phone=" + client_phone
				+ ", client_addr=" + client_addr + ", client_com_tel=" + client_com_tel + ", client_contract="
				+ client_contract + ", client_comment=" + client_comment + ", emp_no=" + emp_no + "]";
	}
	
	
}
