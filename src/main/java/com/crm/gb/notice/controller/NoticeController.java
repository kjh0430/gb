package com.crm.gb.notice.controller;

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
import org.springframework.context.support.GenericApplicationContextExtensionsKt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import com.crm.gb.notice.model.service.NoticeService;
import com.crm.gb.notice.model.vo.Notice;

@Controller
public class NoticeController {

	private static final Logger logger=LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	//공지사항 리스트 
	@RequestMapping("noticeList.do")
	public String NoticeList(Notice notice, Model model ,@RequestParam(value="page") int page) {
		logger.info("공지사항 리스트 메소드 실행됨");
		
		//페이지 기본값 지정
				int currentPage=page;				
				//한 페이지당 출력할 목록갯수 지정
				int pageSize=10;
				int pageGroupSize=5;
				
				System.out.println("page"+page);
				System.out.println("pageSize"+pageSize);
				System.out.println("currentPage+"+currentPage);
				
				Notice listCount_1=(noticeService.noticeListCount());
				int listCount_2=listCount_1.getNotice_list_count();
				
				//페이지수 계산 
				int maxPage=(int)((double)listCount_2/pageSize+0.9);				
				//페이지 번호 갯수 출력 					
				
				int curBlock=(currentPage-1)/pageGroupSize+1;//원하는 페이지가 몇번째 블록인지계산
				int totBlock=(int)Math.ceil(maxPage*1.0)/pageGroupSize+1;//총 블록 갯수
				
				
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
				
				System.out.println("startPage 시작페이지"+startPage);
				
				System.out.println("endPage 마지막 페이지"+endPage);
				
				System.out.println("maxPage 페이지수 계산"+maxPage);
				
				System.out.println("게시판 갯수 숫자"+listCount_2);
				
				/*if(maxPage<endPage)
					endPage=maxPage;*/
				
				notice.setStartPage(startPage);
				notice.setEndPage(endPage);
				
				System.out.println(notice.getStartPage());
				System.out.println(notice.getEndPage());
				
				System.out.println("blockBegin"+blockBegin);
				System.out.println("blockEnd"+blockEnd);
				System.out.println("curBlock"+curBlock);
				System.out.println("totBlock"+totBlock);
				System.out.println("prevBlock"+prevBlock);
				System.out.println("nextBlock"+nextBlock);
				
				
		ArrayList<Notice> noticeList=noticeService.selectAllNoticeList(notice);
		model.addAttribute("noticeList",noticeList);		
		model.addAttribute("listCount",listCount_2);
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
	
		
	
		
		/*System.out.println(noticeList.get(0));*/
		return "notice/noticeList";
	}
	
	//공지사항 추가 페이지
	@RequestMapping("noticeWrite.do")
	public String NoticeWrite() {
		
		return "notice/noticeWrite";
	}
	
	//공지사항 추가 메소드 
	/*@RequestMapping("noticeAdd.do")*/
	@RequestMapping(value="noticeAdd.do", method=RequestMethod.POST)	
	public String NoticeAdd(Notice notice, Model model,HttpServletRequest request ) {
		
		int result=noticeService.insertNotice(notice);
		
		//페이지 기본값 지정
		int currentPage=1;				
		//한 페이지당 출력할 목록갯수 지정
		int pageSize=10;
		int pageGroupSize=5;		
	
		Notice listCount_1=(noticeService.noticeListCount());
		int listCount_2=listCount_1.getNotice_list_count();
		
		//페이지수 계산 
		int maxPage=(int)((double)listCount_2/pageSize+0.9);				
		//페이지 번호 갯수 출력 					
		
		int curBlock=(currentPage-1)/pageGroupSize+1;//원하는 페이지가 몇번째 블록인지계산
		int totBlock=(int)Math.ceil(maxPage*1.0)/pageGroupSize+1;//총 블록 갯수
		
		
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
		
		
		
		/*if(maxPage<endPage)
			endPage=maxPage;*/
		
		notice.setStartPage(startPage);
		notice.setEndPage(endPage);
		
		
				ArrayList<Notice> noticeList=noticeService.selectAllNoticeList(notice);
				model.addAttribute("noticeList",noticeList);		
				model.addAttribute("listCount",listCount_2);
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
		
		return "notice/noticeList";
	}
	
	
	//공지사항내용 
	@RequestMapping("noticeDetail.do")
	public String NoticeDetail(Notice notice, Model model ,@RequestParam(value="notice_no") int notice_no) {
		
		System.out.println("공지사항 번호"+notice_no);
		
		Notice returnNotice=noticeService.selectNotice(notice_no);
		//공지사항 카운트
		int countNotice=noticeService.countUpdate(notice_no);
		//
		model.addAttribute("detailNotice",returnNotice);
		
		System.out.println("카운트용!!!"+countNotice);
		
		return "notice/noticeDetail";
	}
	
	//공지사항 수정
	@RequestMapping("noticeEdit.do")
	public String NoticeEdit(Notice notice, Model model ,@RequestParam(value="notice_no") int notice_no) {
		
		System.out.println("공지사항 수정번호"+notice_no);
		
		Notice returnNotice=noticeService.selectNotice(notice_no);
		
		model.addAttribute("detailNotice",returnNotice);
		return "notice/noticeEdit";
	}
	//공지사항 수정 update
	@RequestMapping("noticeEditUpdate.do")
	public String NoticeEditUpdate(Notice notice, Model model,@RequestParam(value="notice_no") int notice_no) {
		
		//업데이트 추가 
		int resultNotcie=noticeService.updateNotice(notice);
		
		//페이지 기본값 지정
				int currentPage=1;				
				//한 페이지당 출력할 목록갯수 지정
				int pageSize=10;
				int pageGroupSize=5;		
			
				Notice listCount_1=(noticeService.noticeListCount());
				int listCount_2=listCount_1.getNotice_list_count();
				
				//페이지수 계산 
				int maxPage=(int)((double)listCount_2/pageSize+0.9);				
				//페이지 번호 갯수 출력 					
				
				int curBlock=(currentPage-1)/pageGroupSize+1;//원하는 페이지가 몇번째 블록인지계산
				int totBlock=(int)Math.ceil(maxPage*1.0)/pageGroupSize+1;//총 블록 갯수
				
				
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
				
				
				
				/*if(maxPage<endPage)
					endPage=maxPage;*/
				
				notice.setStartPage(startPage);
				notice.setEndPage(endPage);
				
				
						ArrayList<Notice> noticeList=noticeService.selectAllNoticeList(notice);
						model.addAttribute("noticeList",noticeList);		
						model.addAttribute("listCount",listCount_2);
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
				
	
		return "notice/noticeList";
	}
	
	//공지사항 삭제
	@RequestMapping("noticeDelete.do")
	public String NoticeDelete(Notice notice,Model model,@RequestParam(value="notice_no") int notice_no) {
		
		int result=noticeService.deleteNotice(notice_no);
		
		//페이지 기본값 지정
				int currentPage=1;				
				//한 페이지당 출력할 목록갯수 지정
				int pageSize=10;
				int pageGroupSize=5;		
			
				Notice listCount_1=(noticeService.noticeListCount());
				int listCount_2=listCount_1.getNotice_list_count();
				
				//페이지수 계산 
				int maxPage=(int)((double)listCount_2/pageSize+0.9);				
				//페이지 번호 갯수 출력 					
				
				int curBlock=(currentPage-1)/pageGroupSize+1;//원하는 페이지가 몇번째 블록인지계산
				int totBlock=(int)Math.ceil(maxPage*1.0)/pageGroupSize+1;//총 블록 갯수
				
				
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
				
				
				
				/*if(maxPage<endPage)
					endPage=maxPage;*/
				
				notice.setStartPage(startPage);
				notice.setEndPage(endPage);
				
				
						ArrayList<Notice> noticeList=noticeService.selectAllNoticeList(notice);
						model.addAttribute("noticeList",noticeList);		
						model.addAttribute("listCount",listCount_2);
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
				
	
		
		return "notice/noticeList";
	}
	
		
		
	@RequestMapping(value="latestNotice.do",method=RequestMethod.POST)
	@ResponseBody
	public void latestNotice(HttpServletResponse  response) throws IOException {
	
	ArrayList<Notice> selectlatestNotice=noticeService.selectLatestNotice();
	JSONArray jarr=new JSONArray();
	
	for(Notice notice: selectlatestNotice) {
		
		JSONObject jsonobject=new JSONObject();
		
		jsonobject.put("notice_no",notice.getNotice_no());
		jsonobject.put("notice_title",notice.getNotice_title());
		jsonobject.put("notice_date",notice.getNotice_date().toString());
	
		
		jarr.add(jsonobject);
		
	}
	
	System.out.println("selectlatestNotice"+selectlatestNotice);
	JSONObject send=new JSONObject();
	send.put("list",jarr);
	
	response.setContentType("application/json; charset=utf-8");	
	PrintWriter out=response.getWriter();
	out.println(send.toJSONString());
	out.flush();
	out.close();
	
	}
	
}


