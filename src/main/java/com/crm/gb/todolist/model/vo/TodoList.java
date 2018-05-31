package com.crm.gb.todolist.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("TodoList")
public class TodoList implements Serializable{	
	private static final long serialVersionUID = 15385L;
	
	private int emp_no;
	private String do1;
	private String check1;
	private String do2;
	private String check2;
	private String do3;
	private String check3;
	private String do4;
	private String check4;
	private String do5;
	private String check5;
	private Date to_date;
	
	public TodoList() {}
	
	public TodoList(int emp_no, String do1, String check1, String do2, String check2, String do3, String check3,
			String do4, String check4, String do5, String check5, Date to_date) {
		super();
		this.emp_no = emp_no;
		this.do1 = do1;
		this.check1 = check1;
		this.do2 = do2;
		this.check2 = check2;
		this.do3 = do3;
		this.check3 = check3;
		this.do4 = do4;
		this.check4 = check4;
		this.do5 = do5;
		this.check5 = check5;
		this.to_date = to_date;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public String getDo1() {
		return do1;
	}

	public void setDo1(String do1) {
		this.do1 = do1;
	}

	public String getCheck1() {
		return check1;
	}

	public void setCheck1(String check1) {
		this.check1 = check1;
	}

	public String getDo2() {
		return do2;
	}

	public void setDo2(String do2) {
		this.do2 = do2;
	}

	public String getCheck2() {
		return check2;
	}

	public void setCheck2(String check2) {
		this.check2 = check2;
	}

	public String getDo3() {
		return do3;
	}

	public void setDo3(String do3) {
		this.do3 = do3;
	}

	public String getCheck3() {
		return check3;
	}

	public void setCheck3(String check3) {
		this.check3 = check3;
	}

	public String getDo4() {
		return do4;
	}

	public void setDo4(String do4) {
		this.do4 = do4;
	}

	public String getCheck4() {
		return check4;
	}

	public void setCheck4(String check4) {
		this.check4 = check4;
	}

	public String getDo5() {
		return do5;
	}

	public void setDo5(String do5) {
		this.do5 = do5;
	}

	public String getCheck5() {
		return check5;
	}

	public void setCheck5(String check5) {
		this.check5 = check5;
	}

	public Date getTo_date() {
		return to_date;
	}

	public void setTo_date(Date to_date) {
		this.to_date = to_date;
	}

	@Override
	public String toString() {
		return "TodoList [emp_no=" + emp_no + ", do1=" + do1 + ", check1=" + check1 + ", do2=" + do2 + ", check2="
				+ check2 + ", do3=" + do3 + ", check3=" + check3 + ", do4=" + do4 + ", check4=" + check4 + ", do5="
				+ do5 + ", check5=" + check5 + ", to_date=" + to_date + "]";
	}
}
