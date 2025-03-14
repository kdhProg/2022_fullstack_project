package kr.co.olga.test;

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.co.olga.dao.ProductDAO;
import kr.co.olga.service.ProductService;
import kr.co.olga.vo.PagingVO;
import kr.co.olga.vo.ProductVO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ProductTest {

	@Autowired
	private ProductService service;
	
	/* 테스트용 DAO */
	@Autowired
	private ProductDAO dao;
	
	@Test
	public void productCateTest() {
		//깡통배열
		ArrayList<String> list = new ArrayList<String>();
		list.add("수산물");
		System.out.println(list.isEmpty());
		
		PagingVO vo = new PagingVO();
		vo.setPgName("newProduct");
		vo.setCategories(list);
		
		System.out.println(dao.getProdCount(vo));
	}
	//count전용 임시VO
	
	@Test
	@Ignore
	public void brandNCateListTest() {
		String kw = "파랑";
		System.out.println(service.getSearchBrandList(kw));
		System.out.println(service.getSearchCateList(kw));
		
	}
	
	@Test
	@Ignore
	public void productSearchTest() {
//		String searchKeyWord = "파랑";
//		PagingVO vo = new PagingVO();
//		vo.setSearchKeyWord(searchKeyWord);
//		vo.setSort(1);
//		vo.setContEnd(10);
//		vo.setContStart(1);
//		List<ProductVO> testList = service.getSearchPdList(vo);
//		PagingVO vo2 = service.getSearchPdPageInfo(1,1,searchKeyWord,new ArrayList<String>());
//		for(int i = 0; i<testList.size() ; i++) {
//			System.out.println(testList.get(i).getPdName());
//		}
//		
//		System.out.println(vo2);
	}
	
	@Test
	@Ignore
	public void productInsertTest() {
		ProductVO vo = new ProductVO();
		
		vo.setPdThumbImg("/resources/pdimages/과일/귤.jpeg");
		vo.setPdName("사과");
		vo.setPdMainCategory("과일");
		vo.setPdSubCategory("사과");
		vo.setPdstlBrandName("이 가게 이름은 브랜드2");
		vo.setPdStorageType("냉장");
		vo.setPdUnit("박스");
		vo.setPdWeight("1Kg");
		vo.setPdCountry("국산");
		vo.setPdBBE("2023-09-01");
		vo.setPdDesInfoImg("/resources/pdimages/과일/귤.jpeg");
		vo.setPdSeason("가을");
		vo.setPdPrice(5000L);
		vo.setPdStock(100L);
		
		assertEquals(service.productInsert(vo), 1);
		
		vo.setPdThumbImg("/resources/pdimages/축산/양갈비.jpeg");
		vo.setPdName("양갈비");
		vo.setPdMainCategory("육류");
		vo.setPdSubCategory("양");
		vo.setPdstlBrandName("이 가게 이름은 브랜드3");
		vo.setPdStorageType("냉동");
		vo.setPdUnit("팩");
		vo.setPdWeight("600g");
		vo.setPdCountry("국산");
		vo.setPdBBE("2023-09-01");
		vo.setPdDesInfoImg("/resources/pdimages/축산/양갈비.jpeg");
		vo.setPdSeason("4계절");
		vo.setPdPrice(30000L);
		vo.setPdStock(500L);
		
		assertEquals(service.productInsert(vo), 1);
	}
	
	@Test
	@Ignore
	public void productUpdateTest() {
		ProductVO vo = new ProductVO();
		
		vo.setPdId(1L);
		vo.setPdThumbImg("바뀐 썸네일");
		vo.setPdName("양갈비");
		vo.setPdStorageType("냉장");
		vo.setPdUnit("한 근");
		vo.setPdWeight("600g");
		vo.setPdCountry("미국산");
		vo.setPdBBE("별도표기");
		vo.setPdDesInfoImg("바뀐 설명 이미지");
		vo.setPdPrice(27000L);
		vo.setPdSale(10L);
		vo.setPdStock(300L);
		
		assertEquals(service.productUpdate(vo), 1);	
	}
	
	@Test
	@Ignore
	public void productDeleteTest() {
		long pdId = 2L;
		
		assertEquals(service.productDelete(pdId), 1);
	}
	
	@Test
	@Ignore
	public void productSelectOneTest() {
		long pdId = 1L;
		
		assertEquals(service.productSelectOne(pdId), 1);
	}

/*	
	@Test
	public void mainTest() {
		String pdSeason = "summer";
		long pdSale = 10L;
		System.out.println();
		System.out.println();
		System.out.println("제철 과일" + service.mainProductSeasonFruitSelect(pdSeason));
		System.out.println();
		System.out.println();
		System.out.println("지금 할인 중" + service.mainProductSaleSelect(pdSale));
		System.out.println();
		System.out.println();
		System.out.println("만원 이하 판매량 높은 제품" + service.mainProductSalesVolumeSelect());
		System.out.println();
		System.out.println();
		System.out.println("후기 10000개 이상" + service.mainProductReviewSelect());
		System.out.println();
		System.out.println();
		System.out.println("조회수 100,000 이상" + service.mainProductHitsSelect());
		System.out.println();
		System.out.println();
		System.out.println("제품 출시 6개월 미만 판매량 높은 제품" + service.mainProductDateSelect());
	}
*/	
/*	
	@Test
	public void pageListTest() {
		System.out.println();
		System.out.println("제철과일");
		
		String pdSeason = "summer";
		List<ProductVO> fruitList = service.productSeasonFruitSelectList(pdSeason);
		for(ProductVO vo : fruitList) {
			System.out.println("==========================================");
			System.out.println(vo);
			System.out.println("==========================================");
		}
		
		System.out.println();
		System.out.println("할인 중");
		
		long pdSale = 30L;
		List<ProductVO> saleList = service.productSaleSelectList(pdSale);
		for(ProductVO vo : saleList) {
			System.out.println("==========================================");
			System.out.println(vo);
			System.out.println("==========================================");
		}
		
		System.out.println();
		System.out.println("만원이하 판매량");
		
		List<ProductVO> salesVolumeList = service.productSalesVolumeSelectList();
		for(ProductVO vo : salesVolumeList) {
			System.out.println("==========================================");
			System.out.println(vo);
			System.out.println("==========================================");
		}
	
		System.out.println();
		System.out.println("후기 많은");
		
		List<ProductVO> reviewList = service.productReviewSelectList();
		for(ProductVO vo : reviewList) {
			System.out.println("==========================================");
			System.out.println(vo);
			System.out.println("==========================================");
		}
		
		System.out.println();
		System.out.println("조회수 많은");
	
		List<ProductVO> hitsList = service.productHitsSelectList();
		for(ProductVO vo : hitsList) {
			System.out.println("==========================================");
			System.out.println(vo);
			System.out.println("==========================================");
		}
	
		System.out.println();
		System.out.println("6개월 미만 판매량");
	
		List<ProductVO> dateList = service.productDateSelectList();
		for(ProductVO vo : dateList) {
			System.out.println("==========================================");
			System.out.println(vo);
			System.out.println("==========================================");
		}
		
	}
	*/
	
	
	@Test
	public void sellerOne( ) {
		 String sam = "판매점2";
			List<ProductVO> pdList = service.getSelectList(sam);
			
			System.out.println(pdList);
		}
	
	@Test
	@Ignore
	public void increaseSaleByPdIdTest() {
		ProductVO vo = new ProductVO();
		vo.setPdId(138L);
		vo.setPdSalesVolume(2000L);
		assertEquals(1, service.increaseSaleByPdId(vo));
	}
	
	
//	무작위 입력 테스트
	@Test
	public void randomNumberInsertTest() {
		
		// 메인/서브 카테고리 => productinertView.jsp의 선택옵션들 그대로 사용하기
		// ex) String pdSubCategory = "양파/마늘/파";
        String pdMainCategory = "수산물";
        String pdSubCategory = "갑각류";
        String pdstlBrandName = "판매점5";
        String pdUnit = "1상자";
        String pdWeight = "500g";
        String pdSeason = "no";
        long pdStock = 100L;
        
        int startPrice = 1000;   //가격: 1000원 이상으로 하기
        int endPrice = 20000;
        
        int startSale = 0;  // 0 ~ 100사이만, 시작/끝 둘다 0 주기 가능
        int endSale = 40;
        
        for(int i=0; i < 15;i++) {
        	ProductVO vo =  service.makeRandomPdDatas(pdMainCategory,pdSubCategory,pdstlBrandName,pdUnit,pdWeight,pdSeason,pdStock,startPrice,endPrice,startSale,endSale);
            service.productInsert(vo);
        }
	}
	
	
	
	
	
}




















