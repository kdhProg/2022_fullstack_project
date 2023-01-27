package kr.co.olga.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.olga.service.CartService;
import kr.co.olga.service.MemberService;
import kr.co.olga.service.ProductService;
import kr.co.olga.service.PurchaseService;
import kr.co.olga.service.ShipService;
import kr.co.olga.vo.CartVO;
import kr.co.olga.vo.ProductVO;
import kr.co.olga.vo.PurchaseVO;

@Controller
@RequestMapping(value = "/order/")
public class OrderController {
	
	@Autowired
	private CartService ctService;
	
	@Autowired
	private ShipService shService;
	
	@Autowired
	private PurchaseService pcService;
	
	@Autowired
	private ProductService pdService;
	
	@Autowired
	private MemberService memService;
	
	//주문페이지 이동
	@RequestMapping(value="/orderPage",method = RequestMethod.POST)
	public String enterCartPage(String shipDestination,String totalSalePrice,String totalPrice,Model model) {
		model.addAttribute("shipDestination",shipDestination);
		model.addAttribute("totalPrice",totalPrice);
		model.addAttribute("totalSalePrice",totalSalePrice);
		return "order/orderPage";
	}
	
	
	//주문등록
	@PostMapping(value="/orderAction")
	public String orderAction(String payType,String payCard,String pay_simple,String memId,String shipDestination) {

		String finalPayWay=""; //최종적으로 삽입될 결제법
		if(payType.equals("payType1")) {finalPayWay = payCard;}
		if(payType.equals("payType2")) {finalPayWay = pay_simple;}
		if(payType.equals("payType3")) {finalPayWay = "휴대폰";}
		
		CartVO vo = new CartVO();
		vo.setCamemId(memId);
		// memId에 해당하는 장바구니 리스트 가져옴
		List<CartVO> cartList =  ctService.selectByMemID(vo);
		
		//장바구니에 담은 상품정보들 가져오기
		List<ProductVO> prodList = new ArrayList<>();
		
		for(int i=0; i<cartList.size();i++) {  //장바구니 리스트 개수만큼 반복 + 리스트의 pdId로 한개씩 가져와서 상품리스트에 추가
			prodList.add(pdService.productSelectOne(cartList.get(i).getCapdId()));
		}
		
		//고유번호용 UUID
		String uuid = UUID.randomUUID().toString();
		
		//최종삽입
		for(int j=0;j<cartList.size();j++) {
			PurchaseVO insertVO = new PurchaseVO();
			insertVO.setPlmemId(memId);
			insertVO.setPlOrderNo(uuid);
			insertVO.setPlOrderState("결제완료");
			insertVO.setPlPayWay(finalPayWay);
			insertVO.setPlpdId(prodList.get(j).getPdId());
			insertVO.setPlPdQuantity(cartList.get(j).getCaQuantity());
			
			if(memService.memSelectOne(memId).getMemGrade().equals("Friend")) {
				insertVO.setPlSavedMoney((prodList.get(j).getPdPrice())*(100-prodList.get(j).getPdSale())/100 * cartList.get(j).getCaQuantity()*5/100);
			}
			if(memService.memSelectOne(memId).getMemGrade().equals("VIP")) {
				insertVO.setPlSavedMoney((prodList.get(j).getPdPrice())*(100-prodList.get(j).getPdSale())/100 * cartList.get(j).getCaQuantity()*10/100);	
			}
			if(memService.memSelectOne(memId).getMemGrade().equals("VVIP")) {
				insertVO.setPlSavedMoney((prodList.get(j).getPdPrice())*(100-prodList.get(j).getPdSale())/100 * cartList.get(j).getCaQuantity()*20/100);
			}
			
			insertVO.setPlShipAddInfo(shipDestination);
			insertVO.setPlTotalPrice( (prodList.get(j).getPdPrice())*(100-prodList.get(j).getPdSale())/100 * cartList.get(j).getCaQuantity() );
			//최종주문내역 삽입
			pcService.insertPurchase(insertVO);
			
			// 해당상품 판매량 증가
			ProductVO pdVO = new ProductVO();
			pdVO.setPdId(prodList.get(j).getPdId());
			pdVO.setPdSalesVolume(pdService.productSelectOne(prodList.get(j).getPdId()).getPdSalesVolume() + cartList.get(j).getCaQuantity());
			pdService.increaseSaleByPdId(pdVO);
		}
		//장바구니 리스트 삭제
		CartVO delVO = new CartVO();
		delVO.setCamemId(memId);
		ctService.deleteByMemId(delVO);
		
		return "redirect:/myPage/myPageList";
	}

}
