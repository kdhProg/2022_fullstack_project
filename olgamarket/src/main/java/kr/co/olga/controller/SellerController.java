package kr.co.olga.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.olga.service.NewPdAnswerService;
import kr.co.olga.service.NewPdQuiryService;
import kr.co.olga.service.ProductService;
import kr.co.olga.service.SelAnswerService;
import kr.co.olga.service.SelQuiryService;
import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.ProductVO;
import kr.co.olga.vo.SelAnswerVO;
import kr.co.olga.vo.SelQuiryVO;

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
	
	@RequestMapping(value = "/dedicated")
	public String dedicated() {
		
		return "/seller/dedicated";
	}
	
/***************** 신상품 등록 문의 ****************************************************************************************/
	
	@Autowired
	private NewPdQuiryService newPdQuiryService;
	
	@Autowired
	private NewPdAnswerService newPdAnswerService;
	
	@RequestMapping(value = "newPdQuiryList")
	@ResponseBody
	public Map<String, Object> newPdQuiryList(String showPage, Integer sort) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		int stShowPage = Integer.parseInt(showPage);
		
		int currPage;
		if(showPage == null) {
			currPage = 1;
		}else {
			currPage = stShowPage;
		}
		
		int sortType;
		if(sort == null) {
			sortType = 1;
		}else {
			sortType = sort;
		}
		
		PagingVO vo = newPdQuiryService.getNewPdQuiryPageInfo(currPage, sortType); //페이징에 필요한 정보 계산
		List<SelQuiryVO> npqList = newPdQuiryService.getNewPdQuiryPageList(vo);
		
		result.put("npqList",npqList);  
		result.put("pageInfo",vo);  //페이징정보
		result.put("currPage",currPage); //현재페이지

		return result;
	}
	
	
/***************** 등록된 상품 문의 ****************************************************************************************/	
	
	@Autowired
	private SelQuiryService selquiryService;
	
	@Autowired
	private SelAnswerService selanswerService;
	
	// 판매자 문의 목록 + 페이징
	@RequestMapping(value = "/selQuiryList")
	@ResponseBody
	public Map<String, Object> selQuiryList(String showPage, Integer sort) {
		Map<String, Object> result = new HashMap<String, Object>();
		
		int stShowPage = Integer.parseInt(showPage);
		
		int currPage;
		if(showPage == null) {
			currPage = 1;
		}else {
			currPage = stShowPage;
		}
		
		int sortType;
		if(sort == null) {
			sortType = 1;
		}else {
			sortType = sort;
		}
		
		PagingVO vo = selquiryService.getSelQuiryPageInfo(currPage, sortType); //페이징에 필요한 정보 계산
		List<SelQuiryVO> sqList = selquiryService.getSelQuiryPageList(vo);
		
		result.put("sqList",sqList);  
		result.put("pageInfo",vo);  //페이징정보
		result.put("currPage",currPage); //현재페이지

		return result;
	}
	
	// 판매자 문의 조회
	@RequestMapping(value = "/selQuiryOne")
	public String selQuiryOne(Model model, SelQuiryVO vo)	{
		model.addAttribute("selQuiryOne", selquiryService.getSelectOne(vo.getSqNo()));
		
		List<SelAnswerVO> selAnList = selanswerService.selAnswerList(vo.getSqNo());
		model.addAttribute("selAnList", selAnList);
		
		return "/seller/selQuiryOne";
	}
	
	// 판매자 문의 등록
	
	// 판매자 문의 등록 화면 
	
	// 판매자 문의 수정
	
	// 판매자 문의 수정 화면 
	
	// 판매자 문의 삭제
	
	
	
	
	
	
	
	
}
