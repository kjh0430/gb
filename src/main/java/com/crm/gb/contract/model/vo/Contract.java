package com.crm.gb.contract.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

import com.crm.gb.client.model.vo.Client;
import com.crm.gb.emp.model.vo.Emp;

@Component("contract")
public class Contract implements Serializable{
	private static final long serialVersionUID = 1805211505L;
	
	private int contract_no;
	private int emp_no;
	private int client_no;
	private int contract_discount;
	private int contract_money;
	private Date contract_date_start;
	private Date contract_date_end;
	private String business_no;
	private Emp emp;
	private Client client;
	
	public Contract() {}
	
	public Contract(int contract_no, int emp_no, int client_no, int contract_discount, int contract_money,
			Date contract_date_start, Date contract_date_end, String business_no, Emp emp, Client client) {
		super();
		this.contract_no = contract_no;
		this.emp_no = emp_no;
		this.client_no = client_no;
		this.contract_discount = contract_discount;
		this.contract_money = contract_money;
		this.contract_date_start = contract_date_start;
		this.contract_date_end = contract_date_end;
		this.business_no = business_no;
		this.emp = emp;
		this.client = client;
	}
	public int getContract_no() {
		return contract_no;
	}
	public void setContract_no(int contract_no) {
		this.contract_no = contract_no;
	}
	public int getEmp_no() {
		return emp_no;
	}
	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}
	public int getClient_no() {
		return client_no;
	}
	public void setClient_no(int client_no) {
		this.client_no = client_no;
	}
	public int getContract_discount() {
		return contract_discount;
	}
	public void setContract_discount(int contract_discount) {
		this.contract_discount = contract_discount;
	}
	public int getContract_money() {
		return contract_money;
	}
	public void setContract_money(int contract_money) {
		this.contract_money = contract_money;
	}
	public Date getContract_date_start() {
		return contract_date_start;
	}
	public void setContract_date_start(Date contract_date_start) {
		this.contract_date_start = contract_date_start;
	}
	public Date getContract_date_end() {
		return contract_date_end;
	}
	public void setContract_date_end(Date contract_date_end) {
		this.contract_date_end = contract_date_end;
	}
	public String getBusiness_no() {
		return business_no;
	}
	public void setBusiness_no(String business_no) {
		this.business_no = business_no;
	}
	public Emp getEmp() {
		return emp;
	}
	public void setEmp(Emp emp) {
		this.emp = emp;
	}
	public Client getClient() {
		return client;
	}
	public void setClient(Client client) {
		this.client = client;
	}
	@Override
	public String toString() {
		return "Contract [contract_no=" + contract_no + ", emp_no=" + emp_no + ", client_no=" + client_no
				+ ", contract_discount=" + contract_discount + ", contract_money=" + contract_money
				+ ", contract_date_start=" + contract_date_start + ", contract_date_end=" + contract_date_end
				+ ", business_no=" + business_no + ", emp=" + emp + ", client=" + client + "]";
	}
	
	
	
	
}
