package com.crm.gb.client.model.vo;

import java.io.Serializable;
import java.sql.Date;

import org.springframework.stereotype.Component;

import com.crm.gb.emp.model.vo.Emp;

@Component("client")
public class Client implements Serializable{
	private static final long serialVersionUID=1805101442L;
	
	private int client_no;
	private String client_name;
	private String client_company;
	private String client_job;
	private String client_email;
	private String client_phone;
	private String client_addr;
	private String client_com_tel;
	private String client_loc_x;
	private String client_loc_y;
	private String client_contract;
	private String client_comment;
	private int emp_no;
	private Date client_enroll;
	private String client_delete;
	private int showPage;
	private int totalRow;
	private int start;
	private int end;
	private int startRow;
	private int endRow;
	private Emp emp;
	private String emp_name;
	private String contract_discount;
	
	//emp job_no
	private int job_no;
	
	//페이징 처리 변수 선언!
	//헷갈려서 그냥 다시 만들었어요!!
	private int client_list_count;
	private int startPage;//페이지 시작 
	private int endPage;//페이지 끝	
	private int totBlock;//전체 페이지 블록갯수
	private int curBlock;//현재 블록
	private int prevBlock;//이전 블록
	private int nextBlock;//다음 블록
	private int blockBegin;//블록페이지 시작페이지
	private int blockEnd;//블록 페이지 끝 번호
	
	
	
	public Client() {}
	
	

	public Client(int client_no, String client_name, String client_company, String client_job, String client_email,
			String client_phone, String client_addr, String client_com_tel, String client_loc_x, String client_loc_y,
			String client_contract, String client_comment, int emp_no, Date client_enroll, String client_delete,
			String emp_name, int client_list_count, int startPage, int endPage, int totBlock, int curBlock,
			int prevBlock, int nextBlock, int blockBegin, int blockEnd) {
		super();
		this.client_no = client_no;
		this.client_name = client_name;
		this.client_company = client_company;
		this.client_job = client_job;
		this.client_email = client_email;
		this.client_phone = client_phone;
		this.client_addr = client_addr;
		this.client_com_tel = client_com_tel;
		this.client_loc_x = client_loc_x;
		this.client_loc_y = client_loc_y;
		this.client_contract = client_contract;
		this.client_comment = client_comment;
		this.emp_no = emp_no;
		this.client_enroll = client_enroll;
		this.client_delete = client_delete;
		this.emp_name = emp_name;
		this.client_list_count = client_list_count;
		this.startPage = startPage;
		this.endPage = endPage;
		this.totBlock = totBlock;
		this.curBlock = curBlock;
		this.prevBlock = prevBlock;
		this.nextBlock = nextBlock;
		this.blockBegin = blockBegin;
		this.blockEnd = blockEnd;
	}



	public Client(int client_no, String client_name, String client_company, String client_job, String client_email,
			String client_phone, String client_addr, String client_com_tel, String client_loc_x, String client_loc_y,
			String client_contract, String client_comment, int emp_no, Date client_enroll, String client_delete,
			int showPage, int totalRow, int start, int end, int startRow, int endRow, Emp emp,
			String contract_discount, String emp_name, int job_no) {
		super();
		this.client_no = client_no;
		this.client_name = client_name;
		this.client_company = client_company;
		this.client_job = client_job;
		this.client_email = client_email;
		this.client_phone = client_phone;
		this.client_addr = client_addr;
		this.client_com_tel = client_com_tel;
		this.client_loc_x = client_loc_x;
		this.client_loc_y = client_loc_y;
		this.client_contract = client_contract;
		this.client_comment = client_comment;
		this.emp_no = emp_no;
		this.client_enroll = client_enroll;
		this.client_delete = client_delete;
		this.showPage = showPage;
		this.totalRow = totalRow;
		this.start = start;
		this.end = end;
		this.startRow = startRow;
		this.endRow = endRow;
		this.emp = emp;
		this.contract_discount = contract_discount;
		this.emp_name = emp_name;
		this.job_no = job_no;
	}

	public int getClient_no() {
		return client_no;
	}

	public void setClient_no(int client_no) {
		this.client_no = client_no;
	}

	public String getClient_name() {
		return client_name;
	}

	public void setClient_name(String client_name) {
		this.client_name = client_name;
	}

	public String getClient_company() {
		return client_company;
	}

	public void setClient_company(String client_company) {
		this.client_company = client_company;
	}

	public String getClient_job() {
		return client_job;
	}

	public void setClient_job(String client_job) {
		this.client_job = client_job;
	}

	public String getClient_email() {
		return client_email;
	}

	public void setClient_email(String client_email) {
		this.client_email = client_email;
	}

	public String getClient_phone() {
		return client_phone;
	}

	public void setClient_phone(String client_phone) {
		this.client_phone = client_phone;
	}

	public String getClient_addr() {
		return client_addr;
	}

	public void setClient_addr(String client_addr) {
		this.client_addr = client_addr;
	}

	public String getClient_com_tel() {
		return client_com_tel;
	}

	public void setClient_com_tel(String client_com_tel) {
		this.client_com_tel = client_com_tel;
	}

	public String getClient_loc_x() {
		return client_loc_x;
	}

	public void setClient_loc_x(String client_loc_x) {
		this.client_loc_x = client_loc_x;
	}

	public String getClient_loc_y() {
		return client_loc_y;
	}

	public void setClient_loc_y(String client_loc_y) {
		this.client_loc_y = client_loc_y;
	}

	public String getClient_contract() {
		return client_contract;
	}

	public void setClient_contract(String client_contract) {
		this.client_contract = client_contract;
	}

	public String getClient_comment() {
		return client_comment;
	}

	public void setClient_comment(String client_comment) {
		this.client_comment = client_comment;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public Date getClient_enroll() {
		return client_enroll;
	}

	public void setClient_enroll(Date client_enroll) {
		this.client_enroll = client_enroll;
	}

	public String getClient_delete() {
		return client_delete;
	}

	public void setClient_delete(String client_delete) {
		this.client_delete = client_delete;
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

	public Emp getEmp() {
		return emp;
	}

	public void setEmp(Emp emp) {
		this.emp = emp;
	}

	public String getContract_discount() {
		return contract_discount;
	}

	public void setContract_discount(String contract_discount) {
		this.contract_discount = contract_discount;
	}
	
	

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

	public int getClient_list_count() {
		return client_list_count;
	}



	public void setClient_list_count(int client_list_count) {
		this.client_list_count = client_list_count;
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

	


	public int getJob_no() {
		return job_no;
	}



	public void setJob_no(int job_no) {
		this.job_no = job_no;
	}



	@Override
	public String toString() {
		return "Client [client_no=" + client_no + ", client_name=" + client_name + ", client_company=" + client_company
				+ ", client_job=" + client_job + ", client_email=" + client_email + ", client_phone=" + client_phone
				+ ", client_addr=" + client_addr + ", client_com_tel=" + client_com_tel + ", client_loc_x="
				+ client_loc_x + ", client_loc_y=" + client_loc_y + ", client_contract=" + client_contract
				+ ", client_comment=" + client_comment + ", emp_no=" + emp_no + ", client_enroll=" + client_enroll
				+ ", client_delete=" + client_delete + ", showPage=" + showPage + ", totalRow=" + totalRow + ", start="
				+ start + ", end=" + end + ", startRow=" + startRow + ", endRow=" + endRow + ", emp=" + emp
				+ ", emp_name=" + emp_name + ", contract_discount=" + contract_discount + "]";
	}

	

	
	

	
}
