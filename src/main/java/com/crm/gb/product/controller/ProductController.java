package com.crm.gb.product.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class ProductController {
	
	public ProductController() {}

	//상품 등록 화면으로 이동
	@RequestMapping("moveProductInsert.do")
	public String moveProductInsert() {
		return "product/productInsert";
	}
	
	
}
