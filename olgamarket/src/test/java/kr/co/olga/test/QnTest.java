package kr.co.olga.test;

import static org.junit.Assert.assertEquals;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.co.olga.service.QnService;
import kr.co.olga.vo.QnVO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class QnTest {

	@Autowired
	private QnService service;

//1대1문의등록
	@Test
	public void qnInsertTest() {
		QnVO vo = new QnVO();

		vo.setOtqNo(1L);
		vo.setOtqMainCategory("메인카테고리1");
		vo.setOtqSubCategory("서브카테고리1");
		vo.setOtqTitle("1대1문의입니다.");
		vo.setOtqContent("문의내용");
		vo.setOtqmemId("mem_id_1");
		vo.setOtqState(0L);

		assertEquals(service.qninsert(vo), 1);
	}

//1대1문의수정
	@Test
	public void qnUpdateTest() {
		QnVO vo = new QnVO();

		vo.setOtqNo(1L);
		vo.setOtqMainCategory("메인카테고리2");
		vo.setOtqSubCategory("서브카테고리1");
		vo.setOtqTitle("1대1문의수정입니다");
		vo.setOtqContent("문의수정내용");
		vo.setOtqState(0L);

		assertEquals(service.qnUpdate(vo), 1);
	}

//1대1문의삭제
	@Test
	public void qnDeleteTest() {

		assertEquals(service.qnDelete(1L), 1);

	}
	
//1대1문의 1개행 가져오기
	@Test
	public void qnSelOneTest() {
		long otqNo=1;
		System.out.println(service.qnSelOne(otqNo));
	}
}
