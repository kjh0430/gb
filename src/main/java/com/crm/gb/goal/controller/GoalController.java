package com.crm.gb.goal.controller;

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

import com.crm.gb.goal.model.service.GoalService;
import com.crm.gb.goal.model.vo.Goal;

import java.io.IOException;
import java.io.PrintWriter;

import java.net.URLEncoder;


import java.util.ArrayList;
import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpServletResponse;

@Controller
public class GoalController {
   private static final Logger logger=LoggerFactory.getLogger(GoalController.class);
   
   @Autowired
   private GoalService goalService;
   
      
   //목표 관리 리스트 출력
   @RequestMapping("goalAdmin.do")
   public String GoalAdmin() {
      return "goal/goalAdmin";
      
   }
   

   @RequestMapping("goalState.do")
   public String GoalSate() {
      
      return "goal/goalState";
   }
   
   @RequestMapping("goalStateAdmin.do")
   public String GoalStateAdmin() {
      
      return "goal/goalStateAdmin";
   }
   
   @RequestMapping("myGoal.do")
   public String myGoal() {
      return "goal/MygoalState";
   }
   
   @RequestMapping("search.do")
   @ResponseBody
   public void searchEmp(Goal goal,HttpServletResponse  response) throws IOException {
   ArrayList<Goal> searchEmp=goalService.selectEmpCondition(goal);
   JSONArray jarr=new JSONArray();
   
   for(Goal goal1: searchEmp) {
      
      JSONObject jsonobject=new JSONObject();
      
      jsonobject.put("emp_name",goal1.getEmp_name());
      jsonobject.put("dept_name",goal1.getDept_name());
      jsonobject.put("emp_job",goal1.getJob_name());
      jsonobject.put("emp_email",goal1.getEmp_email());
      jsonobject.put("emp_no",goal1.getEmp_no());
      jarr.add(jsonobject);
      
   }
   JSONObject send=new JSONObject();
   send.put("list",jarr);
   
   response.setContentType("application/json; charset=utf-8");   
   //System.out.println("messageController:"+send);
   PrintWriter out=response.getWriter();
   out.println(send.toJSONString());
   out.flush();
   out.close();
   }
   @RequestMapping("getgoalInfo.do")
   @ResponseBody
   public void goalEmpInfo(Goal goal,HttpServletResponse  response) throws IOException {
   ArrayList<Goal> selectEmpGoal=goalService.selectEmpGoal(goal);
   JSONArray jarr=new JSONArray();
   
   for(Goal goal1: selectEmpGoal) {
      
      JSONObject jsonobject=new JSONObject();
      
      jsonobject.put("goalMonth",goal1.getGoalMonth());
      jsonobject.put("goalMoney",goal1.getGoalmoney());
      jsonobject.put("sales",goal1.getSales());
      jsonobject.put("acheive",goal1.getAcheive());
      
      jarr.add(jsonobject);
      
   }
   JSONObject send=new JSONObject();
   send.put("list",jarr);
   
   response.setContentType("application/json; charset=utf-8");   
   PrintWriter out=response.getWriter();
   out.println(send.toJSONString());
   out.flush();
   out.close();
   }

   
   @RequestMapping("getAll.do")
   @ResponseBody
   public void goalAllEmp(HttpServletResponse  response) throws IOException {
   ArrayList<Goal> selectAllgoal=goalService.selectEmpAll();
   JSONArray jarr=new JSONArray();
   
   for(Goal goal1: selectAllgoal) {
      
      JSONObject jsonobject=new JSONObject();
      
      jsonobject.put("goalMonth",goal1.getGoalMonth());
      jsonobject.put("goalMoney",goal1.getGoalmoney());
      jsonobject.put("sales",goal1.getSales());
      jsonobject.put("acheive",goal1.getAcheive());
      
      jarr.add(jsonobject);
      
   }
   JSONObject send=new JSONObject();
   send.put("list",jarr);
   
   response.setContentType("application/json; charset=utf-8");   
   PrintWriter out=response.getWriter();
   out.println(send.toJSONString());
   out.flush();
   out.close();
   }
   
   
   @RequestMapping(value="getList.do", method=RequestMethod.POST)
   @ResponseBody
   public void selectGoalList(Goal goal,HttpServletResponse  response) throws IOException {
      System.out.println(goal.getDate()+","+goal.getDept_no());
      ArrayList<Goal> selectGoalList=goalService.selectGoalList(goal);
      
      JSONArray jarr=new JSONArray();
      
   
	   for(Goal goal1: selectGoalList) {
	      JSONObject jsonobject=new JSONObject();
	      
	      jsonobject.put("emp_no",goal1.getEmp_no());
	      jsonobject.put("emp_name",goal1.getEmp_name());
	      jsonobject.put("sales",goal1.getSales());
	      
	      
	      jarr.add(jsonobject);
	      
	   }
   JSONObject send=new JSONObject();
   send.put("list",jarr);
   
   response.setContentType("application/json; charset=utf-8");   
   PrintWriter out=response.getWriter();
   out.println(send.toJSONString());
   out.flush();
   out.close();
   }
   
   

      @RequestMapping(value="checkGoal.do", method=RequestMethod.POST)
      @ResponseBody
      public void selectcheckGoal(Goal goal,HttpServletResponse  response) throws Exception {
         System.out.println(goal.getDate()+","+goal.getDept_no()+","+goal.getEmp_no());
         Goal selectcheckGoal=goalService.selectcheckGoal(goal);
   

	      JSONObject send=new JSONObject();
	      System.out.println("selectcheckGoal"+selectcheckGoal);
	      System.out.println("fvxvxvx");
	      try {
	         
	         if(selectcheckGoal.getGoal_date()!=null) {
	
	            send.put("goal_date",selectcheckGoal.getGoal_date());
	            send.put("goal_money",selectcheckGoal.getGoal_money());
	         }else {
	            send.put("goal_date","N");
	            send.put("goal_money","N");
	            
	         }
	         
	      } catch (NullPointerException e) {
	         send.put("goal_date","N");
	         send.put("goal_money","N");
	      }
      
      /*if(selectcheckGoal.getGoal_date()!=null) {

         send.put("goal_date",selectcheckGoal.getGoal_date().toString());
         send.put("goal_money",selectcheckGoal.getGoal_money());
      }else{
         send.put("goal_date","N");
         send.put("goal_money","N");
      }*/
      
      response.setContentType("application/json; charset=utf-8");   
      PrintWriter out=response.getWriter();
      out.println(send.toJSONString());
      out.flush();
      out.close();
      
      }
      
         
      @RequestMapping(value="insertGoal.do", method=RequestMethod.POST)
      @ResponseBody
      public void insertGoal(Goal goal,HttpServletResponse  response) throws IOException {
      int insertGoal=goalService.insertGoal(goal);
      
      response.setContentType("text/html;charset=utf-8");
      PrintWriter out=response.getWriter();
      
      out.println("입력이 완료되었습니다.");
      out.flush();
      out.close();
      }
      
      @RequestMapping(value="updateGoal.do", method=RequestMethod.POST)
      @ResponseBody
      public void updateGoal(Goal goal,HttpServletResponse  response) throws IOException {
      int updateGoal=goalService.updateGoal(goal);
      
      response.setContentType("text/html;charset=utf-8");
      PrintWriter out=response.getWriter();
      
      out.println("수정이 완료되었습니다.");
      out.flush();
      out.close();
      }
}