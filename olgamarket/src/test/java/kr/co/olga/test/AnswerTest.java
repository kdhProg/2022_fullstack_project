package kr.co.olga.test;

import static org.junit.Assert.assertEquals;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.co.olga.service.AnswerService;
import kr.co.olga.vo.AnswerVO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AnswerTest {

	@Autowired
	private AnswerService service;
	
// 상품문의답변등록	
	@Test

	public void answerInsertTest() {
		AnswerVO vo = new AnswerVO();
		
		vo.setIaiqNo(1L);
		vo.setIaContents("답변내용입니다.");


		assertEquals(service.answerInsert(vo), 1);
	}
	
//상품문의답변수정
		@Test

		public void answerUpdateTest() {
			AnswerVO vo = new AnswerVO();
			
			vo.setIaiqNo(1L);
			vo.setIaContents("수정된답변입니다.");
			
			assertEquals(service.answerUpdate(vo), 1);
		}
	
//상품문의답변삭제
	@Test
	
	public void answerDeleteTest() {
		
		assertEquals(service.answerDelete(1L), 1);
	}
//상품문의 1개행 가져오기	
	@Test
	public void answerSelOneTest() {
		long iaiqNo=1;
		System.out.println(service.answerSelOne(iaiqNo));
	}
	

}
