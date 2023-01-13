package kr.co.olga.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.olga.service.AdminService;
import kr.co.olga.service.FAQService;
import kr.co.olga.service.MemberService;
import kr.co.olga.service.NoticeService;
import kr.co.olga.service.ProductService;
import kr.co.olga.service.SellerService;
import kr.co.olga.service.StoreService;
import kr.co.olga.vo.AdminVO;
import kr.co.olga.vo.FAQVO;
import kr.co.olga.vo.MemberVO;
import kr.co.olga.vo.NoticeVO;
import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.ProductVO;
import kr.co.olga.vo.SellerVO;
import kr.co.olga.vo.StoreVO;

@Controller
@RequestMapping(value = "/admin/")
public class AdminController {

/************ 로그인 ************************************************************************************************************************/

	@Autowired
	private AdminService adminService;

	// 로그인
	@RequestMapping(value = "/adminLogin")
	public String adminLogin(AdminVO vo, HttpServletRequest request, RedirectAttributes rttr) {

		HttpSession session = request.getSession();
		AdminVO login = adminService.adminLogin(vo);

		if (login == null) {
			session.setAttribute("admin", null);
			rttr.addAttribute("admin", false);
		} else {
			session.setAttribute("admin", login);
		}

		return "redirect:/";
	}

	// 로그아웃
	@RequestMapping(value = "/adminLogout")
	public String logout(HttpSession session) throws Exception {

		session.invalidate();

		return "redirect:/";
	}

/************ 판매점 관리 ************************************************************************************************************************/

	@Autowired
	private StoreService storeService;

	// 모든 판매점 목록
	@RequestMapping(value = "/storeList")
	public String storeList(Model model, Integer showPage) {
		int currPage;
		if(showPage == null) {
			currPage = 1;
		}else {
			currPage = showPage;
		}
		
		PagingVO vo = storeService.getStorePageInfo(currPage); //페이징에 필요한 정보 계산
		List<StoreVO> pageList =  storeService.getStorePageList(vo);
		
		model.addAttribute("storeList",pageList);  //게시판목록
		model.addAttribute("pageInfo",vo);  //페이징정보
		model.addAttribute("currPage",currPage); //현재페이지

		return "/admin/storeList";
	}

	// 판매점 하나 조회
	@RequestMapping(value = "/storeOne")
	public String storeOne(Model model, StoreVO vo) {

		model.addAttribute("storeOne", storeService.storeSelectOne(vo.getStlBrandName()));

		return "/admin/storeOne";
	}

	// 판매점 추가
	@RequestMapping(value = "/storeInsert")
	public String storeInsert(StoreVO vo) {

		storeService.storeInsert(vo);

		return "redirect:/admin/storeList";
	}

	// 판매점 추가 화면
	@RequestMapping(value = "/storeInsertView")
	public String storeInsertView() {

		return "/admin/storeInsertView";
	}

	// 판매점 수정
	@RequestMapping(value = "/storeUpdate")
	public String storeUpdate(StoreVO vo) {

		storeService.storeUpdate(vo);

		return "redirect:/admin/storeList";
	}

	// 판매점 수정 화면
	@RequestMapping(value = "/storeUpdateView")
	public String storeUpdateView() {

		return "/admin/storeUpdateView";
	}

	// 판매점 삭제
	@RequestMapping(value = "/storeDelete")
	public String storeDelete(String stlBrandName) {

		storeService.storeDeleteOne(stlBrandName);

		return "redirect:/admin/storeList";
	}

/************ 판매자 관리 ************************************************************************************************************************/

	@Autowired
	private SellerService sellerService;

	// 모든 판매자 목록
	@RequestMapping(value = "/sellerManage")
	public String sellerManage(Model model, Integer showPage) {
		int currPage;
		if(showPage == null) {
			currPage = 1;
		}else {
			currPage = showPage;
		}
		
		PagingVO vo = sellerService.getSellerPageInfo(currPage); //페이징에 필요한 정보 계산
		List<NoticeVO> pageList =  sellerService.getSellerPageList(vo);
		
		model.addAttribute("sellerList",pageList);  //게시판목록
		model.addAttribute("pageInfo",vo);  //페이징정보
		model.addAttribute("currPage",currPage); //현재페이지

		List<SellerVO> slVo = sellerService.sellerSelAll();
		model.addAttribute("slList", slVo);

		return "/admin/sellerManage";
	}

	// 판매자 조회(판매상품도 같이 조회)
	@RequestMapping(value = "/sellerOne")
	public String sellerOne(Model model, SellerVO vo) {

		model.addAttribute("selOne", sellerService.sellerSelOne(vo.getSelId()));

		return "/adimn/sellerOne";
	}
/*
	
	// 판매자에 해당 하는 상품 목록
	@RequestMapping(value = "/sellerPdList")
	public String sellerPdList(Model model, Integer showPage) {
		int currPage;
		if(showPage == null) {
			currPage = 1;
		}else {
			currPage = showPage;
		}
		
		PagingVO vo = productService.getProductPageInfo(currPage); //페이징에 필요한 정보 계산
		List<ProductVO> pageList =  productService.getProductPageList(vo);
		
		model.addAttribute("sellerPdList",pageList);  //상품 목록
		model.addAttribute("pageInfo",vo);  //페이징정보
		model.addAttribute("currPage",currPage); //현재페이지

		List<SellerVO> slVo = sellerService.sellerSelAll();
		model.addAttribute("slList", slVo);
		
		
		return "/admin/sellerPdList";
	}
*/
/************ 상품 관리 ************************************************************************************************************************/

	@Autowired
	private ProductService productService;

	// 모든 상품 목록
	@RequestMapping(value = "/productList")
	public String productList(Model model, Integer showPage) {
		int currPage;
		if (showPage == null) {
			currPage = 1;
		} else {
			currPage = showPage;
		}
		
		PagingVO vo = productService.getProductPageInfo(currPage);
		List<ProductVO> pageList = productService.getProductPageList(vo);
		
		model.addAttribute("productList", pageList); // 상품목록
		model.addAttribute("pageInfo", vo); // 페이징정보
		model.addAttribute("currPage", currPage); // 현재페이지
		
		return "/admin/productList";
	}

	// 상품 하나 조회
	@RequestMapping(value = "/productOne")
	public String productOne(Model model, ProductVO vo) {

		model.addAttribute("productOne", productService.productSelectOne(vo.getPdId()));

		return "/admin/productOne";
	}

	// 상품 추가
	@RequestMapping(value = "/productInsert")
	public String productInsert(ProductVO vo) {

		productService.productInsert(vo);

		return "redirect:/admin/productList";
	}

	// 상품 추가 화면
	@RequestMapping(value = "/productInsertView")
	public String productInsertView() {

		return "/admin/productInsertView";
	}

	// 상품 수정
	@RequestMapping(value = "/productUpdate")
	public String productUpdate(ProductVO vo) {

		productService.productUpdate(vo);

		return "redirect:/admin/productList";
	}

	// 상품 수정 화면
	@RequestMapping(value = "/productUpdateView")
	public String productUpdateView() {

		return "/admin/productUpdateView";
	}

	// 상품 삭제
	@RequestMapping(value = "/productDelete")
	public String productDelete(long pdId) {

		productService.productDelete(pdId);

		return "redirect:/admin/productDelete";
	}

/************ 공지사항 관리 ************************************************************************************************************************/

	@Autowired
	private NoticeService noticeService;

	// 공지사항 목록 조회
	@RequestMapping(value = "/noticeList")
	public String noticeList(Model model, Integer showPage) throws Exception {
		int currPage;
		if (showPage == null) {
			currPage = 1;
		} else {
			currPage = showPage;
		}

		PagingVO vo = noticeService.getNoticePageInfo(currPage); // 페이징에 필요한 정보 계산
		List<NoticeVO> pageList = noticeService.getNoticePageList(vo);

		model.addAttribute("NoticeList", pageList); // 게시판목록
		model.addAttribute("pageInfo", vo); // 페이징정보
		model.addAttribute("currPage", currPage); // 현재페이지

		return "/admin/noticeList";
	}

	// 공지사항 하나 조회
	@RequestMapping(value = "/noticeOne")
	public String noticeOne(NoticeVO noticeVO, Model model) throws Exception {

		model.addAttribute("noticeRead", noticeService.noticeSelectOne(noticeVO.getNtNo()));

		return "/admin/noticeOne";
	}

	// 공지사항 글 추가
	@RequestMapping(value = "/noticeWrite")
	public String noticeWrite(NoticeVO noticeVO) throws Exception {

		noticeService.noticeInsert(noticeVO);

		return "redirect:/";
	}
	
	// 공지사항 글 추가 화면
	@RequestMapping(value = "/noticeWriteView")
	public String noticeWriteView() throws Exception {

		return "/admin/noticeWriteView";
	}

	// 공지사항 수정
	@RequestMapping(value = "/noticeUpdate")
	public String noticeUpdate(NoticeVO noticeVO) throws Exception {
		noticeService.noticeUpdate(noticeVO);

		return "redirect:/admin/noticeList";
	}

	// 공지사항 수정 화면
	@RequestMapping(value = "/noticeUpdateView")
	public String noticeUpdateView(NoticeVO noticeVO, Model model) throws Exception {
		model.addAttribute("noticeUpdate", noticeService.noticeSelectOne(noticeVO.getNtNo()));

		return "/admin/noticeUpdateView";
	}	
	
	// 공지사항 삭제
	@RequestMapping(value = "/noticeDelete")
	public String noticeDelete(NoticeVO noticeVO) throws Exception {
		noticeService.noticeDeleteOne(noticeVO.getNtNo());

		return "redirect:/admin/noticeList";
	}

/************ FAQ 관리 ************************************************************************************************************************/	
	
	@Autowired
	private FAQService faqService;
	
	// FAQ 목록
	@RequestMapping(value="/faqList")
	public String faqList(Model model,Integer showPage,String category) {
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
		
		return "/admin/faqList";
	}
	
	// FAQ 하나 조회
	@RequestMapping(value = "/faqOne")
	public String faqOne(FAQVO vo, Model model) throws Exception {

		model.addAttribute("faqRead", faqService.faqSelectOne(vo.getFaqNo()));

		return "/admin/faqOne";
	}

	// FAQ 글 추가
	@RequestMapping(value = "/faqWrite")
	public String faqWrite(FAQVO vo) throws Exception {

		faqService.faqInsert(vo);

		return "redirect:/admin/faqList";
	}
	
	// FAQ 글 추가 화면
	@RequestMapping(value = "/faqWriteView")
	public String faqWriteView() throws Exception {

		return "/admin/faqWriteView";
	}

	// FAQ 수정
	@RequestMapping(value = "/faqUpdate")
	public String faqUpdate(FAQVO vo) throws Exception {
		faqService.faqUpdate(vo);

		return "redirect:/admin/faqList";
	}

	// FAQ 수정 화면
	@RequestMapping(value = "/faqUpdateView")
	public String faqUpdateView(FAQVO vo, Model model) throws Exception {
		model.addAttribute("faqUpdate", faqService.faqSelectOne(vo.getFaqNo()));

		return "/admin/faqUpdateView";
	}	
	
	// FAQ 삭제
	@RequestMapping(value = "/faqDelete")
	public String faqDelete(FAQVO vo) throws Exception {
		noticeService.noticeDeleteOne(vo.getFaqNo());

		return "redirect:/admin/faqList";
	}	
	
/************ 회원 관리 ************************************************************************************************************************/		
	
	@Autowired
	private MemberService memberService;
	
	// 회원 목록
	@RequestMapping(value = "/memberList")
	public String memberList(Model model, Integer showPage) {
		int currPage;
		if (showPage == null) {
			currPage = 1;
		} else {
			currPage = showPage;
		}

		PagingVO vo = memberService.getMemberPageInfo(currPage); // 페이징에 필요한 정보 계산
		List<NoticeVO> pageList = memberService.getMemberPageList(vo);

		model.addAttribute("memberList", pageList); // 회원목록
		model.addAttribute("pageInfo", vo); // 페이징정보
		model.addAttribute("currPage", currPage); // 현재페이지
		
		return "/admin/memberList";
	}
	
	// 회원 정지 (업데이트)
	@RequestMapping(value = "memRepot")
	public String memRepot(MemberVO vo) {
		memberService.memRepot(vo);
		
		return "redirect:/admin/memberList";
	}
	
	/*
	// 회원 정지 화면 (업데이트)
	@RequestMapping(value = "memRepotView")
	public String memRepotView() {
		
		return "";
	}
	*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
