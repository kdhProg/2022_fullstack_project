package kr.co.olga.test;

import static org.junit.Assert.assertEquals;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import kr.co.olga.service.SellerService;
import kr.co.olga.vo.SellerVO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class SellerTest {
	
	@Autowired
	private SellerService service;
	
	@Test
	@Ignore
	public void sellerJoinTest() {
		SellerVO vo = new SellerVO();
		
		vo.setSelId("ashhhhhhhhdasd");
		vo.setSelPwd("asdasdasd");
		vo.setSelstlBrandName("판매점1");
		vo.setSelEmail("sdfasd");
		vo.setSelPhone("asdasdsa");
		vo.setSelAddress("판매원주소1");
		vo.setSelGender("남자");
		vo.setSelGrade("asd");
		vo.setSelMarketUniqueNo("dsaasd");
		vo.setSelSelRegiNo("asdsad");
		vo.setSelChoice(10L);
		vo.setSelTypeGrade(1L);
		vo.setSelName("이름이름");
		
		assertEquals(service.selJoin(vo), 1L);
	}
	
	@Test
	@Ignore
	public void sellerDelOneTest() {
		String selId = "asdasd";
		long a = service.selDelOne(selId);
	}
	
	@Test
	@Ignore
	public void sellerUpdTest() {
		SellerVO vo = new SellerVO();
		
		vo.setSelId("seller_id_1");
		vo.setSelPwd("asdasdasd");
		vo.setSelstlBrandName("판매점1");
		vo.setSelEmail("sdfasd");
		vo.setSelPhone("asdasdsa");
		vo.setSelAddress("ggggggggggggggggggg!");
		vo.setSelGender("남자");
		vo.setSelGrade("asd");
		vo.setSelMarketUniqueNo("dsaasd");
		vo.setSelSelRegiNo("asdsad");
		vo.setSelChoice(10L);
		vo.setSelTypeGrade(1L);
		vo.setSelName("ㅁㄴㅇㅁㅇㅁㅇㅁㄴㅇ");
		
		service.selUpd(vo);
	}
	
	@Test
	@Ignore
	public void sellerSelectOneTest() {
		String selId = "seller_id_1";
		System.out.println(service.sellerSelOne(selId));
	}
	
	@Test
	@Ignore
	public void sellerSelectAll() {
		System.out.println(service.sellerSelAll());
	}
	
	@Test
	@Ignore
	public void sellerIdCheckTest() {
		// 아이디 DB에 존재하면 (= 중복되면 ) 1 없다면 0
		String selId = "seller_id_1";
		System.out.println(service.sellerIdcheck(selId));
	}
	
	@Test
	@Ignore
	public void sellerUpdatePwdTest() {
		SellerVO vo = new SellerVO();
		vo.setSelId("seller_id_1");
		vo.setSelPwd("hhhhhhhhhh");
		assertEquals(service.sellerUpdatePwd(vo), 1);
	}
	
	@Test
	@Ignore
	public void sellerIdFindTest() {
		// 이름 전화번호 사업자등록번호만을 받아 VO객체 생성 ( 쿼리문에 전달용 )
		SellerVO vo = new SellerVO();
		vo.setSelName("이름1");
		vo.setSelPhone("01012341234");
		vo.setSelSelRegiNo("사업자등록번호1");
		System.out.println(service.sellerIdFind(vo));
	}
	
	@Test
	@Ignore
	public void sellerPwdFindTest() {
		SellerVO vo = new SellerVO();
		vo.setSelName("이름1");
		vo.setSelPhone("01012341234");
		vo.setSelSelRegiNo("사업자등록번호1");
		vo.setSelId("seller_id_1");
		System.out.println(service.sellerPwdFind(vo));
	}

}
