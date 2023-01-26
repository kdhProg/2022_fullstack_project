package kr.co.olga.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.olga.service.FavorService;
import kr.co.olga.service.MemberService;
import kr.co.olga.service.PurchaseService;
import kr.co.olga.service.ShipService;
import kr.co.olga.vo.FAQVO;
import kr.co.olga.vo.MemberVO;
import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.PurchaseVO;
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
	
	// 찜

	
	
	// 회원 정보 수정 
	@RequestMapping(value = "/memUpdate")
	public String memUpdate(MemberVO vo) {
		memberService.memberUpdate(vo);
		
		return "/myPage/memUpdateView";
	}
	
	// 회원 정보 수정 화면
	@RequestMapping(value = "/memUpdateView")
	public String memUpdateView() {
		
		return "/myPage/memUpdateView";
	}
}
