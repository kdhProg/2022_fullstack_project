package kr.co.olga.dao;

import java.util.List;

import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.ProductVO;

public interface ProductDAO {

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

	List<String> getCateList(String pgName);

//	해당 페이지의 총 레코드 개수
	int getProdCount(PagingVO temp_vo);  //20230115 김동훈 수정

	List<ProductVO> getProdPageList(PagingVO vo);

	List<String> getBrandList(String pgName);

// 판매자 페이지 상품 목록 조회
	List<ProductVO> getPdList(ProductVO vo);

// 관리자용 모든 상품 조회	
	int getProductCount();
	
	List<ProductVO> getProductPageList(PagingVO vo);

//	PagingVO 객체의 searchKeyWord를 이름에 갖고있는 상품레코드 리스트 반환
	List<ProductVO> getSearchPdList(PagingVO vo);

	int getSearchPdCount(String searchKeyWord);

	List<String> getSearchCateList(String searchKeyWord);

	List<String> getSearchBrandList(String searchKeyWord);

// 판매자 관리페이지에 띄우는 판매자 별 판매 중인 상품 목록
	List<ProductVO> getSelectList(String selstlBrandName);

	int getProductSellerCount(PagingVO countVo);

// 관리자 페이지 상품 관리에 모든 상품 목록 띄우기 + 페이징
	int getProductAdminCount();

	List<ProductVO> getProductAdminPageList(PagingVO vo);

	

	

	

}
