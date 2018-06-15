package com.crm.gb.goal.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;


@Component("goal")
public class Goal implements Serializable{
	private static final long serialVersionUID = 2899349057L;
	
	//emp 테이블 data
	private int emp_no;
	private String emp_name;
	private int job_no;
	private int dept_no;
	
	
	//contract 테이블 data
	private int contract_no;
	private int contract_discount;
	private int contract_money;
	private String contract_date_start_goal;// 리스트 출력용
	private Date contract_date_start;
	

	//goal 테이블 data
	private int goal_no;
	private int goal_money;
	private Date goal_date;
	
	//사원 검색을 위한 변수 추가
	private String dept_name;
	private String job_name;
	private String emp_email;
	
	
	public Goal() {}


	public Goal(int emp_no, String emp_name, int job_no, int dept_no, int contract_no, int contract_discount,
			int contract_money, String contract_date_start_goal, Date contract_date_start, int goal_no, int goal_money,
			Date goal_date, String dept_name, String job_name, String emp_email) {
		super();
		this.emp_no = emp_no;
		this.emp_name = emp_name;
		this.job_no = job_no;
		this.dept_no = dept_no;
		this.contract_no = contract_no;
		this.contract_discount = contract_discount;
		this.contract_money = contract_money;
		this.contract_date_start_goal = contract_date_start_goal;
		this.contract_date_start = contract_date_start;
		this.goal_no = goal_no;
		this.goal_money = goal_money;
		this.goal_date = goal_date;
		this.dept_name = dept_name;
		this.job_name = job_name;
		this.emp_email = emp_email;
	}


	public int getEmp_no() {
		return emp_no;
	}


	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}


	public String getEmp_name() {
		return emp_name;
	}


	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}


	public int getJob_no() {
		return job_no;
	}


	public void setJob_no(int job_no) {
		this.job_no = job_no;
	}


	public int getDept_no() {
		return dept_no;
	}


	public void setDept_no(int dept_no) {
		this.dept_no = dept_no;
	}


	public int getContract_no() {
		return contract_no;
	}


	public void setContract_no(int contract_no) {
		this.contract_no = contract_no;
	}


	public int getContract_discount() {
		return contract_discount;
	}


	public void setContract_discount(int contract_discount) {
		this.contract_discount = contract_discount;
	}


	public int getContract_money() {
		return contract_money;
	}


	public void setContract_money(int contract_money) {
		this.contract_money = contract_money;
	}


	public String getContract_date_start_goal() {
		return contract_date_start_goal;
	}


	public void setContract_date_start_goal(String contract_date_start_goal) {
		this.contract_date_start_goal = contract_date_start_goal;
	}


	public Date getContract_date_start() {
		return contract_date_start;
	}


	public void setContract_date_start(Date contract_date_start) {
		this.contract_date_start = contract_date_start;
	}


	public int getGoal_no() {
		return goal_no;
	}


	public void setGoal_no(int goal_no) {
		this.goal_no = goal_no;
	}


	public int getGoal_money() {
		return goal_money;
	}


	public void setGoal_money(int goal_money) {
		this.goal_money = goal_money;
	}


	public Date getGoal_date() {
		return goal_date;
	}


	public void setGoal_date(Date goal_date) {
		this.goal_date = goal_date;
	}


	public String getDept_name() {
		return dept_name;
	}


	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
	}


	public String getJob_name() {
		return job_name;
	}


	public void setJob_name(String job_name) {
		this.job_name = job_name;
	}


	public String getEmp_email() {
		return emp_email;
	}


	public void setEmp_email(String emp_email) {
		this.emp_email = emp_email;
	}


	@Override
	public String toString() {
		return "Goal [emp_no=" + emp_no + ", emp_name=" + emp_name + ", job_no=" + job_no + ", dept_no=" + dept_no
				+ ", contract_no=" + contract_no + ", contract_discount=" + contract_discount + ", contract_money="
				+ contract_money + ", contract_date_start_goal=" + contract_date_start_goal + ", contract_date_start="
				+ contract_date_start + ", goal_no=" + goal_no + ", goal_money=" + goal_money + ", goal_date="
				+ goal_date + ", dept_name=" + dept_name + ", job_name=" + job_name + ", emp_email=" + emp_email + "]";
	}


	



	
	


	









	



	
	

	
	
	
	
}
