package kr.co.olga.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Random;

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

	@Override
	public List<ProductVO> getProductSellerPageList(PagingVO vo) {
		return dao.getProductSellerPageList(vo);
	}

	@Override
	public ProductVO makeRandomPdDatas(String pdMainCategory, String pdSubCategory, String pdstlBrandName,
			String pdUnit, String pdWeight, String pdSeason,long pdStock, int startPrice, int endPrice, int startSale,
			int endSale) {
		
		Random rd = new Random();//랜덤 객체 생성
		ProductVO result = new ProductVO();//값을 담을 상품객체
		
		result.setPdDesInfoImg("/resources/pdimages/tempImg.jpg"); // 디테일 이미지는 임시세팅
	    
		int ranNumPerTwo = (rd.nextInt(2)+1);  //1~2의 난수
        int ranNumPerThree = (rd.nextInt(3)+1);  //1~3의 난수
        int ranNumPerFive = (rd.nextInt(5)+1);  // 1~5의 난수
        
        // 국가목록
        List<String> nations = Arrays.asList("국내산","미국","호주","칠레","캐나다");
        
        // 2. 메인/서브카테고리 지정 
	    result.setPdMainCategory(pdMainCategory);
	    result.setPdSubCategory(pdSubCategory);
	    
	    // 3. 브랜드명 지정
	    result.setPdstlBrandName(pdstlBrandName);
        
        if(pdSubCategory.equals("사과/배")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("친환경 ", "고당도 ", "신선한 ", "맛있는 ", "아삭한 ");
        	List<String> name = Arrays.asList("사과", "배", "배", "청송사과","꿀사과");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("상온");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/과일/사과_배/img"+ranNumPerThree+".jpg");
    	    	    
        }
        if(pdSubCategory.equals("귤/한라봉/오렌지")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("친환경 ", "고당도 ", "신선한 ", "맛있는 ", "유명 ");
        	List<String> name = Arrays.asList("귤", "한라봉","오렌지", "귤", "천혜향");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("상온");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/과일/귤_한라봉_오렌지/img"+ranNumPerThree+".jpg");
    	    	    
        }
        if(pdSubCategory.equals("감/홍시/곶감")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("친환경 ", "고당도 ", "신선한 ", "맛있는 ", "유명 ");
        	List<String> name = Arrays.asList("감", "홍시","곶감", "단감", "아이스홍시");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("상온");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/과일/감_홍시_곶감/img"+ranNumPerThree+".jpg");
    	    	    
        }
        if(pdSubCategory.equals("수박/메론/참외")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("친환경 ", "고당도 ", "신선한 ", "맛있는 ", "유명 ");
        	List<String> name = Arrays.asList("수박", "메론","참외", "수박", "머스크 메론");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("상온");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/과일/수박_메론_참외/img"+ranNumPerThree+".jpg");
    	    	    
        }
        if(pdSubCategory.equals("포도")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("친환경 ", "고당도 ", "신선한 ", "맛있는 ", "유명 ");
        	List<String> name = Arrays.asList("포도", "샤인머스켓","청포도", "적포도", "블루베리");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("상온");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/과일/포도/img"+ranNumPerThree+".jpg");
    	    	    
        }
        if(pdSubCategory.equals("토마토/자두/복숭아")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("친환경 ", "고당도 ", "신선한 ", "맛있는 ", "유명 ");
        	List<String> name = Arrays.asList("토마토", "자두","복숭아", "방울토마토", "황도");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("상온");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/과일/토마토_자두_복숭아/img"+ranNumPerThree+".jpg");
    	    	    
        }
        if(pdSubCategory.equals("자몽/레몬/석류")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("친환경 ", "고당도 ", "프리미엄 ", "맛있는 ", "유명 ");
        	List<String> name = Arrays.asList("자몽", "레몬","석류", "레몬", "자몽");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("상온");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/과일/자몽_레몬_석류/img"+ranNumPerThree+".jpg");
    	    	    
        }
        if(pdSubCategory.equals("열대과일")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("친환경 ", "고당도 ", "프리미엄 ", "맛있는 ", "유명 ");
        	List<String> name = Arrays.asList("패션후르츠", "용과","파파야", "두리안", "람부탄");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("상온");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/과일/열대과일/img"+ranNumPerThree+".jpg");
    	    	    
        }
        // ==========================================================
        // ===========================채소=============================
        // ==========================================================
        if(pdSubCategory.equals("열매채소")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("친환경 ", " ", "프리미엄 ", "맛있는 ", "유명 ");
        	List<String> name = Arrays.asList("가지", "오이","호박", "단호박", "당근");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("상온");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/채소/열매채소/img"+ranNumPerThree+".jpg");
    	    	    
        }
        if(pdSubCategory.equals("양파/마늘/파")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("친환경 ", "유기농 ", "프리미엄 ", "맛있는 ", "유명 ");
        	List<String> name = Arrays.asList("양파", "마늘","파", "쪽마늘", "대파");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정 =>
    	    result.setPdStorageType("상온");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/채소/양파_마늘_파/img"+ranNumPerThree+".jpg");
    	    	    
        }
        if(pdSubCategory.equals("버섯")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("친환경 ", "유기농 ", "프리미엄 ", "맛있는 ", "유명 ");
        	List<String> name = Arrays.asList("느타리버섯", "새송이버섯","팽이버섯", "표고버섯", "송이버섯");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("상온");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/채소/버섯/img"+ranNumPerThree+".jpg");
    	    	    
        }
        if(pdSubCategory.equals("쌈채소")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("친환경 ", "유기농 ", "프리미엄 ", "맛있는 ", "유명 ");
        	List<String> name = Arrays.asList("상추", "깻잎","배추", "적상추", "케일");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("상온");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/채소/쌈채소/img"+ranNumPerThree+".jpg");
    	    	    
        }
        if(pdSubCategory.equals("구황작물")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("친환경 ", "유기농 ", "프리미엄 ", "맛있는 ", "유명 ");
        	List<String> name = Arrays.asList("감자", "고구마","옥수수", "호박고구마", "알감자");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("상온");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/채소/구황작물/img"+ranNumPerThree+".jpg");
    	    	    
        }
        if(pdSubCategory.equals("뿌리채소")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("친환경 ", "유기농 ", "프리미엄 ", "맛있는 ", "유명 ");
        	List<String> name = Arrays.asList("인삼", "토란","당근", "생강", "더덕");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("상온");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/채소/뿌리채소/img"+ranNumPerThree+".jpg");
    	    	    
        }
        if(pdSubCategory.equals("배추/무")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("친환경 ", "유기농 ", "프리미엄 ", "맛있는 ", "유명 ");
        	List<String> name = Arrays.asList("배추", "양배추","무", "열무", "배추");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("상온");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/채소/배추_무/img"+ranNumPerThree+".jpg");
    	    	    
        }
        // ==========================================================
        // ===========================쌀/잡곡=============================
        // ==========================================================
        if(pdSubCategory.equals("백미")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("친환경 ", "유기농 ", "프리미엄 ", "맛있는 ", "유명 ");
        	List<String> name = Arrays.asList("여주쌀", "이천쌀","백미", "백미", "백미");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("상온");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/쌀_잡곡/백미/img"+ranNumPerThree+".jpg");
    	    	    
        }
        if(pdSubCategory.equals("현미/흑미")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("친환경 ", "유기농 ", "프리미엄 ", "맛있는 ", "유명 ");
        	List<String> name = Arrays.asList("현미", "흑미","현미", "흑미", "현미");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("상온");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/쌀_잡곡/현미_흑미/img"+ranNumPerThree+".jpg");
    	    	    
        }
        if(pdSubCategory.equals("잡곡가루")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("친환경 ", "유기농 ", "프리미엄 ", "맛있는 ", "유명 ");
        	List<String> name = Arrays.asList("미숫가루", "잡곡가루","쌀가루", "곡물가루", "미숫가루");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("상온");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/쌀_잡곡/잡곡가루/img"+ranNumPerThree+".jpg");
    	    	    
        }
        if(pdSubCategory.equals("콩/팥")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("친환경 ", "유기농 ", "프리미엄 ", "맛있는 ", "유명 ");
        	List<String> name = Arrays.asList("강낭콩", "팥","혼합콩", "렌틸콩", "검은콩");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("상온");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/쌀_잡곡/콩_팥/img"+ranNumPerThree+".jpg");
    	    	    
        }
        if(pdSubCategory.equals("조/수수/깨/보리")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("친환경 ", "유기농 ", "프리미엄 ", "맛있는 ", "유명 ");
        	List<String> name = Arrays.asList("조", "수수","들깨", "참깨", "보리");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("상온");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/쌀_잡곡/조_수수_깨_보리/img"+ranNumPerThree+".jpg");
    	    	    
        }
        // ==========================================================
        // ===========================수산물=============================
        // ==========================================================
        if(pdSubCategory.equals("생선")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("손질 ", "모둠 ", "냉동 ", "맛있는 ", "프리미엄 ");
        	List<String> name = Arrays.asList("갈치", "고등어","자반", "삼치", "가자미");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("냉동");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/수산물/생선/img"+ranNumPerThree+".jpg");
    	    	    
        }
        if(pdSubCategory.equals("갑각류")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("손질 ", "모둠 ", "냉동 ", "맛있는 ", "프리미엄 ");
        	List<String> name = Arrays.asList("게", "붉은대게","스노우크랩", "대게살", "꽃게");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("냉동");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/수산물/갑각류/img"+ranNumPerThree+".jpg");
    	    	    
        }
        if(pdSubCategory.equals("조개류")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("손질 ", "모둠 ", "냉동 ", "맛있는 ", "프리미엄 ");
        	List<String> name = Arrays.asList("가리비", "바지락","키조개", "맛조개", "꼬막");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("냉동");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/수산물/조개류/img"+ranNumPerThree+".jpg");
    	    	    
        }
        if(pdSubCategory.equals("해조류")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList(" ", "모둠 ", " ", "맛있는 ", "프리미엄 ");
        	List<String> name = Arrays.asList("미역", "다시마","파래", "미역", "파래");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("냉장");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/수산물/해조류/img"+ranNumPerThree+".jpg");
    	    	    
        }
        if(pdSubCategory.equals("건어물")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("커팅 ", "모둠 ", "", "맛있는 ", "프리미엄 ");
        	List<String> name = Arrays.asList("오징어채", "건오징어","황태채", "진미채", "오징어채");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("상온");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/수산물/건어물/img"+ranNumPerThree+".jpg");
    	    	    
        }
        if(pdSubCategory.equals("생선알")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("", "", "", "맛있는 ", "프리미엄 ");
        	List<String> name = Arrays.asList("날치알", "명태알","알탕", "명란", "날치알");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("냉동");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/수산물/생선알/img"+ranNumPerThree+".jpg");
    	    	    
        }
        // ==========================================================
        // ===========================축산/계란=============================
        // ==========================================================
        if(pdSubCategory.equals("소고기")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("", "", "", "무항생제 ", "프리미엄 ");
        	List<String> name = Arrays.asList("등심", "안심","스테이크", "불고기용", "다짐육");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("냉장");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/축산_계란/소고기/img"+ranNumPerThree+".jpg");
    	    	    
        }
        if(pdSubCategory.equals("돼지고기")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("", "", "", "무항생제 ", "프리미엄 ");
        	List<String> name = Arrays.asList("돼지불고기", "삼겹살","목살", "다리살", "갈비");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("냉장");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/축산_계란/돼지고기/img"+ranNumPerThree+".jpg");
    	    	    
        }
        if(pdSubCategory.equals("닭/오리고기")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("", "", "", "무항생제 ", "프리미엄 ");
        	List<String> name = Arrays.asList("닭다리살", "생닭","닭다리살", "훈제오리", "오리 슬라이스");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("냉장");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/축산_계란/닭_오리고기/img"+ranNumPerThree+".jpg");
    	    	    
        }
        if(pdSubCategory.equals("말/양고기")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("", "", "", "무항생제 ", "프리미엄 ");
        	List<String> name = Arrays.asList("양 갈빗살", "양 목심","양 등갈비", "양 등갈비", "양 갈빗살");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("냉장");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/축산_계란/말_양고기/img"+ranNumPerThree+".jpg");
    	    	    
        }
        if(pdSubCategory.equals("계란/알류")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("1등급 ", "", "", "무항생제 ", "프리미엄 ");
        	List<String> name = Arrays.asList("특란", "유정란","무정란", "백색 유정란", "초란");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("냉장");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/축산_계란/계란_알류/img"+ranNumPerThree+".jpg");
    	    	    
        }
        // ==========================================================
        // ===========================냉동/냉장/간편식=============================
        // ==========================================================
        if(pdSubCategory.equals("밀키트")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("", "", "", "", "");
        	List<String> name = Arrays.asList("닭갈비 밀키트", "샤브샤브 밀키트","칼국수 밀키트", "부대찌개 밀키트", "월남쌈 밀키트");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("냉장");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/냉동_냉장_간편식/밀키트/img"+ranNumPerThree+".jpg");
    	    	    
        }
        if(pdSubCategory.equals("즉석밥")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("", "", "", "", "");
        	List<String> name = Arrays.asList("오뚜기밥", "백미밥","오뚜기밥 큰밥", "햇반", "흑미밥");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("상온");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/냉동_냉장_간편식/즉석밥/img"+ranNumPerThree+".jpg");
    	    	    
        }
        if(pdSubCategory.equals("고기/해물")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("프리미엄 ", "", "프리미엄 ", "", "");
        	List<String> name = Arrays.asList("해물모듬", "해물키트","삽겹살 대패", "해물모듬", "우삽겹");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("냉동");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/냉동_냉장_간편식/고기_해물/img"+ranNumPerThree+".jpg");
    	    	    
        }
        if(pdSubCategory.equals("분식류")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("오리지널 ", "", "프리미엄 ", "", "");
        	List<String> name = Arrays.asList("떡볶이", "순대","김밥", "참치김밥", "국물떡볶이");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("냉장");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/냉동_냉장_간편식/분식류/img"+ranNumPerThree+".jpg");
    	    	    
        }
        if(pdSubCategory.equals("면류")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("오리지널 ", "", "프리미엄 ", "", "");
        	List<String> name = Arrays.asList("짬뽕", "파스타","크림 파스타", "토마토 파스타", "백짬뽕");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("냉장");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/냉동_냉장_간편식/면류/img"+ranNumPerThree+".jpg");
    	    	    
        }
        if(pdSubCategory.equals("떡류")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("영양 ", "모듬 ", "프리미엄 ", "", "");
        	List<String> name = Arrays.asList("찹쌀떡", "꿀떡","절편", "백설기", "송편");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("상온");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/냉동_냉장_간편식/떡류/img"+ranNumPerThree+".jpg");
    	    	    
        }
        if(pdSubCategory.equals("피자/치킨")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("", "수제 ", "프리미엄 ", "허니 ", "");
        	List<String> name = Arrays.asList("고르곤졸라 피자", "양념치킨","후라이드치킨", "순살치킨", "페퍼로니 피자");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("냉동");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/냉동_냉장_간편식/피자_치킨/img"+ranNumPerThree+".jpg");
    	    	    
        }
        if(pdSubCategory.equals("과자/빵/젤리/간식")) {
        	// 1. 무작위 상품명
        	String pdName = "";
        	
        	List<String> prefix = Arrays.asList("", "수제 ", "프리미엄 ", "미니 ", "촉촉한 ");
        	List<String> name = Arrays.asList("식빵", "소금빵","호두과자", "카스테라", "생크림빵");
    	    Collections.shuffle(prefix);
    	    Collections.shuffle(name);

    	    pdName += prefix.get(ranNumPerFive-1);
    	    pdName += name.get(ranNumPerFive-1);
    	    
    	    result.setPdName(pdName);
    	    
    	    // 4. 저장타입 지정
    	    result.setPdStorageType("상온");
    	    
    	    // 6. 원산지 지정
    	    result.setPdCountry(nations.get(ranNumPerFive-1));
    	    
    	    // 8.썸네일 지정
    	    result.setPdThumbImg("/resources/pdimages/냉동_냉장_간편식/과자_빵_젤리_간식/img"+ranNumPerThree+".jpg");
    	    	    
        }
        
        // 5. 판매단위/중량 지정
	    result.setPdUnit(pdUnit);
	    result.setPdWeight(pdWeight);
	    
        // 7. 유통기한 지정
	    result.setPdBBE("별도표기");
        
        // 9. 계절 지정
	    result.setPdSeason(pdSeason);
	    
	    // 10. 가격 지정 => 십의 자리 이하는 버림
	    long finalPrice = (rd.nextInt(endPrice)+startPrice)/100*100;
	    result.setPdPrice(finalPrice);
	    
	    // 11. 할인율 지정 => 일의 자리 이하는 버림 / 시작,끝이 0이면 0
	    if(startSale == 0 && endSale == 0) {
	    	long finalSale = 0L;
	    	result.setPdSale(finalSale);
	    }else {
	    	long finalSale = (rd.nextInt(endSale)+startSale)/10*10;
		    result.setPdSale(finalSale);
	    }
	    
	    
	    // 12 재고량 지정
	    result.setPdStock(pdStock);
		
		return result;
	}
	
}
