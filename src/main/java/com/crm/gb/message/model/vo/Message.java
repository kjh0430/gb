package com.crm.gb.message.model.vo;

import java.io.Serializable; 
import java.sql.Date;

import org.springframework.stereotype.Component;

import com.crm.gb.emp.model.vo.Emp;

//기본 vo
@Component("message")
public class Message implements Serializable  {
	
	private static final long serialVersionUID=15L;
	
	private int message_no;
	private int message_from_no;
	private int message_to_no;
	private String message_title;
	private String message_content;
	private Date message_date;
	
	//사원 검색 용
	private String emp_email;
	private String dept_name;
	private String emp_name;
	private String job_name;
	private int emp_no;
	
	public Message() {};
	
	
	
	
	






	public Message(int message_no, int message_from_no, int message_to_no, String message_title, String message_content,
			Date message_date, String emp_email, String dept_name, String emp_name, String job_name, int emp_no) {
		super();
		this.message_no = message_no;
		this.message_from_no = message_from_no;
		this.message_to_no = message_to_no;
		this.message_title = message_title;
		this.message_content = message_content;
		this.message_date = message_date;
		this.emp_email = emp_email;
		this.dept_name = dept_name;
		this.emp_name = emp_name;
		this.job_name = job_name;
		this.emp_no = emp_no;
	}











	public int getMessage_no() {
		return message_no;
	}
	public void setMessage_no(int message_no) {
		this.message_no = message_no;
	}
	public int getMessage_from_no() {
		return message_from_no;
	}
	public void setMessage_from_no(int message_from_no) {
		this.message_from_no = message_from_no;
	}
	public int getMessage_to_no() {
		return message_to_no;
	}
	public void setMessage_to_no(int message_to_no) {
		this.message_to_no = message_to_no;
	}
	public String getMessage_title() {
		return message_title;
	}
	public void setMessage_title(String message_title) {
		this.message_title = message_title;
	}
	public String getMessage_content() {
		return message_content;
	}
	public void setMessage_content(String message_content) {
		this.message_content = message_content;
	}
	public Date getMessage_date() {
		return message_date;
	}
	public void setMessage_date(Date message_date) {
		this.message_date = message_date;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	public String getEmp_email() {
		return emp_email;
	}





	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
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





	public String getJob_name() {
		return job_name;
	}





	public void setJob_name(String job_name) {
		this.job_name = job_name;
	}


	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}


	@Override
	public String toString() {
		return "Message [message_no=" + message_no + ", message_from_no=" + message_from_no + ", message_to_no="
				+ message_to_no + ", message_title=" + message_title + ", message_content=" + message_content
				+ ", message_date=" + message_date + ", emp_email=" + emp_email + ", dept_name=" + dept_name
				+ ", emp_name=" + emp_name + ", job_name=" + job_name + ", emp_no=" + emp_no + "]";
	}




	
	
	
	
	
	
	
}
