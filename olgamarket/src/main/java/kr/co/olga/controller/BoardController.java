package kr.co.olga.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	// 공지사항 목록 조회
	@RequestMapping(value = "/noticeList")
	public String noticeList(Model model, Integer showPage) throws Exception{
		int currPage;
		if(showPage == null) {
			currPage = 1;
		}else {
			currPage = showPage;
		}
		
		PagingVO vo = noticeService.getNoticePageInfo(currPage); //페이징에 필요한 정보 계산
		List<NoticeVO> pageList =  noticeService.getNoticePageList(vo);
		
		model.addAttribute("NoticeList",pageList);  //게시판목록
		model.addAttribute("pageInfo",vo);  //페이징정보
		model.addAttribute("currPage",currPage); //현재페이지
		
		return "/board/noticeList";
	}
		
	// 공지사항 하나 조회
	@RequestMapping(value = "/noticeView")
	public String read(NoticeVO noticeVO, Model model) throws Exception{
		
		model.addAttribute("noticeRead", noticeService.noticeSelectOne(noticeVO.getNtNo()));
		
		return "/board/noticeView";
	}

//////////////////////////////////////////////////////////////////////////////////////////////////	
// 2023 01 12 14 14 faq 페이징 김동훈
	
	@Autowired
	private FAQService faqService;
	
	@RequestMapping(value="/faqList")
	public String newProduct(Model model,Integer showPage,String category) {
		int currPage;
		if(showPage == null) {
			currPage = 1;
		}else {
			currPage = showPage;
		}
		
		PagingVO vo = faqService.getFaqPageInfo(currPage,category); //페이징에 필요한 정보 계산
		List<FAQVO> pageList =  faqService.getFaqPageList(vo);
		
		model.addAttribute("FaqList",pageList);  //게시판목록
		model.addAttribute("pageInfo",vo);  //페이징정보
		model.addAttribute("currPage",currPage); //현재페이지
		model.addAttribute("category",category);
		
		return "/board/faqList";
	}
	
	// FAQ 하나 조회
	@RequestMapping(value = "/faqOne")
	public String faqOne(FAQVO vo, Model model) throws Exception {

		model.addAttribute("faqRead", faqService.faqSelectOne(vo.getFaqNo()));

		return "/board/faqOne";
	}
	
	// 1:1 문의 
	@Autowired
	private QnService qnService;
	
	// 1:1 문의 관리자
	@Autowired
	private AnService anService;
	
	// 목록 (memId에 해당 하는 것 만 띄우기)
	@RequestMapping(value = "memQnListView")
	public String memQnListView(Integer showPage, Model model) {
		int currPage;
		if(showPage == null) {
			currPage = 1;
		}else {
			currPage = showPage;
		}
		
		PagingVO vo = qnService.getQnPageInfo(currPage); //페이징에 필요한 정보 계산
		List<QnVO> pageList =  qnService.getQnPageList(vo);
		
		model.addAttribute("memQnList",pageList);  // 1:1 목록
		model.addAttribute("pageInfo",vo);  //페이징정보
		model.addAttribute("currPage",currPage); //현재페이지
		
		return "/board/memQnListView";
	}
	
	// 문의 조회
	@RequestMapping(value = "memQnOneView")
	public String memQnOneView(QnVO vo, Model model, Long otaotqNo) {
		model.addAttribute("memQnOne", qnService.qnSelOne(vo.getOtqNo()));
		
		List<AnVO> anList = anService.anList(vo.getOtqNo());
		model.addAttribute("memAnList", anList);
		
		return "/board/memQnOneView";
	}
	
	// 문의 작성
	@RequestMapping(value = "qnInsert")
	public String qnInsert(QnVO vo) {
		qnService.qnInsert(vo);
		
		return "redirect:/board/memQnListView";
	}
	
	// 문의 작성 화면
	@RequestMapping(value = "qnInsertView")
	public String qnInsertView() {
		
		return "/board/qnInsertView";
	}
	
	// 문의 수정
	@RequestMapping(value = "qnUpdate")
	public String qnUpdate(QnVO vo) {
		qnService.qnUpdate(vo);
		
		return "redirect:/board/memQnListView";
	}
	
	// 문의 수정 화면
	@RequestMapping(value = "qnUpdateView")
	public String qnUpdateView() {
		
		return "/board/qnUpdateView";
	}
	
	// 문의 삭제
	@RequestMapping(value = "qnDelete")
	public String qnDelete(QnVO vo) {
		
		qnService.qnDelete(vo.getOtqNo());
		
		return "redirect:/board/memQnListView";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
