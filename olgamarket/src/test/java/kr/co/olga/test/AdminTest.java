package kr.co.olga.test;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.co.olga.service.AdminService;
import kr.co.olga.vo.AdminVO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminTest {

	@Autowired
	private AdminService service;
	
	@Test
	public void adminLoginTest() {
		AdminVO vo = new AdminVO();
		String admId = "adm1";

		vo.setAdmId(admId);
		vo.setAdmPwd(admId);

		System.out.println("결과 값 : " + service.adminLogin(vo));
	}
	
	

}
