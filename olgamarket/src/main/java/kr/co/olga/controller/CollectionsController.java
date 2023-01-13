package kr.co.olga.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.olga.service.ProductService;
import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.ProductVO;

@Controller
@RequestMapping(value="/collections/")
public class CollectionsController {
	
	@Autowired
	private ProductService service;
	
	@RequestMapping(value="/newProduct")
	public String newProduct(Model model,Integer showPage,Integer sort) {
		int currPage;
		if(showPage == null) {
			currPage = 1;
		}else {
			currPage = showPage;
		}
		
		int sortType;
		if(sort == null) {
			sortType = 1;
		}else {
			sortType = sort;
		}
		
		String pgName = "newProduct"; //어떤 페이지인지 명시
		ArrayList<String> finalCateList = new ArrayList<String>();
		PagingVO vo = service.getProdPageInfo(currPage,pgName,sortType /*,finalCateList */); //페이징에 필요한 정보 계산
		List<ProductVO> pageList =  service.getProdPageList(vo);
		List<String> cateList = service.getCateList(pgName);
		List<String> brandList = service.getBrandList(pgName);
		
		model.addAttribute("ProdList",pageList);  //상품목록
		model.addAttribute("pageInfo",vo);  //페이징정보
		model.addAttribute("currPage",currPage); //현재페이지
		model.addAttribute("sortType",sortType);  //정렬정보
		model.addAttribute("cateList",cateList);  //카테고리목록
		model.addAttribute("brandList",brandList); //브랜드목록
		
		return "collections/newProduct";
	}
	
	// AJAX 전용
	@RequestMapping(value="/newProductCate")
	public ModelAndView newProductCate(Model model,Integer showPage,Integer sort,@RequestParam(value="finalCateList[]") ArrayList<String> finalCateList) {
		int currPage;
		if(showPage == null) {
			currPage = 1;
		}else {
			currPage = showPage;
		}
		
		int sortType;
		if(sort == null) {
			sortType = 1;
		}else {
			sortType = sort;
		}
		
		String pgName = "newProduct"; //어떤 페이지인지 명시
		
		PagingVO vo = service.getProdPageInfo(currPage,pgName,sortType /* ,finalCateList */); //페이징에 필요한 정보 계산
		List<ProductVO> pageList =  service.getProdPageList(vo);
		List<String> cateList = service.getCateList(pgName);
		List<String> brandList = service.getBrandList(pgName);
		
		ModelAndView ajaxList = new ModelAndView();
		
		ajaxList.addObject("ProdList",pageList);  //상품목록
		ajaxList.addObject("pageInfo",vo);  //페이징정보
		ajaxList.addObject("currPage",currPage); //현재페이지
		ajaxList.addObject("sortType",sortType);  //정렬정보
		ajaxList.addObject("cateList",cateList);  //카테고리목록
		ajaxList.addObject("brandList",brandList); //브랜드목록
		
//		System.out.println("요청왔음");
//		
//		for(int i=0;i<pageList.size();i++) {
//			System.out.println(pageList.get(i).getPdMainCategory()+"    "+i);
//		}
		
		return ajaxList;
	}

}
