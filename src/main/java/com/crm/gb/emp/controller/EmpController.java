package com.crm.gb.emp.controller;

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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.crm.gb.contract.model.service.ContractService;
import com.crm.gb.emp.exception.EmpLoginFailException;
import com.crm.gb.emp.model.service.EmpService;
import com.crm.gb.emp.model.vo.Emp;


@Controller
@SessionAttributes("loginEmp")
public class EmpController {
   private static final Logger logger=LoggerFactory.getLogger(EmpController.class);
   
   @Autowired
   private EmpService empService;

   @Autowired
   private ContractService contractService;
   
   /* 일반 사원 테이블 추가부분 */
   @Autowired
   private BCryptPasswordEncoder pwdEncoder;
   
   //개인 정보
   @RequestMapping("info.do")
   public String  Info() {
      return "emp/myInfo";
   }
   
   //비밀번호 수정하기
   @RequestMapping("modifyPassword.do")
   public String modifyPassword() {
      return "emp/modifyPassword";
   }
   
   //개인정보 수정하기
   @RequestMapping("modifyMyInfo.do")
   public String modifyMyInfo() {
      return "emp/modifyMyInfo";
   }
   
   
   /** 시작화면 */
   @RequestMapping("view.do")
   public String loginView() {
      return "emp/login";
   }
   
   /** 메인화면 */
   @RequestMapping("mainView.do")
   public String mainView() {
      return "main";
   }
   
   /** 로그인 정보확인 컨트롤러 */
   @RequestMapping(value="login.do", method=RequestMethod.POST)
   public void loginEmp(Emp emp, Model model, HttpServletResponse response) throws IOException{
      logger.info("로그인관련 컨트롤러 실행됨");
      
      System.out.println("받아온 사원정보: "+emp);
      
      try {
         
         Emp returnEmp=empService.selectEmp(emp);
         
         System.out.println("사원정보 조회:" + returnEmp);
         model.addAttribute("loginEmp", returnEmp);
         response.setContentType("text/html; charset=utf-8");
         PrintWriter out = response.getWriter();
         
         if(returnEmp != null) {
            out.append("correct");
            out.flush();
         }else {
            out.append("fail");
            out.flush();
         }
         out.close();
         
      } catch (EmpLoginFailException e) {
         model.addAttribute("message", e.getMessage());
      }
      
   }
   
   /** 로그아웃 컨트롤러 */
   @RequestMapping("logout.do")
   public String logoutView(SessionStatus session) {
      session.setComplete();
      return "emp/login";
   }
   
   @RequestMapping(value="main.do")
   public String main() {
      return "main";
   }      
   
   /*사원 등록화면*/
   @RequestMapping(value = "empRegister.do")
   public String empRegister(Emp emp, Model model) {
      
      ArrayList<Emp> empList = empService.selectEmpList();
      System.out.println("empList : " + empList);
      model.addAttribute("empList", empList);
            
      return "emp/empRegister";
   }   

   /*사원 수정화면 이동*/
   @RequestMapping(value = "moveEmpUpdate.do")
   public String moveEmpUpdate(Emp emp, Model model, @RequestParam(value="emp_no") String emp_num) {
      logger.info("수정 페이지로 넘어감");
      System.out.println("수정페이지로 넘어가면서 : " + emp);
      int emp_no = (Integer.parseInt(emp_num));
      
      Emp detailEmp = empService.selectEmpNo(emp_no);
      model.addAttribute("emp", detailEmp);
      System.out.println("moveEmpUpdate 메소드 detailEmp : " + detailEmp);
      return "emp/empUpdate";
   }
   
   /*사원 목록*/
   @RequestMapping(value = "empList.do")
   public String empList(Emp emp, Model model, @RequestParam(value="page") int page,HttpServletRequest request) {
      logger.info("사원 목록 실행");
      
      int currentPage=page;
      int listSize = 10;
      int pageSize = 5;
      int listCount2 = 0;
      
      if(request.getParameter("page")!=null) {
			currentPage=Integer.parseInt(request.getParameter("page"));
		}
      
      if(emp.getEmp_name()!=null && emp.getEmp_name()!="") {
    	  System.out.println("검색어 if문 실행");
    	  Emp listCount = empService.selectEmpListCount(emp);
          listCount2 = listCount.getListCount();
          System.out.println("count까지 실행");
          emp.setStartPage((currentPage-1)*listSize+1);
          emp.setEndPage(emp.getStartPage()+listSize-1);
          ArrayList<Emp> selectEmpSearch = empService.selectEmpSearch(emp);
          System.out.println("arraylist까지 실행");
          model.addAttribute("empList", selectEmpSearch);
          model.addAttribute("emp_no", emp.getEmp_no());
          model.addAttribute("emp_name", emp.getEmp_name());
          model.addAttribute("emp_addr", emp.getEmp_addr());
          model.addAttribute("emp_phone", emp.getEmp_phone());
          model.addAttribute("emp_email", emp.getEmp_email());
          
          System.out.println("emp_name" + emp.getEmp_name());
          System.out.println("startPage : " + emp.getStartPage());
          System.out.println("endPage : " + emp.getEndPage());
          System.out.println("selectEmpSearch 사이즈 : " + selectEmpSearch.size());
          
      }else {
      
      Emp listCount = empService.selectEmpListCount2();
      listCount2 = listCount.getListCount();
	  
	  emp.setStartPage((currentPage-1)*listSize+1);
	  emp.setEndPage(emp.getStartPage()+listSize-1);
	  
	  ArrayList<Emp> empList = empService.selectEmpList(emp);
	  model.addAttribute("empList", empList);
      model.addAttribute("listCount", listCount2);
      }
      
      int maxPage = (int)((double)listCount2 / listSize + 0.9);
      
      int curPage = (currentPage-1) / pageSize + 1;
	  int totalPage = (int)Math.ceil(maxPage*1.0) / pageSize+1;
	  
	  int beginPage = (curPage-1) * pageSize + 1;
	  int finalPage = beginPage + pageSize - 1;
	  
	  int prevPage = (curPage==1)?1:(curPage-1)*pageSize;
	  int nextPage = curPage>totalPage?(curPage*pageSize):(curPage*pageSize)+1;
		
	  if(nextPage>=totalPage) {
		nextPage = totalPage;
	  }		
	  
	  if(maxPage < finalPage) {
		finalPage = maxPage;
	  }
	  
	  System.out.println("listCount : " + listCount2);
	  System.out.println("currentPage : " + currentPage);
	  System.out.println("listSize : " + listSize);
	  System.out.println("pageSize : " + pageSize);
	  System.out.println("maxPage : " + maxPage);
	  System.out.println("curPage : " + curPage);
	  System.out.println("totalPage : " + totalPage);
	  System.out.println("beginPage : " + beginPage);
	  System.out.println("finalPage : " + finalPage);
	  System.out.println("prevPage : " + prevPage);
	  System.out.println("nextPage : " + nextPage);
           
      model.addAttribute("currentPage", currentPage);
      model.addAttribute("listSize", listSize);
      model.addAttribute("pageSize", pageSize);
      model.addAttribute("maxPage", maxPage);
      model.addAttribute("curPage", curPage);
      model.addAttribute("totalPage", totalPage);
      model.addAttribute("beginPage", beginPage);
      model.addAttribute("finalPage", finalPage);
      model.addAttribute("prevPage", prevPage);
      model.addAttribute("nextPage", nextPage);
      
      return "emp/empList";
   }
   
   /*사원 목록 상세보기*/
   @RequestMapping(value = "empDetail.do")
   public String empDetail(Emp emp, Model model, @RequestParam(value="emp_no") String emp_num) {
      logger.info("사원 상세보기 실행");
      
      System.out.println("사원 상세정보: "+emp);
      int emp_no = (Integer.parseInt(emp_num));
               
         Emp detailEmp = empService.selectEmpNo(emp_no);
         model.addAttribute("emp", detailEmp);
         System.out.println("detailEmp : " + detailEmp);
      
      return "emp/empDetail";
   }
   
   /*사원 등록*/
   @RequestMapping(value="empinsert.do", method = RequestMethod.POST)
   @ResponseBody
   public String insertEmp(Emp emp, Model model, @RequestParam(value = "emp_mgr", required = false, defaultValue = "0" ) int emp_mgr, HttpServletResponse response){
      logger.info("emp insert 실행");
      System.out.println("전송온 값 : " + emp);
      
      String encPassword = pwdEncoder.encode(emp.getEmp_pwd());
      emp.setEmp_pwd(encPassword);
      
      emp.setEmp_mgr(emp_mgr);
      
      int result = empService.insertEmp(emp);
      
      System.out.println("emp : " + emp);
      System.out.println("emp_no : " + emp.getEmp_no());
      System.out.println("emp_name : " + emp.getEmp_name());
      System.out.println("emp_mgr : " + emp.getEmp_mgr());
      
      JSONObject job = new JSONObject();
      job.put("emp_name", emp.getEmp_name());      

      return job.toJSONString();
   }
   
   /*사원 정보 수정*/
   @RequestMapping(value="empupdate.do", method = RequestMethod.POST)
   @ResponseBody
   public String updateEmp(Emp emp, Model model, HttpServletResponse response) {
      
      logger.info("emp update 실행");
      
      System.out.println("전송온값 : " + emp);
            
      String encPassword = pwdEncoder.encode(emp.getEmp_pwd());
      emp.setEmp_pwd(encPassword);
      
      int result = empService.updateEmp(emp);
      
      JSONObject job = new JSONObject();
      job.put("emp_name", emp.getEmp_name());

      return job.toJSONString();      
      
   }
   
   /*사원 삭제여부 수정*/
   @RequestMapping(value="updateEmpDelete.do")
   public String updateEmpDelete(Emp emp, Model model, @RequestParam(value="emp_no") String emp_num) {
      
      logger.info("emp delete 실행");
      
      System.out.println("사원 상세정보: "+emp);
      int emp_no = (Integer.parseInt(emp_num));
      
      int result = empService.updateEmpDelete(emp_no);
      
      int currentPage=1;
      int listSize = 10;
      int pageSize = 5;
      
      Emp listCount = empService.selectEmpListCount2();
      int listCount2 = listCount.getListCount();
      
      int maxPage = (int)((double)listCount2 / listSize + 0.9);
      
      int curPage = (currentPage-1) / pageSize + 1;
	  int totalPage = (int)Math.ceil(maxPage*1.0) / pageSize+1;
	  
	  int beginPage = (curPage-1) * pageSize + 1;
	  int finalPage = beginPage + pageSize - 1;
	  
	  int prevPage = (curPage==1)?1:(curPage-1)*pageSize;
	  int nextPage = curPage>totalPage?(curPage*pageSize):(curPage*pageSize)+1;
		
	  if(nextPage>=totalPage) {
		nextPage = totalPage;
	  }		
	  
	  if(maxPage < finalPage) {
		finalPage = maxPage;
	  }		
		
	  int startPage=(currentPage-1)*listSize+1;
	  int endPage=startPage+listSize-1;
	  
	  emp.setStartPage(startPage);
	  emp.setEndPage(endPage);
	  
	  System.out.println("listCount : " + listCount2);
	  System.out.println("currentPage : " + currentPage);
	  System.out.println("listSize : " + listSize);
	  System.out.println("pageSize : " + pageSize);
	  System.out.println("maxPage : " + maxPage);
	  System.out.println("curPage : " + curPage);
	  System.out.println("totalPage : " + totalPage);
	  System.out.println("beginPage : " + beginPage);
	  System.out.println("finalPage : " + finalPage);
	  System.out.println("prevPage : " + prevPage);
	  System.out.println("nextPage : " + nextPage);
	  System.out.println("startPage : " + startPage);
	  System.out.println("endPage : " + endPage);
      
      ArrayList<Emp> empList = empService.selectEmpList(emp);
      model.addAttribute("empList", empList);
      model.addAttribute("listCount", listCount2);
      model.addAttribute("currentPage", currentPage);
      model.addAttribute("listSize", listSize);
      model.addAttribute("pageSize", pageSize);
      model.addAttribute("maxPage", maxPage);
      model.addAttribute("curPage", curPage);
      model.addAttribute("totalPage", totalPage);
      model.addAttribute("beginPage", beginPage);
      model.addAttribute("finalPage", finalPage);
      model.addAttribute("prevPage", prevPage);
      model.addAttribute("nextPage", nextPage);
      model.addAttribute("startPage", startPage);
      model.addAttribute("endPage", endPage);    
      
      return "emp/empList";
   }
   
   /*연락처 중복검사*/
   @RequestMapping(value="checkPhone.do", method=RequestMethod.POST)
   @ResponseBody
   public void selectCheckPhone(@RequestParam(value="emp_phone") String emp_phone, HttpServletResponse response) throws IOException{
      
      logger.info("selectCheckPhone 실행");
      
      System.out.println("연락처 번호 : "+emp_phone);
      
      Emp checkPhone = empService.selectCheckPhone(emp_phone);        
         
      JSONObject job = new JSONObject();
      
      String check="Y";
      if(checkPhone==null) {
         check="N";
      }
      
      job.put("check",check);
      
      response.setContentType("application/json; charset=utf-8");   
   
      PrintWriter out=response.getWriter();
      out.append(job.toJSONString());
      out.flush();
      out.close();
      
   }
   
   /*이메일 중복검사*/
   @RequestMapping(value="checkEmail.do", method=RequestMethod.POST)
   @ResponseBody
   public void selectCheckEmail(@RequestParam(value="emp_email") String emp_email, HttpServletResponse response) throws IOException{
      
      logger.info("selectCheckEmail 실행");
      
      System.out.println("이메일 주소 : "+emp_email);
      
      Emp checkEmail = empService.selectCheckEmail(emp_email);
                     
      JSONObject job = new JSONObject();
            
      String check="Y";
      if(checkEmail==null) {
         check="N";
      }
      
      job.put("check",check);
      
      response.setContentType("application/json; charset=utf-8");   
   
      PrintWriter out=response.getWriter();
      out.append(job.toJSONString());
      out.flush();
      out.close();
      
   }
   
   /*상사번호로 이름 가져오기*/
   @RequestMapping(value="mgrName.do", method=RequestMethod.POST)
   @ResponseBody
   public void selectMgrNo(@RequestParam(value="emp_mgr") String emp_mgr, HttpServletResponse response) throws IOException{
      
      logger.info("selectMgrNo 실행");
      
      System.out.println("상사번호 : "+emp_mgr);
      
      int emp_no = (Integer.parseInt(emp_mgr));
      
      Emp mgrName = empService.selectMgrNo(emp_no);
      
      if(mgrName != null) {
         
      JSONObject job = new JSONObject();
      job.put("emp_name", mgrName.getEmp_name());
      
      System.out.println("mgrName 값 있음");
      System.out.println("emp : " + mgrName);
      System.out.println("mgrName : " + mgrName.getEmp_name());

      response.setContentType("application/json; charset=utf-8");
      PrintWriter out = response.getWriter();
      out.println(job.toJSONString());
      out.flush();
      out.close();
      
      }else {
         System.out.println("mgrName null");
      }
         
   }
   
   /*상사목록 조회*/
   @RequestMapping(value="selectMgrList.do", method=RequestMethod.POST)
   @ResponseBody
   public void selectMgrList(Emp emp, @RequestParam(value="job_no2") String job_no2, HttpServletResponse response) throws IOException{
      logger.info("selectMgrList 실행");
      
      int job_no = (Integer.parseInt(job_no2))+1;
      System.out.println("job_no : " + job_no);
      
      emp.setJob_no(job_no);
      System.out.println("emp.getJob_no : " + emp.getJob_no());
      
      ArrayList<Emp> selectMgrList = empService.selectMgrList(emp);
      JSONArray jarr = new JSONArray();
      
      System.out.println("selectMgrList : " + selectMgrList);
      
      for(Emp e : selectMgrList) {
         JSONObject jsonobject = new JSONObject();
         jsonobject.put("emp_no", e.getEmp_no());
         jsonobject.put("emp_name", e.getEmp_name());
         jsonobject.put("job_no", e.getJob_no());
         jarr.add(jsonobject);
      }
      
      JSONObject sendJson = new JSONObject();
      sendJson.put("mgrList", jarr);
      
      response.setContentType("application/json; charset=utf-8");
      System.out.println("selectMgrList : " + sendJson);
      PrintWriter out = response.getWriter();
      out.println(sendJson.toJSONString());
      out.flush();
      out.close();
      
   }
   
   //마이 페이지 정보 가져오기
   @RequestMapping(value="getMyInfo.do" ,method=RequestMethod.POST)
   @ResponseBody
   public void getMyInfo(Emp emp,HttpServletResponse  response) throws IOException {      
      System.out.println("emp_job_no"+emp.getJob_no());
      Emp getMyInfo=empService.selectMyInfo(emp);      
        
      JSONObject send=new JSONObject();
      
      if(emp.getJob_no()==2) {
       /*  getMyInfo.setMgr_name("");*/
         getMyInfo.setCounty("");
         getMyInfo.setCity("");
         getMyInfo.setVillage("");
      }
      if(emp.getJob_no()==3) {
         getMyInfo.setMgr_name("");
         getMyInfo.setCounty("");
         getMyInfo.setCity("");
         getMyInfo.setVillage("");
      }
      
      send.put("emp_name",getMyInfo.getEmp_name());
      send.put("emp_addr",getMyInfo.getEmp_addr());
      send.put("emp_phone",getMyInfo.getEmp_phone());
      send.put("job_name",getMyInfo.getJob_name());
      send.put("emp_email",getMyInfo.getEmp_email());
      send.put("mgr_name",getMyInfo.getMgr_name());
      send.put("city",getMyInfo.getCity());
      send.put("county",getMyInfo.getCounty());
      send.put("village",getMyInfo.getVillage());
      send.put("dept_name",getMyInfo.getDept_name());
   
      
      response.setContentType("application/json; charset=utf-8");   
   
      PrintWriter out=response.getWriter();
      out.println(send.toJSONString());
      out.flush();
      out.close();
   
   } 
   
   //email check   
   @RequestMapping(value="emailCheck.do" ,method=RequestMethod.POST)
   @ResponseBody

   public void checkEmail(Emp emp,HttpServletResponse  response) throws IOException {      
   
      Emp checkEmail=empService.selectEmail(emp);      
   
      JSONObject send=new JSONObject();
      
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
   
   //phone number check
   @RequestMapping(value="checkPhoneck.do" ,method=RequestMethod.POST)
   @ResponseBody
   public void checkPhonedupl(Emp emp,HttpServletResponse  response) throws IOException {      
   
      Emp checkPhone=empService.selectPhoneckdupl(emp);
      JSONObject send=new JSONObject();
      
      System.out.println("checkPhone"+" "+checkPhone);
      
         String check="Y";
         if(checkPhone==null) {
            check="N";
         }
      
         send.put("check", check);
      
      
   
      response.setContentType("application/json; charset=utf-8");   
      System.out.println("check"+check);
      PrintWriter out=response.getWriter();
      out.append(send.toJSONString());
      out.flush();
      out.close();
   
   }
   
   //수정한 값 집어넣기
   @RequestMapping(value="modifyInfo.do",method=RequestMethod.POST)
   public String updateEmpDelete(Emp emp) {
      
      int result=empService.updateMyInfo(emp);   
      
      return "emp/myInfo";
   }

   
   @RequestMapping(value="updatePassword.do",method=RequestMethod.POST)
   public String updatePassword(Emp emp) {
      
   String pwd =pwdEncoder.encode(emp.getEmp_pwd());
   emp.setEmp_pwd(pwd);
      
      int result=empService.updatePassword(emp);   
      
      return "emp/myInfo";
   }
   
   /*사원목록 검색*/
   @RequestMapping(value="empSearch.do", method=RequestMethod.POST)
   @ResponseBody
   public void selectEmpSearch(Emp emp, @RequestParam(value="emp_name") String emp_name, HttpServletResponse response) throws IOException{
      logger.info("selectEmpSearch 실행");
      
      System.out.println("emp_name : " + emp_name);
      
      ArrayList<Emp> selectEmpSearch = empService.selectEmpSearch(emp);
      JSONArray jarr = new JSONArray();
      
      System.out.println("selectEmpSearch : " + selectEmpSearch);
      
      for(Emp e : selectEmpSearch) {
         JSONObject jsonobject = new JSONObject();
         jsonobject.put("emp_no", e.getEmp_no());
         jsonobject.put("emp_name", e.getEmp_name());
         jsonobject.put("emp_addr", e.getEmp_addr());
         jsonobject.put("emp_phone", e.getEmp_phone());
         jsonobject.put("emp_email", e.getEmp_email());   
         
         jarr.add(jsonobject);
      }
      
      JSONObject sendJson = new JSONObject();
      sendJson.put("empSearch", jarr);
      
      response.setContentType("application/json; charset=utf-8");
      System.out.println("empSearchList : " + sendJson);
      PrintWriter out = response.getWriter();
      out.println(sendJson.toJSONString());
      out.flush();
      out.close();
      
   }

}