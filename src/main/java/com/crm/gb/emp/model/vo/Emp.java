package com.crm.gb.emp.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("emp")
public class Emp implements Serializable{
	private static final long serialVersionUID=1805091737L;
	
	private int emp_no;
	private String emp_pwd;
	private String emp_name;
	private String emp_addr;
	private String emp_phone;
	private int job_no;
	private String email;
	private int emp_mgr;
	private Date emp_hiredate;
	private Date emp_firedate;
	private String emp_loc;
	private int dept_no;
	
	public Emp() {}

	public Emp(int emp_no, String emp_pwd, String emp_name, String emp_addr, String emp_phone, int job_no, String email,
			int emp_mgr, Date emp_hiredate, Date emp_firedate, String emp_loc, int dept_no) {
		super();
		this.emp_no = emp_no;
		this.emp_pwd = emp_pwd;
		this.emp_name = emp_name;
		this.emp_addr = emp_addr;
		this.emp_phone = emp_phone;
		this.job_no = job_no;
		this.email = email;
		this.emp_mgr = emp_mgr;
		this.emp_hiredate = emp_hiredate;
		this.emp_firedate = emp_firedate;
		this.emp_loc = emp_loc;
		this.dept_no = dept_no;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public String getEmp_pwd() {
		return emp_pwd;
	}

	public void setEmp_pwd(String emp_pwd) {
		this.emp_pwd = emp_pwd;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getEmp_addr() {
		return emp_addr;
	}

	public void setEmp_addr(String emp_addr) {
		this.emp_addr = emp_addr;
	}

	public String getEmp_phone() {
		return emp_phone;
	}

	public void setEmp_phone(String emp_phone) {
		this.emp_phone = emp_phone;
	}

	public int getJob_no() {
		return job_no;
	}

	public void setJob_no(int job_no) {
		this.job_no = job_no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getEmp_mgr() {
		return emp_mgr;
	}

	public void setEmp_mgr(int emp_mgr) {
		this.emp_mgr = emp_mgr;
	}

	public Date getEmp_hiredate() {
		return emp_hiredate;
	}

	public void setEmp_hiredate(Date emp_hiredate) {
		this.emp_hiredate = emp_hiredate;
	}

	public Date getEmp_firedate() {
		return emp_firedate;
	}

	public void setEmp_firedate(Date emp_firedate) {
		this.emp_firedate = emp_firedate;
	}

	public String getEmp_loc() {
		return emp_loc;
	}

	public void setEmp_loc(String emp_loc) {
		this.emp_loc = emp_loc;
	}

	public int getDept_no() {
		return dept_no;
	}

	public void setDept_no(int dept_no) {
		this.dept_no = dept_no;
	}

	@Override
	public String toString() {
		return "Emp [emp_no=" + emp_no + ", emp_pwd=" + emp_pwd + ", emp_name=" + emp_name + ", emp_addr=" + emp_addr
				+ ", emp_phone=" + emp_phone + ", job_no=" + job_no + ", email=" + email + ", emp_mgr=" + emp_mgr
				+ ", emp_hiredate=" + emp_hiredate + ", emp_firedate=" + emp_firedate + ", emp_loc=" + emp_loc
				+ ", dept_no=" + dept_no + "]";
	}
	
	

}
