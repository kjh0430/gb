package com.crm.gb.message.model.vo;

import java.io.Serializable;
import java.util.Date;

import org.springframework.stereotype.Component;


@Component("message")
public class Message implements Serializable{
	private static final long serialVersionUID = 222349057L;



	private int messageNo;
	private int messageFromNo;
	private int meassgeToNo;
	private String messageTitle;
	private String messageContent;
	private Date messageDate;
	
	public Message() {}
	
	public Message(int messageNo, int messageFromNo, int meassgeToNo, String messageTitle, String messageContent,
			Date messageDate) {
		super();
		this.messageNo = messageNo;
		this.messageFromNo = messageFromNo;
		this.meassgeToNo = meassgeToNo;
		this.messageTitle = messageTitle;
		this.messageContent = messageContent;
		this.messageDate = messageDate;
		
		
	}


	public int getMessageNo() {
		return messageNo;
	}


	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}


	public int getMessageFromNo() {
		return messageFromNo;
	}


	public void setMessageFromNo(int messageFromNo) {
		this.messageFromNo = messageFromNo;
	}


	public int getMeassgeToNo() {
		return meassgeToNo;
	}


	public void setMeassgeToNo(int meassgeToNo) {
		this.meassgeToNo = meassgeToNo;
	}


	public String getMessageTitle() {
		return messageTitle;
	}


	public void setMessageTitle(String messageTitle) {
		this.messageTitle = messageTitle;
	}


	public String getMessageContent() {
		return messageContent;
	}


	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}


	public Date getMessageDate() {
		return messageDate;
	}


	public void setMessageDate(Date messageDate) {
		this.messageDate = messageDate;
	}

	@Override
	public String toString() {
		return "Message [messageNo=" + messageNo + ", messageFromNo=" + messageFromNo + ", meassgeToNo=" + meassgeToNo
				+ ", messageTitle=" + messageTitle + ", messageContent=" + messageContent + ", messageDate="
				+ messageDate + "]";
	}
	
	
	
}
