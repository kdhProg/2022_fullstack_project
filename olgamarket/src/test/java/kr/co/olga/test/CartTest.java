package kr.co.olga.test;

import static org.junit.Assert.assertEquals;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.co.olga.service.CartService;
import kr.co.olga.vo.CartVO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CartTest {
	
	@Autowired
	private CartService ctService;
	
	@Test
	@Ignore
	public void insertTest() {
		CartVO vo = new CartVO();
		vo.setCamemId("mem_id_1");
		vo.setCapdId(2L);
		vo.setCaQuantity(3L);
		assertEquals(1, ctService.insertCart(vo));
		
	}
	
	@Test
	@Ignore
	public void selectByMemIDTest() {
		CartVO vo = new CartVO();
		vo.setCamemId("mem_id_1");
		System.out.println(ctService.selectByMemID(vo));
	}
	
	
	@Test
	@Ignore
	public void deleteByCanoTest() {
		CartVO vo = new CartVO();
		vo.setCaNo(1L);
		assertEquals(1,ctService.deleteByCano(vo));
	}
	
	@Test
	@Ignore
	public void updateQuantityByCanoTest() {
		CartVO vo = new CartVO();
		vo.setCaNo(2L);
		vo.setCaQuantity(1000L);
		assertEquals(1, ctService.updateQuantityByCano(vo));
	}
	
	@Test
	@Ignore
	public void existChkByMemIdNPdIdTest() {
		CartVO vo = new CartVO();
		vo.setCamemId("mem_id_1");
		vo.setCapdId(2L);
		assertEquals(1, ctService.existChkByMemIdNPdId(vo));
	}
	
	@Test
	@Ignore
	public void getOneByMemIdNPdIdTest() {
		CartVO vo = new CartVO();
		vo.setCamemId("mem_id_1");
		vo.setCapdId(2L);
		System.out.println(ctService.getOneByMemIdNPdId(vo));
	}
	
	@Test
	@Ignore
	public void getOneByCaNoTest() {
		CartVO vo = new CartVO();
		vo.setCaNo(1L);
		System.out.println(ctService.getOneByCaNo(vo));
	}

}
