package kr.co.olga.dao;

import java.util.List;

import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.ProductVO;

public interface ProductDAO {

	long productInsert(ProductVO vo);

	long productUpdate(ProductVO vo);

	long productDelete(long pdId);

	ProductVO productSelectOne(long pdId);
	
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

	

	

	

}
