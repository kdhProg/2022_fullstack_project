package kr.co.olga.test;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.co.olga.service.MemberService;
import kr.co.olga.vo.MemberVO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberTest {

	@Autowired
	private MemberService service;

	@Autowired
	ApplicationContext context;

	@Test
	public void objectListTest() {
		if (context != null) {
			for (String objName : ( context).getBeanDefinitionNames()) {
				System.out.println("생성되어 스프링이 가지고 있는 객체 => " + objName);
			}
		}
	}

	@Test
	public void memberJoinTest() throws Exception {
		MemberVO vo = new MemberVO();

		vo.setMemId("mem1231");
		vo.setMemPwd("mem123");
		vo.setMemName("회원1");
		vo.setMemEmail("mem1@mm312");
		vo.setMemPhone("0101111121312");
		vo.setMemAddress("회원시 멤버동");
		vo.setMemGender("남자");
		vo.setMemGrade("VIP");
		vo.setMemChoice(0L);

		assertEquals(service.memberJoin(vo), 1); // 쿼리 메서드 실행
	}
	
	@Test
	public void memberLogin() throws Exception {
		MemberVO vo = new MemberVO();
		String memId = "mem";

		// 올바른 아이디 비번 입력경우 
		// member.setMemberId("test1");
		// member.setMemberPw("test1");

		service.memberLogin(vo);
		System.out.println("결과 값 : " + service.memberLogin(vo));

	}
	
	@Test
	public void memberUpdateTest() {
		MemberVO vo = new MemberVO();
		
		vo.setMemId("mem");
		vo.setMemPwd("1234");
		vo.setMemName("이름 바꿈");
		vo.setMemEmail("mem@mem.com");
		vo.setMemPhone("010-2222-2222");
		vo.setMemAddress("분당구 이젠 컴퓨터 학원");
		vo.setMemChoice(8L);
		
		assertEquals(service.memberUpdate(vo), 1);
	}
	
	@Test
	public void memberDeleteOneTest() {
		String memId = "mem";
		
		assertEquals(service.memberDeleteOne(memId), 1);
	}
	
	@Test
	public void memberListTest() {
		String memId = null;
		List<MemberVO> list = service.memberList(memId);
		for(MemberVO vo : list) {
			System.out.println(vo);
		}
		System.out.println("====위의 조회 조건은 전체 목록을 가져옴");
	/*	
	 	// memId에 해당하는 애들만 가져온다.
		memId = "mem";
		list = service.memberList(memId);
		for(MemberVO vo : list) {
			System.out.println(vo);
		}
	*/	
	}

}
















