package com.crm.gb.order.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
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
import com.crm.gb.contract.model.service.ContractService;
import com.crm.gb.order.model.service.OrderService;
import com.crm.gb.order.model.vo.Order;
import com.crm.gb.product.model.service.ProductService;
import com.crm.gb.product.model.vo.Product;


@Controller
public class OrderController {
	private static final Logger logger = LoggerFactory.getLogger(ClientController.class);
	
	
	@Autowired
	private ClientService clientService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private ContractService contractService;

	//발주하기-페이지이동과 고객검색용 메소드
	@RequestMapping(value="selectOrderClient.do")
	public String orderPageMethod(@RequestParam("emp_no") String emp_num, Model model) {
		logger.info("발주하기 페이지  run....");

		return "order/order";
	}
	
	//매출현황 페이지 이동 메소드 
	@RequestMapping(value="orderList.do")
	public String orderListPage() {
		return "order/orderList";
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
		//System.out.println("orderController:"+sendJson);
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
			//jsonobject.put("product_availability", product.getProduct_availavility());
			
			jarr.add(jsonobject);
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("plist", jarr);
		
		response.setContentType("application/json; charset=utf-8");	
		//System.out.println("orderProductController:"+sendJson);
		PrintWriter out=response.getWriter();
		out.println(sendJson.toJSONString());
		out.flush();
		out.close();
	
	}
	
	@RequestMapping(value="insertorder.do", method=RequestMethod.POST)
	public String insertOrderlist(HttpServletRequest request, Order orderlist) throws IOException{
		logger.info("주문 등록 메소드 run...");
		request.getParameter("order_price");
		
		int order_no = orderService.selectOrderMaxNo();
		System.out.println("orderNo : " + order_no);
		//System.out.println(request.getParameter("emp_no")+","+request.getParameter("client_no"));
		int emp_no = Integer.parseInt(request.getParameter("emp_no"));
		int client_no = Integer.parseInt(request.getParameter("client_no"));
		
		int contract_discount = contractService.selectDiscount(client_no);
	//	System.out.println("contract_discount : " + contract_discount);
		
		String productNo[] = request.getParameterValues("product_no");
		String orderPrice[] = request.getParameterValues("order_price");
		String amountlist[] = request.getParameterValues("order_amount");
		
		for(int i=0; i < orderPrice.length; i++) {
			System.out.println("no:"+productNo[i]+" ,price : " + orderPrice[i] + " , amount : " + amountlist[i]);
		
			orderlist.setOrder_no(order_no);
			orderlist.setOrder_amount(Integer.parseInt(amountlist[i]));
			orderlist.setOrder_price(Integer.parseInt(orderPrice[i])*(1-contract_discount/100.0));
			orderlist.setProduct_no(Integer.parseInt(productNo[i]));		

			System.out.println("orderlist 111: " + orderlist.toString());
			int result = orderService.insertOrderList(orderlist);
			System.out.println("등록!!!  : " + result);
		
		}
		
	//	orderService.insertOrderList(olist);

		
		return "order/order";
	}
	
	

}
