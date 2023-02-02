package kr.co.olga.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.olga.dao.ProductDAO;
import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDAO dao;

	@Override
	public long productInsert(ProductVO vo) {
		return dao.productInsert(vo);
	}

	@Override
	public long productUpdate(ProductVO vo) {
		return dao.productUpdate(vo);
	}

	@Override
	public long productDelete(Long pdId) {
		return dao.productDelete(pdId);
	}

	@Override
	public ProductVO productSelectOne(Long pdId) {
		return dao.productSelectOne(pdId);
	}
	
// 메인
	
/* 제철과일 */	
	@Override
	public List<ProductVO> mainProductSeasonFruitSelect(ProductVO vo) {
		return dao.mainProductSeasonFruitSelect(vo);
	}
	
/* 지금 할인 중 */	
	@Override
	public List<ProductVO> mainProductSaleSelect(ProductVO vo) {
		return dao.mainProductSaleSelect(vo);
	}	

/* 만원 이하 판매량 높은 제품 */	
	@Override
	public List<ProductVO> mainProductSalesVolumeSelect(ProductVO vo) {
		return dao.mainProductSalesVolumeSelect(vo);
	}
	
/* 후기 10000개 이상 */	
	@Override
	public List<ProductVO> mainProductReviewSelect(ProductVO vo) {
		return dao.mainProductReviewSelect(vo);
	}
	
/* 조회수 100,000 이상 */	
	@Override
	public List<ProductVO> mainProductHitsSelect(ProductVO vo) {
		return dao.mainProductHitsSelect(vo);
	}
	
/* 제품 출시 6개월 미만 판매량 높은 제품 */	
	@Override
	public List<ProductVO> mainProductDateSelect(ProductVO vo) {
		return dao.mainProductDateSelect(vo);
	}

// 메인 항목에 대한 페이지

/* 제철과일 */	
	@Override
	public List<ProductVO> productSeasonFruitSelectList(ProductVO vo) {
		return dao.productSeasonFruitSelectList(vo);
	}

/* 지금 할인 중 */	
	@Override
	public List<ProductVO> productSaleSelectList(ProductVO vo) {
		return dao.productSaleSelectList(vo);
	}
	
/* 만원 이하 판매량 높은 제품 */
	@Override
	public List<ProductVO> productSalesVolumeSelectList(ProductVO vo) {
		return dao.productSalesVolumeSelectList(vo);
	}

/* 후기 10000개 이상 */	
	@Override
	public List<ProductVO> productReviewSelectList(ProductVO vo) {
		return dao.productReviewSelectList(vo);
	}

/* 조회수 100,000 이상 */	
	@Override
	public List<ProductVO> productHitsSelectList(ProductVO vo) {
		return dao.productHitsSelectList(vo);
	}

/* 제품 출시 6개월 미만 판매량 높은 제품 */
	@Override
	public List<ProductVO> productDateSelectList(ProductVO vo) {
		return dao.productDateSelectList(vo);
	}
	
	@Override
	public List<String> getCateList(String pgName) {
		return dao.getCateList(pgName);
	}
	
	@Override
	public PagingVO getProdPageInfo(int currPage,String pgName,int sortType,
			ArrayList<String> finalCateList,ArrayList<String> finalBrandList
			,ArrayList<String> finalpriceList) {
		PagingVO vo = new PagingVO();
		
		//count전용 임시VO
		PagingVO temp_vo = new PagingVO();
		temp_vo.setPgName(pgName);
		temp_vo.setCategories(finalCateList);
		temp_vo.setBrandNames(finalBrandList);
		temp_vo.setPriceLists(finalpriceList);
		
		int setTotalRecordCount = dao.getProdCount(temp_vo);
		int recordCountPerPage = 40;
                        
		int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		//int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		//int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		
		int realEnd = (int)(Math.ceil((dao.getProdCount(temp_vo) * 1.0) / 40));
		if(realEnd < lastPageNoOnPageList) {
			lastPageNoOnPageList = realEnd;
		}
		
		int firstRecordIndex = (currPage - 1) * recordCountPerPage;
		boolean xprev= firstPageNoOnPageList > 1;
		boolean xnext = lastPageNoOnPageList < realEnd;
		
		int contEnd = currPage*40;
		int contStart = contEnd-39;
		if(contEnd > setTotalRecordCount) {
			contEnd = setTotalRecordCount;
		}
		
		vo.setCurrentpageno(currPage);
		vo.setFirstPageNoOnPageList(firstPageNoOnPageList);
		vo.setFirstRecordIndex(firstRecordIndex);
		vo.setLastPageNoOnPageList(lastPageNoOnPageList);
		vo.setRealEnd(realEnd);
		vo.setRecordCountPerPage(recordCountPerPage);
		vo.setTotalRecordCount(setTotalRecordCount);
		vo.setXnext(xnext);
		vo.setXprev(xprev);
		vo.setContEnd(contEnd);
		vo.setContStart(contStart);
		vo.setPgName(pgName);
		vo.setSort(sortType);
		
		vo.setCategories(finalCateList);  // 카테고리정보
		vo.setBrandNames(finalBrandList);  // 브랜드 정보
		vo.setPriceLists(finalpriceList);  // 가격정보
		
		return vo;
	}
	
	@Override
	public List<ProductVO> getProdPageList(PagingVO vo) {
		return dao.getProdPageList(vo);
	}
	
	@Override
	public List<String> getBrandList(String pgName) {
		return dao.getBrandList(pgName);
	}

// 판매자 페이지 상품 목록 조회
	@Override
	public List<ProductVO> getPdList(ProductVO vo) {
		return dao.getPdList(vo);
	}

// 관리자용 모든 상품 조회	
	@Override
	public PagingVO getProductPageInfo(int currPage, String brandName, String selId) {
		PagingVO vo = new PagingVO();
		
		PagingVO countVo = new PagingVO();
		countVo.setPdstlBrandName(brandName);
		countVo.setSelId(selId);
		
		int setTotalRecordCount = dao.getProductSellerCount(countVo);
		int recordCountPerPage = 20;
                        
		int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		//int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		//int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		
		int realEnd = (int)(Math.ceil((dao.getProductSellerCount(countVo) * 1.0) / 20));
		if(realEnd < lastPageNoOnPageList) {
			lastPageNoOnPageList = realEnd;
		}
		
		int firstRecordIndex = (currPage - 1) * recordCountPerPage;
		boolean xprev= firstPageNoOnPageList > 1;
		boolean xnext = lastPageNoOnPageList < realEnd;
		
		int contEnd = currPage*20;
		int contStart = contEnd-19;
		if(contEnd > setTotalRecordCount) {
			contEnd = setTotalRecordCount;
		}
		
		vo.setCurrentpageno(currPage);
		vo.setFirstPageNoOnPageList(firstPageNoOnPageList);
		vo.setFirstRecordIndex(firstRecordIndex);
		vo.setLastPageNoOnPageList(lastPageNoOnPageList);
		vo.setRealEnd(realEnd);
		vo.setRecordCountPerPage(recordCountPerPage);
		vo.setTotalRecordCount(setTotalRecordCount);
		vo.setXnext(xnext);
		vo.setXprev(xprev);
		vo.setContEnd(contEnd);
		vo.setContStart(contStart);
		vo.setPdstlBrandName(brandName);
		vo.setSelId(selId);
		
		return vo;
	}
	
	@Override
	public List<ProductVO> getProductPageList(PagingVO vo) {
		return dao.getProductPageList(vo);
	}

	@Override
	public List<ProductVO> getSearchPdList(PagingVO vo) {
		return dao.getSearchPdList(vo);
	}
	
	// 검색페이지임
	@Override
	public PagingVO getSearchPdPageInfo(int currPage, int sortType,String searchKeyWord,
			ArrayList<String> finalCateList,ArrayList<String> finalBrandList,ArrayList<String> finalpriceList) {
		PagingVO vo = new PagingVO();
		//count전용 임시VO
		PagingVO temp_vo = new PagingVO();
		temp_vo.setSearchKeyWord(searchKeyWord);
		temp_vo.setCategories(finalCateList);
		temp_vo.setBrandNames(finalBrandList);
		temp_vo.setPriceLists(finalpriceList);
		int setTotalRecordCount = dao.getSearchPdCount(temp_vo);
		
		int recordCountPerPage = 40;
                        
		int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		
		int realEnd = (int)(Math.ceil((dao.getSearchPdCount(temp_vo) * 1.0) / 40));
		if(realEnd < lastPageNoOnPageList) {
			lastPageNoOnPageList = realEnd;
		}
		
		int firstRecordIndex = (currPage - 1) * recordCountPerPage;
		boolean xprev= firstPageNoOnPageList > 1;
		boolean xnext = lastPageNoOnPageList < realEnd;
		
		int contEnd = currPage*40;
		int contStart = contEnd-39;
		if(contEnd > setTotalRecordCount) {
			contEnd = setTotalRecordCount;
		}
		
		vo.setCurrentpageno(currPage);
		vo.setFirstPageNoOnPageList(firstPageNoOnPageList);
		vo.setFirstRecordIndex(firstRecordIndex);
		vo.setLastPageNoOnPageList(lastPageNoOnPageList);
		vo.setRealEnd(realEnd);
		vo.setRecordCountPerPage(recordCountPerPage);
		vo.setTotalRecordCount(setTotalRecordCount);
		vo.setXnext(xnext);
		vo.setXprev(xprev);
		vo.setContEnd(contEnd);
		vo.setContStart(contStart);
		vo.setSearchKeyWord(searchKeyWord);
		vo.setCategories(finalCateList);
		vo.setBrandNames(finalBrandList);
		vo.setPriceLists(finalpriceList);
		vo.setSort(sortType);
		
		return vo;
	}
	
	@Override
	public List<String> getSearchCateList(String searchKeyWord) {
		return dao.getSearchCateList(searchKeyWord);
	}
	
	@Override
	public List<String> getSearchBrandList(String searchKeyWord) {
		return dao.getSearchBrandList(searchKeyWord);
	}

// 판매자 관리페이지에 띄우는 판매자 별 판매 중인 상품 목록
	@Override
	public List<ProductVO> getSelectList(String selstlBrandName) {
		return dao.getSelectList(selstlBrandName);
	}

// 관리자 페이지 상품 관리에 모든 상품 목록 띄우기 + 페이징	
	@Override
	public PagingVO getProductAdminPageInfo(int currPage) {
		PagingVO vo = new PagingVO();
		
		int setTotalRecordCount = dao.getProductAdminCount();
		int recordCountPerPage = 20;
                        
		int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		//int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		//int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		
		int realEnd = (int)(Math.ceil((dao.getProductAdminCount() * 1.0) / 20));
		if(realEnd < lastPageNoOnPageList) {
			lastPageNoOnPageList = realEnd;
		}
		
		int firstRecordIndex = (currPage - 1) * recordCountPerPage;
		boolean xprev= firstPageNoOnPageList > 1;
		boolean xnext = lastPageNoOnPageList < realEnd;
		
		int contEnd = currPage*20;
		int contStart = contEnd-19;
		if(contEnd > setTotalRecordCount) {
			contEnd = setTotalRecordCount;
		}
		
		vo.setCurrentpageno(currPage);
		vo.setFirstPageNoOnPageList(firstPageNoOnPageList);
		vo.setFirstRecordIndex(firstRecordIndex);
		vo.setLastPageNoOnPageList(lastPageNoOnPageList);
		vo.setRealEnd(realEnd);
		vo.setRecordCountPerPage(recordCountPerPage);
		vo.setTotalRecordCount(setTotalRecordCount);
		vo.setXnext(xnext);
		vo.setXprev(xprev);
		vo.setContEnd(contEnd);
		vo.setContStart(contStart);
		
		return vo;
	}

	@Override
	public List<ProductVO> getProductAdminPageList(PagingVO vo) {
		return dao.getProductAdminPageList(vo);
	}
	
	@Override
	public int increaseSaleByPdId(ProductVO vo) {
		return dao.increaseSaleByPdId(vo);
	}

// 관리자 통계 - 판매량(당일, 1일전, 2일전, 3일전)	
	@Override
	public Long daySalesVolumeSelect1() {
		return dao.daySalesVolumeSelect1();
	}

	@Override
	public Long daySalesVolumeSelect2() {
		return dao.daySalesVolumeSelect2();
	}

	@Override
	public Long daySalesVolumeSelect3() {
		return dao.daySalesVolumeSelect3();
	}

	@Override
	public Long daySalesVolumeSelect4() {
		return dao.daySalesVolumeSelect4();
	}

// 관리자 통계 - 판매량(당월, 전월, 두 달전, 세 달전)
	@Override
	public Long monthSalesVolumeSelect1() {
		return dao.monthSalesVolumeSelect1();
	}

	@Override
	public Long monthSalesVolumeSelect2() {
		return dao.monthSalesVolumeSelect2();
	}

	@Override
	public Long monthSalesVolumeSelect3() {
		return dao.monthSalesVolumeSelect3();
	}

	@Override
	public Long monthSalesVolumeSelect4() {
		return dao.monthSalesVolumeSelect4();
	}

// 관리자 통계 - 판매량(올해, 1년전, 2년전, 3년젼 ... 10년전)
	@Override
	public Long yearSalesVolumeSelect1() {
		return dao.yearSalesVolumeSelect1();
	}

	@Override
	public Long yearSalesVolumeSelect2() {
		return dao.yearSalesVolumeSelect2();
	}

	@Override
	public Long yearSalesVolumeSelect3() {
		return dao.yearSalesVolumeSelect3();
	}

	@Override
	public Long yearSalesVolumeSelect4() {
		return dao.yearSalesVolumeSelect4();
	}

	@Override
	public Long yearSalesVolumeSelect5() {
		return dao.yearSalesVolumeSelect5();
	}

	@Override
	public Long yearSalesVolumeSelect6() {
		return dao.yearSalesVolumeSelect6();
	}

	@Override
	public Long yearSalesVolumeSelect7() {
		return dao.yearSalesVolumeSelect7();
	}

	@Override
	public Long yearSalesVolumeSelect8() {
		return dao.yearSalesVolumeSelect8();
	}

	@Override
	public Long yearSalesVolumeSelect9() {
		return dao.yearSalesVolumeSelect9();
	}

	@Override
	public Long yearSalesVolumeSelect10() {
		return dao.yearSalesVolumeSelect10();
	}

	@Override
	public Long yearSalesVolumeSelect11() {
		return dao.yearSalesVolumeSelect11();
	}

// 관리자 통계 - 판매량(누적)
	@Override
	public Long allSalesVolumeSelect() {
		return dao.allSalesVolumeSelect();
	}
	
}
