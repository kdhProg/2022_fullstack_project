package kr.co.olga.test;

import java.util.ArrayList;
import java.util.List;

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
public class PagingTest {
	
	@Autowired
	private ProductService service;
	
	@Autowired
	private ProductDAO dao;

/*	
	@Test
//	@Ignore
	public void pagingTest() {
		// [신상품 페이지-최근2주 내]
		// 카테고리 정보(리스트 필요)
		// 현재페이지 : 1 ( 최초접근시 1 )
		int currPage = 1;
		
		//페이지 정보 + 카테고리 가져오기
//		String pgName = "newProduct"; // 컨트롤러가 줘야 하는 정보임
//		System.out.println(service.getCateList(pgName));
		String pgName="newProduct";
		int sort =2;
		ArrayList<String> arrTest = new ArrayList<String>();
		arrTest.add("냉동/냉장/간편식");
		arrTest.add("과2일");
		PagingVO vo = service.getProdPageInfo(currPage,pgName,sort, arrTest);
		List<ProductVO> pageList =  service.getProdPageList(vo);
		
		for(int i = 0; i<pageList.size();i++) {
			System.out.println(pageList.get(i).getPdRegiDate());
			System.out.println(pageList.get(i).getPdMainCategory());
			System.out.println(pageList.get(i).getPdSalesVolume());
			System.out.println(pageList.get(i).getPdPrice());
			System.out.println("==========================");
		}
		
	}
*/	
	@Test
	@Ignore
	public void getBrandListTest() {
		String pgName="newProduct";
		System.out.println(service.getBrandList(pgName));
	}
	
}
