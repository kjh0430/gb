package com.crm.gb.order.model.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("order")
public class Order {
private static final long serialVersionUID = 1111L;	
	
	private int orderlist_no;
	private int order_no;
	private int emp_no;
	private String emp_name;
	private int client_no;
	private String client_phone;
	private String client_addr;
	private String client_comment;
	private int product_no;
	private int order_amount;
	private Double order_price;
	private String client_company;
	private String order_date;
	private int total;
	

	public Order() {}
	
	public Order(int orderlist_no, int order_no, int emp_no, int client_no, int product_no, int order_amount, Double order_price,
			String order_date) {
		super();
		this.orderlist_no = orderlist_no;
		this.order_no = order_no;
		this.emp_no = emp_no;
		this.client_no = client_no;
		this.product_no = product_no;
		this.order_amount = order_amount;
		this.order_price = order_price;
		this.order_date = order_date;
	}
	
	public Order(int orderlist_no, int order_no, int emp_no, int client_no, int product_no, int order_amount, Double order_price,
			String order_date, String client_company) {
		super();
		this.orderlist_no = orderlist_no;
		this.order_no = order_no;
		this.emp_no = emp_no;
		this.client_no = client_no;
		this.product_no = product_no;
		this.order_amount = order_amount;
		this.order_price = order_price;
		this.order_date = order_date;
		this.client_company = client_company;
	}
	
	

	public Order(int orderlist_no, int order_no, int emp_no, String emp_name, int client_no, String client_phone,
			String client_addr, String client_comment, int product_no, int order_amount, Double order_price,
			String client_company, String order_date, int total) {
		super();
		this.orderlist_no = orderlist_no;
		this.order_no = order_no;
		this.emp_no = emp_no;
		this.emp_name = emp_name;
		this.client_no = client_no;
		this.client_phone = client_phone;
		this.client_addr = client_addr;
		this.client_comment = client_comment;
		this.product_no = product_no;
		this.order_amount = order_amount;
		this.order_price = order_price;
		this.client_company = client_company;
		this.order_date = order_date;
		this.total = total;
	}

	public int getOrderlist_no() {
		return orderlist_no;
	}

	public void setOrderlist_no(int orderlist_no) {
		this.orderlist_no = orderlist_no;
	}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}

	public int getEmp_no() {
		return emp_no;
	}

	public void setEmp_no(int emp_no) {
		this.emp_no = emp_no;
	}

	public int getClient_no() {
		return client_no;
	}

	public void setClient_no(int client_no) {
		this.client_no = client_no;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public int getOrder_amount() {
		return order_amount;
	}

	public void setOrder_amount(int order_amount) {
		this.order_amount = order_amount;
	}

	public Double getOrder_price() {
		return order_price;
	}

	public void setOrder_price(Double order_price) {
		this.order_price = order_price;
	}

	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
	public String getClient_company() {
		return client_company;
	}

	public void setClient_company(String client_company) {
		this.client_company = client_company;
	}


	public int getTotal() {
	 	return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}
	
	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
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

	public String getClient_comment() {
		return client_comment;
	}

	public void setClient_comment(String client_comment) {
		this.client_comment = client_comment;
	}

	@Override
	public String toString() {
		return "Order [orderlist_no=" + orderlist_no + ", order_no=" + order_no + ", emp_no=" + emp_no + ", emp_name="
				+ emp_name + ", client_no=" + client_no + ", client_phone=" + client_phone + ", client_addr="
				+ client_addr + ", client_comment=" + client_comment + ", product_no=" + product_no + ", order_amount="
				+ order_amount + ", order_price=" + order_price + ", client_company=" + client_company + ", order_date="
				+ order_date + ", total=" + total + "]";
	}
	
	




	
}
