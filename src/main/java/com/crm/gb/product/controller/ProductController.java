package com.crm.gb.product.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.impl.Log4JLogger;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.crm.gb.client.controller.ClientController;
import com.crm.gb.notice.controller.NoticeController;
import com.crm.gb.notice.model.vo.Notice;
import com.crm.gb.product.model.service.ProductService;
import com.crm.gb.product.model.vo.Product;
import com.crm.gb.product.model.vo.ProductFile;


@Controller
public class ProductController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	ProductService productService;
	
	public ProductController() {}
	
	
	//main으로 가기
	@RequestMapping("Movemain.do")
	public String main() {
		return "main";
	}
	
	
	
	//상품 리스트 화면으로 이동: 권성훈
	@RequestMapping("productList.do")
	public String moveProductList(HttpServletResponse response, Model model) throws IOException{
		System.out.println("test moveProductList run...");
		ArrayList<Product> list = new ArrayList<Product>();	
		for(int i=0; i<productService.selectAllList().size(); i++) {
			list.add(i, ((ArrayList<Product>)productService.selectAllList()).get(i));
		}
		model.addAttribute("list",list);
		return "product/productList";
	}
	
	//상품 상세보기 화면으로 이동(해당 제품 내용을 뿌리기)
	@RequestMapping("productFileDown.do")
	public ModelAndView fileDownMethod(HttpServletRequest request,
				@RequestParam(value="pfName") String fileName, 
				@RequestParam(value="oriName") String  orifileName, HttpServletResponse response) {
		
		System.out.println("받아온 파일이름: "+fileName);
		System.out.println("원래 파일이름: "+orifileName);
		//경로를 저장하고
		String path=request.getSession().getServletContext().getRealPath("resources/upload/product");
		//경로와 파일이름을 연결
		String filePath=path+"/"+fileName;
		String path2=path+"/"+orifileName;
		
		//File 객체생성 
		File downFile=new File(filePath);
		File oriFile=new File(path2);
		ModelAndView mov = new ModelAndView();
			mov.setViewName("productFileDown");
			mov.addObject("productFile", downFile);
			mov.addObject("oriFileName", oriFile);
		//viewname(bean id명)과 modelname, model객체(저장한 파일객체)를 입력한다
		//string: downfile, object : downFile로 filedownview클래스로 전송됨
		//return new ModelAndView("clientFileDown", "clientFile", downFile );
//			try{response.sendRedirect("productList.do");}
//			catch(Exception e) {
//				e.printStackTrace();
//			}
			return mov;
	}

	
	
	//상품 상세보기 화면으로 이동(해당 제품 내용을 뿌리기)
	@RequestMapping(value="moveproductDetail.do", method=RequestMethod.GET)
	public ModelAndView moveproductDetail(
			ModelAndView mv,HttpServletRequest request, HttpServletResponse response
			) {
		/*System.out.println("데이터="+request.getParameter("data"));*/
		Product pd = productService.selectProductDetail(request.getParameter("data"));
		//System.out.println(pd.toString());
		mv.addObject("productDetail", pd);
		mv.addObject("avail",pd.getProduct_availability());
		//여기까지가 제품 정보에 관한 것 뿌리는거
		
		//첨부파일 뿌리는 부분
		ArrayList<ProductFile> pf = productService.selectProductFile(pd);//이름을 받아왔음
		if(pf.isEmpty()) {                  
			System.out.println("널값이다");
		}else {
			mv.addObject("productFileNames", pf);
		}
		
		/** 제품 상세페이지 다운로드 메소드 *//*
			*/
		
		mv.setViewName("product/productDetail");
		
		return mv;
	}
	
	
	//상품 내역 수정 관련 메소드
	
	//상품 등록 화면으로 이동
	@RequestMapping("moveProductInsert.do")
	public String moveProductInsert() {
		return "product/productInsert";
	}
	
	//상품 등록 처리 컨트롤러
	@RequestMapping(value="insertProduct.do", method=RequestMethod.POST)
	public ModelAndView insertProduct(Product product,ModelAndView mv,HttpServletRequest request,
			MultipartHttpServletRequest mtfRequest, HttpServletResponse response) {
				
		if(product.getProduct_availability().equals("sale_n")) {
			product.setProduct_availability("N");
		}else {
			product.setProduct_availability("Y");
		}		
		
		int result = productService.insertProduct(product);
		int product_no = product.getProduct_no();
		String path = request.getSession().getServletContext().getRealPath("resources/upload/product");
		List<MultipartFile> filelist=mtfRequest.getFiles("product_file");
		System.out.println("filelist : "+filelist);
		
		int idx=0;
		
		
		if (filelist.size() == 1 && filelist.get(0).getOriginalFilename().equals("")) {
			 
		 }else {     


			for(MultipartFile mf:filelist) {
				
				try {
					mf.transferTo(new File(path+"\\"+mf.getOriginalFilename()));
					String originalFileName = mf.getOriginalFilename();
					
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					String renameFileName = product_no + "_" + sdf.format(new java.sql.Date(System.currentTimeMillis()))
							+ idx+"." + mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf(".") + 1);
					idx++;
				    File originFile = new File(path + "//" + mf.getOriginalFilename());
		            File renameFile = new File(path + "//" + renameFileName);
		            
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
		            ProductFile pf = new ProductFile(product_no,originFile.getName(),renameFile.getName());
					
					int result2=productService.insertProductFile(pf);
					
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}			
			}
			
					
		 }
		mv.setView(new RedirectView("/productList.do",true));
		
		return mv;
		
	}
	
	@RequestMapping(value="updateProduct.do", method=RequestMethod.POST)
	public ModelAndView updateProduct(Product product,ModelAndView mv,HttpServletRequest request,
			MultipartHttpServletRequest mtfRequest, HttpServletResponse response) {
		
		System.out.println("update : "+product);
		if(product.getProduct_availability().equals("sale_y")) {
			product.setProduct_availability("Y");
		}else {
			product.setProduct_availability("N");
		}
		int result = productService.updateProduct(product);
		int product_no = product.getProduct_no();

		String path = request.getSession().getServletContext().getRealPath("resources/upload/product");
		List<MultipartFile> filelist=mtfRequest.getFiles("product_file");
		int idx=0;
	
		 
			for(MultipartFile mf:filelist) {
				
				try {
					if(!mf.getOriginalFilename().isEmpty()) {
						mf.transferTo(new File(path+"\\"+mf.getOriginalFilename()));
						String originalFileName = mf.getOriginalFilename();
						
						SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
						String renameFileName = product_no + "_" + sdf.format(new java.sql.Date(System.currentTimeMillis()))
								+ idx+"." + mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf(".") + 1);
						idx++;
					    File originFile = new File(path + "//" + mf.getOriginalFilename());
			            File renameFile = new File(path + "//" + renameFileName);
			            
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
			            ProductFile pf = new ProductFile(product_no,originFile.getName(),renameFile.getName());
						
						int result2=productService.insertProductFile(pf);
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}			
				
		}
		mv.setView(new RedirectView("/productList.do",true));
		
		return mv;
	}
	
	@RequestMapping(value="deleteProduct.do", method=RequestMethod.GET)
	public ModelAndView deleteProduct(ModelAndView mv,Product product,@RequestParam("product_no") String product_no) {
		
		int result = productService.deleteProduct(Integer.parseInt(product_no));
		
		mv.setView(new RedirectView("/productList.do",true));		
		return mv;
	}
	
	@RequestMapping(value="deleteFile.do", method=RequestMethod.POST)
	public void deleteFile(@RequestParam("product_rename_file") String product_rename_file) {
		int result = productService.deleteFile(product_rename_file);
		
	}
	
}	



	
	
	
	