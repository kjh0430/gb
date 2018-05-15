package com.crm.gb.product.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class ProductController {
	
	public ProductController() {}
	
	@RequestMapping("moveAdminPL.do")
	public String moveAdminPL() {
		return "product/productList";
	}

	@RequestMapping("moveProductInsert.do")
	public String moveProductInsert() {
		return "product/productInsert";
	}
}
