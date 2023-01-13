package kr.co.olga.test;

import static org.junit.Assert.assertEquals;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.co.olga.service.QuiryService;
import kr.co.olga.vo.QuiryVO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class QuiryTest {

	@Autowired
	private QuiryService service;
	
	@Test
	@Ignore
	public void quiryInsertTest() {
		QuiryVO vo = new QuiryVO();
		
		vo.setIqmemId("mem_id_1");
		vo.setIqpdId(1L);
		vo.setIqTitle("asdasdad");
		vo.setIqContent("asdasdasd");
		vo.setIqPrivate(1L);
		vo.setIqState(0L);
		
		assertEquals(service.quiryInsert(vo), 1);
	}
	
	@Test
	@Ignore
	public void quiryDeleteOneTest() {
		long iqNo = 1L;
		assertEquals(service.quiryDelOne(iqNo), 1);
	}
	
	@Test
	@Ignore
	public void quiryUpdTest() {
		QuiryVO vo = new QuiryVO();
		vo.setIqNo(1L);
		vo.setIqTitle("hhhhhhhh");
		vo.setIqContent("gggggggg");
		vo.setIqPrivate(0L);
		assertEquals(service.quiryUpd(vo), 1);
	}
	
	@Test
	@Ignore
	public void quirySelOneTest() {
		long iqNo = 1;
		System.out.println(service.quirySelOne(iqNo));
	}
	
}
