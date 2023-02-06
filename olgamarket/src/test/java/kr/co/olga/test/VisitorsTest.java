package kr.co.olga.test;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import kr.co.olga.service.VisitorsService;
import kr.co.olga.vo.VisitorsVO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class VisitorsTest {
	
	@Autowired
	private VisitorsService service;
	
	@Test
	public void visitorsInsertTest() throws Exception {
		// ======날짜 원하는 만큼 생성해서 인서트하기==========
//		String date = "20220217";
		
		// 1일 후 날짜 
//		String addDay = service.CalculationDate(date, 0, 0, 1);
//
//		System.out.println("1일 후 날짜 구하기:  " + addDay);
		
//		for(int i=0;i<10;i++) {
//			System.out.println("1일 후 날짜 구하기:  " + service.CalculationDate(date, 0, 0, i));
//		}
		
		//============= 인서트하기
		//반복문으로 넣기
		String case1_date = "20230401";
		String case1_ip = "321.123.123.123";
		
		for(int i=0;i<20;i++) {
			VisitorsVO vo = new VisitorsVO();
			vo.setViIp(case1_ip);
			vo.setViTime(service.CalculationDate(case1_date, 0, 0, i));
			service.visitorsInsert(vo);
		}
		
		String case2_date = "20230115";
		String case2_ip = "967.555.123.123";
		
		for(int i=0;i<35;i++) {
			VisitorsVO vo = new VisitorsVO();
			vo.setViIp(case2_ip);
			vo.setViTime(service.CalculationDate(case2_date, 0, 0, i));
			service.visitorsInsert(vo);
		}
		
		String case3_date = "20230101";
		String case3_ip = "856.524.123.123";
		
		for(int i=0;i<50;i++) {
			VisitorsVO vo = new VisitorsVO();
			vo.setViIp(case3_ip);
			vo.setViTime(service.CalculationDate(case3_date, 0, 0, i));
			service.visitorsInsert(vo);
		}
	}
	
	
	@Test
	public void countGroupByDateTest() {
		List<Long> list = service.countGroupByDate();
		System.out.println(list);
	}
	
	@Test
	public void showDateGroupByDateTest() {
		List<String> list = service.showDateGroupByDate();
		System.out.println(list);
	}
	
	
	@Test
	public void todayVisitTest() {
		long result = service.todayVisit();
		System.out.println(result);
	}
	
	@Test
	public void accumulateVisitTest() {
		long result = service.accumulateVisit();
		System.out.println(result);
	}
	
	

}
