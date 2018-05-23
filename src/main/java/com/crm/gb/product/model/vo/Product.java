package com.crm.gb.product.model.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("Product")
public class Product implements java.io.Serializable{

	private static final long serialVersionUID = 94L;
	
	private int product_no;
	private String product_name;
	private int product_price;
	private String product_availability;
	private int product_amount;
	private String product_comment;
	private Date product_register;
	private String product_delete;
	private Double contract_discount;
	
	public Product() {}
	
	public Product(int product_no, String product_name, int product_price, String product_availability,
			int product_amount, String product_comment, Date product_register, String product_delete) {
		super();
		this.product_no = product_no;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_availability = product_availability;
		this.product_amount = product_amount;
		this.product_comment = product_comment;
		this.product_register = product_register;
		this.product_delete = product_delete;
	}
	
	public Product(int product_no, String product_name, int product_price, String product_availability,
			int product_amount, String product_comment, Date product_register, String product_delete , Double contract_discount) {
		super();
		this.product_no = product_no;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_availability = product_availability;
		this.product_amount = product_amount;
		this.product_comment = product_comment;
		this.product_register = product_register;
		this.product_delete = product_delete;
		this.contract_discount = contract_discount;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public String getProduct_availability() {
		return product_availability;
	}

	public void setProduct_availability(String product_availability) {
		this.product_availability = product_availability;
	}

	public int getProduct_amount() {
		return product_amount;
	}

	public void setProduct_amount(int product_amount) {
		this.product_amount = product_amount;
	}

	public String getProduct_comment() {
		return product_comment;
	}

	public void setProduct_comment(String product_comment) {
		this.product_comment = product_comment;
	}

	public Date getProduct_register() {
		return product_register;
	}

	public void setProduct_register(Date product_register) {
		this.product_register = product_register;
	}

	public String getProduct_delete() {
		return product_delete;
	}

	public void setProduct_delete(String product_delete) {
		this.product_delete = product_delete;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public Double getContract_discount() {
		return contract_discount;
	}

	public void setContract_discount(Double contract_discount) {
		this.contract_discount = contract_discount;
	}

	@Override
	public String toString() {
		return "Product [product_no=" + product_no + ", product_name=" + product_name + ", product_price="
				+ product_price + ", product_availavility=" + product_availability + ", product_amount="
				+ product_amount + ", product_comment=" + product_comment + ", product_register=" + product_register
				+ ", product_delete=" + product_delete + ", contract_discount = " + contract_discount + "]";
	}
	
	
	
}
