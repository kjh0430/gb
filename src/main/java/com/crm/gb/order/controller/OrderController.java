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
import com.crm.gb.emp.model.vo.Emp;
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
		System.out.println("client_company : " + client_company);
		
		clientInfo.setClient_company(client_company);
		clientInfo.setEmp_no(emp_no);
		
		System.out.println("clientInfo : " + clientInfo);

		ArrayList<Client> SearchCom = clientService.selectSearchAccount(clientInfo);
		JSONArray jarr = new JSONArray();
		System.out.println("SearchCom : "+SearchCom);
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
		//System.out.println("222 : "+(1.0-contract_discount/100.0));
		String productNo[] = request.getParameterValues("product_no");
		String orderPrice[] = request.getParameterValues("order_price");
		String amountlist[] = request.getParameterValues("order_amount");
		
		for(int i=0; i < orderPrice.length; i++) {
			//System.out.println("no:"+productNo[i]+" ,price : " + orderPrice[i] + " , amount : " + amountlist[i]);
		
			orderlist.setOrder_no(order_no);
			orderlist.setOrder_amount(Integer.parseInt(amountlist[i]));
			orderlist.setOrder_price((int)((Integer.parseInt(orderPrice[i]))));
			//System.out.println("444444444444 : " + (Integer.parseInt(orderPrice[i])));
			//System.out.println("33333333333 : "+(int)((Integer.parseInt(orderPrice[i])*(1.0-contract_discount/100.0))));
			orderlist.setProduct_no(Integer.parseInt(productNo[i]));		

			//System.out.println("orderlist 111: " + orderlist.toString());
			int result = orderService.insertOrderList(orderlist);
			System.out.println("발주 등록 성공!! : " + result);
			int amountResult = productService.updateProductAmount(orderlist);
			System.out.println("재고 수량 업데이트!!!  : " + amountResult);
		
		}
		
	//	orderService.insertOrderList(olist);

		
		return "order/order";
	}
	
	//매출현황 페이지 메소드 
		@RequestMapping(value="orderList.do")
		public String orderListPage(@RequestParam(value="client_company") String client_company, Model model, Order order, @RequestParam(value="page") int page){
			
			logger.info("매출현황 메소드 run...");
			//int emp_no = Integer.parseInt(empNo);
			
			//페이지 기본값 지정
			int currentPage=page;				
			//한 페이지당 출력할 목록갯수 지정
			int pageSize=10;
			int pageGroupSize=5;		
			String searchCom = client_company;
			if(searchCom.equals("null") || searchCom==null) {
				searchCom = null;
			}
			//System.out.println("searchCom 1: "+searchCom );
			order.setSearchCom(searchCom);
			//System.out.println("order : " + order);
			int listCount_1 = orderService.orderListCount(order);
			//int listCount_2 = listCount_1.getOrder_list_count();
			//System.out.println("listCount : " + listCount_1);
			
			//페이지수 계산 
			int maxPage=(int)((double)listCount_1/pageSize+0.9);				
			//페이지 번호 갯수 출력 					
			
			int curBlock=(currentPage-1)/pageGroupSize+1;//원하는 페이지가 몇번째 블록인지계산
			int totBlock=(int)Math.ceil(maxPage*1.0)/pageGroupSize+1;//총 블록 갯수
			
			
			//블록의 시작 페이지와 끝 페이지 번호 계산
			int blockBegin=(curBlock-1)*pageGroupSize+1;
			int blockEnd=blockBegin+pageGroupSize-1;
			//[이전][다음] 을 눌렀을떄 이동할 페이지 번호
			int prevBlock=(curBlock==1)?1:(curBlock-1)*pageGroupSize;
			int nextBlock=curBlock>totBlock?(curBlock*pageGroupSize):(curBlock*pageGroupSize)+1;
			
			if(nextBlock>=totBlock) {
				nextBlock=totBlock;
			}				
			
			//마지막 페이지 번호가 범위를 초과하지 않도록 처리 
			if(maxPage<blockEnd)
				blockEnd=maxPage;
			
			int startPage=(currentPage-1)*pageSize+1;
			int endPage=startPage+pageSize-1;
			
//				
			order.setStartPage(startPage);
			order.setEndPage(endPage);
			
			
			//System.out.println("order : " + order);
			ArrayList<Order> orderList = orderService.selectAllOrderList(order);
			//System.out.println("orderList: " + orderList.get(0).toString());
			model.addAttribute("orderList", orderList);
			model.addAttribute("listCount",listCount_1);
			model.addAttribute("currentPage",currentPage);
			model.addAttribute("pageGroupSize",pageGroupSize);		
			model.addAttribute("startPage",startPage);
			model.addAttribute("endPage",endPage);
			model.addAttribute("maxPage",maxPage);
			model.addAttribute("blockBegin",blockBegin);
			model.addAttribute("blockEnd",blockEnd); 
			model.addAttribute("curBlock",curBlock);
			model.addAttribute("totBlock",totBlock);
			model.addAttribute("prevBlock",prevBlock);
			model.addAttribute("nextBlock",nextBlock);
			model.addAttribute("searchCom",searchCom);
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
		
		
	//main _ 제품별 주문량 차트
	@RequestMapping(value="productShare.do", method=RequestMethod.POST)
	public void productShare(Order order,HttpServletResponse response) throws IOException {
		ArrayList<Order> orderProduct  = orderService.productShare();
		System.out.println(orderProduct);
		JSONArray jarr = new JSONArray();
		
		for(Order o : orderProduct) {
			JSONObject job = new JSONObject();
			job.put("product_name", o.getProduct_name());
			job.put("total", o.getTotal());
			jarr.add(job);
		}
		
		JSONObject sendJson = new JSONObject();
		sendJson.put("list", jarr);
		
		response.setContentType("application/json; charset=utf-8");	
		//System.out.println("orderProductController:"+sendJson);
		PrintWriter out=response.getWriter();
		out.println(sendJson.toJSONString());
		out.flush();
		out.close();
	
	}
	
	@RequestMapping(value="mainCount.do", method=RequestMethod.POST)
	public void mainCount(@RequestParam(value="emp_no") String empNo,@RequestParam(value="job_no") String jobNo,Emp emp,Order order,HttpServletResponse response) throws IOException{
		logger.info("main count 메소드 실행...");
		int job_no = Integer.parseInt(jobNo);
		int emp_no = Integer.parseInt(empNo);
		emp.setJob_no(job_no);
		emp.setEmp_no(emp_no);
		//System.out.println("emp_no : " + emp_no);
		int order_sum = orderService.selectOrderSum(emp);
		int order_avg = orderService.selectselectOrderAvg(emp);
		String goal_state = orderService.selectGoalState(emp);
		//JSONArray jarr = new JSONArray();
		JSONObject job = new JSONObject();
		job.put("order_sum", order_sum);
		job.put("order_avg", order_avg);
		job.put("goal_state", goal_state);
		//jarr.add(job);
		//System.out.println("jarr : " + jarr.toString());
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
	
		out.println(job.toJSONString());
		out.flush();
		out.close();
	}
	
	

}
