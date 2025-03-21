package kr.co.olga.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SqlSession session;

	@Override
	public long productInsert(ProductVO vo) {
		return session.insert("productMapper.productInsert", vo);
	}

	@Override
	public long productUpdate(ProductVO vo) {
		return session.update("productMapper.productUpdate", vo);
	}

	@Override
	public long productDelete(Long pdId) {
		return session.delete("productMapper.productDelete", pdId);
	}

	@Override
	public ProductVO productSelectOne(Long pdId) {
		return session.selectOne("productMapper.productSelectOne", pdId);
	}
	
// 메인, 페이지
	
/* 제철 과일 */
	@Override
	public List<ProductVO> mainProductSeasonFruitSelect(ProductVO vo) {
		return session.selectList("productMapper.mainProductSeasonFruitSelect", vo);
	}

/* 지금 할인 중 */
	@Override
	public List<ProductVO> mainProductSaleSelect(ProductVO vo) {
		return session.selectList("productMapper.mainProductSaleSelect", vo);
	}

/* 만원 이하 판매량 높은 제품 */	
	@Override
	public List<ProductVO> mainProductSalesVolumeSelect(ProductVO vo) {
		return session.selectList("productMapper.mainProductSalesVolumeSelect", vo);
	}
	
/* 후기 10000개 이상 */
	@Override
	public List<ProductVO> mainProductReviewSelect(ProductVO vo) {
		return session.selectList("productMapper.mainProductReviewSelect", vo);
	}
	
/* 조회수 100,000 이상 */
	@Override
	public List<ProductVO> mainProductHitsSelect(ProductVO vo) {
		return session.selectList("productMapper.mainProductHitsSelect", vo);
	}
	
/* 제품 출시 6개월 미만 판매량 높은 제품 */
	@Override
	public List<ProductVO> mainProductDateSelect(ProductVO vo) {
		return session.selectList("productMapper.mainProductDateSelect", vo);
	}

// 메인 항목에 대한 페이지
	
/* 제철 과일 */
	@Override
	public List<ProductVO> productSeasonFruitSelectList(ProductVO vo) {
		return session.selectList("productMapper.productSeasonFruitSelectList", vo);
	}
	
/* 지금 할인 중 */
	@Override
	public List<ProductVO> productSaleSelectList(ProductVO vo) {
		return session.selectList("productMapper.productSaleSelectList", vo);
	}

/* 만원 이하 판매량 높은 제품 */	
	@Override
	public List<ProductVO> productSalesVolumeSelectList(ProductVO vo) {
		return session.selectList("productMapper.productSalesVolumeSelectList", vo);
	}

/* 후기 10000개 이상 */
	@Override
	public List<ProductVO> productReviewSelectList(ProductVO vo) {
		return session.selectList("productMapper.productReviewSelectList", vo);
	}

/* 조회수 100,000 이상 */
	@Override
	public List<ProductVO> productHitsSelectList(ProductVO vo) {
		return session.selectList("productMapper.productHitsSelectList", vo);
	}

/* 제품 출시 6개월 미만 판매량 높은 제품 */
	@Override
	public List<ProductVO> productDateSelectList(ProductVO vo) {
		return session.selectList("productMapper.productDateSelectList", vo);
	}
	
	@Override
	public List<String> getCateList(String pgName) {
		return session.selectList("productMapper.getCateList",pgName);
	}
	
	@Override
	public int getProdCount(PagingVO temp_vo) {
		return session.selectOne("productMapper.getProdCount",temp_vo); //20230115 김동훈 수정
	}
	
	@Override
	public List<ProductVO> getProdPageList(PagingVO vo) {
		return session.selectList("productMapper.getProdPageList",vo);
	}
	
	@Override
	public List<String> getBrandList(String pgName) {
		return session.selectList("productMapper.getBrandList",pgName);
	}

// 판매자 페이지 상품 목록 조회	
	@Override
	public List<ProductVO> getPdList(ProductVO vo) {
		return session.selectList("productMapper.getPdList", vo);
	}

// 관리자용 모든 상품 조회 페이징
	@Override
	public int getProductCount() {
		return session.selectOne("productMapper.getProductCount");
	}
	
	@Override
	public List<ProductVO> getProductPageList(PagingVO vo) {
		return session.selectList("productMapper.getProductPageList", vo);
	}

	
	@Override
	public List<ProductVO> getSearchPdList(PagingVO vo) {
		return session.selectList("productMapper.getSearchPdList", vo);
	}
	
	@Override
	public int getSearchPdCount(PagingVO temp_vo) {
		return session.selectOne("productMapper.getSearchPdCount", temp_vo);
	}
	
	@Override
	public List<String> getSearchCateList(String searchKeyWord) {
		return session.selectList("productMapper.getSearchCateList", searchKeyWord);
	}
	
	@Override
	public List<String> getSearchBrandList(String searchKeyWord) {
		return session.selectList("productMapper.getSearchBrandList", searchKeyWord);
	}

// 판매자 관리페이지에 띄우는 판매자 별 판매 중인 상품 목록	
	@Override
	public List<ProductVO> getSelectList(String selstlBrandName) {
		return session.selectList("productMapper.getSelectList", selstlBrandName);
	}

	@Override
	public int getProductSellerCount(PagingVO countVo) {
		return session.selectOne("productMapper.getProductSellerCount", countVo);
	}

// 관리자 페이지 상품 관리에 모든 상품 목록 띄우기 + 페이징
	@Override
	public int getProductAdminCount() {
		return session.selectOne("productMapper.getProductAdminCount");
	}

	@Override
	public List<ProductVO> getProductAdminPageList(PagingVO vo) {
		return session.selectList("productMapper.getProductAdminPageList", vo);
	}
	
	//pdId로 판매량 증가
	@Override
	public int increaseSaleByPdId(ProductVO vo) {
		return session.update("productMapper.increaseSaleByPdId", vo);
	}

	@Override
	public List<ProductVO> getProductSellerPageList(PagingVO vo) {
		return session.selectList("productMapper.getProductSellerPageList", vo);
	}


	
}
