package com.crm.gb.notice.model.vo;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("notice")
public class Notice {
	private static final long serialVersionUID=1805161307L;
	
	private int notice_no;//공지사항 번호
	private int emp_no;//사원번호
	private String notice_title;//공지제목
	private String notice_content;//공지내용
	private Date notice_date;//공지날짜
	private int notice_count;//공지사항조회수
	private int notice_list_count;//공지사항 리스트 갯수 
	
	//페이징 처리 용 변수
	private int startPage;//페이지 시작 
	private int endPage;//페이지 끝	
	private int totBlock;//전체 페이지 블록갯수
	private int curBlock;//현재 블록
	private int prevBlock;//이전 블록
	private int nextBlock;//다음 블록
	private int blockBegin;//블록페이지 시작페이지
	private int blockEnd;//블록 페이지 끝 번호
	
	
	
	public Notice() {}


	
	
	

	public Notice(int notice_no, int emp_no, String notice_title, String notice_content, Date notice_date,
			int notice_count, int notice_list_count, int startPage, int endPage, int totBlock, int curBlock,
			int prevBlock, int nextBlock, int blockBegin, int blockEnd) {
		super();
		this.notice_no = notice_no;
		this.emp_no = emp_no;
		this.notice_title = notice_title;
		this.notice_content = notice_content;
		this.notice_date = notice_date;
		this.notice_count = notice_count;
		this.notice_list_count = notice_list_count;
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
		return "Notice [notice_no=" + notice_no + ", emp_no=" + emp_no + ", notice_title=" + notice_title
				+ ", notice_content=" + notice_content + ", notice_date=" + notice_date + ", notice_count="
				+ notice_count + ", notice_list_count=" + notice_list_count + ", startPage=" + startPage + ", endPage="
				+ endPage + ", totBlock=" + totBlock + ", curBlock=" + curBlock + ", prevBlock=" + prevBlock
				+ ", nextBlock=" + nextBlock + ", blockBegin=" + blockBegin + ", blockEnd=" + blockEnd + "]";
	}






	public int getNotice_no() {
		return notice_no;
	}



	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}



	public int getEmp_no() {
		return emp_no;
	}



	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}



	public String getNotice_title() {
		return notice_title;
	}



	public void setNotice_title(String notice_title) {
		this.notice_title = notice_title;
	}



	public String getNotice_content() {
		return notice_content;
	}



	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}



	public Date getNotice_date() {
		return notice_date;
	}



	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}



	public int getNotice_count() {
		return notice_count;
	}



	public void setNotice_count(int notice_count) {
		this.notice_count = notice_count;
	}



	public int getNotice_list_count() {
		return notice_list_count;
	}



	public void setNotice_list_count(int notice_list_count) {
		this.notice_list_count = notice_list_count;
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
