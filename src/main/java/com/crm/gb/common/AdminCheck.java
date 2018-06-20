package com.crm.gb.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.crm.gb.emp.model.vo.Emp;

public class AdminCheck extends HandlerInterceptorAdapter{
	
    @Autowired
    private WebApplicationContext context;


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
    	Emp emp = (Emp)(request.getSession().getAttribute("loginEmp"));
        if(emp.getJob_no() == 1){
            response.sendRedirect("Movemain.do");
            return false;
        }
        return true;
    }

}
