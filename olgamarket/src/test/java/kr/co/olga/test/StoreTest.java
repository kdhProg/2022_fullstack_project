package kr.co.olga.test;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.co.olga.service.StoreService;
import kr.co.olga.vo.StoreVO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class StoreTest {

	@Autowired
	private StoreService service;

	@Test
	public void storeInsertTest() {
		StoreVO vo = new StoreVO();
		
		vo.setStlBrandName("이 가게 이름은 브랜드4");
		vo.setStlInfo("고기 판매 중");
		vo.setStlPhone("031-777-7777");
		vo.setStlEmail("고기@고기.닷컴");
		vo.setStlMarketUniqueNo("관리자가 제공한 고유 번호4");
		vo.setStlSelRegiNo("사업자등록 번호4");
		
		assertEquals(service.storeInsert(vo), 1);
	}
	
	@Test
	public void storeUpdateTest() {
		StoreVO vo = new StoreVO();
		
		vo.setStlNo(2L);
		vo.setStlBrandName("고기마을fasdfs");
		vo.setStlInfo("고기, 쌈 채소 판매 중");
		vo.setStlPhone("031-111-1111");
		vo.setStlEmail("고기@gogi.com");
		
		assertEquals(service.storeUpdate(vo), 1);
	}
	
	@Test
	public void storeDeleteOneTest() {
		long stlNo = 3L;
		
		assertEquals(service.storeDeleteOne(stlNo), 1);
	}
	
	@Test
	public void storeSelectOneTest() {
		long stlNo = 3L;
		
		System.out.println("==========================================");
		System.out.println(service.storeSelectOne(stlNo));
		System.out.println("==========================================");
	}
/*	
	@Test
	public void storeSelectListTest() {
		String stlBrandName = null;
		List<StoreVO> list = service.storeSelectList(stlBrandName);
		for(StoreVO vo : list) {
			System.out.println("==========================================");
			System.out.println(vo);
			System.out.println("==========================================");
		
		}
	}
*/	
}





















