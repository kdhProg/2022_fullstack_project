package kr.co.olga.test;

import static org.junit.Assert.assertEquals;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.co.olga.service.PurchaseService;
import kr.co.olga.vo.PurchaseVO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class PurchaseTest {
	
	@Autowired
	private PurchaseService service;
	
	@Test
	@Ignore
	public void insertPurchaseTest() {
		PurchaseVO vo = new PurchaseVO();
//		vo.setPlDate(null);
		vo.setPlmemId("mem_id_1");
		vo.setPlNo(1L);
		vo.setPlOrderNo("12312321");
		vo.setPlOrderState("배송완료");
		vo.setPlPayWay("토스");
		vo.setPlpdId(1L);
		vo.setPlPdQuantity(4L);
		vo.setPlSavedMoney(40L);
		vo.setPlShipAddInfo("서울");
		vo.setPlTotalPrice(123L);
		
		assertEquals(1, service.insertPurchase(vo));
	}

}
