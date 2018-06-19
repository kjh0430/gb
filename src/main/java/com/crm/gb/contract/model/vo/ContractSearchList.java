package com.crm.gb.contract.model.vo;

import java.io.Serializable;

import org.springframework.stereotype.Component;

@Component("contractSearch")
public class ContractSearchList implements Serializable{
	private static final long serialVersionUID = 1806141338L;
	
	private int emp_no;
	private String client_name;
	private int showPage;
	private int totalRow;
	private int start;
	private int end;
	private int startRow;
	private int endRow;
	
	public ContractSearchList() {}

	public ContractSearchList(int emp_no, String client_name, int showPage, int totalRow, int start, int end,
			int startRow, int endRow) {
		super();
		this.emp_no = emp_no;
		this.client_name = client_name;
		this.showPage = showPage;
		this.totalRow = totalRow;
		this.start = start;
		this.end = end;
		this.startRow = startRow;
		this.endRow = endRow;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public String getClient_name() {
		return client_name;
	}

	public void setClient_name(String client_name) {
		this.client_name = client_name;
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

	@Override
	public String toString() {
		return "ContractSearchList [emp_no=" + emp_no + ", client_name=" + client_name + ", showPage=" + showPage
				+ ", totalRow=" + totalRow + ", start=" + start + ", end=" + end + ", startRow=" + startRow
				+ ", endRow=" + endRow + "]";
	}
	
	
}
