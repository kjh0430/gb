package com.crm.gb.contract.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.crm.gb.client.model.service.ClientService;
import com.crm.gb.client.model.vo.Client;
import com.crm.gb.contract.model.service.ContractService;
import com.crm.gb.contract.model.vo.Contract;

@Controller
public class ContractController {

	private static final Logger logger = LoggerFactory.getLogger(ContractController.class);
	
	@Autowired
	private ContractService contractService;
	@Autowired
	private ClientService clientService;
	
	
	/** 계약리스트  */
	@RequestMapping("contractList.do")
	public String contractList(Contract contract, Model model,
			@RequestParam(value="emp_no") int emp_no) {
		logger.info("계약리스트 메소드 실행");
		ArrayList<Contract> returnList=contractService.selectAllList(emp_no);
		model.addAttribute("contractList", returnList );
		return "contract/contractList";
	}
	
	/** 계약서 작성 페이지 */
	@RequestMapping("contractView.do")
	public String contractView(Client client, Model model, 
			@RequestParam(value="client_no") int client_no) {
		logger.info("계약서 작성페이지 실행됨");
		Client returnClient=clientService.selectClient(client_no);	//고객정보 조회
		model.addAttribute("detailClient", returnClient);
		return "contract/contract";
	}
	
	/** 게약서 등록 메소드 */
	@RequestMapping("insertContract.do")
	public String insertContract(Client client, Contract contract, Model model, 
			@RequestParam(value="emp_no") int emp_no,
			@RequestParam(value="client_no") int client_no) {
		logger.info("계약서 등록버든 실행됨");
			
			System.out.println("받아온 계약정보: "+contract);
		
		contractService.insertContract(contract);	// 계약등록
		clientService.updateClientContract(client_no);	// 계약상태 Y로 변경
		
		ArrayList<Contract> returnList=contractService.selectAllList(emp_no);
		model.addAttribute("contractList", returnList );
		
		return "contract/contractList";
	}
	
}
