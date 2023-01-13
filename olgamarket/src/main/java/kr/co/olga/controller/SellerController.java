package kr.co.olga.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.olga.service.ProductService;
import kr.co.olga.vo.ProductVO;

@Controller
@RequestMapping(value = "/seller/")
public class SellerController {
	
	@Autowired
	private ProductService productService;
	
// 판매자가 판매하는 상품 목록 조회
	@RequestMapping(value = "/productListView")
	public String productListView (Model model, ProductVO vo) {
		
		List<ProductVO> pdVo = productService.getPdList(vo);
		model.addAttribute("pdList", pdVo);
		
		return "/seller/productListView";
	}
}
