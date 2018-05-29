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
import com.crm.gb.emp.model.service.EmpService;
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
	
	
	
	@RequestMapping(value="searchCom.do", method=RequestMethod.POST)
	public void searchCom(@RequestParam(name="searchComName") String client_company,@RequestParam(name="emp_no") String empNo, Client clientInfo ,HttpServletResponse response) throws IOException{
		logger.info("발주하기-고객검색 메소드 run....");
		
		
		int emp_no = Integer.parseInt(empNo);
		
		clientInfo.setClient_company(client_company);
		clientInfo.setEmp_no(emp_no);
		
		//System.out.println("clientInfo : " + clientInfo);

		ArrayList<Client> SearchCom = clientService.selectSearchAccount(clientInfo);
		JSONArray jarr = new JSONArray();
		
		for(Client client : SearchCom) {
			JSONObject jsonobject = new JSONObject();
			jsonobject.put("client_no", client.getClient_no());
			jsonobject.put("client_company", client.getClient_company());
			jsonobject.put("client_phone", client.getClient_phone());
			jsonobject.put("client_addr", client.getClient_addr());
			jsonobject.put("contract_discount", client.getContract_discount());
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
	public void searchProduct(@RequestParam(name="searchProductName") String product_name,@RequestParam(name="client_no") String clientNo, HttpServletResponse response) throws IOException{
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
		//System.out.println("orderNo : " + order_no);
		//System.out.println(request.getParameter("emp_no")+","+request.getParameter("client_no"));
		int emp_no = Integer.parseInt(request.getParameter("emp_no"));
		//System.out.println("emp_no : " + emp_no);
		int client_no = Integer.parseInt(request.getParameter("client_no"));
		//System.out.println("client_no : " + client_no);
		int contract_discount = contractService.selectDiscount(client_no);
		//System.out.println("contract_discount : " + contract_discount);
		
		String productNo[] = request.getParameterValues("product_no");
		String orderPrice[] = request.getParameterValues("order_price");
		String amountlist[] = request.getParameterValues("order_amount");
		
		for(int i=0; i < orderPrice.length; i++) {
			//System.out.println("no:"+productNo[i]+" ,price : " + orderPrice[i] + " , amount : " + amountlist[i]);
		
			orderlist.setOrder_no(order_no);
			orderlist.setOrder_amount(Integer.parseInt(amountlist[i]));
			orderlist.setOrder_price((int)(Integer.parseInt(orderPrice[i])*(1-contract_discount/100.0)));
			orderlist.setProduct_no(Integer.parseInt(productNo[i]));		

			//System.out.println("orderlist 111: " + orderlist.toString());
			int result = orderService.insertOrderList(orderlist);
			//System.out.println("등록!!!  : " + result);
		
		}
		
	//	orderService.insertOrderList(olist);

		
		return "order/order";
	}
	
	//매출현황 페이지 메소드 
		@RequestMapping(value="orderList.do")
		public String orderListPage(Model model){
			
			logger.info("매출현황 메소드 run...");
			//int emp_no = Integer.parseInt(empNo);
			
			ArrayList<Order> orderList = orderService.selectAllOrderList();
			System.out.println("orderList: " + orderList.get(0).toString());
			model.addAttribute("orderList", orderList);
//			
			return "order/orderList";
		}
		
	//orderlist 상세보기 	
		@RequestMapping(value="orderdetail.do")
		public String orderDetailPage(Order order, Model model ,Model model2, Model model3) {
			logger.info("주문 상세보기 메소드 run...");
			
		
			ArrayList<Order> orderList = orderService.selectOrderList2(order);
			//System.out.println("orderList : " + orderList);
			model.addAttribute("orderList",orderList);
		
			order.setClient_no(orderList.get(0).getClient_no());
			//order.setEmp_name(orderList.get(0).getEmp_name());
			
			//System.out.println("order : " + order);			
	
			//고객 정보 전달용 
			Client clientInfo = clientService.selectOrderClient(order);
			//System.out.println("clientInfo : " + clientInfo);
			model2.addAttribute("clientInfo",clientInfo);
			
			//주문 상품 금액 합계 전달용 
			int price=0;
			for(int i=0; i < orderList.size(); i++) {
				price += orderList.get(i).getOrder_price() * orderList.get(i).getOrder_amount();
			}
			
			//System.out.println("price : " + price);
			model3.addAttribute("price",price);
			
			return "order/orderDetail";
		}
		
		
	
	
	

}
