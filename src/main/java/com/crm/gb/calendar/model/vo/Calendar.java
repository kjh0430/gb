package com.crm.gb.calendar.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("calendar")
public class Calendar implements Serializable {
	
	private static final long serialVersionUID = 18L;
	
	private int calendar_no;
	private int emp_no;
	private String calendar_title;
	private String calendar_content;
	private Date calendar_start_date;
	private Date calendar_end_date;
	
	private String calendar_start_date1;
	private String calendar_end_date1;
	
	//
	private String dept_name;
	private String emp_name;
	private String job_no;
	private String dept_no;
	
	public Calendar() {}

	public Calendar(int calendar_no, int emp_no, String calendar_title, String calendar_content,
			Date calendar_start_date, Date calendar_end_date, String calendar_start_date1, String calendar_end_date1,
			String dept_name, String emp_name, String job_no, String dept_no) {
		super();
		this.calendar_no = calendar_no;
		this.emp_no = emp_no;
		this.calendar_title = calendar_title;
		this.calendar_content = calendar_content;
		this.calendar_start_date = calendar_start_date;
		this.calendar_end_date = calendar_end_date;
		this.calendar_start_date1 = calendar_start_date1;
		this.calendar_end_date1 = calendar_end_date1;
		this.dept_name = dept_name;
		this.emp_name = emp_name;
		this.job_no = job_no;
		this.dept_no = dept_no;
	}

	public int getCalendar_no() {
		return calendar_no;
	}

	public void setCalendar_no(int calendar_no) {
		this.calendar_no = calendar_no;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public String getCalendar_title() {
		return calendar_title;
	}

	public void setCalendar_title(String calendar_title) {
		this.calendar_title = calendar_title;
	}

	public String getCalendar_content() {
		return calendar_content;
	}

	public void setCalendar_content(String calendar_content) {
		this.calendar_content = calendar_content;
	}

	public Date getCalendar_start_date() {
		return calendar_start_date;
	}

	public void setCalendar_start_date(Date calendar_start_date) {
		this.calendar_start_date = calendar_start_date;
	}

	public Date getCalendar_end_date() {
		return calendar_end_date;
	}

	public void setCalendar_end_date(Date calendar_end_date) {
		this.calendar_end_date = calendar_end_date;
	}

	public String getCalendar_start_date1() {
		return calendar_start_date1;
	}

	public void setCalendar_start_date1(String calendar_start_date1) {
		this.calendar_start_date1 = calendar_start_date1;
	}

	public String getCalendar_end_date1() {
		return calendar_end_date1;
	}

	public void setCalendar_end_date1(String calendar_end_date1) {
		this.calendar_end_date1 = calendar_end_date1;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public String getJob_no() {
		return job_no;
	}

	public void setJob_no(String job_no) {
		this.job_no = job_no;
	}

	public String getDept_no() {
		return dept_no;
	}

	public void setDept_no(String dept_no) {
		this.dept_no = dept_no;
	}

	@Override
	public String toString() {
		return "Calendar [calendar_no=" + calendar_no + ", emp_no=" + emp_no + ", calendar_title=" + calendar_title
				+ ", calendar_content=" + calendar_content + ", calendar_start_date=" + calendar_start_date
				+ ", calendar_end_date=" + calendar_end_date + ", calendar_start_date1=" + calendar_start_date1
				+ ", calendar_end_date1=" + calendar_end_date1 + ", dept_name=" + dept_name + ", emp_name=" + emp_name
				+ ", job_no=" + job_no + ", dept_no=" + dept_no + "]";
	}

	
	
	
	
	
	
	
	
	

	
	
	
	






	










	










	
	
	
	
}
