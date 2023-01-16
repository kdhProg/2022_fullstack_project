package kr.co.olga.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
@RequestMapping(value = "/search/")
public class SearchController {
	
	@Autowired
	private ProductService service;
	
	@RequestMapping(value="/productList")
	public String getSearchPage(HttpServletRequest request,Model model) {
		
		String searchKeyWord = request.getParameter("searchKeyWord");
		model.addAttribute("searchKeyWord",searchKeyWord);
		
		return "search/productList";
	}
	
	@RequestMapping(value = "searchPageInitInfos")
	@ResponseBody
	public Map<String, Object> getReviewPagingDatas(String showPage,String sort,String searchKeyWord,@RequestParam(value="finalCateList[]",required=false) ArrayList<String> finalCateList) {

		Map<String, Object> result = new HashMap<String, Object>();

		int currPage;
		if(showPage == null) {
			currPage = 1;
		}else {
			currPage = Integer.parseInt(showPage);
		}
		int sortType;
		if(sort == null) {
			sortType = 1;
		}else {
			sortType = Integer.parseInt(sort);
		}
		
		PagingVO vo = service.getSearchPdPageInfo(currPage,sortType,searchKeyWord,finalCateList);
		List<ProductVO> searchPageList =  service.getSearchPdList(vo);
		List<String> cateList = service.getSearchCateList(searchKeyWord);
		List<String> brandList = service.getSearchBrandList(searchKeyWord);
		
//		for(int i=0; i < searchPageList.size();i++) {
//			System.out.println(searchPageList.get(i).getPdName());
//			System.out.println(searchPageList.get(i).getPdId());
//			System.out.println("========================");
//		}
		
		result.put("searchPageList",searchPageList);  //게시판목록
		result.put("pageInfo",vo);  //페이징정보
		result.put("currPage",currPage); //현재페이지
		result.put("cateList", cateList);
		result.put("brandList", brandList);
		
		return result;
	}
}
