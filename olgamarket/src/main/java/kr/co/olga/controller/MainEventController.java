package kr.co.olga.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.olga.service.ProductService;
import kr.co.olga.vo.ProductVO;

@Controller
@RequestMapping(value = "/mainEvent/")
public class MainEventController {
	
	@Autowired
	private ProductService productService;
	
// 제철 과일
	@RequestMapping(value = "/fruitTOP30View")
	public String fruitTOP30View(Model model, ProductVO vo) {
		
		List<ProductVO> pdVo = productService.productSeasonFruitSelectList(vo);
		
		model.addAttribute("fruitPd30", pdVo); 
		
		return "/mainEvent/fruitTOP30View";
	}
	
// 지금 할인 중	
	@RequestMapping(value = "/saleTOP30View")
	public String saleTOP30View(Model model, ProductVO vo) {
		
		List<ProductVO> pdVo = productService.productSaleSelectList(vo);
		
		model.addAttribute("salePd30", pdVo);
		
		return "/mainEvent/saleTOP30View";
	}
	
// 	만원 이하 판매량 높은 제품
	@RequestMapping(value = "/salesVolumeTOP30View")
	public String salesVolumeTOP30View(Model model, ProductVO vo) {
		
		List<ProductVO> pdVo = productService.productSalesVolumeSelectList(vo);
		
		model.addAttribute("svPd30", pdVo);
		
		return "/mainEvent/salesVolumeTOP30View";
	}
	
// 후기 10,000개 이상
	@RequestMapping(value = "/reviewTOP30View")
	public String reviewTOP30View(Model model, ProductVO vo) {
		
		List<ProductVO> pdVo = productService.productReviewSelectList(vo);
		
		model.addAttribute("reviewPd30", pdVo);
		
		return "/mainEvent/reviewTOP30View";
	}
	
// 조회수 100,000 이상	
	@RequestMapping(value = "/hitsTOP30View")
	public String hitsTOP30View(Model model, ProductVO vo) {
		
		List<ProductVO> pdVo = productService.productHitsSelectList(vo);
		
		model.addAttribute("hitsPd30", pdVo);
		
		return "/mainEvent/hitsTOP30View";
	}
	
// 출시 6개월 미만 판매량 높은 제품
	@RequestMapping(value = "/dateTOP30View")
	public String dateTOP30View(Model model, ProductVO vo) {
		
		List<ProductVO> pdVo = productService.productDateSelectList(vo);
		
		model.addAttribute("datePd30", pdVo);
		
		return "/mainEvent/dateTOP30View";
		
	}
	
}












