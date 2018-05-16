/*package com.crm.gb.aatest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MovePageController {
	//구현시 편리를위한 무브 컨트롤러 참고및 페이지 이동에만 수정하지말것
	//페이지 아예 사용안하는 것은 *표시 사용하지만 타고들
	//이어가야하는것은 +
	 
	
	
	
	//approval
	//결재신청
	@RequestMapping("approval.do")
	public String approval() {
		
		return "approval/approval";
	}
	
	//결재목록
	@RequestMapping("approvalList.do")
	public String approvalList() {
		
		return "approval/approvalList";
	}
	
	//결재 목록 관리자
	@RequestMapping("approvalListAdmin.do")
	public String approvalListAdmin() {
		
		return "approval/approvalListAdmin";
	}
	
	@RequestMapping("approvalProcess.do")
	public String approvalProcess() {
		
		return "approval/approvalProcess";
	}
	//*electroSubmit
	
	
	//client
	//고객추가
	@RequestMapping("addClient.do")
	public String addClient() {
		
		return "client/addClient";
	}
	
	//*allClient
	//고객 리스트
	@RequestMapping("clientList.do")
	public String clientList() {
		
		return "client/clientList";
	}
	
	//+poList_detail.jsp
	//잠재고객 세부사항
	@RequestMapping("poList_detail.do")
	public String poList_detail() {
		
		return "client/poList_detail";
	}
	//잠재고객 리스트
	@RequestMapping("poList.do")
	public String poList() {
		
		return "client/poList";
	}
	
	//contract
	//계약
	@RequestMapping("contract.do")
	public String contract() {
		
		return "contract/contract";
	}
	
	//dailyreport
	//영업일지
	@RequestMapping("dailySales.do")
	public String dailySales() {
		
		return "dailyreport/dailySales";
	}
	
	//방문일지
	@RequestMapping("visit.do")
	public String visit() {
		
		return "dailyreport/visit";
	}
	
	
	//emp
	//사원 리스트
	@RequestMapping("empList.do")
	public String empList() {
		
		return "emp/empList";
	}
	
	//사원등록
	@RequestMapping("empRegister.do")
	public String empRegister() {
		
		return "emp/empRegister";
	}
	
	//로그인
	@RequestMapping("login.do")
	public String login() {
		
		return "emp/login";
	}
	
	//goal
	//관리자 목표 현황 
	@RequestMapping("goalStateAdmin.do")
	public String goalStateAdmin() {
		
		return "goal/goalStateAdmin";
	}
	
	//사원 목표현황
	@RequestMapping("goalState.do")
	public String goalState() {
		
		return "goal/goalState";
	}
	//관리자 목표관리
	@RequestMapping("goalAdmin.do")
	public String goalAdmin() {
		
		return "goal/goalAdmin";
	}
	
	//goal
	//message
	@RequestMapping("messageList.do")
	public String messageList() {
		
		return "message/messageList";
	}
	
	//notice
	//공지사항리스트
		@RequestMapping("noticeList.do")
		public String noticeList() {
			
			return "notice/noticeList";
		}
		
		//공지사항 쓰기
		@RequestMapping("noticeWrite.do")
		public String noticeWrite() {
			
			return "notice/noticeWrite";
		}
		
		
		//order
		//발주하기
		@RequestMapping("order.do")
		public String order() {
			
			return "order/order";
		}
		//발주리스트
		@RequestMapping("orderList.do")
		public String orderList() {
			
			return "order/orderList";
		}
		
		//제품 
		//제품 세부사항
		@RequestMapping("productDetail.do")
		public String productDetail() {
			
			return "product/productDetail";
		}
		
		//제품 리스트
		
		@RequestMapping("productList.do")
		public String productList() {
			
			return "product/productList";
		}
		
		
		
		
		
		
		
		
}
*/