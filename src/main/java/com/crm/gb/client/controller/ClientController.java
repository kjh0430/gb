package com.crm.gb.client.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.crm.gb.client.model.service.ClientService;
import com.crm.gb.client.model.vo.Client;
import com.crm.gb.client.model.vo.ClientFile;

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
	@RequestMapping("addClient.do")
	public String addClient() {
		return "client/addClient2";
	}
	
	/** 신규고객 등록 메소드 */
	@RequestMapping(value="insertClient.do", method=RequestMethod.POST)
	public String insertClient(Client client, ClientFile clientFile, Model model, HttpServletRequest request,
			MultipartHttpServletRequest mtfRequest) {
		
		logger.info("고객등록 메소드 실행됨");
			System.out.println("client객체 확인: "+client);
		//고객정보 추가부분	
		int result=clientService.insertClient(client);
//		ArrayList<Client> clientList=clientService.selectAllClient();
//		model.addAttribute("clientList", clientList);
		
		//이메일로 방금전 등록된 고객정보 조회
		client=clientService.selectClient(client);
		
		//고객관련 파일추가부분
				int client_no = client.getClient_no();
				clientFile.setClient_no(client_no);
				
				String path = request.getSession().getServletContext().getRealPath("resources/upload/client");
				List<MultipartFile> filelist=mtfRequest.getFiles("client_file");
				//MultipartFile mfile = mtfRequest.getFile("client_file");
				int idx=0;
				for(MultipartFile mfile : filelist) {
					
					try {
						mfile.transferTo(new File(path+"/"+mfile.getOriginalFilename()));
						String originalFileName = mfile.getOriginalFilename();
						
						SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
						String renameFileName = client_no + "_" + sdf.format(new java.sql.Date(System.currentTimeMillis()))
								+ idx+"." + mfile.getOriginalFilename().substring(mfile.getOriginalFilename().lastIndexOf(".") + 1);
						idx++;
						
						clientFile.setClient_original_file(originalFileName);
						clientFile.setClient_rename_file(renameFileName);
						clientFile.setClient_no(client_no);
						
						
					    File originFile = new File(path + "/" + mfile.getOriginalFilename());
			            File renameFile = new File(path + "/" + renameFileName);
			            
			            if (!originFile.renameTo(renameFile)) {
			                int read = -1;
			                byte[] buf = new byte[1024];
			                // 원본을 읽기 위한 파일스트림 생성
			                FileInputStream fin = new FileInputStream(originFile);
			                // 읽은 내용 기록할 복사본 파일 출력용 파일스트림 생성
			                FileOutputStream fout = new FileOutputStream(renameFile);
			
			                // 원본 읽어서 복사본에 기록 처리
			                while ((read = fin.read(buf, 0, buf.length)) != -1) {
			                   fout.write(buf, 0, read);
			                }
			                fin.close();
			                fout.close();
			                originFile.delete(); // 원본파일 삭제            
				            
						}
			            
			            System.out.println("clientFile정보 : "+clientFile);
						int resultFile=clientService.insertClientFile(clientFile);
						
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}			
				}
				
				ArrayList<Client> clientList=clientService.selectAllClient();
				model.addAttribute("clientList", clientList);
		
		return "client/clientList";
	}
	
	/** 등록된 고객리스트 메소드 */
	@RequestMapping("clientList.do")
	public String showClient(Client client, Model model) {
		logger.info("고객리스트 메소드 실행됨");
		ArrayList<Client> clientList=clientService.selectAllClient();
		model.addAttribute("clientList", clientList);
		
		return "client/clientList";
	}
	
	/** 거래중인 거래처 리스트 메소드 **/
	@RequestMapping("accountList.do")
	public String shoeAccountClient(@RequestParam("emp_no") String emp_num, Model model) {
		logger.info("거래처 리스트 메소드 실행됨!!");
		int emp_no = Integer.parseInt(emp_num);
		System.out.println("emp_no : " + emp_no);
		ArrayList<Client> accountClientList = clientService.selectAccountClientList(emp_no);
		model.addAttribute("accountClientList", accountClientList);
		System.out.println("accountClientList : " +accountClientList.toString());
		return "client/accountList";
	}
	
	/** 잠재고객 리스트 메소드 */
	@RequestMapping("poList.do")
	public String poList(Client client, Model model) {
		logger.info("잠재고객 리스트 메소드 실행됨");
		ArrayList<Client> poList = clientService.selectPoList();
		model.addAttribute("poList", poList);
		
		return "client/poList";
	}
	
	/** 고객정보 상세보기 메소드 */
	@RequestMapping("detailClient.do")
	public String detailClient(Client client, Model model, 
			ArrayList <ClientFile> clientFile, @RequestParam(value="client_no") String client_num) {
		logger.info("고객정보 상세보기 메소드 실행됨");
		
		int client_no=Integer.parseInt(client_num);
		System.out.println("고객번호: "+client_no);	
		Client returnClient=clientService.selectClient(client_no);	//고객정보 조회
		clientFile = clientService.selectClientFileList(client_no);	//고객 첨부파일 조회
		
			System.out.println("상세보기 정보: "+returnClient);
		model.addAttribute("detailClient", returnClient);
		model.addAttribute("clientFileList", clientFile);
		
		return "client/poList_detail";
	}
	
	/** 고객정보 삭제 메소드 */
	@RequestMapping("deleteClient.do")
	public String deleteClient(@RequestParam(value="client_no") String client_num,
				Client client, Model model) {
		logger.info("고객정보 삭제 메소드 실행됨");
		int client_no=Integer.parseInt(client_num);
		int result=clientService.updateDelClient(client_no);
			System.out.println("삭제결과 실행: "+result);
			
		ArrayList<Client> clientList=clientService.selectAllClient();
		model.addAttribute("clientList", clientList);	
			
		return "client/clientList";
	}
	

	/** 고객정보 수정 메소드 */
	@RequestMapping("updateClient.do")
	public String updateClient(Client client, Model model, @RequestParam("client_no") String cNum) {
		logger.info("고객정보 수정메소드 실행됨");
		int client_no=Integer.parseInt(cNum);
			System.out.println("받아온 고객번호: "+client_no);
		
		int resultClient=clientService.updateClient(client);	//고객정보 수정
			System.out.println("고객정보 수정결과: "+resultClient);
			
		Client returnClient=clientService.selectClient(client_no);
		model.addAttribute("detailClient", returnClient);
		
		return "client/poList_detail";
	}
	
	/** 고객 첨부파일 다운로드 메소드 */
	@RequestMapping("clientFileDown.do")
	public ModelAndView fileDownMethod(HttpServletRequest request,
				@RequestParam("clientFileName") String fileName) {
		
		//경로를 저장하고
		String path=request.getSession().getServletContext().getRealPath("resources/upload/client");
		//경로와 파일이름을 연결
		String filePath=path+"/"+fileName;
		//File 객체생성 
		File downFile=new File(filePath);
								//viewname(bean id명)과 modelname, model객체(저장한 파일객체)를 입력한다
								//string: downfile, object : downFile로 filedownview클래스로 전송됨
		return new ModelAndView("clientFileDown", "clientFile", downFile );
		
		
	}
	
}





