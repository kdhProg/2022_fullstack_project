package kr.co.olga.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.olga.service.ProductService;
import kr.co.olga.vo.ProductVO;

@Controller
public class HomeController {

	@Autowired
	private ProductService productService;
	
	@RequestMapping(value = "/")
	public String homeController(Model model, ProductVO vo) {
	// 제철 과일 	
		List<ProductVO> pdVo1 = productService.mainProductSeasonFruitSelect(vo);
		model.addAttribute("fruitPd", pdVo1);
	
	// 지금 할인 중	
		List<ProductVO> pdVo2 = productService.mainProductSaleSelect(vo);
		model.addAttribute("salePd", pdVo2);
	
	// 만원 이하 판매량 높은 제품	
		List<ProductVO> pdVo3 = productService.mainProductSalesVolumeSelect(vo);
		model.addAttribute("svPd", pdVo3);
	
	// 후기 10,000개 이상		
		List<ProductVO> pdVo4 = productService.mainProductReviewSelect(vo);
		model.addAttribute("reviewPd", pdVo4);

	// 조회수 100,000 이상	
		List<ProductVO> pdVo5 = productService.mainProductHitsSelect(vo);
		model.addAttribute("hitsPd", pdVo5);
		
	// 출시 6개월 미만 판매량 높은 제품	
		List<ProductVO> pdVo6 = productService.mainProductDateSelect(vo);
		model.addAttribute("datePd", pdVo6);
		
		return "/olgamarket";
	}
}
