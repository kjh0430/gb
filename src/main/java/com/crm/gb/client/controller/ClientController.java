package com.crm.gb.client.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.crm.gb.client.model.service.ClientService;
import com.crm.gb.client.model.vo.Client;

/**
 * Handles requests for the application home page.
 */

@Controller
//@SessionAttributes("loginEmp")
public class ClientController {
	
	private static final Logger logger = LoggerFactory.getLogger(ClientController.class);
	
	@Autowired
	private ClientService clientService;
	
	
	/** 신규고객 등록 화면이동 */
	@RequestMapping("MoveaddClient.do")
	public String addClient() {
		return "client/addClient";
	}
	
	/** 신규고객 등록 메소드 */
	@RequestMapping(value="insertClient.do", method=RequestMethod.POST)
	public String insertClient(Client client, Model model) {
		
		logger.info("고객등록 메소드 실행됨");
			System.out.println("client객체 확인: "+client);
		int result=clientService.insertClient(client);
		ArrayList<Client> clientList=clientService.selectAllClient();
		model.addAttribute("clientList", clientList);
		
		return "client/clientList";
	}
	
	/** 등록된 고객리스트 메소드 */
	@RequestMapping("MoveclientList.do")
	public String showClient(Client client, Model model) {
		logger.info("고객리스트 메소드 실행됨");
		ArrayList<Client> clientList=clientService.selectAllClient();
		model.addAttribute("clientList", clientList);
		
		return "client/clientList";
	}
	
	/** 잠재고객 리스트 메소드 */
	@RequestMapping("MovepoList.do")
	public String poList(Client client, Model model) {
		logger.info("잠재고객 리스트 메소드 실행됨");
		ArrayList<Client> poList = clientService.selectPoList();
		model.addAttribute("poList", poList);
		
		return "client/poList";
	}
	
	/** 고객정보 상세보기 메소드 */
	@RequestMapping("detailClient.do")
	public String detailClient(Client client, Model model, @RequestParam(value="client_no") String client_num) {
		logger.info("고객정보 상세보기 메소드 실행됨");
		
		int client_no=(Integer.parseInt(client_num));
		System.out.println("고객번호: "+client_no);	
		Client returnClient=clientService.selectClient(client_no);
		
		System.out.println("상세보기 정보: "+returnClient);
		model.addAttribute("detailClient", returnClient);
		
		return "client/poList_detail";
	}
	
	/** 고객정보 삭제 메소드 */
	@RequestMapping("deleteClient.do")
	public String deleteClient(@RequestParam(value="client_no") String client_num,
				Client client, Model model) {
		
		int client_no=Integer.parseInt(client_num);
		int result=clientService.deleteClient(client_no);
			System.out.println("삭제결과 실행: "+result);
			
		ArrayList<Client> clientList=clientService.selectAllClient();
		model.addAttribute("clientList", clientList);	
			
		return "client/clientList";
	}
	
}





