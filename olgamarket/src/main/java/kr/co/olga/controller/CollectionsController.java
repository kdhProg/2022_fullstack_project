package kr.co.olga.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	
	@RequestMapping(value="/newProduct")
	public String newProduct() {
		return "collections/newProduct";
	}
	
	// AJAX 전용
	@RequestMapping(value="/newProductCate")
	@ResponseBody
	public Map<String, Object> newProductCate(Integer showPage,Integer sort,@RequestParam(value="finalCateList[]",required=false) ArrayList<String> finalCateList) {

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
		
		PagingVO vo = service.getProdPageInfo(currPage,pgName,sortType,finalCateList); //페이징에 필요한 정보 계산
		List<ProductVO> pageList =  service.getProdPageList(vo);
		List<String> cateList = service.getCateList(pgName);
		List<String> brandList = service.getBrandList(pgName);
		
		result.put("ProdList",pageList);  //상품목록
		result.put("pageInfo",vo);  //페이징정보
		result.put("currPage",currPage); //현재페이지
		result.put("sortType",sortType);  //정렬정보
		result.put("cateList",cateList);  //카테고리목록
		result.put("brandList",brandList); //브랜드목록
		
//		for(int i=0;i<pageList.size();i++) {
//			System.out.println(pageList.get(i).getPdMainCategory()+"    "+i);
//		}
		
		return result;
	}

}
