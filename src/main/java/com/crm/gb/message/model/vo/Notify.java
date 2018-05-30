package com.crm.gb.message.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component("notify")
public class Notify implements Serializable{

	private static final long serialVersionUID = 84L;
	
	private int notify_no;
	private int notify_from;
	private int notify_to;
	private String notify_date;
	private String notify_read;
	private String emp_name;
	
	public Notify() {}
	
	
	public Notify(int notify_no, int notify_from, int notify_to, String notify_date, String notify_read) {
		super();
		this.notify_no = notify_no;
		this.notify_from = notify_from;
		this.notify_to = notify_to;
		this.notify_date = notify_date;
		this.notify_read = notify_read;
	}
	

	public int getNotify_no() {
		return notify_no;
	}

	public void setNotify_no(int notify_no) {
		this.notify_no = notify_no;
	}

	public int getNotify_from() {
		return notify_from;
	}

	public void setNotify_from(int notify_from) {
		this.notify_from = notify_from;
	}

	public int getNotify_to() {
		return notify_to;
	}

	public void setNotify_to(int notify_to) {
		this.notify_to = notify_to;
	}

	public String getNotify_date() {
		return notify_date;
	}

	public void setNotify_date(String notify_date) {
		this.notify_date = notify_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getNotify_read() {
		return notify_read;
	}

	public void setNotify_read(String notify_read) {
		this.notify_read = notify_read;
	}

	
	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}


	@Override
	public String toString() {
		return "Notify [notify_no=" + notify_no + ", notify_from=" + notify_from + ", notify_to=" + notify_to
				+ ", notify_date=" + notify_date + ", notify_read=" + notify_read + ", emp_name=" + emp_name + "]";
	}

	
	
}
