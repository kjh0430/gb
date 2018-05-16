package com.crm.gb.aatest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestViewController {
	
	@RequestMapping("testView.do")
	public String TestView() {
		
		return "client/poList";
	}
	@RequestMapping("testView2.do")
	public String TestView2() {
		

		int a=1;

		return "client/poList_detail";
	}
	
	@RequestMapping("clientlist.do")
	public String clientListView() {
		
		return "client/clientList";
	}
	
	@RequestMapping("adminmain.do")
	public String adminmain() {
		
		return "adminmain";
	}
}
