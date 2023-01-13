package kr.co.olga.test;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.co.olga.service.ShipService;
import kr.co.olga.vo.ShipVO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ShipTest {
	
	@Autowired
	private ShipService service;

	@Test
	public void shipInsertTest() {
		ShipVO vo = new ShipVO();
		
		vo.setSlmemId("mem_id_1");
		vo.setSlAddress("경기도 성남시 분당구");
		
		assertEquals(service.shipInsert(vo), 1);
	}
	@Test
	public void shipDelOneTest() {
		long slNo = 1L;	
		assertEquals(service.shipDelOne(slNo), 0);
	}
		@Test
		public void shipUpdate() {
			ShipVO vo = new ShipVO();
			
			vo.setSlNo(2L);
			vo.setSlAddress("경기도 고양시 ");
			
			assertEquals(service.shipUpdate(vo), 1);
		}
		
	@Test
	public void shipSelectOneTest() {
		long slNo = 1L;
		
		System.out.println(service.shipSelectOne(slNo));
	}
	

	@Test
	public void shipSelectListTest() {
		List<ShipVO> list = service.shipSelectList();
		
		for(ShipVO vo : list) {
			System.out.println("==========================================");
			System.out.println(vo);
			System.out.println("==========================================");
		
		
	}

}
}