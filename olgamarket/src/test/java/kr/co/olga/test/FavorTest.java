package kr.co.olga.test;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.co.olga.service.FavorService;
import kr.co.olga.vo.FavorVO;
import kr.co.olga.vo.ShipVO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class FavorTest {

	@Autowired
	private FavorService service;
	
	@Test
	public void favorInsertTest() {
		FavorVO vo = new FavorVO();
		
		vo.setFvmemId("mem_id_1");
		vo.setFvpdId(3L);
		
		assertEquals(service.favorInsert(vo), 1);
	}
	@Test
	public void favorDelOneTest() {
		long fvNo = 0L;	
		assertEquals(service.favorDelOne(1L), 0);
	}
	
	@Test
	public void favorSelectOneTest() {
		long fvNo = 1L;
		
		System.out.println(service.favorSelectOne(fvNo));
	}

	@Test
	public void favorSelectListTest() {
		List<FavorVO> list = service.favorSelectList();
		
		for(FavorVO vo : list) {
			System.out.println("==========================================");
			System.out.println(vo);
			System.out.println("==========================================");
		
		
	}

	}

}

