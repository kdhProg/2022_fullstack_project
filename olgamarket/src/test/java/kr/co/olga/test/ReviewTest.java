package kr.co.olga.test;

import static org.junit.Assert.assertEquals;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.co.olga.service.ReviewService;
import kr.co.olga.vo.ReviewVO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class ReviewTest {
	
	@Autowired
	private ReviewService service;
	
	@Test
	@Ignore
	public void reviewInsertTest() {
		ReviewVO vo = new ReviewVO();
		vo.setRvmemId("mem_id_1");
		vo.setRvpdId(1L);
		vo.setRvContent("asdasd");
		vo.setRvImg("asdasd");
		assertEquals(service.reviewInsert(vo), 1);
	}
	
	@Test
	@Ignore
	public void reviewDelOneTest() {
		long rvNo = 1;
		assertEquals(service.reviewDelOne(rvNo), 1);
	}
	
	@Test
	@Ignore
	public void reviewUpdTest() {
		ReviewVO vo = new ReviewVO();
		vo.setRvContent("6666666666666");
		vo.setRvImg("444444444");
		vo.setRvNo(1L);
		assertEquals(service.reviewUpd(vo), 1);
	}
	
	@Test
	@Ignore
	public void reviewNiceUpTest() {
		long rvNo = 1;
		assertEquals(service.reviewNiceUp(rvNo), 1);
	}
	
	@Test
	@Ignore
	public void reviewRptUpTest() {
		long rvNo = 1;
		assertEquals(service.reviewRptUp(rvNo), 1);
	}
	
	@Test
	@Ignore
	public void reviewSelOneTest() {
		long rvNo = 1;
		System.out.println(service.reviewSelOne(rvNo));
	}
	
	
}
