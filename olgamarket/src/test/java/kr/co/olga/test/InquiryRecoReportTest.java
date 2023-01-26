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

import kr.co.olga.service.InquiryRecoReportService;
import kr.co.olga.vo.InquiryRecoReportVO;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class InquiryRecoReportTest {
	
	@Autowired
	private InquiryRecoReportService irrService;
	
	@Test
	@Ignore
	public void irrInsertTest() {
		InquiryRecoReportVO vo = new InquiryRecoReportVO();
		vo.setIrrBad(0L);
		vo.setIrrBno(1L);
		vo.setIrrGood(1L);
		vo.setIrrmemId("mem_id_1");
		assertEquals(1, irrService.insertIrr(vo));
		vo.setIrrBad(1L);
		vo.setIrrBno(2L);
		vo.setIrrGood(0L);
		vo.setIrrmemId("mem_id_1");
		assertEquals(1, irrService.insertIrr(vo));
	}
	
	@Test
	@Ignore
	public void irrSelectTest() {
		// 한개의 멤버ID, 한개의 글(BNO)에는 행이 한개만 존재해야 함
		InquiryRecoReportVO vo = new InquiryRecoReportVO();
		vo.setIrrmemId("mem_id_1");
		vo.setIrrBno(1L);
		System.out.println(irrService.existCheckMemIdBno(vo));
	}
	
	@Test
	@Ignore
	public void irrGoodUpdateTest() {
		InquiryRecoReportVO vo = new InquiryRecoReportVO();
		vo.setIrrmemId("mem_id_1");
		vo.setIrrBno(1L);
		vo.setIrrBad(100L);
		vo.setIrrGood(0L);
		irrService.irrUpdate(vo);
	}
	
	@Test
	@Ignore
	public void irrGetOneTest() {
		InquiryRecoReportVO vo = new InquiryRecoReportVO();
		vo.setIrrmemId("mem_id_1");
//		vo.setIrrBno(1L);
		System.out.println(irrService.irrGetAllByMemId(vo));
	}
	
	@Test
	public void irrListTest() {
		InquiryRecoReportVO vo = new InquiryRecoReportVO();
		vo.setIrrmemId("ertert43");
		List<InquiryRecoReportVO> list = irrService.irrGetAllByMemId(vo);
		System.out.println(list);
		
		String irrBnoString = "";
		String irrGoodString = "";
		String irrBadString ="";
		for(int i=0;i<list.size();i++) {
			irrBnoString+=list.get(i).getIrrBno();
			irrGoodString+=list.get(i).getIrrGood();
			irrBadString+=list.get(i).getIrrBad();
			if(i < (list.size()-1)) {irrBnoString += "/";irrGoodString += "/";irrBadString += "/";}
		}
		System.out.println(irrBnoString);
		System.out.println(irrGoodString);
		System.out.println(irrBadString);
	}

}
