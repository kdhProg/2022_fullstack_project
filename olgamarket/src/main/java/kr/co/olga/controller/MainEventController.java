package kr.co.olga.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.olga.service.ProductService;
import kr.co.olga.vo.ProductVO;

@Controller
@RequestMapping(value = "/mainEvent/")
public class MainEventController {
	
	@Autowired
	private ProductService productService;
	
// 제철 과일	
	@RequestMapping(value = "/fruit")
	public String fruit() {
		return "/mainEvent/FruitTOP30View";
	}
	
	@RequestMapping(value = "/FruitTOP30View")
	@ResponseBody
	public Map<String, Object> FruitTOP30View() {
		Map<String, Object> result = new HashMap<String, Object>();
		ProductVO vo = new ProductVO();
		List<ProductVO> pdVo = productService.productSeasonFruitSelectList(vo);
		
		result.put("fruitPd30",pdVo);  
		
		return result;

	}

// 지금 할인 중	
	@RequestMapping(value = "/sale")
	public String sale() {
		return "/mainEvent/saleTOP30View";
	}
	
	@RequestMapping(value = "/saleTOP30View")
	@ResponseBody
	public Map<String, Object> saleTOP30View() {
		Map<String, Object> result = new HashMap<String, Object>();
		ProductVO vo = new ProductVO();
		List<ProductVO> pdVo = productService.mainProductSaleSelect(vo);
		
		result.put("salePd30",pdVo);  
		
		return result;
	}
	
// 	만원 이하 판매량 높은 제품
	@RequestMapping(value = "/salesVolume")
	public String salesVolume() {
		return "/mainEvent/salesVolumeTOP30View";
	}
	
	@RequestMapping(value = "/salesVolumeTOP30View")
	@ResponseBody
	public Map<String, Object> salesVolumeTOP30View() {
		Map<String, Object> result = new HashMap<String, Object>();
		ProductVO vo = new ProductVO();
		List<ProductVO> pdVo = productService.productSalesVolumeSelectList(vo);
		
		result.put("svPd30",pdVo);  
		
		return result;
	}
	
// 후기 10,000개 이상
	@RequestMapping(value = "/review")
	public String review() {
		return "/mainEvent/reviewTOP30View";
	}
	
	@RequestMapping(value = "/reviewTOP30View")
	@ResponseBody
	public Map<String, Object> reviewTOP30View() {
		Map<String, Object> result = new HashMap<String, Object>();
		ProductVO vo = new ProductVO();
		List<ProductVO> pdVo = productService.productReviewSelectList(vo);
		List<ProductVO> pdList = new ArrayList<ProductVO>();
		for(int i = 0; i < pdVo.size(); i++) {
			pdList.add(productService.productSelectOne(pdVo.get(i).getPdId()));
			
		}
		
		result.put("reviewPd30",pdList);  
		
		return result;
	}
	
// 조회수 100,000 이상	
	@RequestMapping(value = "/hits")
	public String hits() {
		return "/mainEvent/hitsTOP30View";
	}
	
	@RequestMapping(value = "/hitsTOP30View")
	@ResponseBody
	public Map<String, Object> hitsTOP30View() {
		Map<String, Object> result = new HashMap<String, Object>();
		ProductVO vo = new ProductVO();
		List<ProductVO> pdVo = productService.productHitsSelectList(vo);
		
		result.put("hitsPd30",pdVo);  
		
		return result;
	}
	
// 출시 6개월 미만 판매량 높은 제품
	@RequestMapping(value = "/date")
	public String date() {
		return "/mainEvent/dateTOP30View";
	}
	
	@RequestMapping(value = "/dateTOP30View")
	@ResponseBody
	public Map<String, Object> dateTOP30View() {
		Map<String, Object> result = new HashMap<String, Object>();
		ProductVO vo = new ProductVO();
		List<ProductVO> pdVo = productService.productDateSelectList(vo);
		
		result.put("datePd30",pdVo);  
		
		return result;
	}
	
}












