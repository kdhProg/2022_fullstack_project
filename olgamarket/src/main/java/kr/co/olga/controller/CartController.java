package kr.co.olga.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.olga.service.CartService;
import kr.co.olga.service.MemberService;
import kr.co.olga.service.ProductService;
import kr.co.olga.service.ShipService;
import kr.co.olga.vo.CartVO;
import kr.co.olga.vo.ProductVO;
import kr.co.olga.vo.ShipVO;

@Controller
@RequestMapping(value = "/cart/")
public class CartController {
	
	@Autowired
	private CartService ctService;
	
	@Autowired
	private ProductService pdService;
	
	@Autowired
	private MemberService memService;
	
	@Autowired
	private ShipService shService;
	
	// 디테일뷰 AJAX
	// 장바구니 카트에 1개 추가
	@RequestMapping(value="/addCart",method = RequestMethod.POST)
	@ResponseBody
	public String cartBtnAction(String currentSession,String pdId,String productQuantity) {
		String resultMsg = "";
		String memId = currentSession;
		Long pdIdValue = Long.parseLong(pdId);
		Long pdQuantity = Long.parseLong(productQuantity);
		//1. 장바구니에 같은 항목이 담겨있는지검사
		CartVO extChkVO = new CartVO();
		extChkVO.setCamemId(memId);
		extChkVO.setCapdId(pdIdValue);
		extChkVO.setCaQuantity(pdQuantity);
		if( ctService.existChkByMemIdNPdId(extChkVO) == 1) {
			//이미 장바구니에 같은 항목이 담겨있는경우임
			//=> DB에서 현재 수량값 가져와서 업데이트하기
			long currentQuantity = ctService.getOneByMemIdNPdId(extChkVO).getCaQuantity();
			long currentCaNo = ctService.getOneByMemIdNPdId(extChkVO).getCaNo();
			CartVO updVO = new CartVO(); //업데이트용 VO
			updVO.setCapdId(pdIdValue);
			updVO.setCamemId(memId);
			updVO.setCaQuantity(currentQuantity+pdQuantity);  // 기본DB수량 + 넘긴 수량
			updVO.setCaNo(currentCaNo);
			ctService.updateQuantityByCano(updVO);
			resultMsg += "alreadyIn";
			return resultMsg;
		}else {
			//장바구니에 해당 항목이 없음 => insert하기
			ctService.insertCart(extChkVO); 
			resultMsg += "insert";
			return resultMsg;
		}
	}
	
	// 장바구니페이지 진입
	@RequestMapping(value="/enterCartPage",method = RequestMethod.GET)
	public String enterCartPage() {
		return "cart/cart";
	}
	
	//장바구니페이지 띄워주기
	@RequestMapping(value="/getCartListByMemId",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> showCartList(String memId) {
		Map<String, Object> result = new HashMap<String, Object>();
		CartVO vo = new CartVO();
		vo.setCamemId(memId);
		// memId에 해당하는 장바구니 리스트 가져옴
		List<CartVO> cartList =  ctService.selectByMemID(vo);
		
		//장바구니에 담은 상품정보들 가져오기
		List<ProductVO> prodList = new ArrayList<>();
		for(int i=0; i<cartList.size();i++) {  //장바구니 리스트 개수만큼 반복 + 리스트의 pdId로 한개씩 가져와서 상품리스트에 추가
			prodList.add(pdService.productSelectOne(cartList.get(i).getCapdId()));
		}
		
		result.put("prodList", prodList);
		result.put("cartList", cartList);
		
		return result;
	}
	
	
	//장바구니 행 삭제
	@RequestMapping(value="/deleteCart",method = RequestMethod.POST)
	@ResponseBody
	public void deleteCart(String caNo) {
		long caNoVal = Long.parseLong(caNo);
		CartVO vo = new CartVO();
		vo.setCaNo(caNoVal);
		ctService.deleteByCano(vo);
	}
	
	
	//장바구니페이지에서 수량1증가 or 1감소
	@RequestMapping(value="/modifyCartQuantity",method = RequestMethod.POST)
	@ResponseBody
	public void addCartOne(String caNo,String state) {
		long caNoValue = Long.parseLong(caNo);
		if(state.equals("plus")) {
			//수량1증가
			CartVO vo = new CartVO(); //밑의 getOneByCaNo 용도
			vo.setCaNo(caNoValue);
			
			CartVO rstVo = new CartVO();
			rstVo.setCaNo(caNoValue);
			rstVo.setCaQuantity(ctService.getOneByCaNo(vo).getCaQuantity() + 1L);
			ctService.updateQuantityByCano(rstVo);
		}else {
			//수량1감소
			CartVO vo = new CartVO(); //밑의 getOneByCaNo 용도
			vo.setCaNo(caNoValue);
			
			CartVO rstVo = new CartVO();
			rstVo.setCaNo(caNoValue);
			rstVo.setCaQuantity(ctService.getOneByCaNo(vo).getCaQuantity() - 1L);
			ctService.updateQuantityByCano(rstVo);
		}
	}
	
	
	
	//배송지 리스트 반환
	@RequestMapping(value="/setShipList",method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> setShipList(String memId) {
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		//기본배송지 => member테이블의 주소
		String defaultAddress = memService.memSelectOne(memId).getMemAddress();
		// 이외배송지 => shippingList테이블의 튜플
		ShipVO vo = new ShipVO();
		vo.setSlmemId(memId);
		List<ShipVO> shipList = shService.getShipListByMemId(vo);
		
		result.put("defaultAddress", defaultAddress);
		result.put("shipList", shipList);
		
		return result;
	}
	
	
	//배송지 추가
		@RequestMapping(value="/addShipList",method = RequestMethod.POST)
		@ResponseBody
		public void addShipList(String memId,String finalAddress) {
			ShipVO vo = new ShipVO();
			vo.setSlAddress(finalAddress);
			vo.setSlmemId(memId);
			shService.shipInsert(vo);
		}

}
