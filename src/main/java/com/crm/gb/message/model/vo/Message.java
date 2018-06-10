package com.crm.gb.message.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;



//기본 vo
@Component("message")
public class Message implements Serializable {

	private static final long serialVersionUID = 15L;

	private int message_no;
	private int message_from_no;
	private int message_to_no;
	private String message_title;
	private String message_content;
	private String message_date;
	private String message_confirm;
	
	// 사원 검색 용 
	private String emp_email;
	private String dept_name;
	private String emp_name;
	private String job_name;
	private int emp_no; // 검색시 사원테이블의 사원넘버를 갖고 오기 위한 변수
	
	
	//paging 처리를 위한 변수
	private int listCount;
	private int currentPage;
	private int startRow;
	private int endRow;
	
	//검색용 조건
	
	
	public Message() {
	}
	public Message(int message_no, int message_from_no, int message_to_no, String message_title, String message_content,
			String message_date, String message_confirm, String emp_email, String dept_name, String emp_name,
			String job_name, int emp_no, int listCount, int currentPage, int startRow, int endRow) {
		super();
		this.message_no = message_no;
		this.message_from_no = message_from_no;
		this.message_to_no = message_to_no;
		this.message_title = message_title;
		this.message_content = message_content;
		this.message_date = message_date;
		this.message_confirm = message_confirm;
		this.emp_email = emp_email;
		this.dept_name = dept_name;
		this.emp_name = emp_name;
		this.job_name = job_name;
		this.emp_no = emp_no;
		this.listCount = listCount;
		this.currentPage = currentPage;
		this.startRow = startRow;
		this.endRow = endRow;
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
	public String getMessage_date() {
		return message_date;
	}
	public void setMessage_date(String message_date) {
		this.message_date = message_date;
	}
	public String getMessage_confirm() {
		return message_confirm;
	}
	public void setMessage_confirm(String message_confirm) {
		this.message_confirm = message_confirm;
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
	public int getListCount() {
		return listCount;
	}
	public void setListCount(int listCount) {
		this.listCount = listCount;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
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
	@Override
	public String toString() {
		return "Message [message_no=" + message_no + ", message_from_no=" + message_from_no + ", message_to_no="
				+ message_to_no + ", message_title=" + message_title + ", message_content=" + message_content
				+ ", message_date=" + message_date + ", message_confirm=" + message_confirm + ", emp_email=" + emp_email
				+ ", dept_name=" + dept_name + ", emp_name=" + emp_name + ", job_name=" + job_name + ", emp_no="
				+ emp_no + ", listCount=" + listCount + ", currentPage=" + currentPage + ", startRow=" + startRow
				+ ", endRow=" + endRow + "]";
	}
	
	
	
	
	

	

	

	

	

	
	
	
}
