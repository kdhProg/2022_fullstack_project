package kr.co.olga.service;

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
	public long productDelete(long pdId) {
		return dao.productDelete(pdId);
	}

	@Override
	public ProductVO productSelectOne(long pdId) {
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
	public PagingVO getProdPageInfo(int currPage,String pgName,int sortType) {
		PagingVO vo = new PagingVO();
		int setTotalRecordCount = dao.getProdCount(pgName);
		int recordCountPerPage = 40;
                        
		int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		//int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		//int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		
		int realEnd = (int)(Math.ceil((dao.getProdCount(pgName) * 1.0) / 40));
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
	public PagingVO getProductPageInfo(int currPage) {
		PagingVO vo = new PagingVO();
		int setTotalRecordCount = dao.getProductCount();
		int recordCountPerPage = 20;
                        
		int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		//int lastPageNoOnPageList = (int)(Math.ceil(currPage/10.0)) * 10;
		int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		//int firstPageNoOnPageList = lastPageNoOnPageList - 9;
		
		int realEnd = (int)(Math.ceil((dao.getProductCount() * 1.0) / 20));
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
	public List<ProductVO> getProductPageList(PagingVO vo) {
		return dao.getProductPageList(vo);
	}

	
	
	
	
}
