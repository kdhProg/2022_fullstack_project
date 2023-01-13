package kr.co.olga.test;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.co.olga.service.FAQService;
import kr.co.olga.vo.FAQVO;
import kr.co.olga.vo.PagingVO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class FAQTest {

	@Autowired
	private FAQService service;

	@Test
	@Ignore
	public void faqInsertTest() {
		FAQVO vo = new FAQVO();

		vo.setFaqadmId("adm1");
		vo.setFaqCategory("배송?????????");
		vo.setFaqTitle("배송시작?????");
		vo.setFaqContent("기다리면 배송 된다.");

		assertEquals(service.faqInsert(vo), 1);
	}

	@Test
	@Ignore
	public void faqUpdateTest() {
		FAQVO vo = new FAQVO();

		vo.setFaqNo(1L);
		vo.setFaqCategory("배송문제?????");
		vo.setFaqTitle("배송 지연이 되는 이유는???????");
		vo.setFaqContent("나도 모른다.??????");

		assertEquals(service.faqUpdate(vo), 1);
	}

	@Test
	@Ignore
	public void faqDeleteTest() {
		long faqNo = 0L;

		assertEquals(service.faqDeleteOne(1L), 1);
	}
	
	@Test
	@Ignore
	public void faqSelectOneTest() {
		long faqNo = 3L;
		
		System.out.println("==========================================");
		System.out.println(service.faqSelectOne(faqNo));
		System.out.println("==========================================");
	}
	
	@Test
	@Ignore
	public void faqSelectListTest() {
		long faqNo = 0L;
		List<FAQVO> list = service.faqSelectList(faqNo);
		for(FAQVO vo : list) {
			System.out.println("==========================================");
			System.out.println(vo);
			System.out.println("==========================================");
		}
	}
	
	
	@Autowired
	private FAQService faqService;
	
	
	@Test
	public void faqListTest() {
		int currPage = 1;
		String category = null;
		PagingVO vo = faqService.getFaqPageInfo(currPage,category); //페이징에 필요한 정보 계산
		List<FAQVO> pageList =  faqService.getFaqPageList(vo);
		System.out.println(vo);
		
		for(int i = 0; i<pageList.size();i++) {
			System.out.println(pageList.get(i));
		}
	}
}
