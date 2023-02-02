package kr.co.olga.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.olga.service.AnswerService;
import kr.co.olga.service.FavorService;
import kr.co.olga.service.MemberService;
import kr.co.olga.service.PurchaseService;
import kr.co.olga.service.QuiryService;
import kr.co.olga.service.ReviewService;
import kr.co.olga.service.ShipService;
import kr.co.olga.vo.AnswerVO;
import kr.co.olga.vo.FavorVO;
import kr.co.olga.vo.MemberVO;
import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.PurchaseVO;
import kr.co.olga.vo.QuiryVO;
import kr.co.olga.vo.ReviewVO;
import kr.co.olga.vo.ShipVO;

@Controller
@RequestMapping(value = "/myPage/")
public class MyPageController {

	@RequestMapping(value = "/myPageList")
	public String myPageList() {
		return "/myPage/myPageList";
	}
	
	@Autowired
	private PurchaseService purchaseService;
	
	@Autowired
	private ShipService shipService;
	
	@Autowired
	private FavorService favorService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private QuiryService quiryService;
	
	@Autowired
	private AnswerService answerService;
	
	@Autowired
	private ReviewService reviewService;

	// 주문내역
	@RequestMapping(value = "/purchase")
	@ResponseBody
	public Map<String, Object> purchaseList(String showPage, String plmemId) {
		Map<String, Object> result = new HashMap<String, Object>();

		int stShowPage = Integer.parseInt(showPage);

		int currPage;
		if (showPage == null) {
			currPage = 1;
		} else {
			currPage = stShowPage;
		}

		PagingVO vo = purchaseService.getMemPurchasePageInfo(currPage, plmemId); //페이징에 필요한 정보 계산
		List<PurchaseVO> purchaseList =  purchaseService.getMemPurchasePageList(vo);

		result.put("purchaseList", purchaseList);
		result.put("pageInfo", vo); // 페이징정보
		result.put("currPage", currPage); // 현재페이지

		return result;
	}
	
	// 배송지
	@RequestMapping(value = "/shipList")
	@ResponseBody
	public Map<String, Object> shipList(String showPage, String slmemId) {
		Map<String, Object> result = new HashMap<String, Object>();

		int stShowPage = Integer.parseInt(showPage);

		int currPage;
		if (showPage == null) {
			currPage = 1;
		} else {
			currPage = stShowPage;
		}

		PagingVO vo = shipService.getMemShipPageInfo(currPage, slmemId); //페이징에 필요한 정보 계산
		List<ShipVO> myShipList =  shipService.getMemShipPageList(vo);

		result.put("myShipList", myShipList);
		result.put("pageInfo", vo); // 페이징정보
		result.put("currPage", currPage); // 현재페이지

		return result;
	}
	
	// 배송지 추가
	@RequestMapping(value = "/shipInsert")
	public String shipInsert(String slmemId, String postcode, String address, String detailAddress, String extraAddress) {
		
		String slAddress = postcode + " " + address + " " + detailAddress + " " + extraAddress;
		ShipVO vo = new ShipVO(null, slmemId, slAddress);
		shipService.shipInsert(vo);
		
		return "redirect:/myPage/myPageList";
	}
	
	// 배송지 추가 화면
	@RequestMapping(value = "/shipInsertView")
	public String shipInsertView() {
		
		return "/myPage/shipInsertView";
	}
	
	// 배송지 조회
	@RequestMapping(value = "/shipOne")
	public String shipOne(ShipVO vo, Model model) {
		model.addAttribute("shipOne", shipService.shipSelectOne(vo.getSlNo()));
		
		return "/myPage/shipOne";
	}
	
	// 배송지 수정
	@RequestMapping(value = "/shipUpdate")
	public String shipUpdate(Long slNo, String slmemId, String upd_postcode, String upd_address, String upd_detailAddress, String upd_extraAddress) {
		
		String slAddress = upd_postcode + " " + upd_address + " " + upd_detailAddress + " " + upd_extraAddress;
		
		ShipVO vo = new ShipVO(slNo, slmemId, slAddress);
		shipService.shipUpdate(vo);
		
		return "redirect:/myPage/myPageList";
	}
	
	// 배송지 수정 화면
	@RequestMapping(value = "/shipUpdateView")
	public String shipUpdateView(ShipVO vo, Model model) {
		model.addAttribute("shipUpd", shipService.shipSelectOne(vo.getSlNo()));
		
		return "/myPage/shipUpdateView";
	}
	
	// 배송지 삭제
	@RequestMapping(value = "/shipDelete")
	public String shipDelete(ShipVO vo) {
		shipService.shipDelOne(vo.getSlNo());
		
		return "redirect:/myPage/myPageList";
	}
	
	// 찜
	@RequestMapping(value = "/favorList")
	@ResponseBody
	public Map<String, Object> favorList(String showPage, String fvmemId) {
		Map<String, Object> result = new HashMap<String, Object>();

		int stShowPage = Integer.parseInt(showPage);

		int currPage;
		if (showPage == null) {
			currPage = 1;
		} else {
			currPage = stShowPage;
		}

		PagingVO vo = favorService.getMemFavorPageInfo(currPage, fvmemId); //페이징에 필요한 정보 계산
		List<FavorVO> myFavorList =  favorService.getMemFavorPageList(vo);

		result.put("myFavorList", myFavorList);
		result.put("pageInfo", vo); // 페이징정보
		result.put("currPage", currPage); // 현재페이지

		return result;
	}
	
	// 상품 후기 리스트
	@RequestMapping(value = "/reviewList")
	@ResponseBody
	public Map<String, Object> reviewList(String showPage, String rvmemId) {
		Map<String, Object> result = new HashMap<String, Object>();

		int stShowPage = Integer.parseInt(showPage);

		int currPage;
		if (showPage == null) {
			currPage = 1;
		} else {
			currPage = stShowPage;
		}

		PagingVO vo = reviewService.getMemReviewPageInfo(currPage, rvmemId); //페이징에 필요한 정보 계산
		List<ReviewVO> myReviewList =  reviewService.getMemReviewPageList(vo);

		result.put("myReviewList", myReviewList);
		result.put("pageInfo", vo); // 페이징정보
		result.put("currPage", currPage); // 현재페이지

		return result;
	}
	
	// 상품 후기 조회
	@RequestMapping(value = "/reviewOne")
	public String reviewOne(ReviewVO vo, Model model) {
		model.addAttribute("reviewOne", reviewService.reviewSelOne(vo.getRvNo()));
		
		return "/myPage/reviewOne";
	}
	
	// 상품 후기 수정
	@RequestMapping(value = "/reviewUpdate")
	public String reviewUpdate(ReviewVO vo) {
		reviewService.reviewUpd(vo);
		
		return "redirect:/myPage/myPageList";
	}
	
	// 상품 후기 수정 화면
	@RequestMapping(value = "/reviewUpdateView")
	public String reviewUpdateView(ReviewVO vo, Model model) {
		model.addAttribute("reviewUpd", reviewService.reviewSelOne(vo.getRvNo()));
		
		return "/myPage/reviewUpdateView";
	}
	
	
	// 상품 후기 삭제
	@RequestMapping(value = "/reviewDelete")
	public String reviewDelete(ReviewVO vo) {
		reviewService.reviewDelOne(vo.getRvNo());
		
		return "redirect:/myPage/myPageList";
	}
	
	
	// 상품 문의 목록 페이징
	@RequestMapping(value = "/quiryList")
	@ResponseBody
	public Map<String, Object> quiryList(String showPage, String iqmemId) {
		Map<String, Object> result = new HashMap<String, Object>();

		int stShowPage = Integer.parseInt(showPage);

		int currPage;
		if (showPage == null) {
			currPage = 1;
		} else {
			currPage = stShowPage;
		}

		PagingVO vo = quiryService.getMemQuiryPageInfo(currPage, iqmemId); //페이징에 필요한 정보 계산
		List<QuiryVO> myQuiryList =  quiryService.getMemQuiryPageList(vo);

		result.put("myQuiryList", myQuiryList);
		result.put("pageInfo", vo); // 페이징정보
		result.put("currPage", currPage); // 현재페이지

		return result;
	}
	
	// 상품 문의 조회 + 답변 띄우기
	@RequestMapping(value = "/quiryOne")
	public String quiryOne(QuiryVO vo, Model model) {
		model.addAttribute("quiryOne", quiryService.quirySelOne(vo.getIqNo()));
		
		List<AnswerVO> answerList = answerService.answerList(vo.getIqNo());
		model.addAttribute("answerList", answerList);
		
		return "/myPage/quiryOne";
	}
	
	// 상품 문의 수정
	@RequestMapping(value = "/quiryUpdate")
	public String quiryUpdate(QuiryVO vo) {
		quiryService.quiryUpd(vo);
		
		return "redirect:/myPage/myPageList";
	}
	
	// 상품 문의 수정 화면 
	@RequestMapping(value = "/quiryUpdateView")
	public String quiryUpdateView(QuiryVO vo, Model model) {
		model.addAttribute("quiryUpd", quiryService.quirySelOne(vo.getIqNo()));
		
		return "/myPage/quiryUpdateView";
	}
	
	// 상품 문의 삭제
	@RequestMapping(value = "/quiryDelete")
	public String quiryDelete(QuiryVO vo) {
		quiryService.quiryDelOne(vo.getIqNo());
		
		return "redirect:/myPage/myPageList";
	}
	
	// 회원 정보 수정 
	@RequestMapping(value = "/memInfoUpdate")
	public String memInfoUpdate(MemberVO vo, String mainPostcode,String mainAddress,String mainDetailAddress, 
								Integer choiceSelectBoxOne,Integer choiceSelectBoxTwo,Integer choiceSelectBoxThree,HttpServletRequest request ) {
		
		String memAddress = mainPostcode + " " + mainAddress + " " + mainDetailAddress;
		Long memChoice = 0L;
		if(choiceSelectBoxOne != null) {memChoice += 1L;}
		if(choiceSelectBoxTwo != null) {memChoice += 10L;}
		if(choiceSelectBoxThree != null) {memChoice += 100L;}
		vo.setMemAddress(memAddress);
		vo.setMemChoice(memChoice);
		
		memberService.memberUpdate(vo);
		
		//세션없애기
		HttpSession session = request.getSession();
		session.invalidate();
		
		return "redirect:/member/login";
	}
	
	// 회원 정보 수정 화면
	@RequestMapping(value = "/memInfoUpdateView")
	public String memUpdateView(MemberVO vo, Model model) {
		model.addAttribute("memInfoUpd", memberService.memSelectOne(vo.getMemId()));
		
		return "/myPage/memInfoUpdateView";
	}
	
	
	
	// memId 적립금 보여주기
	@PostMapping(value="/getSavedMoneyBymemId")
	@ResponseBody
	public Long getSavedMoneyBymemId(String memId) {
		MemberVO vo = new MemberVO();
		vo.setMemId(memId);
		Long result = purchaseService.sumSavedMoneyByMemId(vo);
		return result;
	}
}
