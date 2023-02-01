package kr.co.olga.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.olga.service.AdminService;
import kr.co.olga.service.AnService;
import kr.co.olga.service.AnswerService;
import kr.co.olga.service.FAQService;
import kr.co.olga.service.MemberService;
import kr.co.olga.service.NewPdAnswerService;
import kr.co.olga.service.NewPdQuiryService;
import kr.co.olga.service.NoticeService;
import kr.co.olga.service.ProductService;
import kr.co.olga.service.PurchaseService;
import kr.co.olga.service.QnService;
import kr.co.olga.service.QuiryService;
import kr.co.olga.service.SelAnswerService;
import kr.co.olga.service.SelQuiryService;
import kr.co.olga.service.SellerService;
import kr.co.olga.service.StoreService;
import kr.co.olga.vo.AdminVO;
import kr.co.olga.vo.AnVO;
import kr.co.olga.vo.AnswerVO;
import kr.co.olga.vo.FAQVO;
import kr.co.olga.vo.MemberVO;
import kr.co.olga.vo.NewPdAnswerVO;
import kr.co.olga.vo.NewPdQuiryVO;
import kr.co.olga.vo.NoticeVO;
import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.ProductVO;
import kr.co.olga.vo.PurchaseVO;
import kr.co.olga.vo.QnVO;
import kr.co.olga.vo.QuiryVO;
import kr.co.olga.vo.SelAnswerVO;
import kr.co.olga.vo.SelQuiryVO;
import kr.co.olga.vo.SellerVO;
import kr.co.olga.vo.StoreVO;

@Controller
@RequestMapping(value = "/admin/")
public class AdminController {

/************ 로그인 ************************************************************************************************************************/
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value = "/enterAdminMain")
	public String adminMain() {
		return "/adminMain";
	}

	// 로그인
	@RequestMapping(value = "/adminLogin")
	public String adminLogin(String admId, String admPwd, HttpServletRequest request, RedirectAttributes rttr, Model model) {
		// vo로 로그인 구현
		HttpSession session = request.getSession();
		
		AdminVO vo = new AdminVO();
		vo.setAdmId(admId);
		vo.setAdmPwd(admPwd);
		AdminVO adminLo = adminService.adminLogin(vo);
		if(adminLo == null) {
			// 로그인 실패
			model.addAttribute("loginResult", "failed");
			return "/admin/adminLogin";
		}else {
			//일반 로그인 성공
			session.setAttribute("admin", adminLo);
			return "redirect:/admin/enterAdminMain";
		}
		
	}

	// 로그아웃
	@RequestMapping(value = "/adminLogout")
	public String logout(HttpSession session) throws Exception {

		session.invalidate();

		return "redirect:/master";
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

		model.addAttribute("storeOne", storeService.storeSelectOne(vo.getStlNo()));

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
	public String storeInsertView(StoreVO vo, Model model) {

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
	public String storeUpdateView(StoreVO vo, Model model) {
		
		model.addAttribute("update", storeService.storeSelectOne(vo.getStlNo()));

		return "/admin/storeUpdateView";
	}

	// 판매점 삭제
	@RequestMapping(value = "/storeDelete")
	public String storeDelete(StoreVO vo) {

		storeService.storeDeleteOne(vo.getStlNo());

		return "redirect:/admin/storeList";
	}

/************ 판매자 관리 ************************************************************************************************************************/

	@Autowired
	private SellerService sellerService;
	
	@RequestMapping(value="/seller")
	public String seller() {
		return "/admin/seller";
	}

	// 모든 판매자 목록
	@RequestMapping(value = "/sellerList")
	@ResponseBody
	public Map<String, Object> sellerList(String showPage, Integer sort) {
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
		
		PagingVO vo = sellerService.getSellerPageInfo(currPage, sortType); //페이징에 필요한 정보 계산
		List<SellerVO> sellerList = sellerService.getSellerPageList(vo);
		
		result.put("selList",sellerList);  
		result.put("pageInfo",vo);  //페이징정보
		result.put("currPage",currPage); //현재페이지

		return result;
	}

	// 판매자 조회(판매상품도 같이 조회)
	@RequestMapping(value = "/sellerOne")
	public String sellerOne(Model model, SellerVO selVo) {
		model.addAttribute("selOne", sellerService.sellerSelOne(selVo.getSelId()));
		
		List<ProductVO> pdList = productService.getSelectList(selVo.getSelstlBrandName());
		model.addAttribute("pdList", pdList);
		return "/admin/sellerOne";
	}
	
	// 판매자 권한 회수
	@RequestMapping(value = "/sellerGrant")
	public String sellerGrant(SellerVO vo)	{
		
		sellerService.sellerGrantUpdate(vo);
		
		return "redirect:/admin/seller";
	}
	
	// 판매자 권한 회수하는 화면
	@RequestMapping(value = "/sellerGrantView")
	public String sellerGrantView(SellerVO vo, Model model)	{
	
		model.addAttribute("selUp", sellerService.sellerSelOne(vo.getSelId()));
		
		return "admin/sellerGrantView";
	}
/************ 신상품 문의 답변 ************************************************************************************************************************/

	@Autowired
	private NewPdQuiryService newPdQuiryService;
	
	@Autowired
	private NewPdAnswerService newPdAnswerService;
	
	// 신상품 등록 문의 리스트
	@RequestMapping(value = "newPdQuiryList")
	@ResponseBody
	public Map<String, Object> newPdQuiryList(String showPage, Integer sort) {
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
		
		
		PagingVO vo = newPdQuiryService.getNewPdQuiryAdminPageInfo(currPage, sortType); //페이징에 필요한 정보 계산
		List<SelQuiryVO> npqList = newPdQuiryService.getNewPdQuiryAdminPageList(vo);
		
		result.put("npqList",npqList);  
		result.put("pageInfo",vo);  //페이징정보
		result.put("currPage",currPage); //현재페이지

		return result;
	}
	
	// 신상품 등록 문의 조회 + 답글
	@RequestMapping(value = "/newPdQuiryOne")
	public String newPdQuiryOne(NewPdQuiryVO vo, Model model) {
		model.addAttribute("newPdQuiryOne", newPdQuiryService.newPdQuirySelectOne(vo.getNpqNo()));
		
		List<NewPdAnswerVO> newPdAnList = newPdAnswerService.newPdAnswerSelectOne(vo.getNpqNo());
		model.addAttribute("newPdAnList", newPdAnList);
		
		return "/admin/newPdQuiryOne";
	}
	
	// 문의 답글 등록
	@RequestMapping(value ="newPdAnswerInsert")
	public String newPdAnswerInsert(NewPdAnswerVO vo) {
		newPdAnswerService.newPdAnswerInsert(vo);
		
		NewPdQuiryVO npqVo = new NewPdQuiryVO();
		npqVo.setNpqNo(vo.getNpanpqNo());
		npqVo.setNpqState(1L);
		newPdQuiryService.newPdQuiryStateUpdate(npqVo);
		
		return "redirect:/admin/seller";
	}
	
	// 문의 답글 등록 화면 
	@RequestMapping(value = "newPdAnswerInsertView")
	public String newPdAnswerInsertView(NewPdQuiryVO vo, Model model) {
		model.addAttribute("npaIn", newPdQuiryService.newPdQuirySelectOne(vo.getNpqNo()));
		
		return "/admin/newPdAnswerInsertView";
	}
	
	// 문의 답글 수정
	@RequestMapping(value = "newPdAnswerUpdate")
	public String newPdAnswerUpdate(NewPdAnswerVO vo) {
		newPdAnswerService.newPdAnswerUpdate(vo);
		
		return "redirect:/admin/seller";
	}
	
	// 문의 답글 수정 화면
	@RequestMapping(value = "newPdAnswerUpdateView")
	public String newPdAnswerUpdateView(NewPdQuiryVO vo, Model model) {
		model.addAttribute("npaUp", newPdQuiryService.newPdQuirySelectOne(vo.getNpqNo()));
		
		return "/admin/newPdAnswerUpdateView";
	}
	
	
/************ 판매자 문의 관리 ************************************************************************************************************************/

	@Autowired
	private SelQuiryService selquiryService;
	
	@Autowired
	private SelAnswerService selanswerService;
	
	// 판매자 문의 목록 + 페이징
	@RequestMapping(value = "/selQuiryList")
	@ResponseBody
	public Map<String, Object> selQuiryList(String showPage, Integer sort) {
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
		
		PagingVO vo = selquiryService.getSelQuiryPageInfo(currPage, sortType); //페이징에 필요한 정보 계산
		List<SelQuiryVO> sqList = selquiryService.getSelQuiryPageList(vo);
		
		result.put("sqList",sqList);  
		result.put("pageInfo",vo);  //페이징정보
		result.put("currPage",currPage); //현재페이지

		return result;
	}
	
	// 판매자 문의 조회
	@RequestMapping(value = "/selQuiryOne")
	public String selQuiryOne(Model model, SelQuiryVO vo)	{
		model.addAttribute("selQuiryOne", selquiryService.getSelectOne(vo.getSqNo()));
		
		List<SelAnswerVO> selAnList = selanswerService.selAnswerList(vo.getSqNo());
		model.addAttribute("selAnList", selAnList);
		
		return "/admin/selQuiryOne";
	}
	
	// 답글 등록
	@RequestMapping(value ="/selAnswerInsert")
	public String selAnswerInsert(SelAnswerVO vo) {
		selanswerService.selAnswerInsert(vo);
		
		SelQuiryVO sqVo = new SelQuiryVO();
		sqVo.setSqNo(vo.getSasqNo());
		sqVo.setSqState(1L);
		selquiryService.selQuiryStateUpdate(sqVo);
		
		return "redirect:/admin/seller";
	}
	
	// 답글 등록 화면
	@RequestMapping(value ="/selAnswerInsertView")
	public String selAnswerInsertView(SelQuiryVO vo, Model model) {
		model.addAttribute("selAnswerIn", selquiryService.getSelectOne(vo.getSqNo()));
		
		return "/admin/selAnswerInsertView";
	}
	
	// 답글 수정
	@RequestMapping(value ="/selAnswerUpdate")
	public String selAnswerUpdate(SelAnswerVO vo) {
		selanswerService.selAnswerUpdate(vo);
		
		return "redirect:/admin/seller";
	}
	
	// 답글 수정 화면
	@RequestMapping(value ="/selAnswerUpdateView")
	public String selAnswerUpdateView(Model model, SelQuiryVO vo) {
		model.addAttribute("selAnswerUp", selquiryService.getSelectOne(vo.getSqNo()));
		
		return "/admin/selAnswerUpdateView";
	}

/************ 상품 관리 ************************************************************************************************************************/

	@Autowired
	private ProductService productService;
	
	@RequestMapping(value="/product")
	public String product() {
		return "/admin/product";
	}

	// 모든 상품 목록
	@RequestMapping(value = "/productList")
	@ResponseBody
	public Map<String, Object> productList(String showPage) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		int stShowPage = Integer.parseInt(showPage);
		
		int currPage;
		if(showPage == null) {
			currPage = 1;
		}else {
			currPage = stShowPage;
		}
		
		PagingVO vo = productService.getProductAdminPageInfo(currPage); //페이징에 필요한 정보 계산
		List<ProductVO> productList =  productService.getProductAdminPageList(vo);
		
		result.put("pdList",productList);  
		result.put("pageInfo",vo);  //페이징정보
		result.put("currPage",currPage); //현재페이지

		return result;
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

		return "redirect:/admin/product";
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

		return "redirect:/admin/product";
	}

	// 상품 수정 화면
	@RequestMapping(value = "/productUpdateView")
	public String productUpdateView(ProductVO vo, Model model) {
		
		model.addAttribute("update", productService.productSelectOne(vo.getPdId()));

		return "/admin/productUpdateView";
	}

	// 상품 삭제
	@RequestMapping(value = "/productDelete")
	public String productDelete(ProductVO vo) {

		productService.productDelete(vo.getPdId());

		return "redirect:/admin/product";
	}

/************ 상품 문의 답변 ************************************************************************************************************************/
	
	// 상품 문의 
	@Autowired
	private QuiryService quiryService;
	
	// 상품 문의 답변 
	@Autowired
	private AnswerService answerService;
	
	// 상품 문의 목록
	@RequestMapping(value = "/quiryAdmin")
	@ResponseBody
	public Map<String, Object> quiryAdmin(String showPage, Integer sort) {
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
		
		PagingVO vo = quiryService.getQuiryAdminPageInfo(currPage, sortType);
		List<QuiryVO> pdQnPageList =  quiryService.getQuiryAdminPageList(vo);
		
		result.put("pdQuiryList",pdQnPageList);  
		result.put("pageInfo",vo);  //페이징정보
		result.put("currPage",currPage); //현재페이지

		return result;
	}
	
	// 상품 문의 조회 + 답변
	@RequestMapping(value = "adminQuiryOne")
	public String adminQuiryOne(QuiryVO vo, Model model){
		model.addAttribute("adminQuiryOne", quiryService.quirySelOne(vo.getIqNo()));
		
		List<AnswerVO> answerList = answerService.answerList(vo.getIqNo());
		model.addAttribute("answerList", answerList);
		
		return "/admin/adminQuiryOne";
	}
	
	// 상품 문의 답변 추가
	@RequestMapping(value = "/answerInsert")
	public String answerInsert(AnswerVO vo ) {
		
		answerService.answerInsert(vo);
		
		QuiryVO quVo = new QuiryVO();

		quVo.setIqNo(vo.getIaiqNo());
		quVo.setIqState(1L);
		quiryService.quiryStateUpdate(quVo);
		
		return "redirect:/admin/product";
	}
	
	// 상품 문의 답변 추가 화면
	@RequestMapping(value = "/answerInsertView")
	public String answerInsertView(QuiryVO vo, Model model) {
		model.addAttribute("quiryIn", quiryService.quirySelOne(vo.getIqNo()));
		
		return "/admin/answerInsertView";
	}
	
	// 상품 문의 답변 수정
	@RequestMapping(value = "/answerUpdate")
	public String answerUpdate(AnswerVO vo) {
		answerService.answerUpdate(vo);
		
		return "redirect:/admin/product";
	}
	
	// 상품 문의 답변 수정 화면
	@RequestMapping(value = "/answerUpdateView")
	public String answerUpdateView(QuiryVO vo, Model model) {
		model.addAttribute("quiryUp", quiryService.quirySelOne(vo.getIqNo()));
		
		return "/admin/answerUpdateView";
	}	

/************ 공지사항 관리 ************************************************************************************************************************/

	@Autowired
	private NoticeService noticeService;

	@RequestMapping(value="/clientList")
	public String client() {
		return "/admin/clientList";
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
	public String noticeOne(NoticeVO vo, Model model) throws Exception {

		model.addAttribute("noticeOne", noticeService.noticeSelectOne(vo.getNtNo()));

		return "/admin/noticeOne";
	}

	// 공지사항 글 추가
	@RequestMapping(value = "/noticeInsert")
	public String noticeInsert(NoticeVO vo) throws Exception {

		noticeService.noticeInsert(vo);

		return "redirect:/admin/clientList";
	}
	
	// 공지사항 글 추가 화면
	@RequestMapping(value = "/noticeInsertView")
	public String noticeInsertView() throws Exception {

		return "/admin/noticeInsertView";
	}

	// 공지사항 수정
	@RequestMapping(value = "/noticeUpdate")
	public String noticeUpdate(NoticeVO vo) throws Exception {
		noticeService.noticeUpdate(vo);

		return "redirect:/admin/clientList";
	}

	// 공지사항 수정 화면
	@RequestMapping(value = "/noticeUpdateView")
	public String noticeUpdateView(NoticeVO vo, Model model) throws Exception {
		
		model.addAttribute("update", noticeService.noticeSelectOne(vo.getNtNo()));

		return "/admin/noticeUpdateView";
	}	
	
	// 공지사항 삭제
	@RequestMapping(value = "/noticeDelete")
	public String noticeDelete(NoticeVO vo) throws Exception {
		noticeService.noticeDeleteOne(vo.getNtNo());

		return "redirect:/admin/clientList";
	}

/************ FAQ 관리 ************************************************************************************************************************/	
	
	@Autowired
	private FAQService faqService;
	
	// FAQ 목록
	@RequestMapping(value="/faqList")
	@ResponseBody
	public Map<String, Object> faqList(String showPage) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		int stShowPage = Integer.parseInt(showPage);
		
		int currPage;
		if(showPage == null) {
			currPage = 1;
		}else {
			currPage = stShowPage;
		}
		
		PagingVO vo = faqService.getFaqAdminPageInfo(currPage); //페이징에 필요한 정보 계산
		List<FAQVO> faqList =  faqService.getFaqAdminPageList(vo);
		
		result.put("faqList",faqList);  
		result.put("pageInfo",vo);  //페이징정보
		result.put("currPage",currPage); //현재페이지

		return result;
	}
	
	// FAQ 하나 조회
	@RequestMapping(value = "/faqOne")
	public String faqOne(FAQVO vo, Model model) throws Exception {

		model.addAttribute("faqOne", faqService.faqSelectOne(vo.getFaqNo()));

		return "/admin/faqOne";
	}

	// FAQ 글 추가
	@RequestMapping(value = "/faqInsert")
	public String faqInsert(FAQVO vo) throws Exception {

		faqService.faqInsert(vo);

		return "redirect:/admin/clientList";
	}
	
	// FAQ 글 추가 화면
	@RequestMapping(value = "/faqInsertView")
	public String faqInsertView() throws Exception {

		return "/admin/faqInsertView";
	}

	// FAQ 수정
	@RequestMapping(value = "/faqUpdate")
	public String faqUpdate(FAQVO vo) throws Exception {
		faqService.faqUpdate(vo);

		return "redirect:/admin/clientList";
	}

	// FAQ 수정 화면
	@RequestMapping(value = "/faqUpdateView")
	public String faqUpdateView(FAQVO vo, Model model) throws Exception {
		
		model.addAttribute("update", faqService.faqSelectOne(vo.getFaqNo()));

		return "/admin/faqUpdateView";
	}	
	
	// FAQ 삭제
	@RequestMapping(value = "/faqDelete")
	public String faqDelete(FAQVO vo) throws Exception {
		faqService.faqDeleteOne(vo.getFaqNo());

		return "redirect:/admin/clientList";
	}	
	
/************ 회원 관리 ************************************************************************************************************************/		
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private PurchaseService purchaseService;
	
	@RequestMapping(value="/memberGrade")
	public String memberGrade() {
		return "/admin/memberGrade";
	}
	
	// 회원 등급 조정 목록
	@RequestMapping(value = "/memberGradeList")
	@ResponseBody
	public Map<String, Object> memberGradeList(String showPage, Integer sort) {
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
		
		PagingVO vo = purchaseService.getMemPurchaseAdminPageInfo(currPage, sortType); //페이징에 필요한 정보 계산
		List<MemberVO> memList =  purchaseService.getMemPurchaseAdminPageList(vo);
		
		result.put("memList",memList);  
		result.put("pageInfo",vo);  //페이징정보
		result.put("currPage",currPage); //현재페이지

		return result;	
		
	}
	
	// 회원 조회
	@RequestMapping(value = "/memOne")
	public String memOne(MemberVO vo, Model model) {
		model.addAttribute("adminMemOne", memberService.memSelectOne(vo.getMemId()));
		
		return "/admin/memOne";
	}
	
	// 회원 등급 변경
	@RequestMapping(value = "/memGradeUpdate")
	public String memGradeUpdate(MemberVO vo) {
		memberService.memGradeUpdate(vo);
		
		return "redirect:/admin/memberGrade";
	}
	
	// 회원 등급 변경 화면
	@RequestMapping(value = "/memGradeUpdateView")
	public String memGradeUpdateView(MemberVO vo, Model model) {
		model.addAttribute("memGradeUpd", memberService.memSelectOne(vo.getMemId()));
		
		return "/admin/memGradeUpdateView";
	}
	
	
/************ 1:1 문의 관리 ************************************************************************************************************************/		
	
	// 1:1 문의 회원
	@Autowired
	private QnService qnService;
	
	// 1:1 문의 관리자
	@Autowired
	private AnService anService;
	
	// 모든 1:1 문의 띄우기
	@RequestMapping(value="/adminQnList")
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
	@RequestMapping(value = "/adminQnOne")
	public String adminQnOne(QnVO vo, Model model) {
		model.addAttribute("adminQnOne", qnService.qnSelOne(vo.getOtqNo()));
		
		List<AnVO> adminAnList = anService.anList(vo.getOtqNo());
		model.addAttribute("adminAnList", adminAnList);
		
		return "/admin/adminQnOne";
	}
	
	// 답변 달기
	@RequestMapping(value = "/anInsert")
	public String anInsert(AnVO vo) {
		
		anService.anInsert(vo);
		
		QnVO qnVo = new QnVO();
		
		qnVo.setOtqNo(vo.getOtaotqNo());
		qnVo.setOtqState(1L);
		qnService.qnStateUpdate(qnVo);
		
		return "redirect:/admin/clientList";
	}
	
	// 답변 달기 화면
	@RequestMapping(value = "/anInsertView")
	public String anInsertView(QnVO vo,Model model) {
		model.addAttribute("anIn", qnService.qnSelOne(vo.getOtqNo()));
		
		return "/admin/anInsertView";
	}
	
	// 답변 수정
	@RequestMapping(value = "/anUpdate")
	public String anUpdate(AnVO vo) {
		anService.anUpdate(vo);
		
		return "redirect:/admin/clientList";
	}
	
	// 답변 수정 화면
	@RequestMapping(value = "/anUpdateView")
	public String anUpdateView(QnVO vo, Model model) {
		model.addAttribute("anUp", qnService.qnSelOne(vo.getOtqNo()));
		
		return "/admin/anUpdateView";
	}
	
/************ 관리자 통계 ************************************************************************************************************************/	
	
	@RequestMapping(value = "/adminStats")
	public String adminStats() {
		return "/admin/adminStats";
	}
	
	// 일일 매출액
	@RequestMapping(value="/daySalesVolume")
	@ResponseBody
	public Map<String, Object> daySalesVolume() {
		Map<String, Object> result = new HashMap<String, Object>();
		
		long plListTotal = purchaseService.daySalesVolumeSelect();
		String plListDate = purchaseService.daySelect();
		
				
		result.put("plListTotal", plListTotal);
		result.put("plListDate", plListDate);
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
