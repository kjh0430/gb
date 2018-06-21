package com.crm.gb.client.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.crm.gb.client.model.service.ClientService;
import com.crm.gb.client.model.vo.Client;
import com.crm.gb.client.model.vo.ClientFile;
import com.crm.gb.dailywork.model.service.DailyworkService;
import com.crm.gb.dailywork.model.vo.Dailywork;
import com.crm.gb.emp.model.vo.Emp;

/**
 * Handles requests for the application home page.
 */

@Controller
//@SessionAttributes("loginEmp")
public class ClientController {
	
	private static final Logger logger = LoggerFactory.getLogger(ClientController.class);
	
	@Autowired
	private ClientService clientService;
	@Autowired
	private DailyworkService dailyworkService;
	
	/** 신규고객 등록 화면이동 */
	@RequestMapping("addClient.do")
	public String addClient() {
		return "client/addClient2";
	}
	
	/** 고객 파일삭제 메소드 */
	@RequestMapping(value="updateClientFile.do", method=RequestMethod.POST)
	public void updateClientFile(ClientFile clientFile, HttpServletResponse response,
			@RequestParam(value="client_file_no") int client_file_no) throws IOException{
			
			System.out.println("받아온 파일번호 : "+client_file_no);
		
		int result=clientService.deleteClientFile(client_file_no);
			System.out.println("파일삭제 결과:"+result);
			
		if(result > 0) {	
			
		PrintWriter out = response.getWriter();
			out.print("ok");
			out.flush();
			out.close();
		}
			
	}
	
	/** 신규고객 등록 메소드 */
	@RequestMapping(value="insertClient.do", method=RequestMethod.POST)
	public String insertClient(Client client, ClientFile clientFile, Model model, HttpServletRequest request,
			MultipartHttpServletRequest mtfRequest,
			@RequestParam(value="startPage", defaultValue="1") int startPage,
			@RequestParam(value="emp_no") int emp_no,
			@RequestParam(value="client_name", defaultValue="") String client_name,
			HttpServletResponse response) throws IOException{
		
		logger.info("고객등록 메소드 실행됨");
			System.out.println("client객체 확인: "+client);
		//고객정보 추가부분	
		int result=clientService.insertClient(client);
//		ArrayList<Client> clientList=clientService.selectAllClient();
//		model.addAttribute("clientList", clientList);
		
		//이메일로 방금전 등록된 고객정보 조회
		client=clientService.selectClient(client);
		
		//고객관련 파일추가부분
				List<MultipartFile> filelist=mtfRequest.getFiles("client_file");
				String path = request.getSession().getServletContext().getRealPath("resources/upload/client");
				int idx=0;
				if(filelist.size() != 0) {
				
					int client_no = client.getClient_no();
					clientFile.setClient_no(client_no);
					
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
				
			}//if close
				client.setEmp_no(emp_no);
				
				ArrayList<Client> ppList = clientService.selectAllClient(client);
				
				client.setClient_name(client_name);
				
				client.setShowPage(10); //보여줄 페이지 수
				client.setTotalRow(ppList.size());	// 총 회원 수
				client.setStart(startPage);	// 시작페이지
				
				int showPage = client.getShowPage();
				int totalRow = client.getTotalRow();
				int start = (client.getStart() - 1)*showPage+1;
				int end = start+9;
				int currentPage = 1;

				client.setStartRow(start);	// 시작 열
				client.setEndRow(end);	// 끝 열
				
				if(totalRow%showPage != 0) {	// 끝페이지
					client.setEnd((totalRow/showPage)+1);
				}else {
					client.setEnd(totalRow/showPage);
				}
				
				ArrayList<Client> pList = clientService.selectAllClient(client);
				
				model.addAttribute("pageList", pList);
				model.addAttribute("start", currentPage);
				model.addAttribute("end", client.getEnd());
		
				
		return "client/clientList";
	}
	
	
	/** 등록된 고객리스트 메소드 */
	@RequestMapping("clientList.do")
	public String showClient(Client client, Model model,
			@RequestParam(value="startPage", defaultValue="1") int startPage,
			@RequestParam(value="client_name", defaultValue="") String client_name,
			@RequestParam(value="emp_no") int emp_no) throws IOException{
		logger.info("고객리스트 메소드 실행됨");
		
		ArrayList<Client> ppList = clientService.selectPageClient(client);
		
		client.setEmp_no(emp_no);
		client.setClient_name(client_name);
		client.setShowPage(10); //보여줄 페이지 수
		client.setTotalRow(ppList.size());	// 총 회원 수
		client.setStart(startPage);	// 시작페이지
		
		int showPage = client.getShowPage();
		int totalRow = client.getTotalRow();
		int start = (client.getStart() - 1)*showPage+1;
		int end = start+9;
		int currentPage = 1;

		client.setStartRow(start);	// 시작 열
		client.setEndRow(end);	// 끝 열
		
		if(totalRow%showPage != 0) {	// 끝페이지
			client.setEnd((totalRow/showPage)+1);
		}else {
			client.setEnd(totalRow/showPage);
		}
		
		System.out.println("maxPage: "+client.getEnd()+"검색 수: "+ppList.size());
		
		ArrayList<Client> pList = clientService.selectAllClient(client);
		
		model.addAttribute("pageList", pList);
		model.addAttribute("start", currentPage);
		model.addAttribute("end", client.getEnd());
		
		return "client/clientList";
	}
	
	/** 거래중인 거래처 리스트 메소드 **/
	@RequestMapping("accountList.do")
	public String showAccountClient(@RequestParam("emp_no") String emp_num, Model model, 
	@RequestParam(value="page") int page, Client client, @RequestParam(value="job_no") String jobNo,
	@RequestParam(value="client_company") String clientCompany) {
		logger.info("거래처 리스트 메소드 실행됨!!");
		
		int emp_no = Integer.parseInt(emp_num);
		int job_no = Integer.parseInt(jobNo);
		String client_company = clientCompany;
		
		if(client_company.equals("null") || client_company==null) {
			client_company = null;
		}
		
		client.setEmp_no(emp_no);
		client.setJob_no(job_no);
		client.setClient_company(client_company);
		//페이지 기본값 지정
		int currentPage=page;				
		//한 페이지당 출력할 목록갯수 지정
		int pageSize=10;
		int pageGroupSize=5;

	
		System.out.println("jobNo : " + job_no);
		System.out.println("page: " + page);
		System.out.println("client_company : " + client_company);
		
	
		
		int listCount_1 = clientService.clientListCount(client);
		System.out.println("count : " + listCount_1);
		//페이지수 계산 
		int maxPage=(int)((double)listCount_1/pageSize+0.9);				
		//페이지 번호 갯수 출력 					
		System.out.println("maxPage:" + maxPage);
		int curBlock=(currentPage-1)/pageGroupSize+1;//원하는 페이지가 몇번째 블록인지계산
		int totBlock=(int)Math.ceil(maxPage*1.0)/pageGroupSize+1;//총 블록 갯수
		System.out.println("totBlock : " + totBlock);
		
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
		
		//int startPage=(((int)((double)currentPage/pageSize+0.9))-1)*pageSize+1;
		int startPage=(currentPage-1)*pageSize+1;
		int endPage=startPage+pageSize-1;
		System.out.println("start : " + startPage +", end :" + endPage);
		client.setStartPage(startPage);
		client.setEndPage(endPage);
		client.setEmp_no(emp_no);
		
		//System.out.println("client : " + client);
		ArrayList<Client> accountClientList = clientService.selectAccountClientList(client);
		System.out.println("accountClientList"+accountClientList.size());
		model.addAttribute("accountClientList", accountClientList);
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
		model.addAttribute("client_company",client.getClient_company());
		return "client/accountList";
	}
	
	/** 잠재고객 리스트 메소드 */
	@RequestMapping("poList.do")
	public String poList(Client client, Model model,
			@RequestParam(value="startPage", defaultValue="1") int startPage,
			@RequestParam(value="client_name", defaultValue="") String client_name,
			@RequestParam(value="emp_no") int emp_no) throws IOException{
		
		logger.info("잠재고객 리스트 메소드 실행됨");
		
		ArrayList<Client> ppList = clientService.selectPoList(client);
		
		client.setClient_name(client_name);
		client.setEmp_no(emp_no);
		client.setShowPage(10); //보여줄 페이지 수
		client.setTotalRow(ppList.size());	// 총 회원 수
		client.setStart(startPage);	// 시작페이지
		
		int showPage = client.getShowPage();
		int totalRow = client.getTotalRow();
		int start = (client.getStart() - 1)*showPage+1;
		int end = start+9;
		int currentPage = 1;

		client.setStartRow(start);	// 시작 열
		client.setEndRow(end);	// 끝 열
		
		if(totalRow%showPage != 0) {	// 끝페이지
			client.setEnd((totalRow/showPage)+1);
		}else {
			client.setEnd(totalRow/showPage);
		}
		
		ArrayList<Client> pList = clientService.selectPoClient(client);
		
		model.addAttribute("pageList", pList);
		model.addAttribute("start", currentPage);
		model.addAttribute("end", client.getEnd());
		
		return "client/poList";
	}
	
	/** 고객정보 상세보기 메소드 */
	@RequestMapping("detailClient.do")
	public String detailClient(Client client, Model model, 
			ArrayList <ClientFile> clientFile, @RequestParam(value="client_no") int client_no,
			Dailywork dailyWork) {
		logger.info("고객정보 상세보기 메소드 실행됨");
		
		System.out.println("고객번호: "+client_no);	
		
		Client returnClient=clientService.selectClient(client_no);	//고객정보 조회
		clientFile = clientService.selectClientFileList(client_no);	//고객 첨부파일 조회
		ArrayList<Dailywork> list = dailyworkService.selectDailyHistory(client_no);	// 방문내역 리스트
			System.out.println("상세보기 정보: "+returnClient);
		
		model.addAttribute("detailClient", returnClient);
		model.addAttribute("clientFileList", clientFile);
		model.addAttribute("dailyHistoryList", list);
		
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
	
	/** 고객정보 수정페이지 이동 */
	@RequestMapping(value="updateClientView.do", method=RequestMethod.POST)
	public String updateClientView(Client client, Model model, @RequestParam("client_no") int client_no,
			ArrayList <ClientFile> clientFile) {
		Client returnClient=clientService.selectClient(client_no);
		clientFile = clientService.selectClientFileList(client_no);	//고객 첨부파일 조회
		ArrayList<Dailywork> list = dailyworkService.selectDailyHistory(client_no);	// 방문내역 리스트
		
		model.addAttribute("detailClient", returnClient);
		model.addAttribute("clientFileList", clientFile);
		model.addAttribute("dailyHistoryList", list);
		
		return "client/updateClient";
	}

	/** 고객정보 수정 메소드 */
	@RequestMapping("updateClient.do")
	public String updateClient(Client client, ArrayList <ClientFile> clientFile, ClientFile cFile,
			Model model, @RequestParam("client_no") int client_no, HttpServletRequest request,
			MultipartHttpServletRequest mtfRequest) throws IOException{
		logger.info("고객정보 수정메소드 실행됨");
			System.out.println("받아온 고객번호: "+client_no);
		
		int resultClient=clientService.updateClient(client);	//고객정보 수정
			System.out.println("고객정보 수정결과: "+resultClient);
		
			//고객관련 파일추가부분
			List<MultipartFile> filelist=mtfRequest.getFiles("client_file");
			String path = request.getSession().getServletContext().getRealPath("resources/upload/client");
			int idx=0;
			if(filelist.size() != 0) {
			
			for(MultipartFile mfile : filelist) {
				try {
					mfile.transferTo(new File(path+"/"+mfile.getOriginalFilename()));
					String originalFileName = mfile.getOriginalFilename();
					
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					String renameFileName = client_no + "_" + sdf.format(new java.sql.Date(System.currentTimeMillis()))
							+ idx+"." + mfile.getOriginalFilename().substring(mfile.getOriginalFilename().lastIndexOf(".") + 1);
					idx++;
					
					cFile.setClient_original_file(originalFileName);
					cFile.setClient_rename_file(renameFileName);
					cFile.setClient_no(client_no);
					
					
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
		            
		            System.out.println("clientFile정보 : "+cFile);
					int resultFile=clientService.insertClientFile(cFile);
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}			
			}
			
		}//if close	
			
		Client returnClient=clientService.selectClient(client_no);
		clientFile = clientService.selectClientFileList(client_no);	//고객 첨부파일 조회
	
		model.addAttribute("detailClient", returnClient);
		model.addAttribute("clientFileList", clientFile);
		
		return "client/poList_detail";
	}
	
	/** 고객 첨부파일 다운로드 메소드 */
	@RequestMapping("clientFileDown.do")
	public ModelAndView fileDownMethod(HttpServletRequest request,
				@RequestParam("clientFileName") String fileName,
				@RequestParam("oriName") String oriName) {
		
		//경로를 저장하고
		String path=request.getSession().getServletContext().getRealPath("resources/upload/client");
		//경로와 파일이름을 연결
		String filePath=path+"/"+fileName;
		String path2 = path+"/"+oriName;
		//File 객체생성 
		File downFile=new File(filePath);
		File oriFile = new File(path2);
		
		ModelAndView mov = new ModelAndView();
			mov.setViewName("clientFileDown");
			mov.addObject("clientFile", downFile);
			mov.addObject("oriName", oriFile);
		
								//viewname(bean id명)과 modelname, model객체(저장한 파일객체)를 입력한다
								//string: downfile, object : downFile로 filedownview클래스로 전송됨
		//return new ModelAndView("clientFileDown", "clientFile", downFile );
			return mov;
		
	}
	
	/** 등록된 고객리스트 검색 메소드 */
	@RequestMapping(value="searchClientList.do", method=RequestMethod.POST)
	public void searchClientList(Client client, HttpServletResponse response,
			@RequestParam(value="client_name", defaultValue="") String client_name,
			@RequestParam(value="startPage", defaultValue="1") int startPage,
			@RequestParam(value="emp_no") int emp_no) throws IOException{
		logger.info("고객검색 메소드 실행됨");
		
		ArrayList<Client> ppList = clientService.selectPageClient(client);
		
			client.setEmp_no(emp_no);
			client.setClient_name(client_name);
			client.setShowPage(10); //보여줄 페이지 수
			client.setTotalRow(ppList.size());	// 총 회원 수
			client.setStart(startPage);	// 시작페이지
			
			int showPage = client.getShowPage();
			int totalRow = client.getTotalRow();
			int start = (client.getStart() - 1)*showPage+1;
			int end = start+9;
			int currentPage = 1;
	
			client.setStartRow(start);	// 시작 열
			client.setEndRow(end);	// 끝 열
			
			if(totalRow%showPage != 0) {	// 끝페이지
				client.setEnd((totalRow/showPage)+1);
			}else {
				client.setEnd(totalRow/showPage);
			}
		
			System.out.println("maxPage: "+client.getEnd()+"검색 수: "+ppList.size());
			
		ArrayList<Client> sList = clientService.selectAllClient(client);
			
		JSONArray jarr = new JSONArray();
			
			for(Client c : sList) {
				JSONObject job = new JSONObject();
					job.put("client_no", c.getClient_no());
					job.put("client_name", URLEncoder.encode(c.getClient_name(), "utf-8"));
					job.put("client_company", URLEncoder.encode(c.getClient_company(), "utf-8"));
					job.put("client_job", URLEncoder.encode(c.getClient_job(), "utf-8"));
					job.put("client_email", c.getClient_email());
					job.put("client_phone", c.getClient_phone());
					job.put("client_addr", URLEncoder.encode(c.getClient_addr(), "utf-8"));
					
					jarr.add(job);
			}
			
				JSONObject resultJob = new JSONObject();
					resultJob.put("searchList", jarr);
					resultJob.put("maxPage", client.getEnd());
					
					response.setContentType("application/json; charset=utf-8");
					PrintWriter out = response.getWriter();
					
					out.print(resultJob.toJSONString());
					out.flush();
					out.close();
			
	}
	
	
	/** 등록된 잠재고객리스트 검색용 */
	@RequestMapping(value="searchPoList.do", method=RequestMethod.POST)
	public void searchPoList(Client client, HttpServletResponse response,
			@RequestParam(value="client_name", defaultValue="") String client_name,
			@RequestParam(value="startPage", defaultValue="1") int startPage,
			@RequestParam(value="emp_no") int emp_no) throws IOException{
		
		logger.info("잠재고객리스트 검색용");
		
		ArrayList<Client> poList = clientService.selectPoList(client);
		
		client.setEmp_no(emp_no);
		client.setClient_name(client_name);
		client.setShowPage(10); //보여줄 페이지 수
		client.setTotalRow(poList.size());	// 총 회원 수
		client.setStart(startPage);	// 시작페이지
		
		int showPage = client.getShowPage();
		int totalRow = client.getTotalRow();
		int start = (client.getStart() - 1)*showPage+1;
		int end = start+9;
		int currentPage = 1;

		client.setStartRow(start);	// 시작 열
		client.setEndRow(end);	// 끝 열
		
		if(totalRow%showPage != 0) {	// 끝페이지
			client.setEnd((totalRow/showPage)+1);
		}else {
			client.setEnd(totalRow/showPage);
		}
		
		ArrayList<Client> pList = clientService.selectPoClient(client);
		
		JSONArray jarr = new JSONArray();
		
		for(Client c : pList) {
			JSONObject job = new JSONObject();
				job.put("client_no", c.getClient_no());
				job.put("client_name", URLEncoder.encode(c.getClient_name(), "utf-8"));
				job.put("client_company", URLEncoder.encode(c.getClient_company(), "utf-8"));
				job.put("client_job", URLEncoder.encode(c.getClient_job(), "utf-8"));
				job.put("client_email", c.getClient_email());
				job.put("client_phone", c.getClient_phone());
				job.put("client_addr", URLEncoder.encode(c.getClient_addr(), "utf-8"));
				
				jarr.add(job);
				
		}
			JSONObject resultJob = new JSONObject();
				resultJob.put("searchList", jarr);
				resultJob.put("maxPage", client.getEnd());
				
				response.setContentType("application/json; charset=utf-8");
				PrintWriter out = response.getWriter();
				
				out.print(resultJob.toJSONString());
				out.flush();
				out.close();
		
	}
	
	 //email check   
	   @RequestMapping(value="clientemailCheck.do" ,method=RequestMethod.POST)
	   @ResponseBody

	   public void checkEmail(Client client,HttpServletResponse  response) throws IOException {      
	   
	      Client checkEmail=clientService.selectClientEmail(client);      
	   
	      JSONObject send=new JSONObject();
	      System.out.println(checkEmail);
	      String check="Y";
	      if(checkEmail==null) {
	         check="N";
	      }
	      
	      send.put("check",check);
	      
	      response.setContentType("application/json; charset=utf-8");   
	   
	      PrintWriter out=response.getWriter();
	      out.append(send.toJSONString());
	      out.flush();
	      out.close();
	   
	   }
	   
		   //phone check   
		   @RequestMapping(value="clientephoneCheck.do" ,method=RequestMethod.POST)
		   @ResponseBody

		   public void checkPhone(Client client,HttpServletResponse  response) throws IOException {      
		   
		      Client checkPhone=clientService.selectClientPhone(client);      
		   
		      JSONObject send=new JSONObject();
		      
		      String check="Y";
		      if(checkPhone==null) {
		         check="N";
		      }
		      
		      send.put("check",check);
		      
		      response.setContentType("application/json; charset=utf-8");   
		   
		      PrintWriter out=response.getWriter();
		      out.append(send.toJSONString());
		      out.flush();
		      out.close();
		   
		   }
}





