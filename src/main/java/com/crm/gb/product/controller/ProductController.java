package com.crm.gb.product.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.crm.gb.product.model.service.ProductService;
import com.crm.gb.product.model.vo.Product;


@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	public ProductController() {}
	
	@RequestMapping("adminmain.do")
	public String adminMain() {
			return "adminmain";
				
	}
			
	//main으로 가기
	@RequestMapping("Movemain.do")
	public String main() {
		return "adminmain";
		
	}
	
	//상품 리스트 화면으로 이동
	@RequestMapping("productList.do")
	public String moveProductList() {
		return "product/productList";
	}
	
	//상품 등록 화면으로 이동
	@RequestMapping("moveProductInsert.do")
	public String moveProductInsert() {
		return "product/productInsert";
	}
	
	//상품 등록 처리 컨트롤러
	@RequestMapping(value="insertProduct.do", method=RequestMethod.POST)
	public ModelAndView insertProduct(Product product,ModelAndView mv,HttpServletRequest request,MultipartHttpServletRequest mhsq) {
				
		if(product.getProduct_availavility().equals("sale_n")) {
			product.setProduct_availavility("N");
		}else {
			product.setProduct_availavility("Y");
		}
		System.out.println(product);
		int result = productService.insertProduct(product);
		int product_no = product.getProduct_no();
		
		String path = request.getSession().getServletContext().getRealPath("resources/upload/product");
		
		
		
		System.out.println("product_no 기본키 : " + product_no);
		mv.setViewName("product/productList");		
		
		return mv;
		
	}
	
	
}
