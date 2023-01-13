package kr.co.olga.test;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.co.olga.service.NoticeService;
import kr.co.olga.vo.MemberVO;
import kr.co.olga.vo.NoticeVO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class NoticeTest {

	@Autowired
	private NoticeService service;
	
// 공지사항 추가	
	@Test
	public void noticeInsertTest() {
		NoticeVO vo = new NoticeVO();
		
		vo.setNtadmId("adm1");
		vo.setNtCategory("배송");
		vo.setNtTitle("배송지연");
		vo.setNtContent("배송이 지연될 거 같다.");
		
		assertEquals(service.noticeInsert(vo), 1);
	}

// 공지사항 수정
	@Test
	public void noticeUpdateTest() {
		NoticeVO vo = new NoticeVO();
		
		vo.setNtNo(1L);
		vo.setNtCategory("배송문제123123");
		vo.setNtTitle("배송 지연이 되는 이유31231");
		vo.setNtContent("이런 이유로 인해 배송이 지연될 거 같다.3123124");
		
		assertEquals(service.noticeUpdate(vo), 1);
	}

// 공지사항 삭제	
	@Test
	public void noticeDeleteTest() {
		long ntNo = 0L;
		
		assertEquals(service.noticeDeleteOne(1L), 0);
	}
	
	@Test
	public void noticeSelectOneTest() {
		long ntNo = 3L;
		
		System.out.println("==========================================");
		System.out.println(service.noticeSelectOne(ntNo));
		System.out.println("==========================================");
	}

/*
	@Test
	public void noticeSelectListTest() {
		long ntNo = 0L;
		List<NoticeVO> list = service.noticeSelectList(ntNo);
		for(NoticeVO vo : list) {
			System.out.println("==========================================");
			System.out.println(vo);
			System.out.println("==========================================");
		}
	}
*/	
	
}
















