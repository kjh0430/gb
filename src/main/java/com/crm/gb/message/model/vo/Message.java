package com.crm.gb.message.model.vo;

import java.io.Serializable; 
import java.sql.Date;

import org.springframework.stereotype.Component;


@Component("message")
public class Message implements Serializable  {
	
	private static final long serialVersionUID=15L;
	
	private int message_no;
	private int message_from_no;
	private int message_to_no;
	private String message_title;
	private String message_content;
	private Date message_date;
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
	public Date getMessage_date() {
		return message_date;
	}
	public void setMessage_date(Date message_date) {
		this.message_date = message_date;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "Message [message_no=" + message_no + ", message_from_no=" + message_from_no + ", message_to_no="
				+ message_to_no + ", message_title=" + message_title + ", message_content=" + message_content
				+ ", message_date=" + message_date + "]";
	}
	
	
	
	
	
	
}
