package com.crm.gb.goal.model.vo;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;

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
	

	private String gdata;
	
	
	//목표날짜 설정
	private String goal_date_start;
	
	//총 계약 금액	
	private int contract_money_sum;
	
	//목표설정 확인유무
	private int goal_count;

	//사원 검색을 위한 변수 추가
	private String dept_name;
	private String job_name;
	private String emp_email;

	
	//사원의 목표 및 달성률등을 가져오기 위한 변수 추가
	private String goalMonth;
	private int goalmoney;
	private int sales;
	private float acheive;
	
	
	//목표관리 페이징 변수 
	private int goal_list_count;// 목표관리 리스트 카운트
	private int startPage;//페이지 시작 
	private int endPage;//페이지 끝	
	private int totBlock;//전체 페이지 블록갯수
	private int curBlock;//현재 블록
	private int prevBlock;//이전 블록
	private int nextBlock;//다음 블록
	private int blockBegin;//블록페이지 시작페이지
	private int blockEnd;//블록 페이지 끝 번호
	
	
	
	public Goal() {}



	public Goal(int emp_no, String emp_name, int job_no, int dept_no, int contract_no, int contract_discount,
			int contract_money, String contract_date_start_goal, Date contract_date_start, int goal_no, int goal_money,
			Date goal_date, String gdata, String goal_date_start, int contract_money_sum, int goal_count,
			String dept_name, String job_name, String emp_email, String goalMonth, int goalmoney, int sales,
			float acheive, int goal_list_count, int startPage, int endPage, int totBlock, int curBlock, int prevBlock,
			int nextBlock, int blockBegin, int blockEnd) {
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
		this.gdata = gdata;
		this.goal_date_start = goal_date_start;
		this.contract_money_sum = contract_money_sum;
		this.goal_count = goal_count;
		this.dept_name = dept_name;
		this.job_name = job_name;
		this.emp_email = emp_email;
		this.goalMonth = goalMonth;
		this.goalmoney = goalmoney;
		this.sales = sales;
		this.acheive = acheive;
		this.goal_list_count = goal_list_count;
		this.startPage = startPage;
		this.endPage = endPage;
		this.totBlock = totBlock;
		this.curBlock = curBlock;
		this.prevBlock = prevBlock;
		this.nextBlock = nextBlock;
		this.blockBegin = blockBegin;
		this.blockEnd = blockEnd;
	}



	@Override
	public String toString() {
		return "Goal [emp_no=" + emp_no + ", emp_name=" + emp_name + ", job_no=" + job_no + ", dept_no=" + dept_no
				+ ", contract_no=" + contract_no + ", contract_discount=" + contract_discount + ", contract_money="
				+ contract_money + ", contract_date_start_goal=" + contract_date_start_goal + ", contract_date_start="
				+ contract_date_start + ", goal_no=" + goal_no + ", goal_money=" + goal_money + ", goal_date="
				+ goal_date + ", gdata=" + gdata + ", goal_date_start=" + goal_date_start + ", contract_money_sum="
				+ contract_money_sum + ", goal_count=" + goal_count + ", dept_name=" + dept_name + ", job_name="
				+ job_name + ", emp_email=" + emp_email + ", goalMonth=" + goalMonth + ", goalmoney=" + goalmoney
				+ ", sales=" + sales + ", acheive=" + acheive + ", goal_list_count=" + goal_list_count + ", startPage="
				+ startPage + ", endPage=" + endPage + ", totBlock=" + totBlock + ", curBlock=" + curBlock
				+ ", prevBlock=" + prevBlock + ", nextBlock=" + nextBlock + ", blockBegin=" + blockBegin + ", blockEnd="
				+ blockEnd + "]";
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



	public String getGdata() {
		return gdata;
	}



	public void setGdata(String gdata) {
		this.gdata = gdata;
	}



	public String getGoal_date_start() {
		return goal_date_start;
	}



	public void setGoal_date_start(String goal_date_start) {
		this.goal_date_start = goal_date_start;
	}



	public int getContract_money_sum() {
		return contract_money_sum;
	}



	public void setContract_money_sum(int contract_money_sum) {
		this.contract_money_sum = contract_money_sum;
	}



	public int getGoal_count() {
		return goal_count;
	}



	public void setGoal_count(int goal_count) {
		this.goal_count = goal_count;
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



	public int getGoal_list_count() {
		return goal_list_count;
	}



	public void setGoal_list_count(int goal_list_count) {
		this.goal_list_count = goal_list_count;
	}



	public int getStartPage() {
		return startPage;
	}



	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}



	public int getEndPage() {
		return endPage;
	}



	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}



	public int getTotBlock() {
		return totBlock;
	}



	public void setTotBlock(int totBlock) {
		this.totBlock = totBlock;
	}



	public int getCurBlock() {
		return curBlock;
	}



	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}



	public int getPrevBlock() {
		return prevBlock;
	}



	public void setPrevBlock(int prevBlock) {
		this.prevBlock = prevBlock;
	}



	public int getNextBlock() {
		return nextBlock;
	}



	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}



	public int getBlockBegin() {
		return blockBegin;
	}



	public void setBlockBegin(int blockBegin) {
		this.blockBegin = blockBegin;
	}



	public int getBlockEnd() {
		return blockEnd;
	}



	public void setBlockEnd(int blockEnd) {
		this.blockEnd = blockEnd;
	}



	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	
	
	
	
	
	
	
	
	
	
}


	



	
	


	









	



	


	
	
	
	


	
	

