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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.crm.gb.product.model.service.ProductService;
import com.crm.gb.product.model.vo.Product;
import com.crm.gb.product.model.vo.ProductFile;


@Controller
public class ProductController {
	
	@Autowired
	ProductService productService;
	
	public ProductController() {}
	
	@RequestMapping("adminmain.do")
	public String adminMain() {
			return "adminmain";
				
	}
			
	//main으로 가기
	@RequestMapping("Movemain.do")
	public String main() {
		return "main";
	}
	
	//상품 리스트 화면으로 이동: 권성훈
	@RequestMapping("productList.do")
	public String moveProductList(HttpServletResponse response) throws IOException{
		System.out.println("test moveProductList run...");
		ArrayList<Product> list = new ArrayList<Product>();	
		for(int i=0; i<productService.selectAllList().size(); i++) {
			list.add(i, productService.selectAllList().get(i));
		}
		
		/*JSONObject sendJson = new JSONObject();
		JSONArray jarr = new JSONArray();
		
		for(Product product : list) {
			JSONObject jp = new JSONObject();
			jp.put("productno",product.getProduct_no());
			jp.put("productname",product.getProduct_name());
			jp.put("productprice", product.getProduct_price());
			jp.put("productavailability", product.getProduct_availability());
			jp.put("productamount", product.getProduct_amount());
			jp.put("productcomment", product.getProduct_comment());
			jp.put("productregister", product.getProduct_register());
			jp.put("productdelete", product.getProduct_delete());
			
			jarr.add(jp);
		}
		JSONObject sendjson = new JSONObject();
		sendjson.put("list",jarr);
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(sendJson.toJSONString());
		out.flush();
		out.close();
		*/
		return "product/productList";
	}

	
	//상품 상세보기 화면으로 이동
	@RequestMapping("moveproductDetail.do")
	public String moveproductDetail() {
		return "product/productDetail";
	}
	
	//상품 등록 화면으로 이동
	@RequestMapping("moveProductInsert.do")
	public String moveProductInsert() {
		return "product/productInsert";
	}
	
	//상품 등록 처리 컨트롤러
	@RequestMapping(value="insertProduct.do", method=RequestMethod.POST)
	public ModelAndView insertProduct(Product product,ModelAndView mv,HttpServletRequest request,
			MultipartHttpServletRequest mtfRequest) {
				
		if(product.getProduct_availability().equals("sale_n")) {
			product.setProduct_availability("N");
		}else {
			product.setProduct_availability("Y");
		}		
		//System.out.println(product);
		
		int result = productService.insertProduct(product);
		int product_no = product.getProduct_no();
		String path = request.getSession().getServletContext().getRealPath("resources/upload/product");
		List<MultipartFile> filelist=mtfRequest.getFiles("product_file");
		int idx=0;
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
		
		mv.setViewName("product/productList");			
		return mv;
		
	}
	
	
}
