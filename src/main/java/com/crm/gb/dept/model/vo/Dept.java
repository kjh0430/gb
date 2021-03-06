package com.crm.gb.dept.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component("dept")
public class Dept implements Serializable{
	private static final long serialVersionUID = 1806031537L;	

	private int dept_no;
	private String dept_name;
	
	public Dept() {}

	public Dept(int dept_no, String dept_name) {
		super();
		this.dept_no = dept_no;
		this.dept_name = dept_name;
	}

	public int getDept_no() {
		return dept_no;
	}

	public void setDept_no(int dept_no) {
		this.dept_no = dept_no;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	@Override
	public String toString() {
		return "Dept [dept_no=" + dept_no + ", dept_name=" + dept_name + "]";
	}
	
	
	
}
