package com.crm.gb.product.model.vo;

import org.springframework.stereotype.Component;

@Component("ProductFile")
public class ProductFile implements java.io.Serializable{
	
	private static final long serialVersionUID = 99L;
	
	private int product_file_no;
	private int product_no;
	private String product_original_file;
	private String product_rename_file;
	
	
	public ProductFile(){}
	
	

	public ProductFile(int product_file_no, int product_no, String product_original_file, String product_rename_file) {
		super();
		this.product_file_no = product_file_no;
		this.product_no = product_no;
		this.product_original_file = product_original_file;
		this.product_rename_file = product_rename_file;
	}



	public ProductFile(int product_no, String product_original_file, String product_rename_file) {
		super();
		this.product_no = product_no;
		this.product_original_file = product_original_file;
		this.product_rename_file = product_rename_file;
	}


	public int getProduct_no() {
		return product_no;
	}


	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}


	public String getProduct_original_file() {
		return product_original_file;
	}


	public void setProduct_original_file(String product_original_file) {
		this.product_original_file = product_original_file;
	}


	public String getProduct_rename_file() {
		return product_rename_file;
	}


	public void setProduct_rename_file(String product_rename_file) {
		this.product_rename_file = product_rename_file;
	}


	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	

	public int getProduct_file_no() {
		return product_file_no;
	}



	public void setProduct_file_no(int product_file_no) {
		this.product_file_no = product_file_no;
	}



	@Override
	public String toString() {
		return "ProductFile [product_file_no=" + product_file_no + ", product_no=" + product_no
				+ ", product_original_file=" + product_original_file + ", product_rename_file=" + product_rename_file
				+ "]";
	}



	
	
	
}
