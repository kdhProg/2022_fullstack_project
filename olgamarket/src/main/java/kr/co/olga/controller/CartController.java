package kr.co.olga.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.olga.service.CartService;
import kr.co.olga.vo.CartVO;

@Controller
@RequestMapping(value = "/cart/")
public class CartController {
	
	@Autowired
	private CartService ctService;
	
	// 장바구니 카트에 1개 추가
	@RequestMapping(value="/addCart",method = RequestMethod.POST)
	@ResponseBody
	public String noticeList(String currentSession,String pdId,String productQuantity) {
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
}
