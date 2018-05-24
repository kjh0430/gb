
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
	private String emp_email;
	private int emp_mgr;
	private Date emp_hiredate;
	private Date emp_firedate;
	private String city;
	private String county;
	private String village;
	private int dept_no;
	private String emp_delete;
	private String dept_name; //부서별 사원조회 
	
	
	
	
	public Emp() {}




	public Emp(int emp_no, String emp_pwd, String emp_name, String emp_addr, String emp_phone, int job_no,
			String emp_email, int emp_mgr, Date emp_hiredate, Date emp_firedate, String city, String county,
			String village, int dept_no, String emp_delete, String dept_name) {
		super();
		this.emp_no = emp_no;
		this.emp_pwd = emp_pwd;
		this.emp_name = emp_name;
		this.emp_addr = emp_addr;
		this.emp_phone = emp_phone;
		this.job_no = job_no;
		this.emp_email = emp_email;
		this.emp_mgr = emp_mgr;
		this.emp_hiredate = emp_hiredate;
		this.emp_firedate = emp_firedate;
		this.city = city;
		this.county = county;
		this.village = village;
		this.dept_no = dept_no;
		this.emp_delete = emp_delete;
		this.dept_name = dept_name;
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




	public String getEmp_email() {
		return emp_email;
	}




	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
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




	public String getCity() {
		return city;
	}




	public void setCity(String city) {
		this.city = city;
	}




	public String getCounty() {
		return county;
	}




	public void setCounty(String county) {
		this.county = county;
	}




	public String getVillage() {
		return village;
	}




	public void setVillage(String village) {
		this.village = village;
	}




	public int getDept_no() {
		return dept_no;
	}




	public void setDept_no(int dept_no) {
		this.dept_no = dept_no;
	}




	public String getEmp_delete() {
		return emp_delete;
	}




	public void setEmp_delete(String emp_delete) {
		this.emp_delete = emp_delete;
	}




	public String getDept_name() {
		return dept_name;
	}




	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}




	public static long getSerialversionuid() {
		return serialVersionUID;
	}




	@Override
	public String toString() {
		return "Emp [emp_no=" + emp_no + ", emp_pwd=" + emp_pwd + ", emp_name=" + emp_name + ", emp_addr=" + emp_addr
				+ ", emp_phone=" + emp_phone + ", job_no=" + job_no + ", emp_email=" + emp_email + ", emp_mgr="
				+ emp_mgr + ", emp_hiredate=" + emp_hiredate + ", emp_firedate=" + emp_firedate + ", city=" + city
				+ ", county=" + county + ", village=" + village + ", dept_no=" + dept_no + ", emp_delete=" + emp_delete
				+ ", dept_name=" + dept_name + "]";
	}


	

	



	




	
}

