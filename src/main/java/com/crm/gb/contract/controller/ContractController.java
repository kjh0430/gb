package com.crm.gb.contract.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Date;
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

import com.crm.gb.client.model.service.ClientService;
import com.crm.gb.client.model.vo.Client;
import com.crm.gb.contract.model.service.ContractService;
import com.crm.gb.contract.model.vo.Contract;
import com.crm.gb.contract.model.vo.ContractSearchList;

@Controller
public class ContractController {

	private static final Logger logger = LoggerFactory.getLogger(ContractController.class);
	
	@Autowired
	private ContractService contractService;
	@Autowired
	private ClientService clientService;
	
	/** 계약된 고객수 */
	@RequestMapping(value="countContract.do", method=RequestMethod.POST)
	public void countContract(@RequestParam(value="emp_no") int emp_no, HttpServletResponse response) 
		throws IOException{
		int contractCount = contractService.selectCountContract(emp_no);
			System.out.println("계약된 고객수: "+contractCount);
		JSONObject job = new JSONObject();
			job.put("contractCount", contractCount);
			
			PrintWriter out = response.getWriter();
				out.print(job.toJSONString());
				out.flush();
				out.close();
			
	}
	
	/** 계약리스트 검색 */
	@RequestMapping(value="searchContractList.do", method=RequestMethod.POST)
	public void searchContractList(Contract contract, ContractSearchList contractSearch,
			@RequestParam(value="emp_no") int emp_no,
			@RequestParam(value="client_name") String clientName,
			@RequestParam(value="startPage", defaultValue="1") int startPage,
			Model model,
			HttpServletResponse response) throws IOException{
		
		logger.info("계약리스트 검색 실행됨");

		ArrayList<Contract> returnList=contractService.selectAllList(emp_no);
		
		contractSearch.setShowPage(10); //보여줄 페이지 수
		contractSearch.setTotalRow(returnList.size());	// 총 회원 수
		contractSearch.setStart(startPage);	// 시작페이지
		
		int showPage = contractSearch.getShowPage();
		int totalRow = contractSearch.getTotalRow();
		int start = (contractSearch.getStart() - 1)*showPage+1;
		int end = start+9;
		int currentPage = 1;

		contractSearch.setStartRow(start);	// 시작 열
		contractSearch.setEndRow(end);	// 끝 열
		
		if(totalRow%showPage != 0) {	// 끝페이지
			contractSearch.setEnd((totalRow/showPage)+1);
		}else {
			contractSearch.setEnd(totalRow/showPage);
		}
		
		contractSearch.setEmp_no(emp_no);
		contractSearch.setClient_name(clientName);
		
		ArrayList<Contract> list = contractService.selectContractList(contractSearch);
			
		JSONArray jarr = new JSONArray();
		
		for(Contract c : list) {
			
			JSONObject job = new JSONObject();
				job.put("client_no", c.getClient_no());
				job.put("client_name", URLEncoder.encode(c.getClient().getClient_name(), "utf-8"));
				job.put("client_company", URLEncoder.encode(c.getClient().getClient_company(), "utf-8"));
				job.put("client_phone", c.getClient().getClient_phone());
				job.put("contract_discount", c.getContract_discount());
				job.put("contract_money", c.getContract_money());
				job.put("contract_start", c.getContract_date_start().toString());
				job.put("contract_end", c.getContract_date_end().toString());
				
				jarr.add(job);
				
				
		}
		
		
		response.setContentType("application/json; charset=utf-8");
		JSONObject result = new JSONObject();
			result.put("list", jarr);
		PrintWriter out = response.getWriter();
			out.print(result.toJSONString());
			out.flush();
			out.close();
		
		
	}
	
	/** 계약리스트  */
	@RequestMapping("contractList.do")
	public String contractList(Contract contract, Model model,
			@RequestParam(value="emp_no") int emp_no,
			@RequestParam(value="startPage", defaultValue="1") int startPage,
			HttpServletResponse response) {
		logger.info("계약리스트 메소드 실행");
		ArrayList<Contract> returnList=contractService.selectAllList(emp_no);
		
		contract.setShowPage(10); //보여줄 페이지 수
		contract.setTotalRow(returnList.size());	// 총 회원 수
		contract.setStart(startPage);	// 시작페이지
		
		int showPage = contract.getShowPage();
		int totalRow = contract.getTotalRow();
		int start = (contract.getStart() - 1)*showPage+1;
		int end = start+9;
		int currentPage = 1;

		contract.setStartRow(start);	// 시작 열
		contract.setEndRow(end);	// 끝 열
		
		if(totalRow%showPage != 0) {	// 끝페이지
			contract.setEnd((totalRow/showPage)+1);
		}else {
			contract.setEnd(totalRow/showPage);
		}
		
		ArrayList<Contract> list = contractService.selectPageList(contract);
		
		model.addAttribute("contractPageList", list );
		model.addAttribute("start", currentPage);
		model.addAttribute("end", contract.getEnd());
		
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
			@RequestParam(value="client_no") int client_no,
			@RequestParam(value="client_Sign") String client_Sign,
			@RequestParam(value="emp_Sign") String emp_Sign,
			@RequestParam(value="startPage", defaultValue="1") int startPage,
			HttpServletResponse response) {
		
		logger.info("계약서 등록버든 실행됨");
		
		contract.setClient_sign(client_Sign);
		contract.setEmp_sign(emp_Sign);
		
			System.out.println("받아온 계약정보: "+contract);
		
		contractService.insertContract(contract);	// 계약등록
		clientService.updateClientContract(client_no);	// 계약상태 Y로 변경
		
		ArrayList<Contract> returnList=contractService.selectAllList(emp_no);
		
			contract.setShowPage(10); //보여줄 페이지 수
			contract.setTotalRow(returnList.size());	// 총 회원 수
			contract.setStart(startPage);	// 시작페이지
			
			int showPage = contract.getShowPage();
			int totalRow = contract.getTotalRow();
			int start = (contract.getStart() - 1)*showPage+1;
			int end = start+9;
			int currentPage = 1;
	
			contract.setStartRow(start);	// 시작 열
			contract.setEndRow(end);	// 끝 열
			
			if(totalRow%showPage != 0) {	// 끝페이지
				contract.setEnd((totalRow/showPage)+1);
			}else {
				contract.setEnd(totalRow/showPage);
			}
			
			ArrayList<Contract> list = contractService.selectPageList(contract);
			
			model.addAttribute("contractPageList", list );
			model.addAttribute("start", currentPage);
			model.addAttribute("end", contract.getEnd());
		
		return "contract/contractList";
	}
	
	/** 계약정보 상세보기 */
	@RequestMapping("contractDetail.do")
	public String contractDetail(Contract contract, Model model, 
			@RequestParam(value="client_no") int client_no) {
		
		contract = contractService.selectContractDetail(client_no);
		model.addAttribute("contractDetail", contract);
		
		return "contract/contract_detail";
	}
}
