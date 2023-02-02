package kr.co.olga.service;

import java.util.ArrayList;
import java.util.List;

import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.ProductVO;

public interface ProductService {

	long productInsert(ProductVO vo);

	long productUpdate(ProductVO vo);

	long productDelete(Long pdId);

	ProductVO productSelectOne(Long pdId);

// 메인	
	List<ProductVO> mainProductSeasonFruitSelect(ProductVO vo);

	List<ProductVO> mainProductSaleSelect(ProductVO vo);

	List<ProductVO> mainProductSalesVolumeSelect(ProductVO vo);

	List<ProductVO> mainProductReviewSelect(ProductVO vo);

	List<ProductVO> mainProductHitsSelect(ProductVO vo);

	List<ProductVO> mainProductDateSelect(ProductVO vo);
	
// 메인 항목에 대한 페이지
	List<ProductVO> productSeasonFruitSelectList(ProductVO vo);

	List<ProductVO> productSaleSelectList(ProductVO vo);

	List<ProductVO> productSalesVolumeSelectList(ProductVO vo);

	List<ProductVO> productReviewSelectList(ProductVO vo);

	List<ProductVO> productHitsSelectList(ProductVO vo);

	List<ProductVO> productDateSelectList(ProductVO vo);

// 2023-01-11 김동훈 추가
// 2023-01-15 getProdPageInfo메서드 수정
	
	List<String> getCateList(String pgName);  //페이지이름(신상품/베스트 등)을 문자열로 주면 해당 카테고리를 모아옴

	PagingVO getProdPageInfo(int currPage,String pgName,int sortType,ArrayList<String> finalCateList
			,ArrayList<String> finalBrandList,ArrayList<String> finalpriceList);

	List<ProductVO> getProdPageList(PagingVO vo);

	List<String> getBrandList(String pgName);

// 판매자 페이지 상품 목록 조회	
	List<ProductVO> getPdList(ProductVO vo);

// 관리자용 모든 상품 조회	
	PagingVO getProductPageInfo(int currPage, String brandName, String selId);
	
	List<ProductVO> getProductPageList(PagingVO vo);

	
//	2023 01 16 김동훈 검색 메서드 -PagingVO 객체의 searchKeyWord를 이름에 갖고있는 상품레코드 리스트 반환
	List<ProductVO> getSearchPdList(PagingVO vo);

	PagingVO getSearchPdPageInfo(int currPage, int sortType,String searchKeyWord,
			ArrayList<String> finalCateList,ArrayList<String> finalBrandList,ArrayList<String> finalpriceList);

	List<String> getSearchCateList(String searchKeyWord);

	List<String> getSearchBrandList(String searchKeyWord);

// 판매자 관리페이지에 띄우는 판매자 별 판매 중인 상품 목록 	
	List<ProductVO> getSelectList(String selstlBrandName);

// 관리자 페이지 상품 관리에 모든 상품 목록 띄우기 + 페이징	
	PagingVO getProductAdminPageInfo(int currPage);

	List<ProductVO> getProductAdminPageList(PagingVO vo);

	// vo객체의 pdId를 통하여 판매량 증가
	int increaseSaleByPdId(ProductVO vo);

// 관리자 통계 - 판매량(당일, 1일전, 2일전, 3일전)	
	Long daySalesVolumeSelect1();

	Long daySalesVolumeSelect2();

	Long daySalesVolumeSelect3();

	Long daySalesVolumeSelect4();

	

	


	
	

	

}
