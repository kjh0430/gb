package com.crm.gb.order.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.crm.gb.client.controller.ClientController;
import com.crm.gb.client.model.service.ClientService;
import com.crm.gb.client.model.vo.Client;
import com.crm.gb.product.model.service.ProductService;
import com.crm.gb.product.model.vo.Product;


@Controller
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(ClientController.class);
	
	/*@Autowired
	private OrderService OrderService;*/
	
	@Autowired
	private ClientService clientService;
	
	@Autowired
	private ProductService productService;
//	
//	@RequestMapping(value="orderaction.do")
//	public String orderPageMethod() {
//		return "order/order";
//	}
	
	//발주하기-페이지이동과 고객검색용 메소드
	@RequestMapping(value="selectOrderClient.do")
	public String orderPageMethod(@RequestParam("emp_no") String emp_num, Model model) {
		logger.info("발주하기 페이지  run....");
//		int emp_no = Integer.parseInt(emp_num);
//		ArrayList<Client> accountClientList = clientService.selectAccountClientList(emp_no);
//		model.addAttribute("accountClientList", accountClientList);
//		System.out.println("accountClientList : " +accountClientList.toString());
//	
		return "order/order";
	}
	
	@RequestMapping(value="searchCom.do", method=RequestMethod.POST)
	public void searchCom(@RequestParam(name="searchComName") String client_company, HttpServletResponse response) throws IOException{
		logger.info("발주하기-고객검색 메소드 run....");

		ArrayList<Client> SearchCom = clientService.selectSearchAccount(client_company);
		JSONArray jarr = new JSONArray();
		
		for(Client client : SearchCom) {
			JSONObject jsonobject = new JSONObject();
			jsonobject.put("client_no", client.getClient_no());
			jsonobject.put("client_company", client.getClient_company());
			jsonobject.put("client_phone", client.getClient_phone());
			jsonobject.put("client_addr", client.getClient_addr());
			jarr.add(jsonobject);
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		

		
		response.setContentType("application/json; charset=utf-8");	
		System.out.println("orderController:"+sendJson);
		PrintWriter out=response.getWriter();
		out.println(sendJson.toJSONString());
		out.flush();
		out.close();
	
	}
	
	@RequestMapping(value="searchProduct.do", method=RequestMethod.POST)
	public void searchProduct(@RequestParam(name="searchProductName") String product_name, HttpServletResponse response) throws IOException{
		logger.info("발주하기-상품 검색 메소드 run....");

		ArrayList<Product> SearchProduct = productService.selectSearchProduct(product_name);
		JSONArray jarr = new JSONArray();
		
		for(Product product : SearchProduct) {
			JSONObject jsonobject = new JSONObject();
			jsonobject.put("product_no", product.getProduct_no());
			jsonobject.put("product_name", product.getProduct_name());
			jsonobject.put("product_price", product.getProduct_price());
			jsonobject.put("product_amount", product.getProduct_amount());
			jsonobject.put("contract_discount", product.getContract_discount());
			//jsonobject.put("product_availability", product.getProduct_availavility());
			
			jarr.add(jsonobject);
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("plist", jarr);
		

		
		response.setContentType("application/json; charset=utf-8");	
		System.out.println("orderProductController:"+sendJson);
		PrintWriter out=response.getWriter();
		out.println(sendJson.toJSONString());
		out.flush();
		out.close();
	
	}

}
