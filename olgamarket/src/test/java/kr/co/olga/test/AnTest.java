package kr.co.olga.test;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.co.olga.service.AnService;
import kr.co.olga.vo.AnVO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AnTest {

	@Autowired
	private AnService service;
	
//1대1답변등록	
	@Test
	public void anInsertTesst() {
		AnVO vo = new AnVO();
		
		vo.setOtaotqNo(1L);
		vo.setOtaadmId("admin1");
		vo.setOtaMainCategory("메인카테고리1");
		vo.setOtaSubCategory("서브카테고리1");
		vo.setOtaTitle("답변제목입니다");
		vo.setOtaContent("답변내용입니다");
		
		assertEquals(service.anInsert(vo), 1);
	}

//1대1답변수정
	@Test
	public void anUpdateTest() {
		AnVO vo = new AnVO();
		
		vo.setOtaotqNo(1L);
		vo.setOtaMainCategory("메인카테고리2");
		vo.setOtaSubCategory("서브카테고리1");
		vo.setOtaTitle("수정제목입니다");
		vo.setOtaContent("수정내용입니다");
		
		assertEquals(service.anUpdate(vo), 1);
	}
	
//1대1답변삭제
	@Test
	public void anDeleteTest() {
		
		assertEquals(service.anDelete(1L), 1);
	}
	
//1대1 답변 1개행 가져오기
	@Test
	public void anSelOneTest() {
		long otaotqNo=1;
		System.out.println(service.anSelOne(otaotqNo));
		
	}
	
}
