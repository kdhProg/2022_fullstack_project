package kr.co.olga.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.olga.service.AnService;
import kr.co.olga.service.FAQService;
import kr.co.olga.service.NoticeService;
import kr.co.olga.service.QnService;
import kr.co.olga.vo.AnVO;
import kr.co.olga.vo.FAQVO;
import kr.co.olga.vo.NoticeVO;
import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.QnVO;

@Controller
@RequestMapping(value = "/board/")
public class BoardController {

// 공지사항	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value="/client")
	public String client() {
		return "/board/client";
	}
	
	// 공지사항 목록 조회
	@RequestMapping(value="/noticeList")
	@ResponseBody
	public Map<String, Object> noticeList(String showPage) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		int stShowPage = Integer.parseInt(showPage);
		
		int currPage;
		if(showPage == null) {
			currPage = 1;
		}else {
			currPage = stShowPage;
		}
		
		PagingVO vo = noticeService.getNoticePageInfo(currPage); //페이징에 필요한 정보 계산
		List<NoticeVO> noticeList =  noticeService.getNoticePageList(vo);
		
		result.put("noticeList",noticeList);  
		result.put("pageInfo",vo);  //페이징정보
		result.put("currPage",currPage); //현재페이지

		return result;
	}
		
	// 공지사항 하나 조회
	@RequestMapping(value = "/noticeOne")
	public String noticeOne(NoticeVO noticeVO, Model model) throws Exception{
		
		model.addAttribute("noticeOne", noticeService.noticeSelectOne(noticeVO.getNtNo()));
		
		return "/board/noticeOne";
	}

//////////////////////////////////////////////////////////////////////////////////////////////////	
// 2023 01 12 14 14 faq 페이징 김동훈
	
	@Autowired
	private FAQService faqService;
	
	@RequestMapping(value="/faqList")
	@ResponseBody
	public Map<String, Object> faqList(String showPage, String category) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		int stShowPage = Integer.parseInt(showPage);
		
		int currPage;
		if(showPage == null) {
			currPage = 1;
		}else {
			currPage = stShowPage;
		}
		
		PagingVO vo = faqService.getFaqPageInfo(currPage, category); //페이징에 필요한 정보 계산
		List<FAQVO> faqList =  faqService.getFaqPageList(vo);
		
		result.put("faqList",faqList);  
		result.put("pageInfo",vo);  //페이징정보
		result.put("currPage",currPage); //현재페이지
		result.put("category", category);
		
		return result;
	}
	
	// FAQ 하나 조회
	@RequestMapping(value = "/faqOne")
	public String faqOne(FAQVO vo, Model model) throws Exception {

		model.addAttribute("faqOne", faqService.faqSelectOne(vo.getFaqNo()));

		return "/board/faqOne";
	}
	
	// 1:1 문의 
	@Autowired
	private QnService qnService;
	
	// 1:1 문의 관리자
	@Autowired
	private AnService anService;
	
	// 모든 1:1 문의 띄우기
	@RequestMapping(value="/boardQnList")
	@ResponseBody
	public Map<String, Object> adminQnList(String showPage, Integer sort) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		int stShowPage = Integer.parseInt(showPage);
		
		int currPage;
		if(showPage == null) {
			currPage = 1;
		}else {
			currPage = stShowPage;
		}
		
		int sortType;
		if(sort == null) {
			sortType = 1;
		}else {
			sortType = sort;
		}
		
		PagingVO vo = qnService.getQnAdminPageList(currPage, sortType); //페이징에 필요한 정보 계산
		List<QnVO> otoList =  qnService.getQnAdminPageList(vo);
		
		result.put("otoList",otoList);  
		result.put("pageInfo",vo);  //페이징정보
		result.put("currPage",currPage); //현재페이지

		return result;
	}
	
	// 문의글 하나 조회  
	@RequestMapping(value = "/boardQnOne")
	public String boardQnOne(QnVO vo, Model model) {
		model.addAttribute("boardQnOne", qnService.qnSelOne(vo.getOtqNo()));
		
		List<AnVO> boardAnList = anService.anList(vo.getOtqNo());
		model.addAttribute("boardAnList", boardAnList);
		
		return "/board/boardQnOne";
	}
	
	// 문의 작성
	@RequestMapping(value = "otqInsert")
	public String qnInsert(QnVO vo) {
		qnService.qnInsert(vo);
		
		return "redirect:/board/client";
	}
	
	// 문의 작성 화면
	@RequestMapping(value = "/otqInsertView")
	public String qnInsertView() {
		
		return "/board/otqInsertView";
	}
	
	// 문의 수정
	@RequestMapping(value = "/otqUpdate")
	public String qnUpdate(QnVO vo) {
		qnService.qnUpdate(vo);
		
		return "redirect:/board/client";
	}
	
	// 문의 수정 화면
	@RequestMapping(value = "/otqUpdateView")
	public String qnUpdateView(QnVO vo, Model model) {
		model.addAttribute("otqUp", qnService.qnSelOne(vo.getOtqNo()));
		
		return "/board/otqUpdateView";
	}
	
	// 문의 삭제
	@RequestMapping(value = "/otqDelete")
	public String qnDelete(QnVO vo) {
		
		qnService.qnDelete(vo.getOtqNo());
		
		return "redirect:/board/client";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
