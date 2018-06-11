package com.crm.gb.todolist.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("TodoList")
public class TodoList implements Serializable{	
	private static final long serialVersionUID = 15385L;
	
	private int emp_no;
	private String todo1;
	private String check1;
	private String todo2;
	private String check2;
	private String todo3;
	private String check3;
	private String todo4;
	private String check4;
	private String todo5;
	private String check5;
	private Date todo_date;
	
	public TodoList() {}

	public TodoList(int emp_no, String todo1, String check1, String todo2, String check2, String todo3, String check3,
			String todo4, String check4, String todo5, String check5, Date todo_date) {
		super();
		this.emp_no = emp_no;
		this.todo1 = todo1;
		this.check1 = check1;
		this.todo2 = todo2;
		this.check2 = check2;
		this.todo3 = todo3;
		this.check3 = check3;
		this.todo4 = todo4;
		this.check4 = check4;
		this.todo5 = todo5;
		this.check5 = check5;
		this.todo_date = todo_date;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public String getTodo1() {
		return todo1;
	}

	public void setTodo1(String todo1) {
		this.todo1 = todo1;
	}

	public String getCheck1() {
		return check1;
	}

	public void setCheck1(String check1) {
		this.check1 = check1;
	}

	public String getTodo2() {
		return todo2;
	}

	public void setTodo2(String todo2) {
		this.todo2 = todo2;
	}

	public String getCheck2() {
		return check2;
	}

	public void setCheck2(String check2) {
		this.check2 = check2;
	}

	public String getTodo3() {
		return todo3;
	}

	public void setTodo3(String todo3) {
		this.todo3 = todo3;
	}

	public String getCheck3() {
		return check3;
	}

	public void setCheck3(String check3) {
		this.check3 = check3;
	}

	public String getTodo4() {
		return todo4;
	}

	public void setTodo4(String todo4) {
		this.todo4 = todo4;
	}

	public String getCheck4() {
		return check4;
	}

	public void setCheck4(String check4) {
		this.check4 = check4;
	}

	public String getTodo5() {
		return todo5;
	}

	public void setTodo5(String todo5) {
		this.todo5 = todo5;
	}

	public String getCheck5() {
		return check5;
	}

	public void setCheck5(String check5) {
		this.check5 = check5;
	}

	public Date getTodo_date() {
		return todo_date;
	}

	public void setTodo_date(Date todo_date) {
		this.todo_date = todo_date;
	}

	@Override
	public String toString() {
		return "TodoList [emp_no=" + emp_no + ", todo1=" + todo1 + ", check1=" + check1 + ", todo2=" + todo2
				+ ", check2=" + check2 + ", todo3=" + todo3 + ", check3=" + check3 + ", todo4=" + todo4 + ", check4="
				+ check4 + ", todo5=" + todo5 + ", check5=" + check5 + ", todo_date=" + todo_date + "]";
	}
	
}
