package com.crm.gb.client.model.vo;

import java.io.Serializable;

public class ClientFile implements Serializable{
	private static final long serialVersionUID = 1805211430L;
	
	private int client_file_no;
	private int client_no;
	private String client_original_file;
	private String client_rename_file;
	
	private Client client;
	
	public ClientFile() {}

	public ClientFile(int client_file_no, int client_no, String client_original_file, String client_rename_file,
			Client client) {
		super();
		this.client_file_no = client_file_no;
		this.client_no = client_no;
		this.client_original_file = client_original_file;
		this.client_rename_file = client_rename_file;
		this.client = client;
	}

	public int getClient_file_no() {
		return client_file_no;
	}

	public void setClient_file_no(int client_file_no) {
		this.client_file_no = client_file_no;
	}

	public int getClient_no() {
		return client_no;
	}

	public void setClient_no(int client_no) {
		this.client_no = client_no;
	}

	public String getClient_original_file() {
		return client_original_file;
	}

	public void setClient_original_file(String client_original_file) {
		this.client_original_file = client_original_file;
	}

	public String getClient_rename_file() {
		return client_rename_file;
	}

	public void setClient_rename_file(String client_rename_file) {
		this.client_rename_file = client_rename_file;
	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	@Override
	public String toString() {
		return "ClientFile [client_file_no=" + client_file_no + ", client_no=" + client_no + ", client_original_file="
				+ client_original_file + ", client_rename_file=" + client_rename_file + ", client=" + client + "]";
	}
	
	
}
