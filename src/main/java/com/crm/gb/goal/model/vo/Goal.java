package com.crm.gb.goal.model.vo;

import java.io.Serializable;


import org.springframework.stereotype.Component;


@Component("goal")
public class Goal implements Serializable{
   private static final long serialVersionUID = 2899349057L;
   
   //emp 테이블 data
   private int emp_no;
   private String emp_name;
   private int job_no;
   private String dept_no;
   
   //goal 테이블 data
   private int goal_no;
   private int goal_money;
   private String goal_date;
  
   //사원 검색을 위한 변수 추가
   private String dept_name;
   private String job_name;
   private String emp_email;

   
   //사원의 목표 및 달성률등을 가져오기 위한 변수 추가
   private String goalMonth;
   private int goalmoney;
   private int sales;
   private float acheive;
   private String date;
      
   
   public Goal() {}


public Goal(int emp_no, String emp_name, int job_no, String dept_no, int goal_no, int goal_money, String goal_date,
		String dept_name, String job_name, String emp_email, String goalMonth, int goalmoney, int sales, float acheive,
		String date) {
	super();
	this.emp_no = emp_no;
	this.emp_name = emp_name;
	this.job_no = job_no;
	this.dept_no = dept_no;
	this.goal_no = goal_no;
	this.goal_money = goal_money;
	this.goal_date = goal_date;
	this.dept_name = dept_name;
	this.job_name = job_name;
	this.emp_email = emp_email;
	this.goalMonth = goalMonth;
	this.goalmoney = goalmoney;
	this.sales = sales;
	this.acheive = acheive;
	this.date = date;
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


public String getDept_no() {
	return dept_no;
}


public void setDept_no(String dept_no) {
	this.dept_no = dept_no;
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


public String getGoal_date() {
	return goal_date;
}


public void setGoal_date(String goal_date) {
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


public String getGoalMonth() {
	return goalMonth;
}


public void setGoalMonth(String goalMonth) {
	this.goalMonth = goalMonth;
}


public int getGoalmoney() {
	return goalmoney;
}


public void setGoalmoney(int goalmoney) {
	this.goalmoney = goalmoney;
}


public int getSales() {
	return sales;
}


public void setSales(int sales) {
	this.sales = sales;
}


public float getAcheive() {
	return acheive;
}


public void setAcheive(float acheive) {
	this.acheive = acheive;
}


public String getDate() {
	return date;
}


public void setDate(String date) {
	this.date = date;
}


public static long getSerialversionuid() {
	return serialVersionUID;
}


@Override
public String toString() {
	return "Goal [emp_no=" + emp_no + ", emp_name=" + emp_name + ", job_no=" + job_no + ", dept_no=" + dept_no
			+ ", goal_no=" + goal_no + ", goal_money=" + goal_money + ", goal_date=" + goal_date + ", dept_name="
			+ dept_name + ", job_name=" + job_name + ", emp_email=" + emp_email + ", goalMonth=" + goalMonth
			+ ", goalmoney=" + goalmoney + ", sales=" + sales + ", acheive=" + acheive + ", date=" + date + "]";
}


   


   





   


   
}


   



   
   


   









   



   


   
   
   
   


   
   