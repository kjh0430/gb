package com.crm.gb.salary.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

import com.crm.gb.dept.model.vo.Dept;
import com.crm.gb.emp.model.vo.Emp;
import com.crm.gb.job.model.vo.Job;

@Component("salary")
public class Salary implements Serializable{
	private static final long serialVersionUID = 1806031533L;
	
	private int salary_no;
	private int emp_no;
	private int sal;
	private int sal_bonus;
	private Date sal_date;

	private int showPage;
	private int totalRow;
	private int start;
	private int end;
	private int startRow;
	private int endRow;
	private String emp_name;
	
	private Emp emp;
	private Dept dept;
	private Job job;
	
	public Salary() {}

	public Salary(int salary_no, int emp_no, int sal, int sal_bonus, Date sal_date, int showPage, int totalRow,
			int start, int end, int startRow, int endRow, String emp_name, Emp emp, Dept dept, Job job) {
		super();
		this.salary_no = salary_no;
		this.emp_no = emp_no;
		this.sal = sal;
		this.sal_bonus = sal_bonus;
		this.sal_date = sal_date;
		this.showPage = showPage;
		this.totalRow = totalRow;
		this.start = start;
		this.end = end;
		this.startRow = startRow;
		this.endRow = endRow;
		this.emp_name = emp_name;
		this.emp = emp;
		this.dept = dept;
		this.job = job;
	}

	public int getSalary_no() {
		return salary_no;
	}

	public void setSalary_no(int salary_no) {
		this.salary_no = salary_no;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public int getSal() {
		return sal;
	}

	public void setSal(int sal) {
		this.sal = sal;
	}

	public int getSal_bonus() {
		return sal_bonus;
	}

	public void setSal_bonus(int sal_bonus) {
		this.sal_bonus = sal_bonus;
	}

	public Date getSal_date() {
		return sal_date;
	}

	public void setSal_date(Date sal_date) {
		this.sal_date = sal_date;
	}

	public int getShowPage() {
		return showPage;
	}

	public void setShowPage(int showPage) {
		this.showPage = showPage;
	}

	public int getTotalRow() {
		return totalRow;
	}

	public void setTotalRow(int totalRow) {
		this.totalRow = totalRow;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public Emp getEmp() {
		return emp;
	}

	public void setEmp(Emp emp) {
		this.emp = emp;
	}

	public Dept getDept() {
		return dept;
	}

	public void setDept(Dept dept) {
		this.dept = dept;
	}

	public Job getJob() {
		return job;
	}

	public void setJob(Job job) {
		this.job = job;
	}

	@Override
	public String toString() {
		return "Salary [salary_no=" + salary_no + ", emp_no=" + emp_no + ", sal=" + sal + ", sal_bonus=" + sal_bonus
				+ ", sal_date=" + sal_date + ", showPage=" + showPage + ", totalRow=" + totalRow + ", start=" + start
				+ ", end=" + end + ", startRow=" + startRow + ", endRow=" + endRow + ", emp_name=" + emp_name + ", emp="
				+ emp + ", dept=" + dept + ", job=" + job + "]";
	}

	
	
	
}
