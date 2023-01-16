package kr.co.olga.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.olga.service.ProductService;
import kr.co.olga.service.QuiryService;
import kr.co.olga.service.ReviewService;
import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.ProductVO;
import kr.co.olga.vo.QuiryVO;
import kr.co.olga.vo.ReviewVO;

@Controller
@RequestMapping(value = "/goods/")
public class GoodsController {
	
	@Autowired
	private ProductService pdService;
	
	@Autowired
	private ReviewService rvService;
	
	@Autowired
	private QuiryService qrService;
	
	//문자열 상품ID를 줘야함
	@RequestMapping(value="/detailView")
	public String enterDetailView(long pdId,Model model) {
		ProductVO vo = pdService.productSelectOne(pdId);
		model.addAttribute("productDetail", vo);
		return "goods/detailView";
	}
	
	/* 상품후기 컨트롤러 */
	
	@RequestMapping(value = "reviewPageInitInfos")
	@ResponseBody
	public Map<String, Object> getReviewPagingDatas(String showPage,String sort,String pdId) {
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
		int getPdId = Integer.parseInt(pdId);
		
		PagingVO vo = rvService.getRvPageInfo(currPage,sortType,getPdId);
		List<ReviewVO> rvPageList =  rvService.getRvPageList(vo);
		
		result.put("rvPageList",rvPageList);  //게시판목록
		result.put("pageInfo",vo);  //페이징정보
		result.put("currPage",currPage); //현재페이지
		
		return result;
	}
	
	
	
	/* 상품문의 컨트롤러 */
	@RequestMapping(value = "quiryPageInitInfos")
	@ResponseBody
	public Map<String, Object> getQuiryPagingDatas(String showPage,String pdId) {
		Map<String, Object> result = new HashMap<String, Object>();

		int currPage;
		if(showPage == null) {
			currPage = 1;
		}else {
			currPage = Integer.parseInt(showPage);
		}

		int getPdId = Integer.parseInt(pdId);
		
		PagingVO vo = qrService.getRvPageInfo(currPage,getPdId);
		List<QuiryVO> rvPageList =  qrService.getRvPageList(vo);
		
		result.put("qrPageList",rvPageList);  //게시판목록
		result.put("pageInfo",vo);  //페이징정보
		result.put("currPage",currPage); //현재페이지
		
		return result;
	}
	
	

}
