package kr.co.olga.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.olga.service.ProductService;
import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.ProductVO;

@Controller
@RequestMapping(value="/collections/")
public class CollectionsController {
	
	@Autowired
	private ProductService service;
	
	/* 신상품 시작 */
	
	@RequestMapping(value="/newProduct")
	public String enterNewProduct() {
		return "collections/newProduct";
	}
	

	@RequestMapping(value="/newProductCate")
	@ResponseBody
	public Map<String, Object> newProductCate(Integer showPage,Integer sort,
			@RequestParam(value="finalCateList[]",required=false) ArrayList<String> finalCateList,
			@RequestParam(value="finalBrandList[]",required=false) ArrayList<String> finalBrandList,
			@RequestParam(value="finalpriceList[]",required=false) ArrayList<String> finalpriceList) {
		Map<String, Object> result = new HashMap<String, Object>();
		
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
		
		// cateList가 빈 배열인 경우 null로 처리함
		
		String pgName = "newProduct"; //어떤 페이지인지 명시
		
		PagingVO vo = service.getProdPageInfo(currPage,pgName,sortType,finalCateList,finalBrandList,finalpriceList); //페이징에 필요한 정보 계산
		List<ProductVO> pageList =  service.getProdPageList(vo);
		List<String> cateList = service.getCateList(pgName);
		List<String> brandList = service.getBrandList(pgName);
		
		result.put("ProdList",pageList);  //상품목록
		result.put("pageInfo",vo);  //페이징정보
		result.put("currPage",currPage); //현재페이지
		result.put("sortType",sortType);  //정렬정보
		
		result.put("cateList",cateList);  //카테고리목록
		result.put("brandList",brandList); //브랜드목록(전체)
		
		result.put("activeCateList",finalCateList); //가변카테고리목록(버튼누를때마다 인자로 넘어오는것)
		result.put("activeBrandList",finalBrandList); //가변브랜드목록(버튼누를때마다 인자로 넘어오는것)
		result.put("activePriceList",finalpriceList); //가변가격목록(버튼누를때마다 인자로 넘어오는것)
		
		
		
		return result;
	}
	
	/* 신상품 끝 */
	/* 베스트 시작 */
	
	@RequestMapping(value="/best")
	public String enterBest() {
		return "collections/best";
	}
	

	@RequestMapping(value="/bestProductList")
	@ResponseBody
	public Map<String, Object> bestProductList(Integer showPage,Integer sort,
			@RequestParam(value="finalCateList[]",required=false) ArrayList<String> finalCateList,
			@RequestParam(value="finalBrandList[]",required=false) ArrayList<String> finalBrandList,
			@RequestParam(value="finalpriceList[]",required=false) ArrayList<String> finalpriceList) {
		Map<String, Object> result = new HashMap<String, Object>();
		
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
		
		// cateList가 빈 배열인 경우 null로 처리함
		
		String pgName = "best"; //어떤 페이지인지 명시
		
		PagingVO vo = service.getProdPageInfo(currPage,pgName,sortType,finalCateList,finalBrandList,finalpriceList); //페이징에 필요한 정보 계산
		List<ProductVO> pageList =  service.getProdPageList(vo);
		List<String> cateList = service.getCateList(pgName);
		List<String> brandList = service.getBrandList(pgName);
		
		result.put("ProdList",pageList);  //상품목록
		result.put("pageInfo",vo);  //페이징정보
		result.put("currPage",currPage); //현재페이지
		result.put("sortType",sortType);  //정렬정보
		
		result.put("cateList",cateList);  //카테고리목록
		result.put("brandList",brandList); //브랜드목록(전체)
		
		result.put("activeCateList",finalCateList); //가변카테고리목록(버튼누를때마다 인자로 넘어오는것)
		result.put("activeBrandList",finalBrandList); //가변브랜드목록(버튼누를때마다 인자로 넘어오는것)
		result.put("activePriceList",finalpriceList); //가변가격목록(버튼누를때마다 인자로 넘어오는것)
		
		return result;
	}
	
	
	/* 베스트 끝 */
	/* 할인/특가 시작 */
	
	@RequestMapping(value="/nowOnSale")
	public String enterNowOnSale() {
		return "collections/nowOnSale";
	}
	

	@RequestMapping(value="/nowOnSaleProductList")
	@ResponseBody
	public Map<String, Object> nowOnSaleProductList(Integer showPage,Integer sort,
			@RequestParam(value="finalCateList[]",required=false) ArrayList<String> finalCateList,
			@RequestParam(value="finalBrandList[]",required=false) ArrayList<String> finalBrandList,
			@RequestParam(value="finalpriceList[]",required=false) ArrayList<String> finalpriceList) {

		Map<String, Object> result = new HashMap<String, Object>();
		
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
		
		// cateList가 빈 배열인 경우 null로 처리함
		
		String pgName = "nowOnSale"; //어떤 페이지인지 명시
		
		PagingVO vo = service.getProdPageInfo(currPage,pgName,sortType,finalCateList,finalBrandList,finalpriceList); //페이징에 필요한 정보 계산
		List<ProductVO> pageList =  service.getProdPageList(vo);
		List<String> cateList = service.getCateList(pgName);
		List<String> brandList = service.getBrandList(pgName);
		
		result.put("ProdList",pageList);  //상품목록
		result.put("pageInfo",vo);  //페이징정보
		result.put("currPage",currPage); //현재페이지
		result.put("sortType",sortType);  //정렬정보
		
		result.put("cateList",cateList);  //카테고리목록
		result.put("brandList",brandList); //브랜드목록
		
		result.put("activeCateList",finalCateList); //가변카테고리목록(버튼누를때마다 인자로 넘어오는것)
		result.put("activeBrandList",finalBrandList); //가변브랜드목록(버튼누를때마다 인자로 넘어오는것)
		result.put("activePriceList",finalpriceList); //가변가격목록(버튼누를때마다 인자로 넘어오는것)
		
		return result;
	}
	
	/* 할인/특가 끝 */
	/* 카테고리 시작 */
	@RequestMapping(value="/mainPageCategory")
	public String enterMainPageCategory(String cateName,Model model) {
		model.addAttribute("cateName",cateName);
		return "collections/categories";
	}
	

	@RequestMapping(value="/mainPageCategoryProductList")
	@ResponseBody
	public Map<String, Object> mainPageCategoryProductList(String cateName,Integer showPage,Integer sort,
			@RequestParam(value="finalCateList[]",required=false) ArrayList<String> finalCateList,
			@RequestParam(value="finalBrandList[]",required=false) ArrayList<String> finalBrandList,
			@RequestParam(value="finalpriceList[]",required=false) ArrayList<String> finalpriceList) {

		Map<String, Object> result = new HashMap<String, Object>();
		
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
		
		//메인카테고리는 입력받아야함 => pgName변수에 대입
		String pgName = finalCateList.get(0); //어떤 페이지인지 명시 = 어떤 카테고리 페이지인지
		
		PagingVO vo = service.getProdPageInfo(currPage,pgName,sortType,finalCateList,finalBrandList,finalpriceList); //페이징에 필요한 정보 계산
		List<ProductVO> pageList =  service.getProdPageList(vo);
		List<String> brandList = service.getBrandList(pgName);
		
		result.put("ProdList",pageList);  //상품목록
		result.put("pageInfo",vo);  //페이징정보
		result.put("currPage",currPage); //현재페이지
		result.put("sortType",sortType);  //정렬정보
		
		result.put("brandList",brandList); //브랜드목록
		
		result.put("activeBrandList",finalBrandList); //가변브랜드목록(버튼누를때마다 인자로 넘어오는것)
		result.put("activePriceList",finalpriceList); //가변가격목록(버튼누를때마다 인자로 넘어오는것)
		
		return result;
	}
	
	/* 카테고리 끝 */

}
