package kr.co.olga.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/order/")
public class OrderController {
	
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
		
		System.out.println("payType   "+payType);
		System.out.println("payCard   "+payCard);
		System.out.println("pay_simple   "+pay_simple);
		System.out.println("memId   "+memId);
		System.out.println("shipDestination   "+shipDestination);
		return "redirect:/";
	}

}
