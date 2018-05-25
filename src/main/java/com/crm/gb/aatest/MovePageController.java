package com.crm.gb.aatest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MovePageController {
	//구현시 편리를위한 무브 컨트롤러 참고및 페이지 이동에만 수정하지말것
	//페이지 아예 사용안하는 것은 *표시 사용하지만 타고들
	//이어가야하는것은 +
	 
	
	
	
	//approval
	//결재신청
	@RequestMapping("addClient2.do")
	public String addClient2() {
		
		return "client/addClient2";
	}
	
/*	//결재목록
	@RequestMapping("MoveapprovalList.do")
	public String approvalList() {
		
		return "approval/approvalList";
	}
	
	//결재 목록 관리자
	@RequestMapping("MoveapprovalListAdmin.do")
	public String approvalListAdmin() {
		
		return "approval/approvalListAdmin";
	}
	
	@RequestMapping("MoveapprovalProcess.do")
	public String approvalProcess() {
		
		return "approval/approvalProcess";
	}
	//*electroSubmit
	
	
	//client
	//고객추가
//	@RequestMapping("MoveaddClient.do")
//	public String addClient() {
//		
//		return "client/addClient";
//	}
//	
	//*allClient
	//고객 리스트
//	@RequestMapping("MoveclientList.do")
//	public String clientList() {
//		
//		return "client/clientList";
//	}
	
	//+poList_detail.jsp
	//잠재고객 세부사항
//	@RequestMapping("MovepoList_detail.do")
//	public String poList_detail() {
//		
//		return "client/poList_detail";
//	}
	//잠재고객 리스트
//	@RequestMapping("poList.do")
//	public String poList() {
//		
//		return "client/poList";
//	}
	
	//contract
	//계약
	@RequestMapping("Movecontract.do")
	public String contract() {
		
		return "contract/contract";
	}
	
	//dailyreport
	//영업일지
	@RequestMapping("MovedailySales.do")
	public String dailySales() {
		
		return "dailyreport/dailySales";
	}
	
	//방문일지
	@RequestMapping("Movevisit.do")
	public String visit() {
		
		return "dailyreport/visit";
	}
	
	
	//emp
	//사원 리스트
	@RequestMapping("MoveempList.do")
	public String empList() {
		
		return "emp/empList";
	}
	
	//사원등록
	@RequestMapping("MoveempRegister.do")
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
	@RequestMapping("MovegoalStateAdmin.do")
	public String goalStateAdmin() {
		
		return "goal/goalStateAdmin";
	}
	
	//사원 목표현황
	@RequestMapping("MovegoalState.do")
	public String goalState() {
		
		return "goal/goalState";
	}
	//관리자 목표관리
	@RequestMapping("MovegoalAdmin.do")
	public String goalAdmin() {
		
		return "goal/goalAdmin";
	}
	
	//goal
	//message
	@RequestMapping("MovemessageList.do")
	public String messageList() {
		
		return "message/messageList";
	}
	
	//notice
	//공지사항리스트
		@RequestMapping("MovenoticeList.do")
		public String noticeList() {
			
			return "notice/noticeList";
		}
		
		//공지사항 쓰기
		@RequestMapping("MovenoticeWrite.do")
		public String noticeWrite() {
			
			return "notice/noticeWrite";
		}
		
		
		//order
		//발주하기
		@RequestMapping("Moveorder.do")
		public String order() {
			
			return "order/order";
		}
		//발주리스트
		@RequestMapping("MoveorderList.do")
		public String orderList() {
			
			return "order/orderList";
		}
		
		//제품 
		//제품 세부사항
		@RequestMapping("MoveproductDetail.do")
		public String productDetail() {
			
			return "product/productDetail";
		}
		
		//제품 리스트
		
		@RequestMapping("MoveproductList.do")
		public String productList() {
			
			return "product/productList";
		}
		
		//adminmain보기 나중에 지울거예요!
		@RequestMapping("adminmain.do")
		public String adminMain() {
			return "adminmain";
			
		}
		
		//main으로 가기

		@RequestMapping("Movemain.do")
		public String main() {
			return "adminmain";
			
		}*/
		
		
		
		
}