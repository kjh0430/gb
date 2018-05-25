package com.crm.gb.order.model.vo;

import java.util.Date;

/*@Component("order")*/
public class Order {
private static final long serialVersionUID = 1111L;	
	
	private int orderlist_no;
	private int emp_no;
	private int client_no;
	private int product_no;
	private int order_amount;
	private int order_price;
	private Date order_date;
	
	public Order(int orderlist_no, int emp_no, int client_no, int product_no, int order_amount, int order_price,
			Date order_date) {
		super();
		this.orderlist_no = orderlist_no;
		this.emp_no = emp_no;
		this.client_no = client_no;
		this.product_no = product_no;
		this.order_amount = order_amount;
		this.order_price = order_price;
		this.order_date = order_date;
	}

	public int getOrderlist_no() {
		return orderlist_no;
	}

	public void setOrderlist_no(int orderlist_no) {
		this.orderlist_no = orderlist_no;
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

	public int getOrder_price() {
		return order_price;
	}

	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
//	public String toString() {
//		return "orderlist_no : " + orderlist_no + " , emp_no : " + emp_no 
//				+" , client_no : " + client_no + " , product_no : " + product_no 
//				+" , order_amount : " + order_amount + " , order_price : " + order_price
//				+" , order_date : " + order_date;
//	}
}
